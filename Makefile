.SILENT :

# Compose files
COMPOSE_FILES?=-f docker-compose.yml

# Include common Make tasks
root_dir:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
makefiles:=$(root_dir)/makefiles
include $(makefiles)/help.Makefile
include $(makefiles)/docker-cleanup.Makefile
include $(makefiles)/compose.Makefile

# Start HTTP proxy
start-proxy:
	-$(shell ./proxy.sh start)
.PHONY: start-proxy

# Stop HTTP proxy
stop-proxy:
	-$(shell ./proxy.sh stop)
.PHONY: stop-proxy

## Using OpenID (Warning: put this task before other tasks)
with-openid:
	echo "Using OpenID stack..."
	$(eval COMPOSE_FILES += -f docker-compose.openid.yml)

## Deploy containers to Docker host
deploy: compose-build compose-up start-proxy
.PHONY: deploy

## Un-deploy containers from Docker host
undeploy: compose-down stop-proxy
.PHONY: undeploy

## Get deployed service(s) status
status: compose-status
.PHONY: status

## Get deployed service(s) logs
logs: compose-logs
.PHONY: logs

