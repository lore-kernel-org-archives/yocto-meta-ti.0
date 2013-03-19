Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C271BE01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 18:35:12 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJV00954WDRABY1@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Mar 2013 20:34:54 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 77DF8200DD; Mon,
	18 Mar 2013 21:34:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Mar 2013 21:34:31 -0400
Message-id: <1363656871-8839-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1363649547-4693-8-git-send-email-denis@denix.org>
References: <1363649547-4693-8-git-send-email-denis@denix.org>
Subject: [PATCH 07v2/19] u-boot-am180x: modify am180x specific version to use new namespace feature
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
X-List-Received-Date: Tue, 19 Mar 2013 01:35:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - don't remove LIC_FILES_CHKSUM, as old version had different md5 hash

 ...50evm-change-default-memory-to-not-limit-at-32MB.patch |  0
 ....12-psp03.21.00.04.sdk.bb => u-boot-am180x_2010.12.bb} | 15 ++++-----------
 2 files changed, 4 insertions(+), 11 deletions(-)
 rename recipes-bsp/u-boot/{u-boot-2010.12-psp03.21.00.04.sdk => u-boot-am180x-2010.12}/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch (100%)
 rename recipes-bsp/u-boot/{u-boot_2010.12-psp03.21.00.04.sdk.bb => u-boot-am180x_2010.12.bb} (59%)

diff --git a/recipes-bsp/u-boot/u-boot-2010.12-psp03.21.00.04.sdk/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch b/recipes-bsp/u-boot/u-boot-am180x-2010.12/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2010.12-psp03.21.00.04.sdk/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
rename to recipes-bsp/u-boot/u-boot-am180x-2010.12/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
diff --git a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb b/recipes-bsp/u-boot/u-boot-am180x_2010.12.bb
similarity index 59%
rename from recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb
rename to recipes-bsp/u-boot/u-boot-am180x_2010.12.bb
index 7652521..b2852c4 100644
--- a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb
+++ b/recipes-bsp/u-boot/u-boot-am180x_2010.12.bb
@@ -1,15 +1,10 @@
-# Use the version of u-boot.inc in oe-core not the meta-ti version
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+require u-boot-ti.inc
 
-DESCRIPTION = "u-boot bootloader for DaVinci devices"
-
-LICENSE = "GPLv2+"
+DESCRIPTION = "u-boot bootloader for AM180x devices"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
 
 COMPATIBLE_MACHINE = "am180x-evm"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PR = "r0"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git;branch=${BRANCH}"
@@ -21,9 +16,7 @@ SRC_URI_append_am180x-evm = " file://0001-da850evm-change-default-memory-to-not-
 
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


