# wait-for-200

Ultra lightweight container (< 5 MiB) that waits for a HTTP 200 response from a given URL.

## External dependencies

- **bash-static** v5.1.016-1.2.2 - https://github.com/robxu9/bash-static/releases/download/5.1.016-1.2.2/bash-linux-x86_64
- **curl-static** v7.82.0 - https://github.com/moparisthebest/static-curl/releases/download/v7.82.0/curl-amd64

## Usage

### Environment variables

- **URL** - URL to wait for (default: www.google.com)
- **TIMEOUT** - timeout in seconds (default: 600)

```shell
podman run --rm -e URL=http://test.com -e TIMEOUT=200 wait-for-200
```

## Build instructions

### Prerequisites

- **buildah** - [How to install](https://github.com/containers/buildah/blob/main/install.md)
- (alternative **docker** - use `alias buildah=docker`)

```shell
$ buildah build -t wait-for-200 .
STEP 1/7: FROM scratch
STEP 2/7: WORKDIR /
STEP 3/7: ADD --chmod=0755 https://github.com/robxu9/bash-static/releases/download/5.1.016-1.2.2/bash-linux-x86_64 bash
STEP 4/7: ADD --chmod=0755 https://github.com/moparisthebest/static-curl/releases/download/v7.82.0/curl-amd64 curl
STEP 5/7: COPY --chmod=0755 wait-for-200.sh .
STEP 6/7: ENV PATH="/"
STEP 7/7: ENTRYPOINT [ "bash","-c","wait-for-200.sh" ]
COMMIT wait-for-200
Getting image source signatures
Copying blob bd801d9c5e63 skipped: already exists  
Copying config 628341b460 done  
Writing manifest to image destination
Storing signatures
--> 628341b4608
Successfully tagged localhost/wait-for-200:latest
628341b460809f31cc5c21e553f7bfd0b8113c9d47bf8a019f26fd6338826301

$ buildah images wait-for-200
REPOSITORY               TAG      IMAGE ID       CREATED         SIZE
localhost/wait-for-200   latest   628341b46080   7 seconds ago   4.72 MB
```
