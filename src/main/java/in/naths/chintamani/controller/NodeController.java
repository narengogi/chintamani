package in.naths.chintamani.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import in.naths.chintamani.repository.Neo4jQueryService;

@RestController
public class NodeController {

    @Autowired
    private Neo4jQueryService neo4jQueryService;

    @GetMapping("/naren")
    public String getNode() {
        System.out.println("Getting node");
        return neo4jQueryService.getNodeNarenAsJson();
    }

    @GetMapping("/children/{id}")
    public String getChildren(@PathVariable String id, @RequestParam int page) {
        System.out.println("Getting children for " + id);
        return neo4jQueryService.getChildren(id, page);
    }
}
