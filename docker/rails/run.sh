#!/bin/bash
set -e
# docker run -p 80 -p 22 --env LOGSTASH_SERVER=54.76.245.119:2510 --env GRAPHITE_SERVER=54.76.245.119 -d docker.local:5000/myrails /sbin/my_init --enable-insecure-key
echo "inside run.sh"
cd /rails

case ${DOCKER_STATE} in
migrate)
    echo "running migrate"
    bundle exec rake db:migrate
    ;;
seed)
    echo "running seed"
    bundle exec rake db:drop
    bundle exec rake db:create
    bundle exec rake db:migrate
    bundle exec rake db:seed
    bundle exec rake claims:demo_data
    ;;
esac
# exec bundle exec unicorn -p 80