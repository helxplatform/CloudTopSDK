FROM helxplatform/cloudtop:develop-latest

COPY imagej.sh /
RUN chmod +x /imagej.sh && /imagej.sh

RUN mkdir -p /usr/local/renci/bin

COPY ./desktop/* /headless/Desktop/
COPY ./init.d/* /etc/cont-init.d/

# The CloudTop entrypoint
ENTRYPOINT [ "/init" ]
