UI: https://github.com/narengogi/chintamani-ui

<img width="1536" height="2048" alt="chintamani" src="https://github.com/user-attachments/assets/a6a81324-76b6-419a-8158-e390ed586541" />

This is the graph engine + web server for the project

It connects disparate datasources like friends -> their socials -> their friends on their socials -> and so on, and pulls in data for me to consume asynchronously.

The idea for this is quite simple. I want to be able to consume information asynchronously and only consume the information I am interested in.

The project itself is composed of 4 simple parts:
- the data crawlers (different types of connectors for different sources like APIs, web, etc)
- the graph store
- the query engine
- web server and its components
