Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15F2BE0147F
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:33:58 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV008E2QS247B2@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:33:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0A4C7201BB; Mon,
	18 Mar 2013 19:33:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:20 -0400
Message-id: <1363649547-4693-13-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 12/19] u-boot-am33x: modify am33x specific version to use new namespace feature
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
X-List-Received-Date: Mon, 18 Mar 2013 23:33:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{u-boot_2012.10.bb => u-boot-am33x_2012.10.bb}    | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)
 rename recipes-bsp/u-boot/{u-boot_2012.10.bb => u-boot-am33x_2012.10.bb} (31%)

diff --git a/recipes-bsp/u-boot/u-boot_2012.10.bb b/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
similarity index 31%
rename from recipes-bsp/u-boot/u-boot_2012.10.bb
rename to recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
index 89d646c..7320e02 100644
--- a/recipes-bsp/u-boot/u-boot_2012.10.bb
+++ b/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
@@ -1,32 +1,17 @@
-# Use the version of u-boot.inc in oe-core not the meta-ti version
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
-
-# Reset OEMAKE. Current u-boot.inc sets -02 which breaks this version of u-boot's build.
-# This issue was fixed in oe-core master by removing the -02 statement.
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
+require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for ARM MPU devices"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
 COMPATIBLE_MACHINE = "ti33x|omap3"
 
 DEFAULT_PREFERENCE = "-1"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PR = "r7+gitr${SRCPV}"
 
-SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
-"
+SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "amsdk-05.06.00.00"
 
 SRCREV = "6536bfa6b7f16bb49fdea8c72959e3ed54e77a82"
 
-S = "${WORKDIR}/git"
-
-UBOOT_SUFFIX = "img"
-
-# Set the name of the SPL that will built so that it is also packaged with u-boot.
 SPL_BINARY = "MLO"
-- 
1.8.1.5


