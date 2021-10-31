# tesla_wallbox_docker

InfluxDB + Wallbox Exporter + Docker = <3

This is my first public compose environment. Please be gentle.

## What it does

This stack contains two images:

- InfluxDB: A time series database
- tesla_wallbox_exporter: A prometheus like exporter / proxy to get data from a Tesla wallbox

A nice dashboard will tell you the vitals of your wallbox.

## Usage

Open the `compose.yml` file and read it. It's very simple and beginner friendly. Exchange the `TESLA_WALLBOX_IP` env variable with the real IP address of your Tesla gen 3 wallbox. Afterwards you can start the stack:

   docker compose up -d

After some time you should be able to open [InfluxDB](http://localhost:8086). Log in with the following credentials:

   Username: admin   
   Password: supers3cret

After logging in successfully navigate to Data -> Scrapers -> Create scraper. Input the following details:

   Name: wallbox   
   Bucket to store scraped metrics: dontcare   
   Target URL: http://exporter:8420/query   
   Click "Create"

InfluxDB should now query every 10 seconds for metrics.

Last step is to add a dashboard. Navigate to Boards -> Create dashboard -> Import dashboard. Upload the `influx-dashboard.json` file or copy the content from it and click on the import button. Open the dashboard.

Adapt the dashboard how you like it. For example adapt the "Costs" dashboard as it calculates by default with 28 (Euro-)Cents per kWh.
