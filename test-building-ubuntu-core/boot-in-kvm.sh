#!/bin/bash
help() {
  echo "Command requires at least one arg: path to img file to boot in kvm. Optional: os (currently supported: uc18 and uc20)"
  exit
}

if [ "$#" -lt 1 ]; then
    help
    exit 1
fi

IMG=$1

if [ "$2" == "" ]; then
   OS="uc20"
else
   OS=$2
fi

if dpkg-query --show cpu-checker 1>/dev/null 2>/dev/null; then
   kvm-ok && ACCEL="-enable-kvm"
else
   echo "Please install cpu-checker" && exit 1
fi

if [ "$OS" == "uc18" ]; then
    sudo kvm -smp 2 -m 1500 -netdev user,id=mynet0,hostfwd=tcp::8022-:22,hostfwd=tcp::8090-:80 -device virtio-net-pci,netdev=mynet0 -vga qxl -drive file=$IMG,format=raw
else
    if [ "$OS" == "uc20" ]; then
                sudo qemu-system-x86_64 -smp 1 -m 2048 $ACCEL \
 -net nic,model=virtio -net user,hostfwd=tcp::8022-:22 \
 -drive file=/usr/share/OVMF/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
 -drive file=$IMG,cache=none,format=raw,id=disk1,if=none \
 -device virtio-blk-pci,drive=disk1,bootindex=1 \
 -nographic
   else
        echo $OS "is not a supported os"
   fi
fi
