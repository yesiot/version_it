#!/bin/bash

set -e

# File names
TEMPLATE_FILE=version_info.template
VERSION_FILE=version_info.h

# Tags
REVISION_TAG="@AUTOGEN_REVISION"
VERSION_TAG="@AUTOGEN_VERSION"

# Match tags of type v3.4 etc.
VERSION_MATCH_PATTERN="v[0-9]*\.[0-9]"

# Execute commands
REVISION=\"$(git rev-parse --short HEAD)\"
VERSION=\"$(git describe --tags --match=${VERSION_MATCH_PATTERN} --abbrev=0)\" || VERSION='"NO VERSION INFORMATION"'

# Remove file if exist
[ -f ${VERSION_FILE} ] && rm ${VERSION_FILE}

# Put header information
echo -e ""\
"/*\n"\
" * This file is autogenerated\n"\
" * Please do not edit.\n"\
" * Any changes should be made in ${TEMPLATE_FILE}\n"\
" */\n" > ${VERSION_FILE}

# Copy template into the file
cat ${TEMPLATE_FILE} >> ${VERSION_FILE}

# Replace tags with values
sed "s|${REVISION_TAG}|${REVISION}|" -i ${VERSION_FILE}
sed "s|${VERSION_TAG}|${VERSION}|" -i ${VERSION_FILE}
