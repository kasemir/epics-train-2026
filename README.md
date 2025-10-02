EPICS Training 2026
===================

This is a log of the training VM setup as performed on Linux (Intel) and Mac (ARM)
listing the exact versions used at the time.


Virtual Box
-----------

Download Virtual Box 7.2.2 for your system from https://www.virtualbox.org/wiki/Downloads


Create VM
---------

Download Rocky 9.6 "Boot ISO" from https://rockylinux.org/download
Create new VM using that image

 * skip "Unattended Installation",
 * At least 8192 MB memory
 * At least 4 CPUs
 * At least 20GB disk space

On Linux, if you get error ...

    VERR_VMX_IN_VMX_ROOT_MODE VirtualBox can't operate in VMX root mode.
    Please disable the KVM kernel extension

... check this:
 
    # Is a kvm module loaded?
    lsmod | fgrep kvm
    # If so, remove it
    sudo modprobe -r kvm_intel

Start the VM and install Rocky with these settings:

 * Keep "Server with GUI" software selection
 * Create root account with password `$root`
 * Create user `epics-dev`, make user administrator, not _not_ require a password

After shutdown, rename to "training raw", create new clone without the Boot ISO, then:

In setting GUI, configure user epics-dev for automatic login.

    sudo dnf install -y epel-release
    # sudo dnf update -y --refresh
    sudo dnf install -y dkms kernel-devel kernel-headers

Shut down, rename "training prep", create new clone

Use menu "Devices", "Install Guest Additions"

    sudo dnf install git

    git clone https://github.com/kasemir/epics-train-2026.git training



