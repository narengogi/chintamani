MATCH (github:GITHUB)
CREATE (followers:FOLLOWERS {id: randomUUID(), title: "Followers", updatedAt: timestamp()})
CREATE (following:FOLLOWING {id: randomUUID(), title: "Following", updatedAt: timestamp()})
CREATE (repos:REPOS {id: randomUUID(), title: "Repos", updatedAt: timestamp()})
CREATE (starred_repos:STARRED_REPOS {id: randomUUID(), title: "Starred Repos", updatedAt: timestamp()})
CREATE (github)-[:HAS_FOLLOWERS]->(followers)
CREATE (github)-[:HAS_FOLLOWING]->(following)
CREATE (github)-[:HAS_REPOS]->(repos)
CREATE (github)-[:HAS_STARRED_REPOS]->(starred_repos);