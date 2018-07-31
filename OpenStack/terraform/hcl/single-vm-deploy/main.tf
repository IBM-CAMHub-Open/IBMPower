################################################################
# Module to deploy Single VM
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
variable "openstack_image_id" {
  description = "The ID of the image to be used for deploy operations."
}

variable "openstack_flavor_id" {
  description = "The ID of the flavor to be used for deploy operations."
}

variable "openstack_network_name" {
  description = "The name of the network to be used for deploy operations."
}

variable "image_id_username" {
  description = "The username to SSH into image ID"
}

variable "image_id_password" {
  description = "The password of the username to SSH into image ID"
}

provider "openstack" {
  insecure = true
  version  = "~> 0.3"
}

variable "number_of_instances" {}

resource "openstack_compute_instance_v2" "single-vm" {
  count     = "${var.number_of_instances}"
  name      = "${format("terraform-single-vm-%02d", count.index+1)}"
  image_id  = "${var.openstack_image_id}"
  flavor_id = "${var.openstack_flavor_id}"

  network {
    name = "${var.openstack_network_name}"
  }

  # Specify the ssh connection
  connection {
    user     = "${var.image_id_username}"
    password = "${var.image_id_password}"
    timeout  = "10m"
  }
}

output "single-vm-ip" {
  value = "${openstack_compute_instance_v2.single-vm.*.network.0.fixed_ip_v4}"
}
