MATCH (firefox:FIREFOX)
CREATE (origins:ORIGINS {id: randomUUID(), title: "Origins", updatedAt: timestamp()})
CREATE (bookmarks:BOOKMARKS {id: randomUUID(), title: "Bookmarks", updatedAt: timestamp()})
CREATE (firefox)-[:HAS_ORIGINS]->(origins)
CREATE (firefox)-[:HAS_BOOKMARKS]->(bookmarks);