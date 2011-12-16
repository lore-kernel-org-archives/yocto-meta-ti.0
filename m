Return-Path: <wmills@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F680E013EB
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2011 06:17:37 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id pBGEHaQK016947;
	Fri, 16 Dec 2011 08:17:36 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pBGEHaj4018579;
	Fri, 16 Dec 2011 08:17:36 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 16 Dec 2011 08:17:36 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pBGEHami024703;	Fri, 16 Dec 2011 08:17:36 -0600
Message-ID: <4EEB52FF.50705@ti.com>
Date: Fri, 16 Dec 2011 09:17:35 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1323961434.git.otavio@ossystems.com.br>,
	<5a96447bec084526f7d9397f0a8b80fbbdb265ac.1323961434.git.otavio@ossystems.com.br>	<F61A9010E56D7F4C93A19FD36DAAC3592FA12D@DFLE34.ent.ti.com>
	<020D35A2-B806-4C37-AFC7-E8670D7DE004@dominion.thruhere.net>
In-Reply-To: <020D35A2-B806-4C37-AFC7-E8670D7DE004@dominion.thruhere.net>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v3 1/3] sdcard_image: rewrote to avoid	using loopback and mount/unmount
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
X-List-Received-Date: Fri, 16 Dec 2011 14:17:38 -0000
Content-Type: multipart/alternative;
	boundary="------------030508080102030105000108"

--------------030508080102030105000108
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/16/2011 02:23 AM, Koen Kooi wrote:
> Op 15 dec. 2011, om 16:29 heeft Kridner, Jason het volgende geschreven:
>
>> Sorry for the top-post.  Using the number of clusters is important to make sure that the DOS partitioning is valid.  I'm not confident that we'll end up with a whole number of clusters using this method.  Perhaps it isn't completely critical, but I'm not 100% comfortable getting rid of it.
> You can now try it :)
>
> http://dominion.thruhere.net/koen/angstrom/beaglebone/test/
>
> The 'oldmethod' is built using the old method, the other one with otavios patches.

Isn't the question whether the ROM bootloader handles it or not?  If so 
we need to test on Beagleboard classic (Rev B & Rev C) and -xM as well. 
The classic's on board flash should be wiped for a real test.

