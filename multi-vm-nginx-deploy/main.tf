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

provider "openstack" {
    user_name   = "${var.openstack_user_name}"
    password    = "${var.openstack_password}"
    tenant_name = "${var.openstack_project_name}"
    domain_name = "${var.openstack_domain_name}"
    auth_url    = "${var.openstack_auth_url}"
    insecure    = true
}

variable "count" {
    default = 3
}

resource "openstack_compute_instance_v2" "nginx-vm" {
    count     = "${var.count}"
    name      = "${format("terraform-nginx-vm-%02d", count.index+1)}"
    image_id  = "${var.openstack_image_id}"
    flavor_id = "${var.openstack_flavor_id}"

    network {
        name = "${var.openstack_network_name}"
    }

    user_data = "${file("bootstrap_nginx.sh")}"
}
