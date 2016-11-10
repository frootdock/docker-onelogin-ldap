FROM frootdock/docker-oracle-jdk8
MAINTAINER andreas@froot.io

# Build arguments (used only during image build!)
ARG ONELOGIN_LDAP_COONECTOR_VERSION=1_32

# Environment variables (used during runtime of the docker and not the image build!)
ENV ONELOGIN_TOKEN="" \
    ONELOGIN_SYNC_INTERVAL=30 \
    ONELOGIN_SYNC_THREADS=4 \
    ONELOGIN_BASE_DN="" \
    ONELOGIN_OBJECT_CLASSES="inetOrgPerson, posixAccount" \
    ONELOGIN_OPERATIONAL_ATTRIBS="" \
    ONELOGIN_PASSWORD_CRYPT="SSHA" \
    ONELOGIN_JAVA_OPTS="-XX:-UseGCOverheadLimit -Xmx1024M -Xms1024M"

RUN \
 apt-get update && \
 apt-get install -y unzip curl && \
 curl -o /tmp/ldap_connector.zip -L https://s3.amazonaws.com/onelogin-downloads/ldapc/${ONELOGIN_LDAP_COONECTOR_VERSION}/ldap_connector.zip && \
 unzip /tmp/ldap_connector.zip && \
 mv ./ldap_connector /bin/ldap_connector


COPY bin/run-connector.sh /bin/ldap_connector/
RUN chmod +x /bin/ldap_connector/*.sh
RUN mkdir /bin/ldap_connector/log

CMD /bin/ldap_connector/run-connector.sh
