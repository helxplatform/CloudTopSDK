FROM helxplatform/cloudtop:develop-latest

COPY gnu-octave.sh /
RUN chmod +x /gnu-octave.sh && /gnu-octave.sh

RUN mkdir -p /usr/local/renci/bin

COPY ./desktop/* /headless/Desktop/
COPY ./init.d/* /etc/cont-init.d/

# The CloudTop entrypoint
ENTRYPOINT [ "/init" ]
