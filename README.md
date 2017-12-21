# docker-monero

This image is based on [amacneil/docker-bitcoin](https://github.com/amacneil/docker-bitcoin).


### Usage

To start a monerod instance running the latest version (`0.11.1.0`):

```
$ docker run --name monero-node krobertson/monero
```

To run a monero container in the background, pass the `-d` option to `docker
run`:

```
$ docker run -d --name monero-node krobertson/monero
```

Once you have a monero service running in the background, you can show running
containers:

```
$ docker ps
```

Or view the logs of a service:

```
$ docker logs -f some-monero
```

To stop and restart a running container:

```
$ docker stop monero-node
$ docker start monero-node
```


### Data Volumes

By default, Docker will create ephemeral containers. That is, the blockchain
data will not be persisted if you create a new bitcoin container.

To create a simple `busybox` data volume and link it to a bitcoin service:

```
$ docker create -v /data --name xmrdata busybox /bin/true
$ docker run --volumes-from xmrdata krobertson/monero
```


### Configuring Monero

The easiest method to configure the monero server is to pass arguments to the
`monerod` command. For example, to run monero on the testnet:

```
$ docker run --name monero-testnet krobertson/monero monerod --testnet
```
