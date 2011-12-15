Return-Path: <jdk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79953E006DD
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 07:29:45 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pBFFTfMS025150;
	Thu, 15 Dec 2011 09:29:41 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pBFFTfDr009812;
	Thu, 15 Dec 2011 09:29:41 -0600 (CST)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Thu, 15 Dec 2011 09:29:41 -0600
From: "Kridner, Jason" <jdk@ti.com>
To: Otavio Salvador <otavio@ossystems.com.br>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v3 1/3] sdcard_image: rewrote to avoid using
	loopback and mount/unmount
Thread-Index: AQHMuzsNnr1hYI4b2UuMcI5GrNq7DJXdBZEH
Date: Thu, 15 Dec 2011 15:29:39 +0000
Message-ID: <F61A9010E56D7F4C93A19FD36DAAC3592FA12D@DFLE34.ent.ti.com>
References: <cover.1323961434.git.otavio@ossystems.com.br>,
	<5a96447bec084526f7d9397f0a8b80fbbdb265ac.1323961434.git.otavio@ossystems.com.br>
In-Reply-To: <5a96447bec084526f7d9397f0a8b80fbbdb265ac.1323961434.git.otavio@ossystems.com.br>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/3] sdcard_image: rewrote to avoid using	loopback and mount/unmount
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Dec 2011 15:29:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry for the top-post.  Using the number of clusters is important to make =
sure that the DOS partitioning is valid.  I'm not confident that we'll end =
up with a whole number of clusters using this method.  Perhaps it isn't com=
pletely critical, but I'm not 100% comfortable getting rid of it.=0A=
________________________________________=0A=
From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] o=
n behalf of Otavio Salvador [otavio@ossystems.com.br]=0A=
Sent: Thursday, December 15, 2011 10:05 AM=0A=
To: meta-ti@yoctoproject.org=0A=
Subject: [meta-ti] [PATCH v3 1/3] sdcard_image: rewrote to avoid using  loo=
pback and mount/unmount=0A=
=0A=
Allow generation by regular users without fancy setup requirements and=0A=
use of loopback and mount/unmount. Besides, this also includes=0A=
following improvements:=0A=
=0A=
 * use of megabytes when specifying SDIMG_SIZE=0A=
 * remove restriction of filesystem to rootfs=0A=
=0A=
Images that use this class needs to generate the rootfs filesystem and=0A=
set ROOTFS variable according.=0A=
=0A=
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>=0A=
---=0A=
 classes/sdcard_image.bbclass |  180 +++++++++++++++-----------------------=
----=0A=
 1 files changed, 63 insertions(+), 117 deletions(-)=0A=
=0A=
diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass=0A=
index 519bd9a..5f2d091 100644=0A=
--- a/classes/sdcard_image.bbclass=0A=
+++ b/classes/sdcard_image.bbclass=0A=
@@ -1,99 +1,42 @@=0A=
+#=0A=
+# Create an image that can by written onto a SD card using dd.=0A=
+#=0A=
+# External variables needed:=0A=
+#   ${ROOTFS} - the rootfs image to incorporate=0A=
+=0A=
 inherit image=0A=
=0A=
 # Add the fstypes we need=0A=
-IMAGE_FSTYPES_append =3D " tar.bz2 sdimg"=0A=
+IMAGE_FSTYPES +=3D "sdimg"=0A=
=0A=
 # Ensure required utilities are present=0A=
