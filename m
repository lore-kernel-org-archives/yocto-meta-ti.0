Return-Path: <pabigot@gmail.com>
Received: from mail-gx0-f176.google.com (mail-gx0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81672E00502
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 10:25:30 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by ggnp1 with SMTP id p1so1580090ggn.35
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 10:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=5cxbtczyDJ6BldzQla9jm1aBgbnUSK7p6flEDVHSsXM=;
	b=kUadvjebR8zMyapqJBqWytTTRc9raAszhD1Lu+REkM4K/7PhFidOY4J6p5UXxmZ9x2
	Xlw5v71wWp3vbiUWk1RiQmI1T163XwNoq7a6tcSYTajV3TDekAd46+leCaw1u8UCmHZR
	VBP9GBgqmdNgZ1rwK0IXnERVcCCgN/IjZ28rw=
Received: by 10.236.76.136 with SMTP id b8mr9892067yhe.9.1321208729531;
	Sun, 13 Nov 2011 10:25:29 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id o64sm27059912yhk.3.2011.11.13.10.25.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Nov 2011 10:25:28 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Sun, 13 Nov 2011 12:25:15 -0600
Message-Id: <1321208716-9749-1-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1321208655-9701-1-git-send-email-bigotp@acm.org>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
Subject: [PATCH 1/2] sdcard_image bbclass: fix MLO copy, loop device mounts, fstypes
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
X-List-Received-Date: Sun, 13 Nov 2011 18:25:30 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

Generalize the search for MLO to install to have correct path for copies
placed in ${DEPLOY_DIR_IMAGE} by x-load.inc, and to continue for SPL builds
where there is no MLO.

Allow user to override the loop mount point as well as the loop device, for
folks who don't want long paths to temporary directories in their fstabs.

Add noauto to example fstab entries so systems will boot without attempting
to mount an unconfigured loopback device.

Remove IMAGE_FSTYPE_append which does not belong in this class.

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 classes/sdcard_image.bbclass |   47 ++++++++++++++++++++++++-----------------
 1 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index 531b419..96b709d 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -1,8 +1,5 @@
 inherit image
 
-# Add the fstypes we need
-IMAGE_FSTYPES_append = " tar.bz2 sdimg"
-
 # Ensure required utilities are present
 IMAGE_DEPENDS_sdimg = "genext2fs-native e2fsprogs-native"
 
@@ -13,6 +10,7 @@ LOSETUP ?= "/sbin/losetup"
 # Since the vars are weakly assigned, you can override them from your local.conf
 LOOPDEV ?= "/dev/loop1"
 LOOPDEV_BOOT ?= "/dev/loop2"
+MOUNTPOINT_BOOT ?= "${WORKDIR}/tmp-mnt-boot"
 LOOPDEV_FS ?= "/dev/loop3"
 
 # Default to 4GiB images
@@ -29,14 +27,18 @@ IMAGEDATESTAMP = "${@time.strftime('%Y.%m.%d',time.gmtime())}"
 # Files and/or directories to be copied into the vfat partition
 FATPAYLOAD ?= ""
 
+# Match meta-ti x-load.inc link names
+MLO_SYMLINK ?= "MLO-${MACHINE}"
+MLO_SYMLINK_NOMACHINE ?= "MLO"
+
 IMAGE_CMD_sdimg () {
 	SDIMG=${WORKDIR}/sd.img
 
 	# sanity check fstab entry for boot partition mounting
-	if [ "x$(cat /etc/fstab | grep ${LOOPDEV_BOOT} | grep ${WORKDIR}/tmp-mnt-boot | grep user || true)" = "x" ]; then
+	if [ "x$(cat /etc/fstab | grep ${LOOPDEV_BOOT} | grep ${MOUNTPOINT_BOOT} | grep user || true)" = "x" ]; then
 		echo "/etc/fstab entries need to be created with the user flag for the loop devices like:"
-		echo "${LOOPDEV_BOOT} ${WORKDIR}/tmp-mnt-boot vfat user 0 0"
-        false
+		echo "${LOOPDEV_BOOT} ${MOUNTPOINT_BOOT} vfat noauto,user 0 0"
+		false
 	fi
 
 	# cleanup loops
@@ -86,15 +88,20 @@ IMAGE_CMD_sdimg () {
 	# Prepare boot partion. First mount the boot partition, and copy the boot loader and supporting files
 	# from the root filesystem
 
-	mkdir -p ${WORKDIR}/tmp-mnt-boot
-	mount $LOOPDEV_BOOT ${WORKDIR}/tmp-mnt-boot
+	mkdir -p ${MOUNTPOINT_BOOT}
+	mount $LOOPDEV_BOOT ${MOUNTPOINT_BOOT}
 
 	echo "Copying bootloaders into the boot partition"
-	if [ -e ${IMAGE_ROOTFS}/boot/MLO ] ; then
-		cp -v ${IMAGE_ROOTFS}/boot/MLO ${WORKDIR}/tmp-mnt-boot 
-	else
-		cp -v ${DEPLOY_DIR_IMAGE}/MLO ${WORKDIR}/tmp-mnt-boot
-	fi
+	for mlo in \
+	    ${IMAGE_ROOTFS}/boot/${MLO_SYMLINK_NOMACHINE} \
+	    ${DEPLOY_DIR_IMAGE}/${MLO_SYMLINK} \
+	    ${DEPLOY_DIR_IMAGE}/MLO \
+	    ; do
+		if [ -e ${mlo} ] ; then
+			cp -v ${mlo} ${MOUNTPOINT_BOOT}/MLO
+			break
+		fi
+	done
 
 	# Check for u-boot SPL
 	if [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.img ] ; then
@@ -103,27 +110,27 @@ IMAGE_CMD_sdimg () {
 		suffix=bin
 	fi
 
-	cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt ${WORKDIR}/tmp-mnt-boot || true
-	cp -v ${IMAGE_ROOTFS}/boot/user.txt ${WORKDIR}/tmp-mnt-boot || true
-	cp -v ${IMAGE_ROOTFS}/boot/uImage ${WORKDIR}/tmp-mnt-boot || true
+	cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt ${MOUNTPOINT_BOOT} || true
+	cp -v ${IMAGE_ROOTFS}/boot/user.txt ${MOUNTPOINT_BOOT} || true
+	cp -v ${IMAGE_ROOTFS}/boot/uImage ${MOUNTPOINT_BOOT} || true
 
 	if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
-		cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} ${WORKDIR}/tmp-mnt-boot || true
+		cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} ${MOUNTPOINT_BOOT} || true
 	else
-		cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix ${WORKDIR}/tmp-mnt-boot/u-boot.$suffix 
+		cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix ${MOUNTPOINT_BOOT}/u-boot.$suffix 
 	fi
 
 	if [ -n ${FATPAYLOAD} ] ; then
 		echo "Copying payload into VFAT"
 		for entry in ${FATPAYLOAD} ; do
 				# add the || true to stop aborting on vfat issues like not supporting .~lock files
-				cp -av ${IMAGE_ROOTFS}$entry ${WORKDIR}/tmp-mnt-boot || true
+				cp -av ${IMAGE_ROOTFS}$entry ${MOUNTPOINT_BOOT} || true
 		done
 	fi
 
 	# Cleanup VFAT mount
 	echo "Cleaning up VFAT mount"
-	umount ${WORKDIR}/tmp-mnt-boot
+	umount ${MOUNTPOINT_BOOT}
 	${LOSETUP} -d ${LOOPDEV_BOOT} || true
 
 	# Prepare rootfs parition
-- 
1.7.6.4


