---
title: logging into container
description: execute bash to logging interactively in to the running container allocating a pseudo-TTY
tags:
  - docker
  - container
  - bash
---
# Logging as root in a running container


execute bash to logging interactively in to the running container allocating a pseudo-TTY

``` bash
docker exec \
    -it \
    -u root \ # (1)!
    <container name> \
    bash
```

1.  use the -u option of the docker exec command to specify the user by name or id

## References
- [docker exec](https://docs.docker.com/engine/reference/commandline/exec/)
