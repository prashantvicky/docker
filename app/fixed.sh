#!/bin/sh
cat /app/app/fluentd_config_test1.yaml | sed  's/:{{namespace}}/:\\"default\\"/g'   |sed 's/\/{{namespace}}/\/default/g' | sed 's/{{namespace}}/\"default\"/g' | kubectl apply -f -
