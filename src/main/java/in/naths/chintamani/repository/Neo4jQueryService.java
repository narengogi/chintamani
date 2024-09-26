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

    public Boolean createChild(String childLabel,String childObject, String parentPath, String relationship) {
        try {
            String parentId= "";
            String[] labels = parentPath.split("\\.");
            if (labels.length == 1) {
                Map<String, Object> map = neo4jClient
                .query("MATCH (n:"+labels[0]+") return n.id")
                .fetch().one().orElse(null);
                parentId = map.get("n.id").toString();
            } else {
                // StringBuilder query = new StringBuilder("MATCH (parent:");
                // handle the case for more than 1 label
            }
            // Parse the childObject JSON string into a JsonNode
            JsonNode jsonNode = objectMapper.readTree(childObject);
            
            // Convert the JsonNode to a string with unquoted keys
            String customChildObjectString = jsonNode.toString().replaceAll("\"(\\w+)\":", "$1:");
            
            neo4jClient.query("""
            MATCH (parent {id: "$parentId"}) 
            CREATE (parent)-[:$relationship]->(child: $childLabel $childObject)
            """.replace("$parentId",parentId).replace("$childLabel",childLabel).replace("$childObject",customChildObjectString).replace("$relationship",relationship))
            .fetch().one();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}