-IMAGE_DEPENDS_sdimg =3D "genext2fs-native e2fsprogs-native"=0A=
-=0A=
-# Change this to match your host distro=0A=
-LOSETUP ?=3D "/sbin/losetup"=0A=
-=0A=
-# Since these need to go in /etc/fstab we can hardcode them=0A=
-# Since the vars are weakly assigned, you can override them from your loca=
l.conf=0A=
-LOOPDEV ?=3D "/dev/loop1"=0A=
-LOOPDEV_BOOT ?=3D "/dev/loop2"=0A=
-LOOPDEV_FS ?=3D "/dev/loop3"=0A=
+IMAGE_DEPENDS_sdimg =3D "dosfstools-native parted-native"=0A=
=0A=
-# Default to 4GiB images=0A=
-SDIMG_SIZE ?=3D "444"=0A=
+# Default to 3.4GiB images=0A=
+SDIMG_SIZE ?=3D "3400"=0A=
=0A=
-# FS type for rootfs=0A=
-ROOTFSTYPE ?=3D "ext3"=0A=
+# Boot partition volume id=0A=
+BOOTDD_VOLUME_ID_beaglebone =3D "BEAGLE_BONE"=0A=
+BOOTDD_VOLUME_ID ?=3D "${MACHINE}"=0A=
=0A=
-BOOTPARTNAME_beaglebone =3D "BEAGLE_BONE"=0A=
-BOOTPARTNAME ?=3D "${MACHINE}"=0A=
-=0A=
-IMAGEDATESTAMP =3D "${@time.strftime('%Y.%m.%d',time.gmtime())}"=0A=
+# Addional space for boot partition=0A=
+BOOTDD_EXTRA_SPACE ?=3D "16384"=0A=
=0A=
 # Files and/or directories to be copied into the vfat partition=0A=
 FATPAYLOAD ?=3D ""=0A=
=0A=
 IMAGE_CMD_sdimg () {=0A=
-       SDIMG=3D${WORKDIR}/sd.img=0A=
-=0A=
-       # sanity check fstab entry for boot partition mounting=0A=
-       if [ "x$(cat /etc/fstab | grep ${LOOPDEV_BOOT} | grep ${WORKDIR}/tm=
p-mnt-boot | grep user || true)" =3D "x" ]; then=0A=
-               echo "/etc/fstab entries need to be created with the user f=
lag for the loop devices like:"=0A=
-               echo "${LOOPDEV_BOOT} ${WORKDIR}/tmp-mnt-boot vfat user 0 0=
"=0A=
-        false=0A=
-       fi=0A=
-=0A=
-       # cleanup loops=0A=
-       for loop in ${LOOPDEV} ${LOOPDEV_BOOT} ${LOOPDEV_FS} ; do=0A=
-               ${LOSETUP} -d $loop || true=0A=
-       done=0A=
-=0A=
-       # If an SD image is already present, reuse and reformat it=0A=
-       if [ ! -e ${SDIMG} ] ; then=0A=
-               dd if=3D/dev/zero of=3D${SDIMG} bs=3D$(echo '255 * 63 * 512=
' | bc) count=3D${SDIMG_SIZE}=0A=
-       fi=0A=
-=0A=
-       ${LOSETUP} ${LOOPDEV} ${SDIMG}=0A=
-=0A=
-       # Create partition table=0A=
-       dd if=3D/dev/zero of=3D${LOOPDEV} bs=3D1024 count=3D1024=0A=
-       SIZE=3D$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes | awk '=
{print $5}')=0A=
-       CYLINDERS=3D$(echo $SIZE/255/63/512 | bc)=0A=
-       {=0A=
-       echo ,9,0x0C,*=0A=
-       echo ,,,-=0A=
-       } | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}=0A=
-=0A=
-       # Prepare loop devices for boot and filesystem partitions=0A=
-       BOOT_OFFSET=3D32256=0A=
-       FS_OFFSET_SECT=3D$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep Linux |=
 perl -p -i -e "s/\s+/ /"|cut -d " " -f 2)=0A=
-       FS_OFFSET=3D$(echo "$FS_OFFSET_SECT * 512" | bc)=0A=
-       FS_SIZE_BLOCKS=3D$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep Linux |=
 perl -p -i -e "s/\s+/ /g" \=0A=
