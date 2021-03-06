#!/bin/sh

get_icon() {
    case $1 in
        01d) icon="";;
        01n) icon="";;
        02d) icon="";;
        02n) icon="";;
        03*) icon="";;
        04*) icon="";;
        09d) icon="";;
        09n) icon="";;
        10d) icon="";;
        10n) icon="";;
        11d) icon="";;
        11n) icon="";;
        13d) icon="";;
        13n) icon="";;
        50d) icon="";;
        50n) icon="";;
        *) icon="";
    esac

    echo $icon
}

KEY="51559554982e52a671702d97f5d54a04"
CITY="1566083"
UNITS="metric"
SYMBOL="°"

if [ ! -z $CITY ]; then
    # weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID=$KEY&id=$CITY&units=$UNITS")
    weather=$(curl -sf "http://api.openweathermap.org/data/2.5/forecast?APPID=$KEY&id=$CITY&units=$UNITS&cnt=1")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)
 
    if [ ! -z "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"
        weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ ! -z "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".list[].main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".list[].weather[0].icon")
    location_name=$(echo "$weather" | jq -r ".list[].weather[0].description")

    echo "%{T4}%{O5}%{F#d1003e}$(get_icon "$weather_icon")%{F-}" "%{T1}$weather_temp%{F#00d9e5}$SYMBOL%{F-}%{T-}%{O5}$location_name"
fi
