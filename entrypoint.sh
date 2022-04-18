#!/bin/bash

set -o pipefail

# config
# ...

# Fix the unsafe repo error which was introduced by the CVE-2022-24765 git patches
git config --global --add safe.directory /github/workspace