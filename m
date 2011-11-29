Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9AC51E00309
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 04:41:44 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by mail-yx0-f176.google.com with SMTP id l9so8234957yen.35
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 04:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=BtfnGcoI2InNjgSzZ9c2P+gKDQnFcuVg5h3UN1LCdNE=;
	b=wLjPr+GIMGAC+ZDz0cDdzdnbwicY8+kwBVcKudEavGyDS/cQjg7nNPxCLFHnSGHmjh
	SGib0dFMg1NRTldidnr0EdbmtWjDKltYfDNIKRI255Dko1G0vMwOPJfKNZOEbHtc6td9
	JkEGgQbv5hAaY84yz54A7+vSyrz9AAscL2xoI=
Received: by 10.236.154.3 with SMTP id g3mr73633288yhk.119.1322570504437;
	Tue, 29 Nov 2011 04:41:44 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 33sm2938343ano.1.2011.11.29.04.41.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 04:41:43 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Tue, 29 Nov 2011 12:41:29 +0000
Message-Id: <ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1322570446.git.otavio@ossystems.com.br>
References: <cover.1322570446.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1322570446.git.otavio@ossystems.com.br>
References: <cover.1322570446.git.otavio@ossystems.com.br>
Subject: [PATCH v2 1/3] sdcard_image: rewrote to avoid using loopback and mount/unmount
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
X-List-Received-Date: Tue, 29 Nov 2011 12:41:44 -0000

Allow generation by regular users without fancy setup requirements and
use of loopback and mount/unmount. Besides, this also includes
following improvements:

 * use of megabytes when specifying SDIMG_SIZE
 * remove restriction of filesystem to rootfs

Images that use this class needs to generate the rootfs filesystem and
set ROOTFS variable according.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/sdcard_image.bbclass |  181 +++++++++++++++---------------------------
 1 files changed, 64 insertions(+), 117 deletions(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index 519bd9a..158648e 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -1,99 +1,43 @@
+# Copyright (C) 2011 O.S. Systems Software LTDA.
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
-IMAGEDATESTAMP = "${@time.strftime('%Y.%m.%d',time.gmtime())}"
+# Addional space for boot partition
+BOOTDD_EXTRA_SPACE ?= "16384"
 
 # Files and/or directories to be copied into the vfat partition
 FATPAYLOAD ?= ""
 
 IMAGE_CMD_sdimg () {
-	SDIMG=${WORKDIR}/sd.img
-
-	# sanity check fstab entry for boot partition mounting
-	if [ "x$(cat /etc/fstab | grep ${LOOPDEV_BOOT} | grep ${WORKDIR}/tmp-mnt-boot | grep user || true)" = "x" ]; then
-		echo "/etc/fstab entries need to be created with the user flag for the loop devices like:"
-		echo "${LOOPDEV_BOOT} ${WORKDIR}/tmp-mnt-boot vfat user 0 0"
-        false
-	fi
-
-	# cleanup loops
-	for loop in ${LOOPDEV} ${LOOPDEV_BOOT} ${LOOPDEV_FS} ; do
-		${LOSETUP} -d $loop || true
-	done
-
-	# If an SD image is already present, reuse and reformat it
-	if [ ! -e ${SDIMG} ] ; then
-		dd if=/dev/zero of=${SDIMG} bs=$(echo '255 * 63 * 512' | bc) count=${SDIMG_SIZE}
-	fi
-
-	${LOSETUP} ${LOOPDEV} ${SDIMG}
-
-	# Create partition table
-	dd if=/dev/zero of=${LOOPDEV} bs=1024 count=1024
-	SIZE=$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes | awk '{print $5}')
-	CYLINDERS=$(echo $SIZE/255/63/512 | bc)
-	{
-	echo ,9,0x0C,*
-	echo ,,,-
-	} | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}
-
-	# Prepare loop devices for boot and filesystem partitions
-	BOOT_OFFSET=32256
-	FS_OFFSET_SECT=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep Linux | perl -p -i -e "s/\s+/ /"|cut -d " " -f 2)
-	FS_OFFSET=$(echo "$FS_OFFSET_SECT * 512" | bc)
-	FS_SIZE_BLOCKS=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep Linux | perl -p -i -e "s/\s+/ /g" \ 
-	|cut -d " " -f 4 | cut -d "+" -f 1)
- 
-	LOOPDEV_BLOCKS=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep FAT | perl -p -i -e "s/\s+/ /g"|cut -d " " -f 5)
-	LOOPDEV_BYTES=$(echo "$LOOPDEV_BLOCKS * 1024" | bc)
-
-	${LOSETUP} -d ${LOOPDEV}
-
-	${LOSETUP} ${LOOPDEV_BOOT} ${SDIMG} -o ${BOOT_OFFSET} 
-
-	/sbin/mkfs.vfat ${LOOPDEV_BOOT} -n ${BOOTPARTNAME} $LOOPDEV_BLOCKS
-
-	# Prepare filesystem partition
-	# Copy ubi used by flashing scripts
-	if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
-		echo "Copying UBIFS image to file system"
-		cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${IMAGE_ROOTFS}/boot/fs.ubi
-	fi
+	TMP=${WORKDIR}/tmp
+	SDIMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.sdimg
 
-	# Prepare boot partion. First mount the boot partition, and copy the boot loader and supporting files
-	# from the root filesystem
-
-	mkdir -p ${WORKDIR}/tmp-mnt-boot
-	mount $LOOPDEV_BOOT ${WORKDIR}/tmp-mnt-boot
+	# Prepare boot filesystem
+	install -d $TMP/boot
 
 	echo "Copying bootloaders into the boot partition"
 	if [ -e ${IMAGE_ROOTFS}/boot/MLO ] ; then
