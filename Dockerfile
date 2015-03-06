FROM tutum/curl:trusty
MAINTAINER Eli Perelman <eli@mozilla.com>

ENV INFLUXDB_VERSION 0.8.8
ENV GRAFANA_VERSION 1.9.1
ENV DEBIAN_FRONTEND noninteractive
ENV PRE_CREATE_DB raptor;grafana

# Install prerequisites
RUN apt-get update && \
    apt-get install -y wget

# Install InfluxDB
RUN curl -s -o /tmp/influxdb_latest_amd64.deb https://s3.amazonaws.com/influxdb/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
    dpkg -i /tmp/influxdb_latest_amd64.deb && \
    rm /tmp/influxdb_latest_amd64.deb

# Install nginx
RUN apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD sites-enabled/ /etc/nginx/sites-enabled

# Install Grafana
RUN wget http://grafanarel.s3.amazonaws.com/grafana-${GRAFANA_VERSION}.tar.gz -O grafana.tar.gz && \
    tar zxf grafana.tar.gz && \
    rm grafana.tar.gz && \
    rm -rf app && \
    mv grafana-${GRAFANA_VERSION} app

ADD config.js /app/config.js
ADD dashboards/* /app/app/dashboards/

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD run.sh /run.sh
ADD config.toml /config/config.toml
RUN chmod +x /*.sh

# Grafana UI
EXPOSE 8080

# InfluxDB UI
EXPOSE 8083

# InfluxDB HTTP API
EXPOSE 8086

VOLUME ["/data"]

CMD ["/run.sh"]
