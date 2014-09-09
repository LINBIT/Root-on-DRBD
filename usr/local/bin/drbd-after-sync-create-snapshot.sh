#!/bin/bash


if test `hostname` = beverages ; then
	lvcreate --name "$DRBD_RESOURCE"__`date +%Y%m%d_%H%M%S` -s "$DRBD_LL_DISK"
fi 

true
