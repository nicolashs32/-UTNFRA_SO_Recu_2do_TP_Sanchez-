# Comandos usados para resolver el Punto A
fdisk /dev/sdd
fdisk /dev/sdc
pvcreate /dev/sdc1
pvcreate /dev/sdd2
vgcreate vg_datos /dev/sdc1 /dev/sdd2
lvcreate -L 12M -n lv_docker vg_datos
lvcreate -L 1.5G -n lv_multimedia vg_datos
mkfs.ext4 /dev/vg_datos/lv_docker
mkfs.ext4 /dev/vg_datos/lv_multimedia
mkswap /dev/sdd1
swapon /dev/sdd1
mount /dev/vg_datos/lv_docker /var/lib/docker
mount /dev/vg_datos/lv_multimedia /Multimedia
