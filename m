Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF791E0147F
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:33:57 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV008E2QS247B2@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:33:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C3D4920077; Mon,
	18 Mar 2013 19:33:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:18 -0400
Message-id: <1363649547-4693-11-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 10/19] u-boot 2011.12: modify multi-machine version for the new .inc file
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
 recipes-bsp/u-boot/u-boot_2011.12.bb | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 137f5b5..13cb537 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -1,15 +1,10 @@
-require u-boot.inc
+require u-boot-ti.inc
 
-# SPL build
-UBOOT_BINARY = "u-boot.img"
-UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
-UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
+SPL_BINARY = "MLO"
 
-PV = "2011.12"
 PR = "r8"
 
-# No patches for other machines yet
-COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
+COMPATIBLE_MACHINE = "(beagleboard|pandaboard|am3517-evm|am37x-evm|omap3evm)"
 
 # Non-omap4 platforms need outer cache turned on
 CACHEFIX = "file://2011.12/0008-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch"
@@ -36,12 +31,7 @@ SRC_URI = "git://git.denx.de/u-boot.git;protocol=git \
            ${FWENV} \
           "
 
-
 # v2011.12 tag
 SRCREV = "cba9a894fdb1cb49b60fcd1d1d6919cbd7995dd5"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-S = "${WORKDIR}/git"
-
 RRECOMMENDS_${PN}_beagleboard = "u-boot-fw-utils"
-- 
1.8.1.5


