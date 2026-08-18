#!/usr/bin/env bash
set -euo pipefail

mvn clean package

echo
printf 'Build successful: target/aurora-portal.war\n'
