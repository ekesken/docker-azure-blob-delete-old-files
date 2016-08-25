#!/bin/bash
DELETE_CMD="azure storage blob delete -q ${AZURE_STORAGE_CONTAINER}"
if [ "${DRY_RUN}" = "true" ]; then
  DELETE_CMD="echo ${DELETE_CMD}";
fi
azure storage blob list ${AZURE_STORAGE_CONTAINER} \
 | cut -d ' ' -f5,13-18 | grep GMT | sed 's/ /\t/' \
 | python filter_old_files.py | awk '{print $1}' \
 | while read FILE; do ${DELETE_CMD} ${FILE}; done
