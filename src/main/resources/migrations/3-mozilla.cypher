MATCH (firefox:FIREFOX)
CREATE (origins:ORIGINS {id: randomUUID(), title: "Origins", insertedAt: timestamp()})
CREATE (bookmarks:BOOKMARKS {id: randomUUID(), title: "Bookmarks", insertedAt: timestamp()})
CREATE (firefox)-[:HAS_ORIGINS]->(origins)
CREATE (firefox)-[:HAS_BOOKMARKS]->(bookmarks);