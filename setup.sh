#!/bin/sh

GITHUB_ANSIBLE=github-ansible

ANSIBLE=`which ansible`
if [ -z "${ANSIBLE}" ] ; then
  # no Ansible found, let's install one
  if [ ! -d ${GITHUB_ANSIBLE} ] ; then
    git clone https://github.com/ansible/ansible.git ${GITHUB_ANSIBLE}
  fi
  (cd ${GITHUB_ANSIBLE}; git checkout tags/v1.2.2)
  source ${GITHUB_ANSIBLE}/hacking/env-setup
fi

if [ ! -r inventory/hosts ] ; then
  cp inventory/hosts-example inventory/hosts
fi