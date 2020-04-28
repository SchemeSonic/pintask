#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5ea84aef84a94d001ad3f80b/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5ea84aef84a94d001ad3f80b
curl -s -X POST https://api.stackbit.com/project/5ea84aef84a94d001ad3f80b/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5ea84aef84a94d001ad3f80b/webhook/build/publish > /dev/null
