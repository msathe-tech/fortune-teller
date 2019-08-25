#!/bin/bash

# Set app suffix
echo -n "App suffix ['random']> "
read UINPUT
if [ -z "$UINPUT" ]; then
    UINPUT="random"
fi
REGION=$UINPUT

# delete apps
cf delete $UINPUT-fortune-service -f
cf delete $UINPUT-fortune-ui -f

# delete services
cf delete-service fortunes-db -f
cf delete-service fortunes-config-server -f
cf delete-service fortunes-service-registry -f
cf delete-service fortunes-circuit-breaker-dashboard -f
cf delete-service fortunes-cloud-bus -f

# delete orgphaned routes
cf delete-orphaned-routes -f
