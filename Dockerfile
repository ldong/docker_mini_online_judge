FROM java:7
MAINTAINER unclebarney
COPY ./usr/src/oj
WORKDIR /usr/src/oj
CMD ["sh", "run.sh"]
