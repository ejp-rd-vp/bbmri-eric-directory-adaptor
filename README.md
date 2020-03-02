# BBMRI-ERIC Directory Adaptor

This is an adaptor for the BBMRI-ERIC Directory to conform to the EJP-RD VP API.

## Running in Docker

To run this code create a docker-compose.yml file which defines the service:
```
version: "3.7"
services:
  bbmri-eric-directory-adaptor:
    build : .
    container_name: bbmri-eric-directory-adaptor
    environment:
      - localURL=http://ejprd.fair-dtls.surf-hosted.nl:8080
    ports:
      - 8080:8080
    restart: unless-stopped
```
Make sure the localURL is set to the URL on which the service is exposed and that the port
is correctly mapped.

