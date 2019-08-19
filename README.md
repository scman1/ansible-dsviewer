
# Ansible configuration for DSViewer rails app


## Requirements

These playbooks are tested on Ubuntu 18.04 LTS. There may likely to be issues using different versions of Ubuntu or other distributions.

There are definitely problems awaiting users of non-APT distributions - all the plays using `&apt` will need an equivalent for these other distributions.

## Configure ssh public key access

Setup password-less access to your hosts.  You should also have password-less access to sudo on the host.  (If not, see the Ansible documentation for additional flags).

Typically, this requires the command:
```
$ ssh-add <ssh-key>
```

## Setup

From the directory containing this README, run the command:
```
$ source setup.sh
```
This will install Ansible if required, and create additional files, such as a
hosts file.

## Update the host inventory

Ensure the `inventory/hosts` file contains the hosts you wish to manage. You can provide a short name by adding the `ansible_ssh_host` setting.

e.g. for a host called `viewerhost.example.com`:
```
viewerhost ansible_ssh_host=viewerhost.example.com
```
Then add the short name under the groups to indicate the host to deploy to, e.g. for a deploying in production:
```
[production]
viewerhost
```
## Configure the hosts
There are two playbooks to run: setup.yaml and server.yaml.
Execute setup.yaml to get the basic configuration (required software and deploy user), run:
```
$ ansible-playbook -K playbooks/setup.yaml
```
Then, login to the server and run manually the rbenv to install ruby 2.6.1 and install bundler.

Afterwards, execute server.yaml to setup the web server, run:
```
$ ansible-playbook -K playbooks/server.yaml
```
To finish get the source code of the app from git, add capistrano and run capistrano to publish the app.
