MATCH (github:GITHUB)
CREATE (followers:FOLLOWERS {id: randomUUID(), title: "Followers", insertedAt: timestamp()})
CREATE (following:FOLLOWING {id: randomUUID(), title: "Following", insertedAt: timestamp()})
CREATE (repos:REPOS {id: randomUUID(), title: "Repos", insertedAt: timestamp()})
CREATE (starred_repos:STARRED_REPOS {id: randomUUID(), title: "Starred Repos", insertedAt: timestamp()})
CREATE (github)-[:HAS_FOLLOWERS]->(followers)
CREATE (github)-[:HAS_FOLLOWING]->(following)
CREATE (github)-[:HAS_REPOS]->(repos)
CREATE (github)-[:HAS_STARRED_REPOS]->(starred_repos);