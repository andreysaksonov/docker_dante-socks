## docker_dante-socks
Dante SOCKS Docker Image

[![](https://images.microbadger.com/badges/version/andreysaksonov/dante-socks.svg)](https://microbadger.com/images/andreysaksonov/dante-socks)
[![](https://images.microbadger.com/badges/image/andreysaksonov/dante-socks.svg)](https://microbadger.com/images/andreysaksonov/dante-socks)

### Run Container
1. Download [Docker](https://www.docker.com/community-edition)
2. `docker pull andreysaksonov/dante-socks`
3. `docker run -it -p 1080:1080/tcp -p 1080:1080/udp -e PROXY_USER_PASSWORD=proxy_password andreysaksonov/dante-socks`
4. `curl --proxy socks5://proxy:proxy_password@localhost:1080 https://example.com`

### Custom Config
* `mkdir -p ./config/dante-socks`
* `cp ./etc/dante-socks/sockd.conf ./config/dante-socks/`
* `docker run -d -p 1080:1080/tcp -p 1080:1080/udp -v $(pwd)/config/dante-socks:/etc/dante-socks andreysaksonov/dante-socks`

#### Authors
* [Andrey Saksonov](https://saksonov.me)
