#!/bin/bash

tag=1.0-SNAPSHOT

for service in wfs gwc wcs webui rest wms
do
  name="geoserver-cloud-$service"
  from="geoservercloud/$name"
  to="k3d-registry.localhost:5000/$name"
  
  echo docker tag $from:$tag $to:$tag
  docker tag $from:$tag $to:$tag
  
  echo docker push $to:$tag
  docker push $to:$tag
  
  # echo helm upgrade --set geoserver.$service.image.repository=$to --set geoserver.$service.image.tag=$tag geoserver .
  # helm upgrade --set geoserver.$service.image.repository=$to --set geoserver.$service.image.tag=$tag geoserver .
  
  echo
done



