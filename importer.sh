#!/bin/sh
sed -i "s/localhost/172\.17\.0\.1/g" /opt/vlo/config/VloConfig.xml

touch /opt/vlo/log/vlo-importer.log
ln -sf /dev/stdout /opt/vlo/log/vlo-importer.log
cd /opt/vlo/bin/
./vlo_solr_importer.sh
