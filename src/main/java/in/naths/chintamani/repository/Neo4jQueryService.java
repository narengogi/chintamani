package in.naths.chintamani.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.neo4j.core.Neo4jClient;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Collection;


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
        Map<String, Object> result = neo4jClient.query("MATCH (n:Naren) RETURN n{.*, id: n.id, parentId: null} AS node")
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
            "RETURN child{.*, id: child.id, parentId: $id} AS node"
        ).bind(id).to("id").fetch().all();
        try {
            return objectMapper.writeValueAsString(result);
        } catch (Exception e) {
            // Handle or log the exception as needed
            return null;
        }
    }
}