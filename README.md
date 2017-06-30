# Ansible Development Enviroment - Windows Module Development

Build a Virtual Development Enviroment for Ansible Windows Module Development

## Usage

#### Run Ansible Development Machine - ansidev
```ssh
vagrant up ansidev
```

#### Run the Domaincontroller - dc1
```ssh
vagrant up dc1
```

#### Rebuild all Systems
```ssh
vagrant destroy
vagrant up
```

#### Rebuild only one System
```ssh
vagrant destroy vmname
vagrant up vmname
```

More Info about Vagrant
 - https://www.vagrantup.com/docs/index.html


## Requirements
 - Vagrant
 - Virtualbox
 - Plenty of Diskspace on Users Directory(typical c:/user/username) for Vagrant Images
 - a BIIIGGG Coffee and an epic Youtube Playlist while watching vagrant do its stuff :-)

## TODO
 - [ ] Finish AD Controller Setup( DNS Bug Currently)
 - [ ] Write some Helping Files
 - [ ] How to Remote Debug Python
 - [ ] Windows Server 2012 R2 Support
 - [ ] Customize Different Server Roles for Testing
 - [ ] ansidev box as conditional DNS Forwarder for Windows Development Domain(dnsmasq)

 Build with Love from @daBONDi for **Ansible Windows Working Group**