# kmlinters

A docker image for various kubernetes manifests linters.

- [kubeval](https://github.com/instrumenta/kubeval)
- [conftest](https://github.com/open-policy-agent/conftest)
- [pluto](https://github.com/FairwindsOps/pluto)

## docker image

Public docker image is available [here](https://hub.docker.com/r/makocchi/kmlinters).

## Usage

Here are examples.

```bash
# kubeval
docker run --rm  -v ${PWD}:/work makocchi/kmlinters kubeval -d /work

# conftest
docker run --rm  -v ${PWD}:/work makocchi/kmlinters conftest test /work

# pluto
docker run --rm  -v ${PWD}:/work makocchi/kmlinters pluto detect-files -d /work
```
