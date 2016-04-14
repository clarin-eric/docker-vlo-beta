# docker-vlo beta

## Parameters

* SOLR_DATA, specify a custom solr data directory 
* STATSD_PREFIX, specifiy an alternative statsd prefix when sending statistics to metrics.clarin.eu.

## Volumes

* /opt/sitemap, output location of the sitemap generator

## Building 

### With access to the CLARIN docker registry

1. Build docker image locally:

```
make
```

#### Push to the CLARIN docker registry 

```
make push
```

### Without access to the CLARIN docker registry

clone and build the following repositories (or download and build the corresponding tag directly):

* docker.clarin.eu/base:1.0.1
  * GitHub: https://github.com/clarin-eric/docker-clarin-base
  * Release: https://github.com/clarin-eric/docker-clarin-base/releases/tag/release-1.0.1
    
* docker.clarin.eu/tomcat8:1.1.5,
  * GitHub: https://github.com/clarin-eric/docker-tomcat
  * Release: https://github.com/clarin-eric/docker-tomcat/releases/tag/release-1.1.5

You should end up with the following directories:

```
docker-clarin-base
docker-tomcat
docker-vlo-beta
```

To build all images :

```
cd docker-clarin-base && make && cd .. && \
cd docker-tomcat && make && cd .. && \
cd docker-vlo-beta && make && cd ..
```

## CLARIN docker registry

Send and email to sysops@clarin.eu to request access.
