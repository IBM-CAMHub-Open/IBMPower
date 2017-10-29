=======
Summary
=======

This Terraform sample will perform a multi-VM deployment and install and launch
NGINX on all of the VMs. It highlights how to perform a semi-complex deployment
and can serve as a template to bootstrap whatever applications are of interest
for your environment.

Assumptions
-----------
* It is assumed that the reader is already familiar with Terraform; if you
  are not, there are a lot of great articles available on the web or you can
  read this PowerVC `blog post
  <https://developer.ibm.com/powervc/2017/06/29/infrastructure-code-terraform-meets-powervc/>`_

Prerequisites
-------------
* You have `downloaded Terraform
  <https://www.terraform.io/downloads.html>`_ and installed it on your workstation
* You have an instance of PowerVC 1.3.3 (or newer) running
* You have a bare bones Ubuntu 16.04 (or newer) image loaded within PowerVC;
  you could modify the cloud-init script to also work with your operating
  system of choice
* If you're using this for anything beyond a proof-of-concept, within
  **main.tf**, please also take the added step of setting *insecure=false* and
  set the *cacert* option to the contents of the PowerVC certificate
  (*/etc/pki/tls/certs/powervc.crt*)
* Run [**terraform apply**] to start the NGINX deployment
