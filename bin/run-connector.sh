#!/usr/bin/env bash

/usr/bin/java ${ONELOGIN_JAVA_OPTS} -jar /bin/ldap_connector/ldap-connector.jar \
    --token ${ONELOGIN_TOKEN} \
    --sync-interval ${ONELOGIN_SYNC_INTERVAL} \
    --sync-threads ${ONELOGIN_SYNC_THREADS} \
    --base-dn "${ONELOGIN_BASE_DN}" \
    --object-classes "${ONELOGIN_OBJECT_CLASSES}" \
    --operational-attributes "${ONELOGIN_OPERATIONAL_ATTRIBS}" \
    --password-crypt "${ONELOGIN_PASSWORD_CRYPT}"
