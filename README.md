# paulseward/docker-tftp-hpa
Simplistic docker image for running tftp-hpa

## Requires
For multi-arch support we need:
* qemu + docker 19.03+
  * https://docs.docker.com/buildx/working-with-buildx/
  * https://docs.docker.com/docker-for-mac/multi-arch/

For same-arch support we only need:
* docker 1.9+

## Notes

It might be advantageous to make use of `docker buildx` to build for multiple architectures.

```
# Create a build builder called `mybuilder`
docker buildx create --name mybuilder --use --platform "linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7"
docker buildx inspect --bootstrap

# Build for arm32v7, and load the resulting image into the local docker 
docker buildx build --build-arg VERSION=latest --build-arg ARCH=arm32v7 --platform linux/arm/v7 --load .
```

If you don't want the hastle of making a `docker buildx` environment that works, GCP Cloud Shell is already configured for it and works great.

## ToDo:
  * Plain `docker build` Makefile target for same-arch building
  * Per-architecture Makefile targets
  * Build-all target
  * Repo/Image name, tagging etc
  * Push

