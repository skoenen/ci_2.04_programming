# How to view the slides with vagrant?

## What is _Vagrant_?

Vagrant is a tool for building and managing virtual machine environments in a
single workflow.
With an easy-to-use workflow and focus on automation, Vagrant lowers
development environment setup time, increases production parity, and makes the
"works on my machine" excuse a relic of the past.

## Prerequisites

- [Virtualbox](https://www.virtualbox.org/wiki/Downloads) _min. Version 5_
- [Vagrant](https://www.vagrantup.com/) _min. Version 2.7_
- Clone/Download of the repository

On the computers in the __PC-Pools__ the software should be already installed.
The only task there is either

- Download
- Clone (with cmd.exe and git command or the _Gitg_ application)

## Steps to do

It is taken that all these steps are done in an _cmd.exe_ window that has the
current working directory in the cloned/downloaded repository.

_Hint: cd ..._

1. Run `$ vagrant up development`
    The output should look like:

2. Run `$ vagrant ssh development`
    To have console access to the VM.

