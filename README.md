# Ansible Development Enviroment - Windows Module Development

Build a Virtual Development Enviroment for Ansible Windows Module Development

Creates a Ubuntu 16.x Box with DNS Masq pointing to the Windows Domaincontroler on the desired Activedirectory Domain and
mounting the Ansible Source in it, so all dns lookups for the Activedirectory Domain works also on the ansidev box.

Allow to Spinup more Windows Boxes in the Enviroment for Debugging some usecases(See **Define needed Windows Servers here** in Vagrant File).

**Also automatic Source the env-setup Script and cd into shared playbook directory on vagrant ssh ansidev!**

## Usage

- Change the Path **ansible_repo** in the **vagrant** file to your **Ansible Source folder**
- "vagrant up ansidev"
- If a Domaincontroller is needed
  - "vagrant up dc1"
- Add more Windows Server Boxes in the Vagrant File under the **Define needed Windows Servers here** Section

Use **playground** folder for building your playbooks and usecases for development and debugging

### Run Ansible Development Machine - ansidev

```ssh
vagrant up ansidev
```

### Run the Domaincontroller - dc1

```ssh
vagrant up dc1
```

### Rebuild all Systems

```ssh
vagrant destroy
vagrant up
```

### Rebuild only one System

```ssh
vagrant destroy vmname
vagrant up vmname
```

More Info about Vagrant

- [https://www.vagrantup.com/docs/index.html](https://www.vagrantup.com/docs/index.html)

## Requirements

- Vagrant
- Virtualbox
- Plenty of Diskspace on Users Directory(typical c:/user/username) for Vagrant Images
- a BIIIGGG Coffee and an epic Youtube Playlist while watching vagrant do its stuff :-)

 Build with Love from @daBONDi for **Ansible Windows Community / Ansible Windows Working Group**