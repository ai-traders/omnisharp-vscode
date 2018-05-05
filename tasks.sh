#!/bin/bash

set -e

command="$1"
case "${command}" in
  _build)
      npm i
      npm run compile
      node node_modules/gulp/bin/gulp.js package:offline
      ;;
  build)
      ide "./tasks.sh _build"
      ;;
  publish)
      export OS_TENANT_NAME=ait-production
      export OS_PROJECT_NAME=ait-production
      file="csharp.*-linux-x86_64.vsix"
      ide --idefile Idefile.pyos "swift upload --object-name $file omnisharp-vscode $file"
      ;;
  *)
      echo "Invalid command: '${command}'"
      exit 1
      ;;
esac
set +e
