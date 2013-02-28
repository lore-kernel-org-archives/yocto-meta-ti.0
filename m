Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B7B0E00738
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2013 13:55:09 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIY00AOKA6W9VI2@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 28 Feb 2013 15:54:47 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6A71820092; Thu,
	28 Feb 2013 16:54:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 28 Feb 2013 16:54:24 -0500
Message-id: <1362088464-26632-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] u-boot 2012.10: add the latest SDK 05.06 version from meta-arago
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
X-List-Received-Date: Thu, 28 Feb 2013 21:55:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot_2012.10.bb | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 recipes-bsp/u-boot/u-boot_2012.10.bb

diff --git a/recipes-bsp/u-boot/u-boot_2012.10.bb b/recipes-bsp/u-boot/u-boot_2012.10.bb
new file mode 100644
index 0000000..89d646c
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2012.10.bb
@@ -0,0 +1,32 @@
+# Use the version of u-boot.inc in oe-core not the meta-ti version
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+# Reset OEMAKE. Current u-boot.inc sets -02 which breaks this version of u-boot's build.
+# This issue was fixed in oe-core master by removing the -02 statement.
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
+
+DESCRIPTION = "u-boot bootloader for ARM MPU devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+COMPATIBLE_MACHINE = "ti33x|omap3"
+
+DEFAULT_PREFERENCE = "-1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r7+gitr${SRCPV}"
+
+SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
+"
+
+BRANCH = "amsdk-05.06.00.00"
+
+SRCREV = "6536bfa6b7f16bb49fdea8c72959e3ed54e77a82"
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "img"
+
+# Set the name of the SPL that will built so that it is also packaged with u-boot.
+SPL_BINARY = "MLO"
-- 
1.8.1.4


