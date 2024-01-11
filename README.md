# Share

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/Marty42780/share/publish.yml?label=%F0%9F%9A%80%20Docker%20Publish)

Share files with your friends through a rsync command.

## Usage

Docker compose example:

```yaml
services:
  share:
    image: share:latest
    ports:
      - "1234:22" # randomize this port
    volumes:
      - ./share:/home/share:ro # read only
    environment:
      - PASSWORD=<your password> # randomize the password
    container_name: share
```

Docker run example:

```bash
docker run -d --rm \
  -p 1234:22 \ # randomize this port
  -v <folder/to/share>:/home/share:ro \
  -e PASSWORD=<your password> \ # randomize the password
  --name share \
  share:latest
```

## Download a file

```bash
# Download
rsync -avzPe "ssh -p 1234" share@<domain>:file ./
```

You can edit your ssh config file to make it easier:

```bash
# ~/.ssh/config
Host share
  HostName <domain>
  Port 1234
  User share
```

```bash
# Download
rsync -avzPe ssh share:file ./
```


---
2024 / [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) © [Marty42](https://github.com/Marty42780)