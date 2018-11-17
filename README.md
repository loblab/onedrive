# Docker based Linux OneDrive client

Based on [skilion/onedrive](https://github.com/skilion/onedrive), build from scratch.
With docker-compose.yml provided, support multiple accounts.
Sync or just download (1 way sync) specific directories.

- Platform: Docker CE (tested on docker ce 18.x, Ubuntu/Mac)
- Updated: 11/17/2018
- Created: 11/17/2018
- Author: loblab

## Usage

- Edit docker-compose.yml. To support download only, MODE=download; default is "monitor"
- Run "docker-compose run onedrive1", paste the URL to browser, login, get another URL and paste it back.
- Stop (Ctrl-C) & remove the temp onedrive1 container
- Run "docker-compose up -d onedrive1"

## Remarks

- To support "download only" (1 way sync), newer version is needed. [oznu/onedrive](https://hub.docker.com/r/oznu/onedrive/) is out of date. It (ver 1.0.1) only supports "monitor" mode.
- Put sync_list to the config dir. It is not ~/.config/onedrive as [the
  document](https://github.com/skilion/onedrive#selective-sync) said if you specify the config dir.
Since we specify the config dir to "/config", sync_list should be put/mounted to "/config".
- The database format is not compitable between ver 1.1.3 & 1.0.1 as tested. Have to clean &
  re-sync (see clean.sh).

## Reference

- [docker: oznu/onedrive](https://hub.docker.com/r/oznu/onedrive/)
- [github: skilion/onedrive](https://github.com/skilion/onedrive)

