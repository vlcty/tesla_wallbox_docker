# tesla_wallbox_docker

InfluxDB + tesla_wallbox_exporter + Grafana + Telegraf + Docker = <3

> **Warning**   
> This software is designed around Europe's three phase power grid. If you are located outside said region this software might not work for you.

> **Warning**   
> A user reported problems on a Raspberry Pi running the Armv7 architecture. It seems that the official influxdb image does not support that architecture. Make sure you run this on amd64 or aarch64 architecture! Check with: `docker run -it --rm alpine apk --print-arch`

This is my first public compose file. Please be gentle.

## What you get

Current charging session:

![Chargin session](/.github/screenshots/charging-session.png?raw=true "Charging session overview")

Grid details:

![Grid details](/.github/screenshots/grid-details.png?raw=true "Grid details")

## Stack overview

This stack is composed from:

- InfluxDB: A time series database
- Grafana: A visualization tool
- tesla_wallbox_exporter: A proxy appliation to translate the wallbox API result into prometheus format
- Telegraf: Collects metrics from tesla_wallbox_exporter and writes them into influxdb

## Usage

Open the `compose.yml` file and read it. It's very simple. Exchange the `TESLA_WALLBOX_IP` env variable with the real IP address of your Tesla gen 3 wallbox. Afterwards you can start the stack:

   docker-compose up -d

That's basically it. Navigate to [Grafana](http://localhost:3000) and have a look at the dashboards. The default credentials are admin/admin.

## Security

This project contains hardcoded credentials and keys. Don't make it accessible from untrusted networks e.g. the internet.