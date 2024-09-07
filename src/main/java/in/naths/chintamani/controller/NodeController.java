package in.naths.chintamani.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import in.naths.chintamani.repository.Neo4jQueryService;
// import java.util.Map;

@RestController
public class NodeController {

    @Autowired
    private Neo4jQueryService neo4jQueryService;

    @GetMapping("/naren")
    public String getNode() {
        System.out.println("Getting node");
        return neo4jQueryService.getNodeNarenAsJson();
    }
}
