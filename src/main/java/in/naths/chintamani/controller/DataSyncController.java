package in.naths.chintamani.controller;

import in.naths.chintamani.annotation.RequiresAuth;
import in.naths.chintamani.repository.Neo4jQueryService;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/data-sync")
public class DataSyncController {

    @Autowired
    private Neo4jQueryService neo4jQueryService;

    @PostMapping("/child")
    public ResponseEntity<String> createChild(@RequestBody Map<String, String> body) {
        //curl -X POST -H "Content-Type: application/json" -d '{"label": "ChildLabel", "json": "{\"key\": \"value\"}", "parentPath": "Parent.Parent.Parent", "relationship": "RELATIONSHIP"}' http://localhost:8080/api/data-sync/child
        System.out.println(body);
        String data = body.get("data");
        String label = body.get("label");
        String parentPath = body.get("parentPath");
        String relationship = body.get("relationship");
        String parentLabel = body.get("parentLabel");
        Boolean result = neo4jQueryService.createChild(label, data, parentPath, relationship, parentLabel);
        if (result) {
            return ResponseEntity.ok("Data synced successfully");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Unable to sync data");
        }
    }
}
