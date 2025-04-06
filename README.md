# DDON Docker
This repository contains a docker-compose.yml with a couple of utilities to set up a docker container that runs DDON server.

## Initial Setup
1. Create a folder on your host machine
2. Run `git clone https://github.com/AlexMacocian/DDONDocker`
3. Navigate to `DDONDocker/docker-compose.yml`
4. Open the yml file with a text editor and adjust it
    - Modify the source of the ddon volume to a place on your host where you want to persist your files. `source: CHANGE_ME`
5. Run `docker compose run --rm install` and follow the installation steps
6. The installation script will now download and set up DDON server in the persistent folder that you set up on step 4.
8. Run `docker compose up -d server` to start the server
9. Run `docker compose down` to stop the server

## Update DDON
If you want to update DDON private server binaries, run `docker compose run --rm install`