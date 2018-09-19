#!/bin/bash

# service hqbird start

# /opt/firebird/bin/fb_smp_server &
${PREFIX}/bin/fbguard &

service hqbird console &

tail -f /opt/firebird/firebird.log
