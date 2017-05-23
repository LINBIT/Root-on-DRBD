#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

# drbdsetup-84 new-resource r-o-d 
# drbdsetup-84 new-minor r-o-d 13 0 
drbdmeta 13 v08 /dev/centos_c7-rod/root internal apply-al 
drbdsetup-84 attach 13 /dev/centos_c7-rod/root /dev/centos_c7-rod/root internal --c-max-rate=1G --c-plan-ahead=100 --resync-rate=1G 
# drbdsetup-84 connect r-o-d ipv4:10.43.6.150:7613 ipv4:10.43.57.44:7613 --protocol=C 
drbdsetup primary 13 --force

