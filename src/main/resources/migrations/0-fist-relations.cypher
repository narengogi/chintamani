// CREATE DATABASE IF NOT EXISTS chintamani; //In community edition, we can create only one database.

CREATE (n:NAREN {title: "Narendranath Gogineni", age: 25, aboutMe: "I exist as an idea", id: randomUUID(), updatedAt: timestamp()});

MATCH (n:NAREN)
CREATE (blogs:BLOGS {id: randomUUID(), title: "Blogs", updatedAt: timestamp()})
CREATE (github:GITHUB {id: randomUUID(), title: "Github", username: "narengogi", updatedAt: timestamp()})
CREATE (socials:SOCIALS {id: randomUUID(), title: "Socials", updatedAt: timestamp()})
CREATE (browsers:BROWSERS {id: randomUUID(), title: "Browsers", updatedAt: timestamp()})
CREATE (music:MUSIC {id: randomUUID(), title: "Music", updatedAt: timestamp()})
CREATE (health:HEALTH {id: randomUUID(), title: "Health", updatedAt: timestamp()})
CREATE (search:SEARCH {id: randomUUID(), title: "Search", updatedAt: timestamp()})
CREATE (quickCommerce:QUICK_COMMERCE {id: randomUUID(), title: "Quick Commerce", updatedAt: timestamp()})
CREATE (travel:TRAVEL {id: randomUUID(), title: "Travel", updatedAt: timestamp()})
CREATE (mail:MAIL {id: randomUUID(), title: "Mail", updatedAt: timestamp()})
CREATE (eCommerce:E_COMMERCE {id: randomUUID(), title: "E-Commerce", updatedAt: timestamp()})
CREATE (stremio:STREMIO {id: randomUUID(), title: "Stremio", updatedAt: timestamp()})
CREATE (people:PEOPLE {id: randomUUID(), title: "People", updatedAt: timestamp()})
CREATE (obsidian:OBSIDIAN {id: randomUUID(), title: "Obsidian", updatedAt: timestamp()})
CREATE (n)-[:DATA_SOURCE]->(blogs)
CREATE (n)-[:DATA_SOURCE]->(github)
CREATE (n)-[:DATA_SOURCE]->(socials)
CREATE (n)-[:DATA_SOURCE]->(browsers)
CREATE (n)-[:DATA_SOURCE]->(music)
CREATE (n)-[:DATA_SOURCE]->(health)
CREATE (n)-[:DATA_SOURCE]->(search)
CREATE (n)-[:DATA_SOURCE]->(quickCommerce)
CREATE (n)-[:DATA_SOURCE]->(travel)
CREATE (n)-[:DATA_SOURCE]->(mail)
CREATE (n)-[:DATA_SOURCE]->(eCommerce)
CREATE (n)-[:DATA_SOURCE]->(stremio)
CREATE (n)-[:DATA_SOURCE]->(people)
CREATE (n)-[:DATA_SOURCE]->(obsidian);


MATCH (socials:SOCIALS)
CREATE (x:X {id: randomUUID(), title: "X", updatedAt: timestamp()})
CREATE (y:YOUTUBE {id: randomUUID(), title: "Youtube", updatedAt: timestamp()})
CREATE (goodreads:GOODREADS {id: randomUUID(), title: "Goodreads", updatedAt: timestamp()})
CREATE (i:INSTAGRAM {id: randomUUID(), title: "Instagram", updatedAt: timestamp()})
CREATE (f:FACEBOOK {id: randomUUID(), title: "Facebook", updatedAt: timestamp()})
CREATE (reddit:REDDIT {id: randomUUID(), title: "Reddit", updatedAt: timestamp()})
CREATE (socials)-[:HAS_DATA_SOURCE]->(x)
CREATE (socials)-[:HAS_DATA_SOURCE]->(y)
CREATE (socials)-[:HAS_DATA_SOURCE]->(goodreads)
CREATE (socials)-[:HAS_DATA_SOURCE]->(i)
CREATE (socials)-[:HAS_DATA_SOURCE]->(f)
CREATE (socials)-[:HAS_DATA_SOURCE]->(reddit);