> regards,
>
> Koen
>
>
>> ________________________________________
>> From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] on behalf of Otavio Salvador [otavio@ossystems.com.br]
>> Sent: Thursday, December 15, 2011 10:05 AM
>> To: meta-ti@yoctoproject.org
>> Subject: [meta-ti] [PATCH v3 1/3] sdcard_image: rewrote to avoid using  loopback and mount/unmount
>>
>> Allow generation by regular users without fancy setup requirements and
>> use of loopback and mount/unmount. Besides, this also includes
>> following improvements:
>>
>> * use of megabytes when specifying SDIMG_SIZE
>> * remove restriction of filesystem to rootfs
>>
>> Images that use this class needs to generate the rootfs filesystem and
>> set ROOTFS variable according.
>>
>> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
>> ---
>> classes/sdcard_image.bbclass |  180 +++++++++++++++---------------------------
>> 1 files changed, 63 insertions(+), 117 deletions(-)
>>
>> diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
>> index 519bd9a..5f2d091 100644
>> --- a/classes/sdcard_image.bbclass
>> +++ b/classes/sdcard_image.bbclass
>> @@ -1,99 +1,42 @@
>> +#
>> +# Create an image that can by written onto a SD card using dd.
>> +#
>> +# External variables needed:
>> +#   ${ROOTFS} - the rootfs image to incorporate
>> +
>> inherit image
>>
>> # Add the fstypes we need
>> -IMAGE_FSTYPES_append = " tar.bz2 sdimg"
>> +IMAGE_FSTYPES += "sdimg"
>>
>> # Ensure required utilities are present
>> -IMAGE_DEPENDS_sdimg = "genext2fs-native e2fsprogs-native"
>> -
>> -# Change this to match your host distro
>> -LOSETUP ?= "/sbin/losetup"
>> -
>> -# Since these need to go in /etc/fstab we can hardcode them
>> -# Since the vars are weakly assigned, you can override them from your local.conf
>> -LOOPDEV ?= "/dev/loop1"
>> -LOOPDEV_BOOT ?= "/dev/loop2"
>> -LOOPDEV_FS ?= "/dev/loop3"
>> +IMAGE_DEPENDS_sdimg = "dosfstools-native parted-native"
>>
>> -# Default to 4GiB images
>> -SDIMG_SIZE ?= "444"
>> +# Default to 3.4GiB images
>> +SDIMG_SIZE ?= "3400"
>>
>> -# FS type for rootfs
>> -ROOTFSTYPE ?= "ext3"
>> +# Boot partition volume id
>> +BOOTDD_VOLUME_ID_beaglebone = "BEAGLE_BONE"
>> +BOOTDD_VOLUME_ID ?= "${MACHINE}"
>>
>> -BOOTPARTNAME_beaglebone = "BEAGLE_BONE"
>> -BOOTPARTNAME ?= "${MACHINE}"
>> -
>> -IMAGEDATESTAMP = "${@time.strftime('%Y.%m.%d',time.gmtime())}"
>> +# Addional space for boot partition
>> +BOOTDD_EXTRA_SPACE ?= "16384"
>>
>> # Files and/or directories to be copied into the vfat partition
>> FATPAYLOAD ?= ""
>>
>> IMAGE_CMD_sdimg () {
>> -       SDIMG=${WORKDIR}/sd.img
>> -
>> -       # sanity check fstab entry for boot partition mounting
>> -       if [ "x$(cat /etc/fstab | grep ${LOOPDEV_BOOT} | grep ${WORKDIR}/tmp-mnt-boot | grep user || true)" = "x" ]; then
>> -               echo "/etc/fstab entries need to be created with the user flag for the loop devices like:"
>> -               echo "${LOOPDEV_BOOT} ${WORKDIR}/tmp-mnt-boot vfat user 0 0"
>> -        false
>> -       fi
>> -
>> -       # cleanup loops
>> -       for loop in ${LOOPDEV} ${LOOPDEV_BOOT} ${LOOPDEV_FS} ; do
>> -               ${LOSETUP} -d $loop || true
>> -       done
>> -
>> -       # If an SD image is already present, reuse and reformat it
>> -       if [ ! -e ${SDIMG} ] ; then
>> -               dd if=/dev/zero of=${SDIMG} bs=$(echo '255 * 63 * 512' | bc) count=${SDIMG_SIZE}
>> -       fi
>> -
>> -       ${LOSETUP} ${LOOPDEV} ${SDIMG}
>> -
>> -       # Create partition table
>> -       dd if=/dev/zero of=${LOOPDEV} bs=1024 count=1024
>> -       SIZE=$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes | awk '{print $5}')
>> -       CYLINDERS=$(echo $SIZE/255/63/512 | bc)
>> -       {
>> -       echo ,9,0x0C,*
>> -       echo ,,,-
>> -       } | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}
>> -
>> -       # Prepare loop devices for boot and filesystem partitions
>> -       BOOT_OFFSET=32256
>> -       FS_OFFSET_SECT=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep Linux | perl -p -i -e "s/\s+/ /"|cut -d " " -f 2)
>> -       FS_OFFSET=$(echo "$FS_OFFSET_SECT * 512" | bc)
>> -       FS_SIZE_BLOCKS=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep Linux | perl -p -i -e "s/\s+/ /g" \
>> -       |cut -d " " -f 4 | cut -d "+" -f 1)
>> -
>> -       LOOPDEV_BLOCKS=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep FAT | perl -p -i -e "s/\s+/ /g"|cut -d " " -f 5)
>> -       LOOPDEV_BYTES=$(echo "$LOOPDEV_BLOCKS * 1024" | bc)
>> -
>> -       ${LOSETUP} -d ${LOOPDEV}
>> -
>> -       ${LOSETUP} ${LOOPDEV_BOOT} ${SDIMG} -o ${BOOT_OFFSET}
>> -
>> -       /sbin/mkfs.vfat ${LOOPDEV_BOOT} -n ${BOOTPARTNAME} $LOOPDEV_BLOCKS
>> -
>> -       # Prepare filesystem partition
>> -       # Copy ubi used by flashing scripts
>> -       if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
>> -               echo "Copying UBIFS image to file system"
>> -               cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${IMAGE_ROOTFS}/boot/fs.ubi
>> -       fi
>> +       TMP=${WORKDIR}/tmp
>> +       SDIMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.sdimg
>>
>> -       # Prepare boot partion. First mount the boot partition, and copy the boot loader and supporting files
>> -       # from the root filesystem
>> -
>> -       mkdir -p ${WORKDIR}/tmp-mnt-boot
>> -       mount $LOOPDEV_BOOT ${WORKDIR}/tmp-mnt-boot
>> +       # Prepare boot filesystem
>> +       install -d $TMP/boot
>>
>>         echo "Copying bootloaders into the boot partition"
>>         if [ -e ${IMAGE_ROOTFS}/boot/MLO ] ; then
>> -               cp -v ${IMAGE_ROOTFS}/boot/MLO ${WORKDIR}/tmp-mnt-boot
>> +               cp -v ${IMAGE_ROOTFS}/boot/MLO $TMP/boot
>>         else
>> -               cp -v ${DEPLOY_DIR_IMAGE}/MLO ${WORKDIR}/tmp-mnt-boot
>> +               cp -v ${DEPLOY_DIR_IMAGE}/MLO $TMP/boot
>>         fi
>>
>>         # Check for u-boot SPL
>> @@ -103,54 +46,57 @@ IMAGE_CMD_sdimg () {
>>                 suffix=bin
>>         fi
>>
>> -       cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt ${WORKDIR}/tmp-mnt-boot || true
>> -       cp -v ${IMAGE_ROOTFS}/boot/user.txt ${WORKDIR}/tmp-mnt-boot || true
>> -       cp -v ${IMAGE_ROOTFS}/boot/uImage ${WORKDIR}/tmp-mnt-boot || true
>> -
>>         if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
>> -               cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} ${WORKDIR}/tmp-mnt-boot || true
>> +               cp -v ${IMAGE_ROOTFS}/boot/u-boot.$suffix $TMP/boot || true
>>         else
>> -               cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix ${WORKDIR}/tmp-mnt-boot/u-boot.$suffix
>> +               cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix $TMP/boot/u-boot.$suffix
>> +       fi
>> +
>> +       if [ -e ${IMAGE_ROOTFS}/boot/uImage ]; then
>> +               cp -v ${IMAGE_ROOTFS}/boot/uImage $TMP/boot || true
>> +       else
>> +               cp -v ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.$suffix $TMP/boot/uImage
>> +       fi
>> +
>> +       cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt $TMP/boot || true
>> +       cp -v ${IMAGE_ROOTFS}/boot/user.txt $TMP/boot || true
>> +
>> +       # Copy ubi used by flashing scripts
>> +       if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
>> +               echo "Copying UBIFS image to file system"
>> +               cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${IMAGE_ROOTFS}/boot/fs.ubi
>>         fi
>>
>>         if [ -n ${FATPAYLOAD} ] ; then
>>                 echo "Copying payload into VFAT"
>>                 for entry in ${FATPAYLOAD} ; do
>>                                 # add the || true to stop aborting on vfat issues like not supporting .~lock files
>> -                               cp -av ${IMAGE_ROOTFS}$entry ${WORKDIR}/tmp-mnt-boot || true
>> +                               cp -av ${IMAGE_ROOTFS}$entry $TMP/boot || true
>>                 done
>>         fi
>>
>> -       echo "${IMAGE_NAME}-${IMAGEDATESTAMP}">  ${IMAGE_ROOTFS}/etc/image-version-info
>> -
>> -       # Cleanup VFAT mount
>> -       echo "Cleaning up VFAT mount"
>> -       umount ${WORKDIR}/tmp-mnt-boot
>> -       ${LOSETUP} -d ${LOOPDEV_BOOT} || true
>> -
>> -       # Prepare rootfs parition
>> -       echo "Creating rootfs loopback"
>> -       ${LOSETUP} ${LOOPDEV_FS} ${SDIMG} -o ${FS_OFFSET}
>> -
>> -       FS_NUM_INODES=$(echo $FS_SIZE_BLOCKS / 4 | bc)
>> -
>> -       case "${ROOTFSTYPE}" in
>> -               ext3)
>> -                               genext2fs -z -N $FS_NUM_INODES -b $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
>> -                               tune2fs -L ${IMAGE_NAME} -j ${LOOPDEV_FS}
>> -                               ;;
>> -               ext4)
>> -                               genext2fs -z -N $FS_NUM_INODES -b $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
>> -                               tune2fs -L ${IMAGE_NAME} -j -O extents,uninit_bg,dir_index ${LOOPDEV_FS}
>> -                               ;;
>> -               *)
>> -                               echo "Please set ROOTFSTYPE to something supported"
>> -                               exit 1
>> -                               ;;
>> -       esac
>> -
>> -       ${LOSETUP} -d ${LOOPDEV_FS} || true
>> -
>> -       gzip -c ${WORKDIR}/sd.img>  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-${IMAGEDATESTAMP}.img.gz
>> -       rm -f ${WORKDIR}/sd.img
>> +       dd if=/dev/zero of=${SDIMG} bs=$(expr 1000 \* 1000) count=${SDIMG_SIZE}
>> +
>> +       # Create the boot filesystem
>> +       BOOT_OFFSET=32256
>> +       BOOT_BLOCKS=$(du -bks $TMP/boot | cut -f 1)
>> +       BOOT_SIZE=$(expr $BOOT_BLOCKS + ${BOOTDD_EXTRA_SPACE})
>> +       mkfs.vfat -n ${BOOTDD_VOLUME_ID} -d $TMP/boot -C $TMP/boot.img $BOOT_SIZE
>> +
>> +       # Create partition table
>> +       END1=$(expr $BOOT_SIZE \* 1024)
>> +       END2=$(expr $END1 + 512)
>> +       parted -s ${SDIMG} mklabel msdos
>> +       parted -s ${SDIMG} mkpart primary fat16 ${BOOT_OFFSET}B ${END1}B
>> +       parted -s ${SDIMG} mkpart primary ext3 ${END2}B 100%
>> +       parted -s ${SDIMG} set 1 boot on
>> +       parted ${SDIMG} print
>> +
>> +       OFFSET1=$(expr $BOOT_OFFSET / 512)
>> +       OFFSET2=$(expr $END2 / 512)
>> +       dd if=$TMP/boot.img of=${SDIMG} conv=notrunc seek=$OFFSET1 bs=512
>> +       dd if=${ROOTFS} of=${SDIMG} conv=notrunc seek=$OFFSET2 bs=512
>> +
>> +       cd ${DEPLOY_DIR_IMAGE}
>> +       ln -sf ${IMAGE_NAME}.sdimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.sdimg
>> }
>> --
>> 1.7.2.5
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

