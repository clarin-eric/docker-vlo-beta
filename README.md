# docker-vlo beta

## Parameters

* SOLR_DATA, specify a custom solr data directory 
* STATSD_PREFIX, specifiy an alternative statsd prefix when sending statistics to metrics.clarin.eu.

## Volumes

* /opt/sitemap, output location of the sitemap generator

## Building

```
make
```

## Push to the CLARIN docker registry 

```
make push
```
