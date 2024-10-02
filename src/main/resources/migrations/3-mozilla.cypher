MATCH (firefox:FIREFOX)
CREATE (origins:ORIGINS {id: randomUUID(), title: "Origins"})
CREATE (bookmarks:BOOKMARKS {id: randomUUID(), title: "Bookmarks"})
CREATE (places:PLACES {id: randomUUID(), title: "Places"})
CREATE (visit:VISIT {id: randomUUID(), title: "Visit"})
CREATE (firefox)-[:HAS_ORIGINS]->(origins)
CREATE (firefox)-[:HAS_BOOKMARKS]->(bookmarks);