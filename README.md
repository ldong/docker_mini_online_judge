# Deploy Online Judge using Docker

Author: Lin Dong

Date: Sat Feb 27, 2016

Place: CMU-SV

## Rational
1. Run in bounded environment to avoid security breaches.
2. [cgroups](https://en.wikipedia.org/wiki/Cgroups): A linux kernel functionality that can:
    * perform resource limiting
    * resource prioritization
    * resource accounting
3. Using existing technology rather than manual tunning. i.e. Docker, Virtual Machine.

## Environment Setup

Steps:

1. [Docker Installation](https://docs.docker.com/engine/installation/mac/)
2.  `docker run -d -p 3000:3000 unclebarney/chit-chat`
3. Find out ip if you are using Mac: `docker-manchine ip`, i.e. `192.168.99.100`
4. Open `http://192.168.99.100:3000/`

## Commands
1. `docker ps`, find out the `CONTAINER ID`, i.e. **47fbc77dddcb**
2. Execute shell in interactive mode, `docker exec -it 47fbc77dddcb sh`
3. Limit memory resource: `docker run -m 20M -d -p 3000:3000 unclebarney/chit-chat`

## Dockerfile
1. As the following as Dockerfile

```
FROM java:7
MAINTAINER unclebarney
COPY ./usr/src/oj
WORKDIR /usr/src/oj
CMD ["sh", "run.sh"]
```

2. Build image, `docker build -t unclebarney/oj:0.0.1`
3. Push to [dockerhub](https://hub.docker.com/), `docker push unclebarney/oj:0.0.1`
4. Pull docker image, `docker run -d unclebarney/oj:0.0.1`
5. Run: `docker run unclebarney/oj:0.0.1`

Two approaches to fix errors:
* Approach 1
  1. Run into errors
  2. fix errors
  3. build a new image
  4. run again

* Approach 2
  1. Run into errors
  2. ssh to docker
  3. fix errors

Note:

1. if we exit shell and run `docker run`, it loads original code, which in this case will run into errors again.
2. Docker image is localed `~/.docker` for Mac
3. `docker-machine ssh` to see what files are available in the docker VM
4. `docker-machine stop` to shut down

## Reference
1. [docker exec](https://docs.docker.com/engine/reference/commandline/exec/)
2. [docker run](https://docs.docker.com/engine/reference/run/)

* Special Thanks to [HeChen Gao](https://github.com/UncleBarney) for enlighten us.

