<div align="center">

<!-- <img src="./assets/img/logo.png" alt="Gruvbox Material" width="40%"> -->

# Pi Coding Agent OCI Image

### An image I am using to sort of isolate my Pi coding agents from my actual system.

[How to Use](#how-to-use) | [How to Build](#how-to-build)

<hr />
</div>

> [!WARNING]
>
> Use at your own risk. There are pretty easy ways the agent can escape this container as soon as
> you mount any file to it. It still allows me to ensure it does not polute my system and only has
> access to the files assuming the agent is not trying to hack me.

## How to Use

I use it to have:

- Access to my central Pi configuration.
- Access to the files in the current directory.

Note that the image has users and groups preconfigured so that it does not conflict with users on my
system. This might not work for you.

```bash
# create a mise cache
docker volume create mise-cache
# run the docker container
docker run --rm \
  -it \
  -e OPENROUTER_API_KEY -e BRAVE_API_KEY \
  -v mise-cache:/home/f4z3r/.local/share/mise \
  -v ~/.pi:/home/f4z3r/.pi \
  -v ~/notes/resources/ai/:/home/f4z3r/notes/resources/ai \
  -v .:/home/f4z3r/workspace \
  ghcr.io/f4z3r/pi-agent-image:v0.2.0 \
  pi
```

## How to Build

Images are released to the GitHub container registry. If want to build it locally nonetheless:

```bash
docker build -t pi-agent-image:test .
```
