#!/bin/bash
# Prepare the workspace for safe usage
git config --global --add safe.directory /github/workspace
cd "/github/workspace" || exit 1
export JAVA_HOME=$HOME/.sdkman/candidates/java/17.0.2-tem
styleConfig=${1:-".idea/codeStyles/Project.xml"}
ls -Rla $(pwd)
/opt/idea/bin/idea.sh format -d -r -m "*" -s $(pwd)/$styleConfig
