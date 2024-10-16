package in.naths.chintamani.repository;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.neo4j.core.Neo4jClient;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;


@Service
public class Neo4jQueryService {

    private final Neo4jClient neo4jClient;
    private final ObjectMapper objectMapper;

    @Autowired
    public Neo4jQueryService(Neo4jClient neo4jClient, ObjectMapper objectMapper) {
        this.neo4jClient = neo4jClient;
        this.objectMapper = objectMapper;
    }

    public String getNodeNarenAsJson() {
        Map<String, Object> result = neo4jClient.query("MATCH (n:NAREN) RETURN n{.*, id: n.id, parentId: null, labels: labels(n)} AS node")
            .fetch()
            .one()
            .orElse(null);
        try {
            return objectMapper.writeValueAsString(result);
        } catch (Exception e) {
            // Handle or log the exception as needed
            return null;
        }
    }
    
    public String getChildren(String id, int page) {
        Collection<Map<String, Object>> result = neo4jClient.query(
            "MATCH (parent {id: $id})-[r]->(child) " +
            "WITH child, elementId(child) AS elementId " +
            "ORDER BY elementId " +
            "SKIP $start " +
            "LIMIT 15 " +
            "RETURN child{.*, id: child.id, parentId: $id, labels: labels(child)} AS node"
        )
        .bind(id).to("id")
        .bind(page * 15).to("start")
        .fetch().all();
        try {
            return objectMapper.writeValueAsString(result);
        } catch (Exception e) {
            // Handle or log the exception as needed
            return null;
        }
    }

    public Boolean createChild(String childLabel, String childObject, String parentPath, String relationship, String parentTitle) {
        try {
            String parentId= "";
            String[] labels = parentPath.split("\\.");
            String parentLabelSelector = parentTitle == null ? "" : "{title: \""+parentTitle+"\"}"; 
            if (labels.length == 1) {
                Map<String, Object> map = neo4jClient
                .query("MATCH (n:"+labels[0]+parentLabelSelector+") return n.id LIMIT 1")
                .fetch().one().orElse(null);
                parentId = map.get("n.id").toString();
            } else {
                StringBuilder query = new StringBuilder("MATCH ");
                for (int i = 0; i< labels.length - 1;i++) {
                   query.append("("+labels[i]+")-[]-");
                }
                query.append(">(n:"+labels[labels.length - 1]+parentLabelSelector+") return n.id LIMIT 1");
                Map<String, Object> map = neo4jClient
                .query(query.toString())
                .fetch().one().orElse(null);
                parentId = map.get("n.id").toString();
            }
            // Parse the childObject JSON string into a JsonNode
            JsonNode jsonNode = objectMapper.readTree(childObject);
            ObjectNode objectNode = (ObjectNode) jsonNode;
            objectNode.put("id", UUID.randomUUID().toString());
            objectNode.put("updatedAt", LocalDateTime.now().toString());
            // Convert the JsonNode to a string with unquoted keys
            String customChildObjectString = objectNode.toString().replaceAll("\"(\\w+)\":", "$1:");

            String query = "MATCH (parent {id: \"" + parentId + "\"}) " +
            "MERGE (child: " + childLabel + " {title: \"" + jsonNode.get("title").asText() + "\"}) " +
            "ON CREATE SET child = " + customChildObjectString +
            "ON MATCH SET child += " + customChildObjectString +
            "MERGE (parent)-[:" + relationship + "]->(child)";
            
            neo4jClient.query(query)
            .fetch().one();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