-		cp -v ${IMAGE_ROOTFS}/boot/MLO ${WORKDIR}/tmp-mnt-boot 
+		cp -v ${IMAGE_ROOTFS}/boot/MLO $TMP/boot
 	else
-		cp -v ${DEPLOY_DIR_IMAGE}/MLO ${WORKDIR}/tmp-mnt-boot
+		cp -v ${DEPLOY_DIR_IMAGE}/MLO $TMP/boot
 	fi
 
 	# Check for u-boot SPL
@@ -103,54 +47,57 @@ IMAGE_CMD_sdimg () {
 		suffix=bin
 	fi
 
-	cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt ${WORKDIR}/tmp-mnt-boot || true
-	cp -v ${IMAGE_ROOTFS}/boot/user.txt ${WORKDIR}/tmp-mnt-boot || true
-	cp -v ${IMAGE_ROOTFS}/boot/uImage ${WORKDIR}/tmp-mnt-boot || true
-
 	if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
-		cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} ${WORKDIR}/tmp-mnt-boot || true
+		cp -v ${IMAGE_ROOTFS}/boot/u-boot.$suffix $TMP/boot || true
 	else
-		cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix ${WORKDIR}/tmp-mnt-boot/u-boot.$suffix 
+		cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix $TMP/boot/u-boot.$suffix
+	fi
+
+	if [ -e ${IMAGE_ROOTFS}/boot/uImage ]; then
+		cp -v ${IMAGE_ROOTFS}/boot/uImage $TMP/boot || true
+	else
+		cp -v ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.$suffix $TMP/boot/uImage
+	fi
+
+	cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt $TMP/boot || true
+	cp -v ${IMAGE_ROOTFS}/boot/user.txt $TMP/boot || true
+
+	# Copy ubi used by flashing scripts
+	if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
+		echo "Copying UBIFS image to file system"
+		cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${IMAGE_ROOTFS}/boot/fs.ubi
 	fi
 
 	if [ -n ${FATPAYLOAD} ] ; then
 		echo "Copying payload into VFAT"
 		for entry in ${FATPAYLOAD} ; do
 				# add the || true to stop aborting on vfat issues like not supporting .~lock files
-				cp -av ${IMAGE_ROOTFS}$entry ${WORKDIR}/tmp-mnt-boot || true
+				cp -av ${IMAGE_ROOTFS}$entry $TMP/boot || true
 		done
 	fi
 
-	echo "${IMAGE_NAME}-${IMAGEDATESTAMP}" > ${IMAGE_ROOTFS}/etc/image-version-info
-
-	# Cleanup VFAT mount
-	echo "Cleaning up VFAT mount"
-	umount ${WORKDIR}/tmp-mnt-boot
-	${LOSETUP} -d ${LOOPDEV_BOOT} || true
-
-	# Prepare rootfs parition
-	echo "Creating rootfs loopback"
-	${LOSETUP} ${LOOPDEV_FS} ${SDIMG} -o ${FS_OFFSET}
-
-	FS_NUM_INODES=$(echo $FS_SIZE_BLOCKS / 4 | bc)
-
-	case "${ROOTFSTYPE}" in
-		ext3)
-				genext2fs -z -N $FS_NUM_INODES -b $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
-				tune2fs -L ${IMAGE_NAME} -j ${LOOPDEV_FS}
-				;;
-		ext4)
-				genext2fs -z -N $FS_NUM_INODES -b $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
-				tune2fs -L ${IMAGE_NAME} -j -O extents,uninit_bg,dir_index ${LOOPDEV_FS}
-				;;
-		*)
-				echo "Please set ROOTFSTYPE to something supported"
-				exit 1
-				;;
-	esac
-
-	${LOSETUP} -d ${LOOPDEV_FS} || true
-
-	gzip -c ${WORKDIR}/sd.img > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-${IMAGEDATESTAMP}.img.gz
-	rm -f ${WORKDIR}/sd.img
+	dd if=/dev/zero of=${SDIMG} bs=$(expr 1000 \* 1000) count=${SDIMG_SIZE}
+
+	# Create the boot filesystem
+	BOOT_OFFSET=32256
+	BOOT_BLOCKS=$(du -bks $TMP/boot | cut -f 1)
+	BOOT_SIZE=$(expr $BOOT_BLOCKS + ${BOOTDD_EXTRA_SPACE})
+	mkfs.vfat -n ${BOOTDD_VOLUME_ID} -d $TMP/boot -C $TMP/boot.img $BOOT_SIZE
+
+	# Create partition table
+	END1=$(expr $BOOT_SIZE \* 1024)
+	END2=$(expr $END1 + 512)
+	parted -s ${SDIMG} mklabel msdos
+	parted -s ${SDIMG} mkpart primary fat16 ${BOOT_OFFSET}B ${END1}B
+	parted -s ${SDIMG} mkpart primary ext3 ${END2}B 100%
+	parted -s ${SDIMG} set 1 boot on
+	parted ${SDIMG} print
+
+	OFFSET1=$(expr $BOOT_OFFSET / 512)
+	OFFSET2=$(expr $END2 / 512)
+	dd if=$TMP/boot.img of=${SDIMG} conv=notrunc seek=$OFFSET1 bs=512
+	dd if=${ROOTFS} of=${SDIMG} conv=notrunc seek=$OFFSET2 bs=512
+
+	cd ${DEPLOY_DIR_IMAGE}
+	ln -sf ${IMAGE_NAME}.sdimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.sdimg
 }
-- 
1.7.2.5


