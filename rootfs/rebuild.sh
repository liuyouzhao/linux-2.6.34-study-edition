sudo umount ./root
dd if=/dev/zero of=/tmp/linux2.6.34-ramdisk.img bs=1M count=32
mkfs.ext3 /tmp/linux2.6.34-ramdisk.img
sudo mount /tmp/linux2.6.34-ramdisk.img ./root
sudo cp -R ../busybox/busybox-1.31.1/_install/* ./root/
sudo chown root:root ./root/* -R
sudo umount ./root
cp /tmp/linux2.6.34-ramdisk.img ./
sudo mount ./linux2.6.34-ramdisk.img ./root
