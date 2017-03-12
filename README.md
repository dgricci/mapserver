% MapServer web mapping 
% Didier Richard
% 12/03/2017

---

revision:
    - 0.0.1 : 08/02/2017
    - 0.0.2 : 19/02/2017
    - 0.0.3 : 05/03/2017
    - 0.0.4 : 12/03/2017

---

# Building #

```bash
$ docker build -t dgricci/mapserver:$(< VERSION) .
$ docker tag dgricci/mapserver:$(< VERSION) dgricci/mapserver:latest
```

## Behind a proxy (e.g. 10.0.4.2:3128) ##

```bash
$ docker build \
    --build-arg http_proxy=http://10.0.4.2:3128/ \
    --build-arg https_proxy=http://10.0.4.2:3128/ \
    -t dgricci/mapserver:$(< VERSION) .
$ docker tag dgricci/mapserver:$(< VERSION) dgricci/mapserver:latest
```

## Build command with arguments default values ##

```bash
$ docker build \
    --build-arg MAPSERVER_VERSION=7.0.4 --build-arg MAPSERVER_DOWNLOAD_URL=http://download.osgeo.org/mapserver/mapserver-7.0.4.zip \
    -t dgricci/mapserver:$(< VERSION) .
$ docker tag dgricci/mapserver:$(< VERSION) dgricci/mapserver:latest
```

# Use #

See `dgricci/jessie` README for handling permissions with dockers volumes.

```bash
$ docker run --rm dgricci/mapserver
MapServer version 7.0.4 OUTPUT=PNG OUTPUT=JPEG OUTPUT=KML SUPPORTS=PROJ
SUPPORTS=AGG SUPPORTS=FREETYPE SUPPORTS=CAIRO SUPPORTS=SVG_SYMBOLS
SUPPORTS=RSVG SUPPORTS=ICONV SUPPORTS=XMP SUPPORTS=FRIBIDI SUPPORTS=WMS_SERVER
SUPPORTS=WMS_CLIENT SUPPORTS=WFS_SERVER SUPPORTS=WFS_CLIENT
SUPPORTS=WCS_SERVER SUPPORTS=SOS_SERVER SUPPORTS=FASTCGI SUPPORTS=THREADS
SUPPORTS=GEOS INPUT=JPEG INPUT=POSTGIS INPUT=OGR INPUT=GDAL INPUT=SHAPEFILE
```


_fin du document[^pandoc_gen]_

[^pandoc_gen]: document généré via $ `pandoc -V fontsize=10pt -V geometry:"top=2cm, bottom=2cm, left=1cm, right=1cm" -s -N --toc -o mapserver.pdf README.md`{.bash}
