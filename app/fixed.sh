#!/bin/bash
cat app/fluentd_config_test.yaml | sed  's/:{{namespace}}/:\\"default\\"/g'   |sed 's/\/{{namespace}}/\/default/g' | sed 's/{{namespace}}/\"default\"/g' | kubectl apply -f -
