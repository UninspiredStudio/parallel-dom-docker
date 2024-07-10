# Parallel DOM Backend Docker

> This is simply a docker image of the Parallel DOM "backend". We are not in any involved in the original creation of pdom, for the original source code and documentation go [here](https://github.com/pdomdev/pdom).

## What is this?

This is a repository containing a Dockerfile that will build the latest version of the Parallel DOM backend and build it into an easy-to-use nginx-based docker image.

NGINX is already configured to always add the required `Origin-Agent-Cluster` header to every response (see [here](https://github.com/pdomdev/pdom?tab=readme-ov-file#domain-and-header-configuration)).

## How do I use this?

Simply run the latest version of the image and expose the port of the webserver to your host.

Using Docker CLI:

```sh
docker run -p 8080:80 uninspiredstudioops/parallel-dom:latest
```

Using docker-compose:

```yaml
services:
  pdom:
    restart: always
    image: uninspiredstudioops/parallel-dom:latest
    ports:
      - 8080:80
```

## How do I change the nginx configuration?

If you need something more flexible than this, we would suggest you build the image with your specific configuration yourself (feel free to use the Dockerfile in this repository as reference).

You should be able to mount your specific nginx config as you would with the base nginx image as described [here](https://hub.docker.com/_/nginx/) as well.
