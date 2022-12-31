# Geolite Legacy converter 
Basic script to convert MMDB / ZIP GeoLite database to DAT format

 * 20221230 - [GeoLite City]([files/GeoLite2-City_20221230.dat](https://github.com/bilyboy785/geolite-legacy-converter/blob/main/files/GeoLite2-City_20221230.dat?raw=true)) - [GeoLite Country]([files/GeoLite2-Country_20221230.dat](https://github.com/bilyboy785/geolite-legacy-converter/blob/main/files/GeoLite2-Country_20221230.dat?raw=true))

## Usage
To get the latest zip version of GeoLite database, create an account on [MaxMind](https://www.maxmind.com/en/accounts/) and go to Download Files in the left panel.

For City database, clic on the **Download GZIP** Link :

![](https://i.imgur.com/PLW2gCl.jpg)

For Country database, clic on the **Download GZIP** Link :

![](https://i.imgur.com/vWyZ0mv.jpg)

### Conversion
Now, you've got two ZIP files, launch the script to convert them to DAT format : 

```
python3 geolite2legacy.py -i files/GeoLite2-Country-CSV_20221230.zip -f geoname2fips.csv -o files/GeoLite2-Country_20221230.dat
```

```
python3 geolite2legacy.py -i files/GeoLite2-City-CSV_20221230.zip -f geoname2fips.csv -o files/GeoLite2-City_20221230.dat
```

