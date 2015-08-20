docker-raptor
=====================
Grafana and InfluxDB image for Raptor visualization

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Usage
-----

To create the image `eliperelman/raptor`, execute the following command in the docker-raptor folder:

`./raptor build`

You can now push new image to the registry:

`./raptor push`


Running your Raptor image
--------------------------

The raptor script binds all necessary external ports for your container, i.e. `8080`, `8083`, and `8086`.

`./raptor run`


Working with InfluxDB
-------------------------
The build script automatically generates the `raptor` InfluxDB database. Open your browser to access `localhost:8083` or relevant docker host to configure InfluxDB. The default credential is `root:root`.

Alternatively, you can use RESTful API to talk to InfluxDB on port `8086`.
