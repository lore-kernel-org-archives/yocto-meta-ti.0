Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B5C0E0147E
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:33:55 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV00926QS1SF61@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:33:43 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 874C9205B6; Mon,
	18 Mar 2013 19:33:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:16 -0400
Message-id: <1363649547-4693-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 08/19] u-boot-beagleboard: modify beagleboard specific version to use new namespace feature
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
X-List-Received-Date: Mon, 18 Mar 2013 23:33:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{u-boot_2011.09.bb => u-boot-beagleboard_2011.09.bb}      | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)
 rename recipes-bsp/u-boot/{u-boot_2011.09.bb => u-boot-beagleboard_2011.09.bb} (89%)

diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-bsp/u-boot/u-boot-beagleboard_2011.09.bb
similarity index 89%
rename from recipes-bsp/u-boot/u-boot_2011.09.bb
rename to recipes-bsp/u-boot/u-boot-beagleboard_2011.09.bb
index edacb6c..519df16 100644
--- a/recipes-bsp/u-boot/u-boot_2011.09.bb
+++ b/recipes-bsp/u-boot/u-boot-beagleboard_2011.09.bb
@@ -1,11 +1,8 @@
-require u-boot.inc
+require u-boot-ti.inc
 
 PR = "r7"
 
-# SPL build
-UBOOT_BINARY = "u-boot.img"
-UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
-UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
+SPL_BINARY = "MLO"
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard)"
@@ -37,7 +34,3 @@ SRC_URI = "git://git.denx.de/u-boot.git;protocol=git \
           "
 
 SRCREV = "fdbe8b9a2d1858ba35dd6214315563ad44d4a0e3"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-S = "${WORKDIR}/git"
-- 
1.8.1.5


