Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94EB9E0147F
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:33:57 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV002AWQRWAPP2@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:33:37 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8F175201BB; Mon,
	18 Mar 2013 19:33:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:11 -0400
Message-id: <1363649547-4693-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 03/19] u-boot 2011.09-psp: remove an older no longer used version
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
X-List-Received-Date: Mon, 18 Mar 2013 23:33:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../u-boot/u-boot_2011.09-psp04.06.00.08.bb        | 29 ----------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb

diff --git a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
deleted file mode 100644
index 1bd4b9e..0000000
--- a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-# Use the version of u-boot.inc in oe-core not the meta-ti version
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
-
-DESCRIPTION = "u-boot bootloader for ARM MPU devices"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-COMPATIBLE_MACHINE = "ti33x|omap3"
-
-DEFAULT_PREFERENCE = "-1"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0+gitr${SRCPV}"
-
-SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
-
-BRANCH = "AM335XPSP_04.06.00.08"
-
-# Lock to the commit corresponding to TAG:
-# v2011.09_AM335xPSP_04.06.00.08
-SRCREV = "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
-
-S = "${WORKDIR}/git"
-
-UBOOT_SUFFIX = "img"
-
-# Set the name of the SPL that will built so that it is also packaged with u-boot.
-SPL_BINARY = "MLO"
-- 
1.8.1.5


