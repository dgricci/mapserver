## MapServer web mapping
FROM dgricci/gdal:0.0.4
MAINTAINER Didier Richard <didier.richard@ign.fr>

ARG MAPSERVER_VERSION
ENV MAPSERVER_VERSION ${MAPSERVER_VERSION:-7.0.6}
ARG MAPSERVER_DOWNLOAD_URL
ENV MAPSERVER_DOWNLOAD_URL ${MAPSERVER_DOWNLOAD_URL:-http://download.osgeo.org/mapserver/mapserver-$MAPSERVER_VERSION.tar.gz}

COPY build.sh /tmp/build.sh
    
RUN /tmp/build.sh && rm -f tmp/build.sh

WORKDIR /geodata

# check and print capabilities
CMD ["mapserv", "-v"]

