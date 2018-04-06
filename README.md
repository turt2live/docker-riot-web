# docker-riot-web

The docker image used by homeserver.today to deploy riot-web servers.

Available on Docker Hub as [hstoday/riot-web](https://hub.docker.com/r/hstoday/riot-web/).

# Running

* Standard: `docker run -p 80:80 hstoday/riot-web`
* Custom port: `docker run -p 8000:8000 hstoday/riot-web /start.sh --port 8000`
* Custom riot-web version: `docker run -p 80:80 hstoday/riot-web /start.sh --riot-version=v0.14.0-rc.4`
* Custom port & version: `docker run -p 8000:8000 hstoday/riot-web /start.sh --port 8000 --riot-version=v0.14.0-rc.4`
