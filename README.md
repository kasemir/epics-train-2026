EPICS Training 2026
===================

This is a log of the training VM setup as performed on Linux (Intel) and Mac (ARM)
listing the exact versions used at the time.


Virtual Box
-----------

Download Virtual Box 7.2.2 for your system from https://www.virtualbox.org/wiki/Downloads

On Linux, if you get error ...

    VERR_VMX_IN_VMX_ROOT_MODE VirtualBox can't operate in VMX root mode.
    Please disable the KVM kernel extension

... check this:
 
    # Is a kvm module loaded?
    lsmod | fgrep kvm
    # If so, remove it
    sudo modprobe -r kvm_intel


Create VM
---------

Basically follow https://github.com/epics-training/training-vm/blob/main/doc/creating-vm-from-scratch.md
without continuing to https://github.com/epics-training/training-vm/blob/main/doc/bootstrap-update-vm.md

Download Rocky 9.6 "Boot ISO" from https://rockylinux.org/download

Create new VM using that image

 * Skip "Unattended Installation",
 * At least 8192 MB memory
 * At least 4 CPUs
 * At least 20GB disk space

Start the VM and install Rocky with these settings:

 * Keep "Server with GUI" software selection
 * Create root account with password `$root`
 * Create user `epics-dev`, make user administrator, do _not_ require a password

After shutdown and restart, in setting GUI, configure user epics-dev for automatic login.

    sudo dnf install -y epel-release
    # sudo dnf update -y --refresh
    sudo dnf install -y dkms kernel-devel kernel-headers

Use menu "Devices", "Install Guest Additions"


Install Training Setup
----------------------

Add the training setup to the VM-based Linux:

    sudo dnf install -y git

    sudo mkdir /ics
    sudo chown epics-dev /ics
    cd /ics
    git clone https://github.com/kasemir/epics-train-2026.git training

    cd /ics/training/setup
    ./setup.sh


Create VM Snapshot
------------------

Reduce the size of the exported image:

    sudo dd if=/dev/zero of=emptyfile bs=1M
    sudo rm emptyfile

Consider

    rm ~/.bash_history

Then

    sudo shutdown now

In VirtualBox, use the menu 'File', 'Export Appliance',
select the VM to export, leave default options
but note which file will be created.
'Finish'.

