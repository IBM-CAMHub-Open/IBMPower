#!/bin/bash

################################################################
# Module to deploy NGINX
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# Copyright IBM Corp. 2017.
#
################################################################

/usr/bin/apt update
/usr/bin/apt-get --assume-yes install nginx
/bin/systemctl start nginx
