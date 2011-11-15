Return-Path: <jkridner@beagleboard.org>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57731E00305
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2011 05:41:39 -0800 (PST)
Received: by ywb26 with SMTP id 26so4278161ywb.35
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2011 05:41:38 -0800 (PST)
Received: by 10.68.31.129 with SMTP id a1mr58867157pbi.131.1321364497233;
	Tue, 15 Nov 2011 05:41:37 -0800 (PST)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com. [75.101.156.174])
	by mx.google.com with ESMTPS id wn14sm65138077pbb.5.2011.11.15.05.41.34
	(version=SSLv3 cipher=OTHER); Tue, 15 Nov 2011 05:41:34 -0800 (PST)
From: Jason Kridner <jkridner@beagleboard.org>
To: meta-ti@yoctoproject.org
Date: Tue, 15 Nov 2011 07:41:31 -0600
Message-Id: <1321364491-20230-1-git-send-email-jdk@ti.com>
X-Mailer: git-send-email 1.7.0.2.276.g60daf
Subject: [PATCH] gadget-init: create info.txt upon starting storage gadget
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
X-List-Received-Date: Tue, 15 Nov 2011 13:41:40 -0000

This creates a file called info.txt that saves some useful information
for image versioning, network connectivity and beginner user debugging.

Signed-off-by: Jason Kridner <jdk@ti.com>
---
 recipes-ti/beagleboard/gadget-init.bb              |    4 ++-
 .../gadget-init/storage-gadget-init.service        |    1 +
 .../gadget-init/update-image-info-on-mmcblk0p1.sh  |   33 ++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletions(-)
 create mode 100755 recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh

diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard/gadget-init.bb
index 0d4682e..16137fa 100644
--- a/recipes-ti/beagleboard/gadget-init.bb
+++ b/recipes-ti/beagleboard/gadget-init.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Units to initialize usb gadgets"
 
-PR = "r11"
+PR = "r12"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
@@ -19,6 +19,7 @@ SRC_URI = "file://storage-gadget-init.service \
            file://g-storage-reinsert.sh \
            file://g-ether-start-service.sh \
            file://g-ether-load.sh \
+           file://update-image-info-on-mmcblk0p1.sh \
           "
 
 do_install() {
@@ -46,6 +47,7 @@ FILES_${PN} = "${sysconfdir}/udev/rules.d/99-hokey-pokey.rules \
 FILES_${PN}-storage = "${base_libdir}/systemd/system/storage-gadget-init.service \
                        ${base_libdir}/systemd/system/basic.target.wants/storage-gadget-init.service \
                        ${bindir}/g-storage-reinsert.sh \
+                       ${bindir}/update-image-info-on-mmcblk0p1.sh \
                        ${sysconfdir}/udev/rules.d/bone-gmass-eject.rules"
 
 FILES_${PN}-network = "${base_libdir}/systemd/system/network-gadget-init.service \
diff --git a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
index 9a8513e..601e0d7 100644
--- a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
+++ b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
@@ -4,6 +4,7 @@ After=dev-mmcblk0p1.device
 
 [Service]
 RemainAfterExit=yes
+ExecStartPre=/usr/bin/update-image-info-on-mmcblk0p1.sh
 ExecStart=/sbin/modprobe g_mass_storage file=/dev/mmcblk0p1 cdrom=0 stall=0 removable=1 nofua=1
 ExecStop=/sbin/rmmod g_mass_storage
 
diff --git a/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh b/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh
new file mode 100755
index 0000000..62aab39
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh
@@ -0,0 +1,33 @@
+#!/bin/sh
+mount /dev/mmcblk0p1 /mnt
+echo "Image info snapshot" > /mnt/info.txt
+
+echo >> /mnt/info.txt
+echo "/etc/angstrom-version:" >> /mnt/info.txt
+cat /etc/angstrom-version >> /mnt/info.txt
+
+echo >> /mnt/info.txt
+echo "/proc/cpuinfo:" >> /mnt/info.txt
+cat /proc/cpuinfo >> /mnt/info.txt
+
+echo >> /mnt/info.txt
+echo "uname -a:" >> /mnt/info.txt
+uname -a >> /mnt/info.txt
+
+echo >> /mnt/info.txt
+echo "/proc/cmdline:" >> /mnt/info.txt
+cat /proc/cmdline >> /mnt/info.txt
+
+echo >> /mnt/info.txt
+echo "ifconfig:" >> /mnt/info.txt
+ifconfig >> /mnt/info.txt
+
+echo >> /mnt/info.txt
+echo "/etc/angstrom-build-info:" >> /mnt/info.txt
+cat /etc/angstrom-build-info >> /mnt/info.txt
+
+echo >> /mnt/info.txt
+echo "opkg list-installed:" >> /mnt/info.txt
+opkg list-installed >> /mnt/info.txt
+
+umount /mnt
-- 
1.7.0.2.276.g60daf


