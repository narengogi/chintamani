CREATE DATABASE IF NOT EXISTS chintamani; //In community edition, we can create only one database.

CREATE (n:Naren {name: "Narendranath Gogineni", age: 25, aboutMe: "I exist as an idea", id: randomUUID()});

MATCH (n:Naren)
CREATE (b:Blogs {id: randomUUID()})
CREATE (n)-[:DATA_SOURCE]->(b);

WITH date("2024-05-20") AS blogDate
CREATE (a:Blog {
    id: randomUUID(),
    title: "I exist as an idea",
    content: "I exist as an idea",
    author: "Narendranath Gogineni",
    date: blogDate,
    jsFileURL: "https://github.com/narendranathgogineni/chintamani/blob/main/0.cypher",
    styleSheetURL: "https://github.com/narendranathgogineni/chintamani/blob/main/0.cypher"
})
WITH a
MATCH (b:Blogs)
CREATE (b)-[:ITEM]->(a);