--------------030508080102030105000108
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <br>
    <br>
    On 12/16/2011 02:23 AM, Koen Kooi wrote:
    <blockquote
      cite="mid:020D35A2-B806-4C37-AFC7-E8670D7DE004@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
Op 15 dec. 2011, om 16:29 heeft Kridner, Jason het volgende geschreven:

</pre>
      <blockquote type="cite">
        <pre wrap="">Sorry for the top-post.  Using the number of clusters is important to make sure that the DOS partitioning is valid.  I'm not confident that we'll end up with a whole number of clusters using this method.  Perhaps it isn't completely critical, but I'm not 100% comfortable getting rid of it.
</pre>
      </blockquote>
      <pre wrap="">
You can now try it :)

<a class="moz-txt-link-freetext" href="http://dominion.thruhere.net/koen/angstrom/beaglebone/test/">http://dominion.thruhere.net/koen/angstrom/beaglebone/test/</a>

The 'oldmethod' is built using the old method, the other one with otavios patches.
</pre>
    </blockquote>
    <br>
    Isn't the question whether the ROM bootloader handles it or not?&nbsp; If
    so we need to test on Beagleboard classic (Rev B &amp; Rev C) and
    -xM as well. The classic's on board flash should be wiped for a real
    test.<br>
    <br>
    <blockquote
      cite="mid:020D35A2-B806-4C37-AFC7-E8670D7DE004@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