-       |cut -d " " -f 4 | cut -d "+" -f 1)=0A=
-=0A=
-       LOOPDEV_BLOCKS=3D$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep FAT | p=
erl -p -i -e "s/\s+/ /g"|cut -d " " -f 5)=0A=
-       LOOPDEV_BYTES=3D$(echo "$LOOPDEV_BLOCKS * 1024" | bc)=0A=
-=0A=
-       ${LOSETUP} -d ${LOOPDEV}=0A=
-=0A=
-       ${LOSETUP} ${LOOPDEV_BOOT} ${SDIMG} -o ${BOOT_OFFSET}=0A=
-=0A=
-       /sbin/mkfs.vfat ${LOOPDEV_BOOT} -n ${BOOTPARTNAME} $LOOPDEV_BLOCKS=
=0A=
-=0A=
-       # Prepare filesystem partition=0A=
-       # Copy ubi used by flashing scripts=0A=
-       if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then=0A=
-               echo "Copying UBIFS image to file system"=0A=
-               cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${IMAGE_ROO=
TFS}/boot/fs.ubi=0A=
-       fi=0A=
+       TMP=3D${WORKDIR}/tmp=0A=
+       SDIMG=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.sdimg=0A=
=0A=
-       # Prepare boot partion. First mount the boot partition, and copy th=
e boot loader and supporting files=0A=
-       # from the root filesystem=0A=
-=0A=
-       mkdir -p ${WORKDIR}/tmp-mnt-boot=0A=
-       mount $LOOPDEV_BOOT ${WORKDIR}/tmp-mnt-boot=0A=
+       # Prepare boot filesystem=0A=
+       install -d $TMP/boot=0A=
=0A=
        echo "Copying bootloaders into the boot partition"=0A=
        if [ -e ${IMAGE_ROOTFS}/boot/MLO ] ; then=0A=
-               cp -v ${IMAGE_ROOTFS}/boot/MLO ${WORKDIR}/tmp-mnt-boot=0A=
+               cp -v ${IMAGE_ROOTFS}/boot/MLO $TMP/boot=0A=
        else=0A=
-               cp -v ${DEPLOY_DIR_IMAGE}/MLO ${WORKDIR}/tmp-mnt-boot=0A=
+               cp -v ${DEPLOY_DIR_IMAGE}/MLO $TMP/boot=0A=
        fi=0A=
=0A=
        # Check for u-boot SPL=0A=
@@ -103,54 +46,57 @@ IMAGE_CMD_sdimg () {=0A=
                suffix=3Dbin=0A=
        fi=0A=
=0A=
-       cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt ${WORKDIR}/tmp-mnt-boot || true=
=0A=
-       cp -v ${IMAGE_ROOTFS}/boot/user.txt ${WORKDIR}/tmp-mnt-boot || true=
=0A=
-       cp -v ${IMAGE_ROOTFS}/boot/uImage ${WORKDIR}/tmp-mnt-boot || true=
=0A=
-=0A=
        if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then=0A=
-               cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} ${WORKDIR}/tmp-=
mnt-boot || true=0A=
+               cp -v ${IMAGE_ROOTFS}/boot/u-boot.$suffix $TMP/boot || true=
=0A=
        else=0A=
-               cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix ${WORKD=
IR}/tmp-mnt-boot/u-boot.$suffix=0A=
+               cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix $TMP/bo=
ot/u-boot.$suffix=0A=
+       fi=0A=
+=0A=
+       if [ -e ${IMAGE_ROOTFS}/boot/uImage ]; then=0A=
+               cp -v ${IMAGE_ROOTFS}/boot/uImage $TMP/boot || true=0A=
+       else=0A=
+               cp -v ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.$suffix $TMP/bo=
ot/uImage=0A=
+       fi=0A=
+=0A=
+       cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt $TMP/boot || true=0A=
+       cp -v ${IMAGE_ROOTFS}/boot/user.txt $TMP/boot || true=0A=
+=0A=
+       # Copy ubi used by flashing scripts=0A=
+       if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then=0A=
+               echo "Copying UBIFS image to file system"=0A=
+               cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${IMAGE_ROO=
TFS}/boot/fs.ubi=0A=
        fi=0A=
=0A=
        if [ -n ${FATPAYLOAD} ] ; then=0A=
                echo "Copying payload into VFAT"=0A=
                for entry in ${FATPAYLOAD} ; do=0A=
                                # add the || true to stop aborting on vfat =
issues like not supporting .~lock files=0A=
-                               cp -av ${IMAGE_ROOTFS}$entry ${WORKDIR}/tmp=
-mnt-boot || true=0A=
+                               cp -av ${IMAGE_ROOTFS}$entry $TMP/boot || t=
rue=0A=
                done=0A=
        fi=0A=
