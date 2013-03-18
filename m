Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F211E0147A
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:43:02 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV007EQR7F1PJ1@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:42:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 25A39212BD; Mon,
	18 Mar 2013 19:33:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:17 -0400
Message-id: <1363649547-4693-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 09/19] u-boot-am33x: modify am33x specific version to use new namespace feature
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
X-List-Received-Date: Mon, 18 Mar 2013 23:43:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{u-boot_2011.10rc.bb => u-boot-am33x_2011.10rc.bb}       | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)
 rename recipes-bsp/u-boot/{u-boot_2011.10rc.bb => u-boot-am33x_2011.10rc.bb} (82%)

diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot-am33x_2011.10rc.bb
similarity index 82%
rename from recipes-bsp/u-boot/u-boot_2011.10rc.bb
rename to recipes-bsp/u-boot/u-boot-am33x_2011.10rc.bb
index 2cb8271..d1a8236 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot-am33x_2011.10rc.bb
@@ -1,4 +1,4 @@
-require u-boot.inc
+require u-boot-ti.inc
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(ti33x)"
@@ -8,10 +8,7 @@ DEFAULT_PREFERENCE_ti33x = "99"
 PV = "2011.09+git"
 PR = "r30"
 
-# SPL build
-UBOOT_BINARY = "u-boot.img"
-UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
-UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
+SPL_BINARY = "MLO"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=master \
            file://2011.09git/0001-am335x_evm-add-option-to-boot-kernel-from-boot-in-ex.patch \
@@ -28,8 +25,3 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
           "
 
 SRCREV = "dc52533ccff00a12761f793d66b39e4f6a4a3bba"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-S = "${WORKDIR}/git"
-
-- 
1.8.1.5


