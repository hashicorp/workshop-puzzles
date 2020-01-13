# Terraform Puzzle #3
## Space - The Final Frontier
**Challenge Level: Advanced**

![](../images/mars_colony.png)

### Background
👩🏽‍🚀 It's 2120 and the Mars Colony project is progressing nicely. As a senior sysadmin working out of Mariner Valley your job is to provision fuel supplies for the various colonies and bases. You need to import Mars weather data into your terraform runs to ensure the right amount of fuel is shipped during each Martian season.

In this challenge you'll bring external data sources into your terraform run.

### Setup
You'll need both the jq and bc programs installed to complete this puzzle. On Ubuntu systems you can install them with the following command:

```bash
sudo apt -y install bc jq
```

### The Challenge
Use the `mars_weather.sh` script along with an [external data source](https://www.terraform.io/docs/providers/external/data_source.html) and a [null resource](https://www.terraform.io/docs/provisioners/null_resource.html) to fetch the most recent weather forecast from NASA's [Insight Weather Station](https://mars.nasa.gov/insight/weather/) at Elysium Planitia.

Your terraform code can all go into a single file, main.tf. It should output the most recent minimum and maximum temperature from Elysium Planitia. You can use a **local_exec** provisioner in your null resource to echo out the temperatures.