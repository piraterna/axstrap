#!/bin/bash
LIVECD=$1
QEMU_FLAGS="-m 2G -smp 4 -serial stdio"
QEMU_MACHINE_FLAGS="-machine q35"

qemu-system-x86_64 $QEMU_FLAGS $QEMU_MACHINE_FLAGS \
	-drive if=pflash,format=raw,unit=0,file=test/ovmf_code-x86_64.fd,readonly=on \
	-drive if=pflash,format=raw,unit=1,file=test/ovmf_vars-x86_64.fd \
	-device uefi-vars-x64,jsonfile=test/nvram.json \
	-cdrom $LIVECD -d guest_errors