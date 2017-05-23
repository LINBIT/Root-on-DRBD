#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

drbdsetup-84 new-resource r-o-d 
drbdsetup-84 new-minor r-o-d 13 0 