MATCH (browsers:BROWSERS)
CREATE (chrome:CHROME {id: randomUUID(), title: "Chrome", updatedAt: timestamp()})
CREATE (edge:EDGE {id: randomUUID(), title: "Edge", updatedAt: timestamp()})
CREATE (firefox:FIREFOX {id: randomUUID(), title: "Firefox", updatedAt: timestamp()})
CREATE (safari:SAFARI {id: randomUUID(), title: "Safari", updatedAt: timestamp()})
CREATE (arc:ARC {id: randomUUID(), title: "Arc", updatedAt: timestamp()})
CREATE (browsers)-[:HAS_DATA_SOURCE]->(chrome)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(edge)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(firefox)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(safari)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(arc);

MATCH (music:MUSIC)
CREATE (spotify:SPOTIFY {id: randomUUID(), title: "Spotify", updatedAt: timestamp()})
CREATE (appleMusic:APPLE_MUSIC {id: randomUUID(), title: "Apple Music", updatedAt: timestamp()})
CREATE (music)-[:HAS_DATA_SOURCE]->(spotify)
CREATE (music)-[:HAS_DATA_SOURCE]->(appleMusic);

MATCH (health:HEALTH)
CREATE (strava:STRAVA {id: randomUUID(), title: "Strava", updatedAt: timestamp()})
CREATE (appleHealth:APPLE_HEALTH {id: randomUUID(), title: "Apple Health", updatedAt: timestamp()})
CREATE (health)-[:HAS_DATA_SOURCE]->(strava)
CREATE (health)-[:HAS_DATA_SOURCE]->(appleHealth);

MATCH (search:SEARCH)
CREATE (google:GOOGLE {id: randomUUID(), title: "Google", updatedAt: timestamp()})
CREATE (duckduckgo:DUCKDUCKGO {id: randomUUID(), title: "DuckDuckGo", updatedAt: timestamp()})
CREATE (exaAI:EXA_AI {id: randomUUID(), title: "Exa AI", updatedAt: timestamp()})
CREATE (chatGPT:CHATGPT {id: randomUUID(), title: "ChatGPT", updatedAt: timestamp()})
CREATE (claude:CLAUDE {id: randomUUID(), title: "Claude", updatedAt: timestamp()})
CREATE (search)-[:HAS_DATA_SOURCE]->(google)
CREATE (search)-[:HAS_DATA_SOURCE]->(duckduckgo)
CREATE (search)-[:HAS_DATA_SOURCE]->(exaAI)
CREATE (search)-[:HAS_DATA_SOURCE]->(chatGPT)
CREATE (search)-[:HAS_DATA_SOURCE]->(claude);

MATCH (quickCommerce:QUICK_COMMERCE)
CREATE (swiggy:SWIGGY {id: randomUUID(), title: "Swiggy", updatedAt: timestamp()})
CREATE (blinkit:BLINKIT {id: randomUUID(), title: "Blinkit", updatedAt: timestamp()})
CREATE (zepto:ZEPTO {id: randomUUID(), title: "Zepto", updatedAt: timestamp()})
CREATE (quickCommerce)-[:HAS_DATA_SOURCE]->(swiggy)
CREATE (quickCommerce)-[:HAS_DATA_SOURCE]->(blinkit)
CREATE (quickCommerce)-[:HAS_DATA_SOURCE]->(zepto);

MATCH (travel:TRAVEL)
CREATE (uber:UBER {id: randomUUID(), title: "Uber", updatedAt: timestamp()})
CREATE (nammayatri:NAMMA_YATRI {id: randomUUID(), title: "Namma Yatri", updatedAt: timestamp()})
CREATE (ola:OLA {id: randomUUID(), title: "Ola", updatedAt: timestamp()})
CREATE (travel)-[:HAS_DATA_SOURCE]->(uber)
CREATE (travel)-[:HAS_DATA_SOURCE]->(nammayatri)
CREATE (travel)-[:HAS_DATA_SOURCE]->(ola);

MATCH (eCommerce:E_COMMERCE)
CREATE (amazon:AMAZON {id: randomUUID(), title: "Amazon", updatedAt: timestamp()})
CREATE (flipkart:FLIPKART {id: randomUUID(), title: "Flipkart", updatedAt: timestamp()})
CREATE (ajio:AJIO {id: randomUUID(), title: "Ajio", updatedAt: timestamp()})
CREATE (eCommerce)-[:HAS_DATA_SOURCE]->(amazon)
CREATE (eCommerce)-[:HAS_DATA_SOURCE]->(flipkart)
CREATE (eCommerce)-[:HAS_DATA_SOURCE]->(ajio);
