#!/bin/bash

sudo yum -y install puppet 
sudo puppet --modulepath=modules/ site.pp --debug 
