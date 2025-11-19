#!/usr/bin/env bash

set -eux
set -o pipefail

# --------------------------------------------------------------------------------------------------
# GLOBALS
# --------------------------------------------------------------------------------------------------
RETRIES=20

# --------------------------------------------------------------------------------------------------
# FUNCTIONS
# --------------------------------------------------------------------------------------------------
retry() {
	for n in $(seq $${RETRIES}); do
		echo "[$${n}/$${RETRIES}] $${*}";
		if eval "$${*}"; then
			echo "[SUCC] $${n}/$${RETRIES}";
			return 0;
		fi;
		sleep 2;
		echo "[FAIL] $${n}/$${RETRIES}";
	done;
	return 1;
}

# --------------------------------------------------------------------------------------------------
# ENTRYPOINT
# --------------------------------------------------------------------------------------------------

###
### Installation
###

# Install Docker (Modern script installs docker-compose-plugin automatically)
curl -fsSL https://get.docker.com | sh

# Install git
apt-get update
apt-get install -y git

# Install docker-dvwa
git clone https://github.com/cytopia/docker-dvwa /tmp/docker-dvwa


###
### Configuration
###

# Setup dvwa
cd /tmp/docker-dvwa
cp .env-example .env
echo "PHP_VERSION=${php_version}" >> .env
# Note: cytopia/docker-dvwa usually listens on 80 internally.
# We will map external port ${listen_port} to internal port 80 in the compose command.


###
### Run
###

# Use the modern 'docker compose' command (Plugin)
# Map the variable listen_port to container port 80
LISTEN_PORT=${listen_port} docker compose up -d
