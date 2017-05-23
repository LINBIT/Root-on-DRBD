#!/bin/bash
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

depends() {
    return 0
}


installkernel() {
    hostonly=''    instmods drbd
}


install() {
    inst $(command -v drbdadm) /sbin/drbdadm
    inst $(command -v drbdsetup) /sbin/drbdsetup
    inst $(command -v drbdmeta) /sbin/drbdmeta
    inst /lib/drbd/drbdadm-84 /sbin/drbdadm-84
    inst /lib/drbd/drbdsetup-84 /sbin/drbdsetup-84
    
    inst_hook pre-trigger 10 "$moddir/drbd-init.sh"
    inst_hook pre-mount 10 "$moddir/drbd-up.sh"

    inst_simple "$moddir/.ignore" /var/lib/drbd/.ignore
}