regards,

Koen


</pre>
      <blockquote type="cite">
        <pre wrap="">________________________________________
From: <a class="moz-txt-link-abbreviated" href="mailto:meta-ti-bounces@yoctoproject.org">meta-ti-bounces@yoctoproject.org</a> [<a class="moz-txt-link-abbreviated" href="mailto:meta-ti-bounces@yoctoproject.org">meta-ti-bounces@yoctoproject.org</a>] on behalf of Otavio Salvador [<a class="moz-txt-link-abbreviated" href="mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>]
Sent: Thursday, December 15, 2011 10:05 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a>
Subject: [meta-ti] [PATCH v3 1/3] sdcard_image: rewrote to avoid using  loopback and mount/unmount

Allow generation by regular users without fancy setup requirements and
use of loopback and mount/unmount. Besides, this also includes
following improvements:

* use of megabytes when specifying SDIMG_SIZE
* remove restriction of filesystem to rootfs

Images that use this class needs to generate the rootfs filesystem and
set ROOTFS variable according.

Signed-off-by: Otavio Salvador <a class="moz-txt-link-rfc2396E" href="mailto:otavio@ossystems.com.br">&lt;otavio@ossystems.com.br&gt;</a>
---
classes/sdcard_image.bbclass |  180 +++++++++++++++---------------------------
1 files changed, 63 insertions(+), 117 deletions(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index 519bd9a..5f2d091 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -1,99 +1,42 @@
+#
+# Create an image that can by written onto a SD card using dd.
+#
+# External variables needed:
+#   ${ROOTFS} - the rootfs image to incorporate
+
inherit image

# Add the fstypes we need
-IMAGE_FSTYPES_append = " tar.bz2 sdimg"
+IMAGE_FSTYPES += "sdimg"

# Ensure required utilities are present
-IMAGE_DEPENDS_sdimg = "genext2fs-native e2fsprogs-native"
-
-# Change this to match your host distro
-LOSETUP ?= "/sbin/losetup"
-
-# Since these need to go in /etc/fstab we can hardcode them
-# Since the vars are weakly assigned, you can override them from your local.conf
-LOOPDEV ?= "/dev/loop1"
-LOOPDEV_BOOT ?= "/dev/loop2"
-LOOPDEV_FS ?= "/dev/loop3"
+IMAGE_DEPENDS_sdimg = "dosfstools-native parted-native"

-# Default to 4GiB images
-SDIMG_SIZE ?= "444"
+# Default to 3.4GiB images
+SDIMG_SIZE ?= "3400"

-# FS type for rootfs
-ROOTFSTYPE ?= "ext3"
+# Boot partition volume id
+BOOTDD_VOLUME_ID_beaglebone = "BEAGLE_BONE"
+BOOTDD_VOLUME_ID ?= "${MACHINE}"

-BOOTPARTNAME_beaglebone = "BEAGLE_BONE"
-BOOTPARTNAME ?= "${MACHINE}"
-
-IMAGEDATESTAMP = <a class="moz-txt-link-rfc2396E" href="mailto:${@time.strftime('%Y.%m.%d',time.gmtime())}">"${@time.strftime('%Y.%m.%d',time.gmtime())}"</a>
+# Addional space for boot partition
+BOOTDD_EXTRA_SPACE ?= "16384"

# Files and/or directories to be copied into the vfat partition
FATPAYLOAD ?= ""

IMAGE_CMD_sdimg () {
-       SDIMG=${WORKDIR}/sd.img
-
-       # sanity check fstab entry for boot partition mounting
-       if [ "x$(cat /etc/fstab | grep ${LOOPDEV_BOOT} | grep ${WORKDIR}/tmp-mnt-boot | grep user || true)" = "x" ]; then
-               echo "/etc/fstab entries need to be created with the user flag for the loop devices like:"
-               echo "${LOOPDEV_BOOT} ${WORKDIR}/tmp-mnt-boot vfat user 0 0"
-        false
-       fi
-
-       # cleanup loops
-       for loop in ${LOOPDEV} ${LOOPDEV_BOOT} ${LOOPDEV_FS} ; do
-               ${LOSETUP} -d $loop || true
-       done
-
-       # If an SD image is already present, reuse and reformat it
-       if [ ! -e ${SDIMG} ] ; then
-               dd if=/dev/zero of=${SDIMG} bs=$(echo '255 * 63 * 512' | bc) count=${SDIMG_SIZE}
-       fi
-
-       ${LOSETUP} ${LOOPDEV} ${SDIMG}
-
-       # Create partition table
-       dd if=/dev/zero of=${LOOPDEV} bs=1024 count=1024
-       SIZE=$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes | awk '{print $5}')
-       CYLINDERS=$(echo $SIZE/255/63/512 | bc)
-       {
-       echo ,9,0x0C,*
-       echo ,,,-
-       } | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}
-
-       # Prepare loop devices for boot and filesystem partitions
-       BOOT_OFFSET=32256
-       FS_OFFSET_SECT=$(/sbin/fdisk -l -u ${LOOPDEV} 2&gt;&amp;1 | grep Linux | perl -p -i -e "s/\s+/ /"|cut -d " " -f 2)
-       FS_OFFSET=$(echo "$FS_OFFSET_SECT * 512" | bc)
-       FS_SIZE_BLOCKS=$(/sbin/fdisk -l -u ${LOOPDEV} 2&gt;&amp;1 | grep Linux | perl -p -i -e "s/\s+/ /g" \
-       |cut -d " " -f 4 | cut -d "+" -f 1)
-
-       LOOPDEV_BLOCKS=$(/sbin/fdisk -l -u ${LOOPDEV} 2&gt;&amp;1 | grep FAT | perl -p -i -e "s/\s+/ /g"|cut -d " " -f 5)
-       LOOPDEV_BYTES=$(echo "$LOOPDEV_BLOCKS * 1024" | bc)
-
-       ${LOSETUP} -d ${LOOPDEV}
-
-       ${LOSETUP} ${LOOPDEV_BOOT} ${SDIMG} -o ${BOOT_OFFSET}
-
-       /sbin/mkfs.vfat ${LOOPDEV_BOOT} -n ${BOOTPARTNAME} $LOOPDEV_BLOCKS
-
-       # Prepare filesystem partition
-       # Copy ubi used by flashing scripts
-       if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
-               echo "Copying UBIFS image to file system"
-               cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${IMAGE_ROOTFS}/boot/fs.ubi
-       fi
+       TMP=${WORKDIR}/tmp
+       SDIMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.sdimg

-       # Prepare boot partion. First mount the boot partition, and copy the boot loader and supporting files
-       # from the root filesystem
-
-       mkdir -p ${WORKDIR}/tmp-mnt-boot
-       mount $LOOPDEV_BOOT ${WORKDIR}/tmp-mnt-boot
+       # Prepare boot filesystem
+       install -d $TMP/boot

       echo "Copying bootloaders into the boot partition"
       if [ -e ${IMAGE_ROOTFS}/boot/MLO ] ; then
-               cp -v ${IMAGE_ROOTFS}/boot/MLO ${WORKDIR}/tmp-mnt-boot
+               cp -v ${IMAGE_ROOTFS}/boot/MLO $TMP/boot
       else
-               cp -v ${DEPLOY_DIR_IMAGE}/MLO ${WORKDIR}/tmp-mnt-boot
+               cp -v ${DEPLOY_DIR_IMAGE}/MLO $TMP/boot
       fi

       # Check for u-boot SPL
@@ -103,54 +46,57 @@ IMAGE_CMD_sdimg () {
               suffix=bin
       fi

-       cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt ${WORKDIR}/tmp-mnt-boot || true
-       cp -v ${IMAGE_ROOTFS}/boot/user.txt ${WORKDIR}/tmp-mnt-boot || true
-       cp -v ${IMAGE_ROOTFS}/boot/uImage ${WORKDIR}/tmp-mnt-boot || true
-
       if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
-               cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} ${WORKDIR}/tmp-mnt-boot || true
+               cp -v ${IMAGE_ROOTFS}/boot/u-boot.$suffix $TMP/boot || true
       else
-               cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix ${WORKDIR}/tmp-mnt-boot/u-boot.$suffix
+               cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix $TMP/boot/u-boot.$suffix
+       fi
+
+       if [ -e ${IMAGE_ROOTFS}/boot/uImage ]; then
+               cp -v ${IMAGE_ROOTFS}/boot/uImage $TMP/boot || true
+       else
+               cp -v ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.$suffix $TMP/boot/uImage
+       fi
+
+       cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt $TMP/boot || true
+       cp -v ${IMAGE_ROOTFS}/boot/user.txt $TMP/boot || true
+
+       # Copy ubi used by flashing scripts
+       if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
+               echo "Copying UBIFS image to file system"
+               cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${IMAGE_ROOTFS}/boot/fs.ubi
       fi

       if [ -n ${FATPAYLOAD} ] ; then
               echo "Copying payload into VFAT"
               for entry in ${FATPAYLOAD} ; do
                               # add the || true to stop aborting on vfat issues like not supporting .~lock files
-                               cp -av ${IMAGE_ROOTFS}$entry ${WORKDIR}/tmp-mnt-boot || true
+                               cp -av ${IMAGE_ROOTFS}$entry $TMP/boot || true
               done
       fi

-       echo "${IMAGE_NAME}-${IMAGEDATESTAMP}" &gt; ${IMAGE_ROOTFS}/etc/image-version-info
-
-       # Cleanup VFAT mount
-       echo "Cleaning up VFAT mount"
-       umount ${WORKDIR}/tmp-mnt-boot
-       ${LOSETUP} -d ${LOOPDEV_BOOT} || true
-
-       # Prepare rootfs parition
-       echo "Creating rootfs loopback"
-       ${LOSETUP} ${LOOPDEV_FS} ${SDIMG} -o ${FS_OFFSET}
-
-       FS_NUM_INODES=$(echo $FS_SIZE_BLOCKS / 4 | bc)
-
-       case "${ROOTFSTYPE}" in
-               ext3)
-                               genext2fs -z -N $FS_NUM_INODES -b $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
-                               tune2fs -L ${IMAGE_NAME} -j ${LOOPDEV_FS}
-                               ;;
-               ext4)
-                               genext2fs -z -N $FS_NUM_INODES -b $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
-                               tune2fs -L ${IMAGE_NAME} -j -O extents,uninit_bg,dir_index ${LOOPDEV_FS}
-                               ;;
-               *)
-                               echo "Please set ROOTFSTYPE to something supported"
-                               exit 1
-                               ;;
-       esac
-
-       ${LOSETUP} -d ${LOOPDEV_FS} || true
-
-       gzip -c ${WORKDIR}/sd.img &gt; ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-${IMAGEDATESTAMP}.img.gz
-       rm -f ${WORKDIR}/sd.img
+       dd if=/dev/zero of=${SDIMG} bs=$(expr 1000 \* 1000) count=${SDIMG_SIZE}
+
+       # Create the boot filesystem
+       BOOT_OFFSET=32256
+       BOOT_BLOCKS=$(du -bks $TMP/boot | cut -f 1)
+       BOOT_SIZE=$(expr $BOOT_BLOCKS + ${BOOTDD_EXTRA_SPACE})
+       mkfs.vfat -n ${BOOTDD_VOLUME_ID} -d $TMP/boot -C $TMP/boot.img $BOOT_SIZE
+
+       # Create partition table
+       END1=$(expr $BOOT_SIZE \* 1024)
+       END2=$(expr $END1 + 512)
+       parted -s ${SDIMG} mklabel msdos
+       parted -s ${SDIMG} mkpart primary fat16 ${BOOT_OFFSET}B ${END1}B
+       parted -s ${SDIMG} mkpart primary ext3 ${END2}B 100%
+       parted -s ${SDIMG} set 1 boot on
+       parted ${SDIMG} print
+
+       OFFSET1=$(expr $BOOT_OFFSET / 512)
+       OFFSET2=$(expr $END2 / 512)
+       dd if=$TMP/boot.img of=${SDIMG} conv=notrunc seek=$OFFSET1 bs=512
+       dd if=${ROOTFS} of=${SDIMG} conv=notrunc seek=$OFFSET2 bs=512
+
+       cd ${DEPLOY_DIR_IMAGE}
+       ln -sf ${IMAGE_NAME}.sdimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.sdimg
}
--
1.7.2.5

_______________________________________________
meta-ti mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a>
_______________________________________________
meta-ti mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
meta-ti mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a>
</pre>
    </blockquote>
  </body>
</html>

--------------030508080102030105000108--
