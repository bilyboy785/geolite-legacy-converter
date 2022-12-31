# Geolite Legacy converter 
Basic script to convert MMDB / ZIP GeoLite database to DAT format

Find below latest releases : 

 * 20221230 - [GeoLite City DAT]([files/GeoLite2-City_20221230.dat](https://github.com/bilyboy785/geolite-legacy-converter/blob/main/files/GeoLite2-City_20221230.dat?raw=true)) - [GeoLite Country DAT]([files/GeoLite2-Country_20221230.dat](https://github.com/bilyboy785/geolite-legacy-converter/blob/main/files/GeoLite2-Country_20221230.dat?raw=true))

## Usage

```
usage: geolite2legacy.py [-h] -i INPUT_FILE -o OUTPUT_FILE [-f FIPS_FILE]
                         [-e ENCODING] [-d] [-6]

optional arguments:
  -h, --help            show this help message and exit
  -i INPUT_FILE, --input-file INPUT_FILE
                        input zip file containings csv databases
  -o OUTPUT_FILE, --output-file OUTPUT_FILE
                        output GeoIP dat file
  -f FIPS_FILE, --fips-file FIPS_FILE
                        geonameid to fips code mappings
  -e ENCODING, --encoding ENCODING
                        encoding to use for the output rather than utf-8
  -d, --debug           debug mode
  -6, --ipv6            use ipv6 database
```

## Download and convert latest releases
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

## Run it inside a Docker
Build the docker image : 

```
docker build -t geolite-legacy-converter .
```

Run the docker in the current directory, with two ZIP files downloaded :

```
docker run -it -v $(pwd):/src geolite-legacy-converter:latest -i /src/GeoLite2-City-CSV_20221230.zip -o /src/GeoIP-City.dat
```

## Autoupdate script
I wrote a script to download and update latest release from [https://dl.miyuru.lk](https://dl.miyuru.lk).

```
./autoupdate.sh
```

Script ask u the output path for DAT files, download and extract them. Or u can specify the path if you add it in cron :

```
./autoupdate.sh /etc/nginx/geoip
```