=0A=
-       echo "${IMAGE_NAME}-${IMAGEDATESTAMP}" > ${IMAGE_ROOTFS}/etc/image-=
version-info=0A=
-=0A=
-       # Cleanup VFAT mount=0A=
-       echo "Cleaning up VFAT mount"=0A=
-       umount ${WORKDIR}/tmp-mnt-boot=0A=
-       ${LOSETUP} -d ${LOOPDEV_BOOT} || true=0A=
-=0A=
-       # Prepare rootfs parition=0A=
-       echo "Creating rootfs loopback"=0A=
-       ${LOSETUP} ${LOOPDEV_FS} ${SDIMG} -o ${FS_OFFSET}=0A=
-=0A=
-       FS_NUM_INODES=3D$(echo $FS_SIZE_BLOCKS / 4 | bc)=0A=
-=0A=
-       case "${ROOTFSTYPE}" in=0A=
-               ext3)=0A=
-                               genext2fs -z -N $FS_NUM_INODES -b $FS_SIZE_=
BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}=0A=
-                               tune2fs -L ${IMAGE_NAME} -j ${LOOPDEV_FS}=
=0A=
-                               ;;=0A=
-               ext4)=0A=
-                               genext2fs -z -N $FS_NUM_INODES -b $FS_SIZE_=
BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}=0A=
-                               tune2fs -L ${IMAGE_NAME} -j -O extents,unin=
it_bg,dir_index ${LOOPDEV_FS}=0A=
-                               ;;=0A=
-               *)=0A=
-                               echo "Please set ROOTFSTYPE to something su=
pported"=0A=
-                               exit 1=0A=
-                               ;;=0A=
-       esac=0A=
-=0A=
-       ${LOSETUP} -d ${LOOPDEV_FS} || true=0A=
-=0A=
-       gzip -c ${WORKDIR}/sd.img > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-${IMA=
GEDATESTAMP}.img.gz=0A=
-       rm -f ${WORKDIR}/sd.img=0A=
+       dd if=3D/dev/zero of=3D${SDIMG} bs=3D$(expr 1000 \* 1000) count=3D$=
{SDIMG_SIZE}=0A=
+=0A=
+       # Create the boot filesystem=0A=
+       BOOT_OFFSET=3D32256=0A=
+       BOOT_BLOCKS=3D$(du -bks $TMP/boot | cut -f 1)=0A=
+       BOOT_SIZE=3D$(expr $BOOT_BLOCKS + ${BOOTDD_EXTRA_SPACE})=0A=
+       mkfs.vfat -n ${BOOTDD_VOLUME_ID} -d $TMP/boot -C $TMP/boot.img $BOO=
T_SIZE=0A=
+=0A=
+       # Create partition table=0A=
+       END1=3D$(expr $BOOT_SIZE \* 1024)=0A=
+       END2=3D$(expr $END1 + 512)=0A=
+       parted -s ${SDIMG} mklabel msdos=0A=
+       parted -s ${SDIMG} mkpart primary fat16 ${BOOT_OFFSET}B ${END1}B=0A=
+       parted -s ${SDIMG} mkpart primary ext3 ${END2}B 100%=0A=
+       parted -s ${SDIMG} set 1 boot on=0A=
+       parted ${SDIMG} print=0A=
+=0A=
+       OFFSET1=3D$(expr $BOOT_OFFSET / 512)=0A=
+       OFFSET2=3D$(expr $END2 / 512)=0A=
+       dd if=3D$TMP/boot.img of=3D${SDIMG} conv=3Dnotrunc seek=3D$OFFSET1 =
bs=3D512=0A=
+       dd if=3D${ROOTFS} of=3D${SDIMG} conv=3Dnotrunc seek=3D$OFFSET2 bs=
=3D512=0A=
+=0A=
+       cd ${DEPLOY_DIR_IMAGE}=0A=
+       ln -sf ${IMAGE_NAME}.sdimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.s=
dimg=0A=
 }=0A=
--=0A=
1.7.2.5=0A=
=0A=
_______________________________________________=0A=
meta-ti mailing list=0A=
meta-ti@yoctoproject.org=0A=
https://lists.yoctoproject.org/listinfo/meta-ti=0A=

