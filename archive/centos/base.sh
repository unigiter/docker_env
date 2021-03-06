#!/usr/bin/env bash

set -e
set -x

# SCRIPT=$(readlink -f "$0")
# SCRIPTPATH=$(dirname "$SCRIPT")

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker pull centos:7

docker build --no-cache -f ${DIR}/base.Dockerfile -t centos:wzh ${DIR}/

