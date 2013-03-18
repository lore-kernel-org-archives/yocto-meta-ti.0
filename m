Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F5FDE01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:33:42 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV00JGLQS03TH1@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:33:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5C4EB204AB; Mon,
	18 Mar 2013 19:33:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:14 -0400
Message-id: <1363649547-4693-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 06/19] u-boot-keystone: modify keystone specific version to use new namespace feature
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
X-List-Received-Date: Mon, 18 Mar 2013 23:33:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{u-boot_2013.01.bb => u-boot-keystone_2013.01.bb}       | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)
 rename recipes-bsp/u-boot/{u-boot_2013.01.bb => u-boot-keystone_2013.01.bb} (43%)

diff --git a/recipes-bsp/u-boot/u-boot_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
similarity index 43%
rename from recipes-bsp/u-boot/u-boot_2013.01.bb
rename to recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
index b9e6daf..788d813 100644
--- a/recipes-bsp/u-boot/u-boot_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
@@ -1,23 +1,16 @@
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
 COMPATIBLE_MACHINE = "keystone"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PR = "r2+gitr${SRCPV}"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
 
-SRCREV = "DEV.MCSDK-03.00.00.07"
-
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
-
-S = "${WORKDIR}/git"
+# DEV.MCSDK-03.00.00.07
+SRCREV = "82f40e857d853165310d0753e79235aefb65d7ba"
 
 UBOOT_SUFFIX = "bin"
-- 
1.8.1.5


