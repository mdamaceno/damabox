#!/bin/bash

${PREFIX}/bin/fbguard &

service hqbird console &

chown -R firebird:root /hqbird_conf

if [[ -f /hqbird_conf/access.properties ]]; then
  rm /opt/hqbird/conf/access.properties
  cp /hqbird_conf/access.properties /opt/hqbird/conf/
fi

if [[ -f /hqbird_conf/application.properties ]]; then
  rm /opt/hqbird/conf/application.properties
  cp /hqbird_conf/application.properties /opt/hqbird/conf/
fi

if [[ -f /hqbird_conf/license.properties ]]; then
  rm /opt/hqbird/conf/license.properties
  cp /hqbird_conf/license.properties /opt/hqbird/conf/
fi

if [[ -f /hqbird_conf/network.properties ]]; then
  rm /opt/hqbird/conf/network.properties
  cp /hqbird_conf/network.properties /opt/hqbird/conf/
fi

if [[ -f /hqbird_conf/vss.properties ]]; then
  rm /opt/hqbird/conf/vss.properties
  cp /hqbird_conf/vss.properties /opt/hqbird/conf/
fi

if [[ -f /hqbird_conf/ftpsrv.properties ]]; then
  rm /opt/hqbird/conf/ftpsrv.properties
  cp /hqbird_conf/ftpsrv.properties /opt/hqbird/conf/
fi

if [[ -f /hqbird_conf/agent.properties ]]; then
  rm /opt/hqbird/conf/agent/agent.properties
  cp /hqbird_conf/agent.properties /opt/hqbird/conf/agent/
fi

tail -f /opt/firebird/firebird.log
