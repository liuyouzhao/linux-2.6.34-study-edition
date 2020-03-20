sudo umount ./root
dd if=/dev/zero of=/tmp/linux2.6.34-ramdisk.img bs=1M count=8
mkfs.ext3 /tmp/linux2.6.34-ramdisk.img
sudo mount /tmp/linux2.6.34-ramdisk.img ./root
sudo cp -R ../ramdisk/* ./root/
sudo chown root:root ./root/* -R
sudo umount ./root
cp /tmp/linux2.6.34-ramdisk.img ./
sudo mount ./linux2.6.34-ramdisk.img ./root
