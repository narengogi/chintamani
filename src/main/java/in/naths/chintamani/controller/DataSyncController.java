package in.naths.chintamani.controller;

import in.naths.chintamani.annotation.RequiresAuth;
import in.naths.chintamani.repository.Neo4jQueryService;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
    public Boolean createChild(@RequestBody Map<String, String> body) {
        //curl -X POST -H "Content-Type: application/json" -d '{"label": "ChildLabel", "json": "{\"key\": \"value\"}", "parentPath": "Parent.Parent.Parent", "relationship": "RELATIONSHIP"}' http://localhost:8080/api/data-sync/child
        System.out.println(body);
        return neo4jQueryService.createChild(body.get("label"), body.get("json"), body.get("parentPath"), body.get("relationship"));
    }
}
