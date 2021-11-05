FROM helxplatform/cloudtop:develop-latest

COPY python.sh /
RUN chmod +x /python.sh && /python.sh

COPY napari.sh /
RUN chmod +x /napari.sh && /napari.sh

COPY imagej.sh /
RUN chmod +x /imagej.sh && /imagej.sh

RUN mkdir -p /usr/local/renci/bin

COPY ./desktop/* /headless/Desktop/
COPY ./init.d/* /etc/cont-init.d/50-desktop-init.sh
# The required CloudTop entrypoint.  init starts the S6 system which reads the run direcories and
# starts the monitored services
ENTRYPOINT [ "/init" ]
