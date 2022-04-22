#!/bin/bash
# Copyright 2022 Cartesi Pte. Ltd.
#
# SPDX-License-Identifier: Apache-2.0
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use
# this file except in compliance with the License. You may obtain a copy of the
# License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.

MACHINE_DIR=/opt/cartesi/echo-machine
ROLLUP_HTTP_SERVER_PORT=5004

cartesi-machine \
    --ram-length=128Mi \
    --rollup \
    --flash-drive=label:echo-dapp,filename:echo-dapp.ext2 \
    --flash-drive=label:root,filename:rootfs.ext2 \
    --ram-image=linux-5.5.19-ctsi-5.bin \
    --rom-image=rom.bin \
    --store=$MACHINE_DIR \
    -- "cd /mnt/echo-dapp; \
        ROLLUP_HTTP_SERVER_URL=\"http://127.0.0.1:$ROLLUP_HTTP_SERVER_PORT\" \
        rollup-init ./echo-server"