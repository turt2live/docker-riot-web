# docker-riot-web

The docker image used by homeserver.today to deploy riot-web servers.

Available on Docker Hub as [hstoday/riot-web](https://hub.docker.com/r/hstoday/riot-web/). This image downloads and unpacks Riot at startup and is not
compiled during the Docker build.

# Running

By default, this will use the latest version of Riot at the time of starting up.

* Standard: `docker run -p 80:80 hstoday/riot-web`
* Custom port: `docker run -p 8000:8000 hstoday/riot-web /start.sh --port 8000`
* Custom riot-web version: `docker run -p 80:80 hstoday/riot-web /start.sh --riot-version=v0.14.0-rc.4`
* Custom port & version: `docker run -p 8000:8000 hstoday/riot-web /start.sh --port 8000 --riot-version=v0.14.0-rc.4`

Use `-v /path/to/config.json:/var/lib/nginx/html/config.json:ro` to specify a build config for Riot.
