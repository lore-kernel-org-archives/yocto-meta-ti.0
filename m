Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECBE8E01481
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:33:57 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV002CIQS1APP2@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 18:33:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E8EB1204EC; Mon,
	18 Mar 2013 19:33:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 19:32:15 -0400
Message-id: <1363649547-4693-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-1-git-send-email-denis@denix.org>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
Subject: [PATCH 07/19] u-boot-am180x: modify am180x specific version to use new namespace feature
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
 ...0evm-change-default-memory-to-not-limit-at-32MB.patch |  0
 ...12-psp03.21.00.04.sdk.bb => u-boot-am180x_2010.12.bb} | 16 ++++------------
 2 files changed, 4 insertions(+), 12 deletions(-)
 rename recipes-bsp/u-boot/{u-boot-2010.12-psp03.21.00.04.sdk => u-boot-am180x-2010.12}/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch (100%)
 rename recipes-bsp/u-boot/{u-boot_2010.12-psp03.21.00.04.sdk.bb => u-boot-am180x_2010.12.bb} (51%)

diff --git a/recipes-bsp/u-boot/u-boot-2010.12-psp03.21.00.04.sdk/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch b/recipes-bsp/u-boot/u-boot-am180x-2010.12/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2010.12-psp03.21.00.04.sdk/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
rename to recipes-bsp/u-boot/u-boot-am180x-2010.12/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
diff --git a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb b/recipes-bsp/u-boot/u-boot-am180x_2010.12.bb
similarity index 51%
rename from recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb
rename to recipes-bsp/u-boot/u-boot-am180x_2010.12.bb
index 7652521..1afc531 100644
--- a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb
+++ b/recipes-bsp/u-boot/u-boot-am180x_2010.12.bb
@@ -1,15 +1,9 @@
-# Use the version of u-boot.inc in oe-core not the meta-ti version
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+require u-boot-ti.inc
 
-DESCRIPTION = "u-boot bootloader for DaVinci devices"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
+DESCRIPTION = "u-boot bootloader for AM180x devices"
 
 COMPATIBLE_MACHINE = "am180x-evm"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PR = "r0"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git;branch=${BRANCH}"
@@ -21,9 +15,7 @@ SRC_URI_append_am180x-evm = " file://0001-da850evm-change-default-memory-to-not-
 
 BRANCH = "03.21.00.03"
 
-# Use literal tags in SRCREV, when available, instead of commit IDs
-SRCREV = "v2010.12_DAVINCIPSP_03.21.00.04"
-
-S = "${WORKDIR}/git"
+# v2010.12_DAVINCIPSP_03.21.00.04
+SRCREV = "1254a0b58d900b7035cfb36bf4e1b05dfbf09997"
 
 UBOOT_SUFFIX = "bin"
-- 
1.8.1.5


