#!/usr/bin/env bash
# Copyright 2016 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
set -x
# Set pipefail so that `egrep` does not eat the exit code.
set -o pipefail

SKIP_TESTS=false
if [ -z "$GOOGLE_APPLICATION_CREDENTIALS"]; then
  SKIP_TESTS=true
fi
mvn --batch-mode clean verify -DskipTests=$SKIP_TESTS | egrep -v "(^\[INFO\] Download|^\[INFO\].*skipping)"

# Run tests using App Engine local devserver.
devserver_tests=(
    appengine/datastore/indexes
    appengine/datastore/indexes-exploding
    appengine/datastore/indexes-perfect
)
for testdir in ${devserver_tests[@]} ; do
  ./java-repo-tools/test-devserver.sh "${testdir}"
done

