Return-Path: <denys@ti.com>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC858E00719
	for <meta-ti@yoctoproject.org>; Mon, 21 Jan 2013 19:30:00 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MH000MDYCE03C53@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 21 Jan 2013 21:30:00 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CFF1220031; Mon,
	21 Jan 2013 22:29:59 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 21 Jan 2013 22:29:58 -0500
Message-id: <1358825399-11222-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH 1/2] u-boot: update to the latest dev release for keystone
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 03:30:01 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot_2012.07.bb | 23 -----------------------
 recipes-bsp/u-boot/u-boot_2013.01.bb | 23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 23 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/u-boot_2012.07.bb
 create mode 100644 recipes-bsp/u-boot/u-boot_2013.01.bb

diff --git a/recipes-bsp/u-boot/u-boot_2012.07.bb b/recipes-bsp/u-boot/u-boot_2012.07.bb
deleted file mode 100644
index f39e60c..0000000
--- a/recipes-bsp/u-boot/u-boot_2012.07.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
-
-DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-COMPATIBLE_MACHINE = "keystone"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0+gitr${SRCPV}"
-
-SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
-
-BRANCH = "master"
-
-SRCREV = "6e710c61dba2665e01c900470a0a63743ff431c6"
-
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
-
-S = "${WORKDIR}/git"
-
-UBOOT_SUFFIX = "bin"
diff --git a/recipes-bsp/u-boot/u-boot_2013.01.bb b/recipes-bsp/u-boot/u-boot_2013.01.bb
new file mode 100644
index 0000000..ee443b0
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2013.01.bb
@@ -0,0 +1,23 @@
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+COMPATIBLE_MACHINE = "keystone"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r1+gitr${SRCPV}"
+
+SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "master"
+
+SRCREV = "DEV.MCSDK-03.00.00.06"
+
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "bin"
-- 
1.8.1.1


