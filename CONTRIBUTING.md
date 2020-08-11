# Contributing

See <https://github.com/traefik/traefik/blob/master/CONTRIBUTING.md>.

## Why a separated repository?

The goal is to have a Docker's official image,
which includes following instructions from
<https://github.com/docker-library/official-images>.

One of the key points is the combination of
<https://github.com/docker-library/official-images#cacheability>
and <https://github.com/docker-library/official-images#security>,
which makes a requirement to commit Traefik's binaries inside the repository.

Then, to avoid slowing down the main
[Traefik's repository](https://github.com/traefik/traefik),
 a separated repository is required.

## How do you release?

### Step 1: Traefik release

The script `update.sh` is called with the Traefik's version to use
as argument:

```shell
bash ./update.sh v1.7.0-rc
```

This call is done by the main release process here:
<https://github.com/traefik/traefik/blob/master/script/deploy.sh#L21>.

### Step 2: Pull Request to the official Docker Library

This step is done by an internal bot at Traefik Labs.
It is in charge of automating creation of Pull Requests against <https://github.com/docker-library/official-images>.

Example of automated Pull Request: <https://github.com/docker-library/official-images/pull/4602>.

## More

[![Official Image Tests (alpine)](https://travis-ci.com/traefik/traefik-library-image.svg?branch=master)](https://travis-ci.com/traefik/traefik-library-image)
[![appveyor Build status](https://ci.appveyor.com/api/projects/status/ahndudkeca1g7qf8/branch/master?svg=true)](https://ci.appveyor.com/project/traefiker/traefik-library-image/branch/master)
