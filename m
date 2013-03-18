Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DECAE01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:42:52 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV00MDBR7FVRY1@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:42:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8F1A521924; Mon,
	18 Mar 2013 19:33:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:21 -0400
Message-id: <1363649547-4693-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 13/19] u-boot: modify mainline version to use the new .inc file
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
X-List-Received-Date: Mon, 18 Mar 2013 23:42:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot_2013.01.01.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2013.01.01.bb b/recipes-bsp/u-boot/u-boot_2013.01.01.bb
index 4c460cc..e3da1f3 100644
--- a/recipes-bsp/u-boot/u-boot_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot_2013.01.01.bb
@@ -1,13 +1,9 @@
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+require u-boot-ti.inc
 
 DESCRIPTION = "Mainline u-boot bootloader"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
 DEFAULT_PREFERENCE = "-1"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PR = "r1"
 
 SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
@@ -16,7 +12,4 @@ BRANCH ?= "u-boot-2013.01.y"
 
 SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
 
-S = "${WORKDIR}/git"
-
-UBOOT_SUFFIX = "img"
 SPL_BINARY = "MLO"
-- 
1.8.1.5


