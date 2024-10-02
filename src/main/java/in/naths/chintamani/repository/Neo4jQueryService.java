package in.naths.chintamani.repository;

import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.neo4j.core.Neo4jClient;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


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
    
    public String getChildren(String id) {
        Collection<Map<String, Object>> result = neo4jClient.query(
            "MATCH (parent {id: $id})-[r]->(child) " +
            "RETURN child{.*, id: child.id, parentId: $id, labels: labels(child)} AS node"
        ).bind(id).to("id").fetch().all();
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
            
            // Convert the JsonNode to a string with unquoted keys
            String customChildObjectString = jsonNode.toString().replaceAll("\"(\\w+)\":", "$1:");
            
            String query = """
            MATCH (parent {id: "PARENT_ID_PLACEHOLDER"})
            MERGE (child: CHILD_LABEL_PLACEHOLDER {title: "TITLE_PLACEHOLDER"})
            ON CREATE SET child = CHILD_OBJECT_PLACEHOLDER
            ON MATCH SET child += CHILD_OBJECT_PLACEHOLDER
            MERGE (parent)-[:RELATIONSHIP_PLACEHOLDER]->(child)
            """.replaceAll("PARENT_ID_PLACEHOLDER",parentId).replaceAll("CHILD_LABEL_PLACEHOLDER",childLabel)
            .replaceAll("CHILD_OBJECT_PLACEHOLDER",customChildObjectString).replaceAll("RELATIONSHIP_PLACEHOLDER",relationship)
            .replaceAll("TITLE_PLACEHOLDER",jsonNode.get("title").asText());

            neo4jClient.query(query)
            .fetch().one();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}