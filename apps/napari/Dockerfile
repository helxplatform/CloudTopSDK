FROM helxplatform/cloudtop:develop-latest

COPY python.sh /
RUN chmod +x /python.sh && /python.sh

RUN mkdir -p /usr/local/renci/bin

COPY napari.sh /
RUN chmod +x /napari.sh && /napari.sh

COPY ./desktop/* /headless/Desktop/
COPY ./init.d/* /etc/cont-init.d/50-desktop-init.sh

# The CloudTop entrypoint
ENTRYPOINT [ "/init" ]
