CREATE DATABASE IF NOT EXISTS chintamani; //In community edition, we can create only one database.

CREATE (n:NAREN {title: "Narendranath Gogineni", age: 25, aboutMe: "I exist as an idea", id: randomUUID()});

MATCH (n:NAREN)
CREATE (blogs:BLOGS {id: randomUUID(), title: "Blogs"})
CREATE (github:GITHUB {id: randomUUID(), title: "Github", username: "narengogi"})
CREATE (socials:SOCIALS {id: randomUUID(), title: "Socials"})
CREATE (browsers:BROWSERS {id: randomUUID(), title: "Browsers"})
CREATE (music:MUSIC {id: randomUUID(), title: "Music"})
CREATE (health:HEALTH {id: randomUUID(), title: "Health"})
CREATE (search:SEARCH {id: randomUUID(), title: "Search"})
CREATE (quickCommerce:QUICK_COMMERCE {id: randomUUID(), title: "Quick Commerce"})
CREATE (travel:TRAVEL {id: randomUUID(), title: "Travel"})
CREATE (mail:MAIL {id: randomUUID(), title: "Mail"})
CREATE (eCommerce:E_COMMERCE {id: randomUUID(), title: "E-Commerce"})
CREATE (stremio:STREMIO {id: randomUUID(), title: "Stremio"})
CREATE (people:PEOPLE {id: randomUUID(), title: "People"})
CREATE (obsidian:OBSIDIAN {id: randomUUID(), title: "Obsidian"})
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
CREATE (x:X {id: randomUUID(), title: "X"})
CREATE (y:YOUTUBE {id: randomUUID(), title: "Youtube"})
CREATE (goodreads:GOODREADS {id: randomUUID(), title: "Goodreads"})
CREATE (i:INSTAGRAM {id: randomUUID(), title: "Instagram"})
CREATE (f:FACEBOOK {id: randomUUID(), title: "Facebook"})
CREATE (reddit:REDDIT {id: randomUUID(), title: "Reddit"})
CREATE (socials)-[:HAS_DATA_SOURCE]->(x)
CREATE (socials)-[:HAS_DATA_SOURCE]->(y)
CREATE (socials)-[:HAS_DATA_SOURCE]->(goodreads)
CREATE (socials)-[:HAS_DATA_SOURCE]->(i)
CREATE (socials)-[:HAS_DATA_SOURCE]->(f)
CREATE (socials)-[:HAS_DATA_SOURCE]->(reddit);

MATCH (browsers:BROWSERS)
CREATE (chrome:CHROME {id: randomUUID(), title: "Chrome"})
CREATE (edge:EDGE {id: randomUUID(), title: "Edge"})
CREATE (firefox:FIREFOX {id: randomUUID(), title: "Firefox"})
CREATE (safari:SAFARI {id: randomUUID(), title: "Safari"})
CREATE (arc:ARC {id: randomUUID(), title: "Arc"})
CREATE (browsers)-[:HAS_DATA_SOURCE]->(chrome)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(edge)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(firefox)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(safari)
CREATE (browsers)-[:HAS_DATA_SOURCE]->(arc);

MATCH (music:MUSIC)
CREATE (spotify:SPOTIFY {id: randomUUID(), title: "Spotify"})
CREATE (appleMusic:APPLE_MUSIC {id: randomUUID(), title: "Apple Music"})
CREATE (music)-[:HAS_DATA_SOURCE]->(spotify)
CREATE (music)-[:HAS_DATA_SOURCE]->(appleMusic);

MATCH (health:HEALTH)
CREATE (strava:STRAVA {id: randomUUID(), title: "Strava"})
CREATE (appleHealth:APPLE_HEALTH {id: randomUUID(), title: "Apple Health"})
CREATE (health)-[:HAS_DATA_SOURCE]->(strava)
CREATE (health)-[:HAS_DATA_SOURCE]->(appleHealth);

MATCH (search:SEARCH)
CREATE (google:GOOGLE {id: randomUUID(), title: "Google"})
CREATE (duckduckgo:DUCKDUCKGO {id: randomUUID(), title: "DuckDuckGo"})
CREATE (exaAI:EXA_AI {id: randomUUID(), title: "Exa AI"})
CREATE (chatGPT:CHATGPT {id: randomUUID(), title: "ChatGPT"})
CREATE (claude:CLAUDE {id: randomUUID(), title: "Claude"})
CREATE (search)-[:HAS_DATA_SOURCE]->(google)
CREATE (search)-[:HAS_DATA_SOURCE]->(duckduckgo)
CREATE (search)-[:HAS_DATA_SOURCE]->(exaAI)
CREATE (search)-[:HAS_DATA_SOURCE]->(chatGPT)
CREATE (search)-[:HAS_DATA_SOURCE]->(claude);

MATCH (quickCommerce:QUICK_COMMERCE)
CREATE (swiggy:SWIGGY {id: randomUUID(), title: "Swiggy"})
CREATE (blinkit:BLINKIT {id: randomUUID(), title: "Blinkit"})
CREATE (zepto:ZEPTO {id: randomUUID(), title: "Zepto"})
CREATE (quickCommerce)-[:HAS_DATA_SOURCE]->(swiggy)
CREATE (quickCommerce)-[:HAS_DATA_SOURCE]->(blinkit)
CREATE (quickCommerce)-[:HAS_DATA_SOURCE]->(zepto);

MATCH (travel:TRAVEL)
CREATE (uber:UBER {id: randomUUID(), title: "Uber"})
CREATE (nammayatri:NAMMA_YATRI {id: randomUUID(), title: "Namma Yatri"})
CREATE (ola:OLA {id: randomUUID(), title: "Ola"})
CREATE (travel)-[:HAS_DATA_SOURCE]->(uber)
CREATE (travel)-[:HAS_DATA_SOURCE]->(nammayatri)
CREATE (travel)-[:HAS_DATA_SOURCE]->(ola);

MATCH (eCommerce:E_COMMERCE)
CREATE (amazon:AMAZON {id: randomUUID(), title: "Amazon"})
CREATE (flipkart:FLIPKART {id: randomUUID(), title: "Flipkart"})
CREATE (ajio:AJIO {id: randomUUID(), title: "Ajio"})
CREATE (eCommerce)-[:HAS_DATA_SOURCE]->(amazon)
CREATE (eCommerce)-[:HAS_DATA_SOURCE]->(flipkart)
CREATE (eCommerce)-[:HAS_DATA_SOURCE]->(ajio);
