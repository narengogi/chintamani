// CREATE DATABASE IF NOT EXISTS chintamani; //In community edition, we can create only one database.

CREATE (n:NAREN {title: "Narendranath Gogineni", age: 25, aboutMe: "I exist as an idea", id: randomUUID(), insertedAt: timestamp()});

MATCH (n:NAREN)
CREATE (blogs:BLOGS {id: randomUUID(), title: "Blogs", insertedAt: timestamp()})
CREATE (github:GITHUB {id: randomUUID(), title: "Github", username: "narengogi", insertedAt: timestamp()})
CREATE (socials:SOCIALS {id: randomUUID(), title: "Socials", insertedAt: timestamp()})
CREATE (browsers:BROWSERS {id: randomUUID(), title: "Browsers", insertedAt: timestamp()})
CREATE (music:MUSIC {id: randomUUID(), title: "Music", insertedAt: timestamp()})
CREATE (health:HEALTH {id: randomUUID(), title: "Health", insertedAt: timestamp()})
CREATE (search:SEARCH {id: randomUUID(), title: "Search", insertedAt: timestamp()})
CREATE (quickCommerce:QUICK_COMMERCE {id: randomUUID(), title: "Quick Commerce", insertedAt: timestamp()})
CREATE (travel:TRAVEL {id: randomUUID(), title: "Travel", insertedAt: timestamp()})
CREATE (mail:MAIL {id: randomUUID(), title: "Mail", insertedAt: timestamp()})
CREATE (eCommerce:E_COMMERCE {id: randomUUID(), title: "E-Commerce", insertedAt: timestamp()})
CREATE (stremio:STREMIO {id: randomUUID(), title: "Stremio", insertedAt: timestamp()})
CREATE (people:PEOPLE {id: randomUUID(), title: "People", insertedAt: timestamp()})
CREATE (obsidian:OBSIDIAN {id: randomUUID(), title: "Obsidian", insertedAt: timestamp()})
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
CREATE (x:X {id: randomUUID(), title: "X", insertedAt: timestamp()})
CREATE (y:YOUTUBE {id: randomUUID(), title: "Youtube", insertedAt: timestamp()})
CREATE (goodreads:GOODREADS {id: randomUUID(), title: "Goodreads", insertedAt: timestamp()})
CREATE (i:INSTAGRAM {id: randomUUID(), title: "Instagram", insertedAt: timestamp()})
CREATE (f:FACEBOOK {id: randomUUID(), title: "Facebook", insertedAt: timestamp()})
CREATE (reddit:REDDIT {id: randomUUID(), title: "Reddit", insertedAt: timestamp()})
CREATE (socials)-[:HAS_DATA_SOURCE]->(x)
CREATE (socials)-[:HAS_DATA_SOURCE]->(y)
CREATE (socials)-[:HAS_DATA_SOURCE]->(goodreads)
CREATE (socials)-[:HAS_DATA_SOURCE]->(i)
CREATE (socials)-[:HAS_DATA_SOURCE]->(f)
CREATE (socials)-[:HAS_DATA_SOURCE]->(reddit);

MATCH (browsers:BROWSERS)
CREATE (chrome:CHROME {id: randomUUID(), title: "Chrome", insertedAt: timestamp()})
CREATE (edge:EDGE {id: randomUUID(), title: "Edge", insertedAt: timestamp()})
CREATE (firefox:FIREFOX {id: randomUUID(), title: "Firefox", insertedAt: timestamp()})
CREATE (safari:SAFARI {id: randomUUID(), title: "Safari", insertedAt: timestamp()})
CREATE (arc:ARC {id: randomUUID(), title: "Arc", insertedAt: timestamp()})
CREATE (browsers)-[:HAS_DATA_SOURCE]->(chrome)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(edge)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(firefox)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(safari)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(arc);

MATCH (music:MUSIC)
CREATE (spotify:SPOTIFY {id: randomUUID(), title: "Spotify", insertedAt: timestamp()})
CREATE (appleMusic:APPLE_MUSIC {id: randomUUID(), title: "Apple Music", insertedAt: timestamp()})
CREATE (music)-[:HAS_DATA_SOURCE]->(spotify)
CREATE (music)-[:HAS_DATA_SOURCE]->(appleMusic);

MATCH (health:HEALTH)
CREATE (strava:STRAVA {id: randomUUID(), title: "Strava", insertedAt: timestamp()})
CREATE (appleHealth:APPLE_HEALTH {id: randomUUID(), title: "Apple Health", insertedAt: timestamp()})
CREATE (health)-[:HAS_DATA_SOURCE]->(strava)
CREATE (health)-[:HAS_DATA_SOURCE]->(appleHealth);

MATCH (search:SEARCH)
CREATE (google:GOOGLE {id: randomUUID(), title: "Google", insertedAt: timestamp()})
CREATE (duckduckgo:DUCKDUCKGO {id: randomUUID(), title: "DuckDuckGo", insertedAt: timestamp()})
CREATE (exaAI:EXA_AI {id: randomUUID(), title: "Exa AI", insertedAt: timestamp()})
CREATE (chatGPT:CHATGPT {id: randomUUID(), title: "ChatGPT", insertedAt: timestamp()})
CREATE (claude:CLAUDE {id: randomUUID(), title: "Claude", insertedAt: timestamp()})
CREATE (search)-[:HAS_DATA_SOURCE]->(google)
CREATE (search)-[:HAS_DATA_SOURCE]->(duckduckgo)
CREATE (search)-[:HAS_DATA_SOURCE]->(exaAI)
CREATE (search)-[:HAS_DATA_SOURCE]->(chatGPT)
CREATE (search)-[:HAS_DATA_SOURCE]->(claude);

MATCH (quickCommerce:QUICK_COMMERCE)
CREATE (swiggy:SWIGGY {id: randomUUID(), title: "Swiggy", insertedAt: timestamp()})
CREATE (blinkit:BLINKIT {id: randomUUID(), title: "Blinkit", insertedAt: timestamp()})
CREATE (zepto:ZEPTO {id: randomUUID(), title: "Zepto", insertedAt: timestamp()})
CREATE (quickCommerce)-[:HAS_DATA_SOURCE]->(swiggy)
CREATE (quickCommerce)-[:HAS_DATA_SOURCE]->(blinkit)
CREATE (quickCommerce)-[:HAS_DATA_SOURCE]->(zepto);

MATCH (travel:TRAVEL)
CREATE (uber:UBER {id: randomUUID(), title: "Uber", insertedAt: timestamp()})
CREATE (nammayatri:NAMMA_YATRI {id: randomUUID(), title: "Namma Yatri", insertedAt: timestamp()})
CREATE (ola:OLA {id: randomUUID(), title: "Ola", insertedAt: timestamp()})
CREATE (travel)-[:HAS_DATA_SOURCE]->(uber)
CREATE (travel)-[:HAS_DATA_SOURCE]->(nammayatri)
CREATE (travel)-[:HAS_DATA_SOURCE]->(ola);

MATCH (eCommerce:E_COMMERCE)
CREATE (amazon:AMAZON {id: randomUUID(), title: "Amazon", insertedAt: timestamp()})
CREATE (flipkart:FLIPKART {id: randomUUID(), title: "Flipkart", insertedAt: timestamp()})
CREATE (ajio:AJIO {id: randomUUID(), title: "Ajio", insertedAt: timestamp()})
CREATE (eCommerce)-[:HAS_DATA_SOURCE]->(amazon)
CREATE (eCommerce)-[:HAS_DATA_SOURCE]->(flipkart)
CREATE (eCommerce)-[:HAS_DATA_SOURCE]->(ajio);
