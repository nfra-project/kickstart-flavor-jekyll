
# kickstart-flavor Jekyll :: Apache2, Jekyll Static Site Generator

[![Actions Status](https://github.com/nfra-project/kickstart-flavor-jekyll/workflows/test/badge.svg)](https://github.com/nfra-project/kickstart-flavor-jekyll/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/nfra/kickstart-flavor-jekyll.svg)](https://github.com/nfra-project/kickstart-flavor-jekyll)

see (http://github.com/infracamp/kickstart) for more information.

Document Index:

- [Development Guide for this flavor](DEVELOPMENT.md)
- [Dockerhub page](https://hub.docker.com/r/nfra/kickstart-flavor-jekyll/)
    - [Tags available](https://hub.docker.com/r/nfra/kickstart-flavor-jekyll/tags/)
    - [Build details](https://hub.docker.com/r/nfra/kickstart-flavor-jekyll/builds/)


## Tags

*Use -min images in Dockerfile and main image in .kick.yml*

| Tag         | OS                            | Branch     | CKit | Docs |
|-------------|-------------------------------|------------|------|------|
| 1.0         | Ubuntu 20.04 (LTS)            | 1.0-stable | 1.4  | [Readme](https://github.com/nfra-project/kickstart-flavor-jekyll/tree/1.0-stable) |
| unstable    | Ubuntu 20.04 (master), PHP8   | main     | unstable  | [Readme](https://github.com/nfra-project/kickstart-flavor-jekyll/) |

Kickstart uses a fixed version of Ckit to keep the features freeze within
a version.

## Usage

Demo <kbd>.kick.yml</kbd>

```yaml
version: 1
from: "ghcr.io/nfra-project/kickstart-flavor-jekyll:1.0"
ports: "80;4000;4100"

command:
  build:
    - "jekyll build -s /opt/docs -d /var/www/html"
  dev:
    - "jekyll serve -s /opt/docs -d /var/www/html --livereload --port 4000 --livereload-port 4100 --host 0.0.0.0"
```


