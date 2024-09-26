MATCH (github:GITHUB)
CREATE (followers:FOLLOWERS {id: randomUUID(), title: "Followers"})
CREATE (following:FOLLOWING {id: randomUUID(), title: "Following"})
CREATE (repos:REPOS {id: randomUUID(), title: "Repos"})
CREATE (starred_repos:STARRED_REPOS {id: randomUUID(), title: "Starred Repos"})
CREATE (github)-[:HAS_FOLLOWERS]->(followers)
CREATE (github)-[:HAS_FOLLOWING]->(following)
CREATE (github)-[:HAS_REPOS]->(repos)
CREATE (github)-[:HAS_STARRED_REPOS]->(starred_repos);