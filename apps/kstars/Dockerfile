FROM helxplatform/cloudtop:develop-latest

COPY ./saoimage-ds9-icon.png /usr/share/icons/hicolor/128x128/apps/saoimage-ds9-icon.png

RUN mkdir -p /usr/local/renci/data
COPY kstars.sh /
RUN chmod +x /kstars.sh && /kstars.sh

COPY ./desktop/* /headless/Desktop/
COPY ./init.d/* /etc/cont-init.d/

# The CloudTop entrypoint
ENTRYPOINT [ "/init" ]
