#!/bin/bash

set -eu

abspath=$(cd $(dirname $0); pwd)
./processing-java --sketch=$abspath/$1 --output=$abspath/$1/output --force --run
