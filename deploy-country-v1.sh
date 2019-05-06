#!/bin/bash

deploy_to_container=$1

if [ -n "$1" ]
then
  echo -e "\nDeploying version-2 to $deploy_to_container "
else
  echo -e "Script needs deploy_to_container name - (countries) \n..Exiting..\n"
  exit
fi

if [ $deploy_to_container == "countries" ]
then
	docker-compose stop countries
	cp -f deploy/countries-assembly-1.0.1.jar countries/run.jar
	rm airport2/RUNNING_PID
	docker-compose start countries
	docker-compose restart nginx
else
	echo "No matching container name"

fi


