#!/bin/sh
set -e

if [ -n "$ACTIVEMQ_ADMIN_PASSWORD" ]; then
  sed -i "/^admin/ s/\: \(admin\),/: ${ACTIVEMQ_ADMIN_PASSWORD},/" /opt/activemq/conf/jetty-realm.properties
fi

if [ -n "$ACTIVEMQ_USER_PASSWORD" ]; then
  sed -i "/^user/ s/\: \(user\),/: ${ACTIVEMQ_USER_PASSWORD},/" /opt/activemq/conf/jetty-realm.properties
fi

chown -R activemq:activemq /opt/activemq
exec su-exec activemq /opt/activemq/bin/activemq console
