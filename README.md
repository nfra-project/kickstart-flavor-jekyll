
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

| Tag      | OS                          | Branch      | CKit     | Docs                                                                               |
|----------|-----------------------------|-------------|----------|------------------------------------------------------------------------------------|
| 1.0      | Ubuntu 20.04 (LTS)          | 1.0-stable  | 1.4      | [Readme](https://github.com/nfra-project/kickstart-flavor-jekyll/tree/1.0-stable)  |
| 2.0      | Ubuntu 22.04 (LTS)          | release/2.0 | 1.4      | [Readme](https://github.com/nfra-project/kickstart-flavor-jekyll/tree/release/2.0) |
| 2.1      | Ubuntu 22.04 (LTS)          | release/2.1 | 1.5      | [Readme](https://github.com/nfra-project/kickstart-flavor-jekyll/tree/release/2.1) |
| 3.0      | Ubuntu 24.04 (LTS)          | release/3.0 | 1.5      | [Readme](https://github.com/nfra-project/kickstart-flavor-jekyll/tree/release/3.0)
| unstable | Ubuntu 24.04 (master), PHP8 | main        | unstable | [Readme](https://github.com/nfra-project/kickstart-flavor-jekyll/)                 |

Kickstart uses a fixed version of Ckit to keep the features freeze within
a version.

## Usage

Demo <kbd>.kick.yml</kbd>

```yaml
version: 1
from: "ghcr.io/nfra-project/kickstart-flavor-jekyll:3.0"
ports: "80;4000;4100"

command:
  build:
    - "jekyll build -s /opt/docs -d /var/www/html"
  
  sass:
    - "sass /opt/docs/_scss/theme.scss /opt/docs/assets/theme.css"
  
  dev:
    - "jekyll serve -s /opt/docs -d /var/www/html --livereload --port 4000 --livereload-port 4100 --host 0.0.0.0"
```

Resources:
- [Jekyll command line options](https://jekyllrb.com/docs/configuration/options/)


## Tools

- [KinderGarden installed](https://www.github.com/lack-project/lack-kindergarden)


## Faq

### Jekyll takes very long to compile page (>3 sec)

This might be because of sass compiling. Instead of using the buildin compiler
just run the sass command specified above.

```
sass [input] [output]
```
