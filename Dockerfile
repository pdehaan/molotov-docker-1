# loadtest for bugzilla server 
FROM python:3.6-slim

COPY . /molotov


RUN apt-get update; \
    apt-get install -y git && \ 
    apt-get install -y build-essential && \
    apt-get install -y virtualenv; 

WORKDIR /molotov

RUN pip3 install -U setuptools pip virtualenv
RUN pip3 install git+https://github.com/loads/molotov.git

CMD SYNC_HOST=$SYNC_HOST molotov -c $VERBOSE -p $TEST_PROCESSES -d $TEST_DURATION -w $TEST_CONNECTIONS ${TEST_MODULE:-loadtest.py}


