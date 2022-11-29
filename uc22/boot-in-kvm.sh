#!/bin/sh -e

if [ "$(id -u)" != 0 ]; then
    echo "Please execute this script as root"
    exit 1
fi

if [ -z "$1" ]; then
    echo "Please specify an Ubuntu Core 22 image file"
    exit 1
fi

if dpkg-query --show cpu-checker 1>/dev/null 2>/dev/null; then
    kvm-ok && ACCEL="-enable-kvm -cpu host"
else
    echo "Please install cpu-checker"
    exit 1
fi

if ! dpkg-query --show ovmf 1>/dev/null 2>/dev/null; then
    echo "Please install ovmf"
    exit 1
fi

qemu-system-x86_64 \
    -smp 1 \
    -m 2048 \
    -machine q35 ${ACCEL} \
    -global ICH9-LPC.disable_s3=1 \
    -net nic,model=virtio \
    -net user,hostfwd=tcp::8022-:22,hostfwd=tcp::8090-:80  \
    -drive file=/usr/share/OVMF/OVMF_CODE.secboot.fd,if=pflash,format=raw,unit=0,readonly=on \
    -drive file=/usr/share/OVMF/OVMF_VARS.ms.fd,if=pflash,format=raw,unit=1 \
    -drive file="${1}",if=none,format=raw,id=disk1 \
    -device virtio-blk-pci,drive=disk1,bootindex=1 \
    -serial mon:stdio
