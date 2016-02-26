FROM java:8
MAINTAINER Eliot Kimber "ekimber@contrext.com"
# Defines a data volume container for the DITA Demo 
# Content collection ("Thunderbird").
#
# Using java:8 for this container so that it is
# the same as the DITA OT base container to keep
# the images the same.
RUN mkdir -p /opt/dita-community/data
WORKDIR /opt/dita-community/data
COPY Thunderbird ./Thunderbird
WORKDIR /opt/dita-community/data/Thunderbird
RUN git init && \
    git config --global user.email "thunderbird@dita-community.org" && \
    git config --global user.name "Thunderbird" &&\
    git add -A && \
    git commit -m "Initial setup"
VOLUME /opt/dita-community/data/Thunderbird
#
# End of 