.DEFAULT_GOAL := list

.PHONY: list
list:
	@echo "Make sure u set specific target dude !!"
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
stop:
	- docker-compose -f ./docker/docker-compose.yml down --remove-orphans
run-monitoring-layer:
	- docker-compose -f ./docker/monitoring.docker-compose.yml up -d --force-recreate
run-db-layer:
	- docker-compose -f ./docker/db.docker-compose.yml up -d --force-recreate
run-all-layer:
	- docker-compose -f ./docker/docker-compose.yml up -d --force-recreate