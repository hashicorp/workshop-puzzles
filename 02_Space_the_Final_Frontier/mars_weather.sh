#!/bin/bash
# Sample script for fetching weather from the NASA API
# Get your NASA API key here: https://api.nasa.gov/
# Outputs the most recent Sol's minimum and maximum temperature in Fahrenheit.

function error_exit() {
  echo "$1" 1>&2
  exit 1
}

function check_deps() {
  test -f $(which jq) || error_exit "jq command not detected in path, please install it"
}

function parse_input() {
  eval "$(jq -r '@sh "export API_KEY=\(.api_key)"')"
  if [[ -z "${API_KEY}" ]]; then export API_KEY=none; fi
}

function get_weather() {
  curl "https://api.nasa.gov/insight_weather/?api_key=${API_KEY}&feedtype=json&ver=1.0" > /tmp/mars_weather.json

  # The API provides the last 7 days of weather data.
  # Array position 6 is the most recent one.
  MIN=$(jq '[.[] ] | .[6].AT.mn' /tmp/mars_weather.json)
  MAX=$(jq '[.[] ] | .[6].AT.mx' /tmp/mars_weather.json)

  # Convert from Celsius to Fahrenheit.
  MIN_F=$(printf %.0f $(echo "scale=2;((9/5) * $MIN) + 32" |bc))
  MAX_F=$(printf %.0f $(echo "scale=2;((9/5) * $MAX) + 32" |bc))

  jq -n \
    --arg min_temp_f "$MIN_F" \
    --arg max_temp_f "$MAX_F" \
    '{"min_temp_f":$min_temp_f,"max_temp_f":$max_temp_f}'
}

check_deps
parse_input
get_weather