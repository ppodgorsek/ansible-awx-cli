#!/bin/bash

source ${AWX_CLI_WORK_DIR}/${AWX_CLI_VIRTUAL_ENVIRONMENT}/bin/activate

awx "$@"

exit $?
