#!/bin/bash

PROGRAM_NAME="devtools"
PROGRAM_OUTPUT_FILE=application.out

JAR_PATH=build/libs/devtools-1.0.jar

THIS_SCRIPT=$0
COMMAND=$1
PORT=$2

PID_FILE=application.pid

function start() {
    if [ -e ${PID_FILE} ]
    then
        echo "Already started!"
        exit 1
    fi

    echo "Starting ${PROGRAM_NAME}..."
    echo `date +"%F %T"` - Start application. >> event.log

    java -jar ${JAR_PATH} --server.port=${PORT} >> ${PROGRAM_OUTPUT_FILE} 2>&1 &
}

function stop() {
    if ! [ -e ${PID_FILE} ]
    then
        echo "Already stopped!"
        exit 1
    fi

    echo "Stopping ${PROGRAM_NAME}..."
    echo `date +"%F %T"` - Stop application. >> event.log

    kill -TERM `cat ${PID_FILE}`
}

function usage() {
    echo "Usage: ${THIS_SCRIPT} <start|stop> [port]"
    exit 1
}

if [ "${COMMAND}" == "start" ]
then
    start
    exit 0
elif [ "${COMMAND}" == "stop" ]
then
    stop
    exit 0
fi

usage