FROM helxplatform/cloudtop:develop-latest

RUN mkdir -p /usr/local/renci/bin
COPY verdi.sh /
RUN chmod +x /verdi.sh && /verdi.sh

COPY ./desktop/* /headless/Desktop/
COPY ./init.d/* /etc/cont-init.d/50-desktop-init.sh

# The CloudTop entrypoint
ENTRYPOINT [ "/init" ]
