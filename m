Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6F79E004D9
	for <meta-ti@yoctoproject.org>; Thu, 30 Jan 2014 21:23:20 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0V5NITx011199
	for <meta-ti@yoctoproject.org>; Thu, 30 Jan 2014 23:23:19 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0V5NIY6010071
	for <meta-ti@yoctoproject.org>; Thu, 30 Jan 2014 23:23:18 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 23:23:18 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0V5NIYf002095;	Thu, 30 Jan 2014 23:23:18 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 31 Jan 2014 00:23:09 -0500
Message-ID: <1391145789-9460-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] linux-keystone: Create recipe for linux-keystone kernel version 3.10
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
X-List-Received-Date: Fri, 31 Jan 2014 05:23:25 -0000
Content-Type: text/plain

- Updated Source URL & version
- Added device tree file

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

-----
Changes from last patch
Renamed recipe from 3.10--> 3.10.10
Removed directory path from dtb file
Removed do_deploy_append
----
---
 .../defconfig                                      |    0
 ...keystone_3.8.4.bb => linux-keystone_3.10.10.bb} |   25 +++++++++++---------
 2 files changed, 14 insertions(+), 11 deletions(-)
 rename recipes-kernel/linux/{linux-keystone-3.8.4 => linux-keystone-3.10.10}/defconfig (100%)
 rename recipes-kernel/linux/{linux-keystone_3.8.4.bb => linux-keystone_3.10.10.bb} (50%)

diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/defconfig b/recipes-kernel/linux/linux-keystone-3.10.10/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-keystone-3.8.4/defconfig
rename to recipes-kernel/linux/linux-keystone-3.10.10/defconfig
diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb b/recipes-kernel/linux/linux-keystone_3.10.10.bb
similarity index 50%
rename from recipes-kernel/linux/linux-keystone_3.8.4.bb
rename to recipes-kernel/linux/linux-keystone_3.10.10.bb
index d176f14..a5c113e 100644
--- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.10.bb
@@ -3,26 +3,29 @@ DESCRIPTION = "Linux kernel for TI Keystone devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
+COMPATIBLE_MACHINE = "keystone"
+
 inherit kernel
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
+MACHINE_KERNEL_PR_append = "a"
+
+CORTEXA8FIXUP = "no"
+
 KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
 
-COMPATIBLE_MACHINE = "keystone"
+#This commit corresponds to "K2_LINUX_03.10.10_13.12"
+SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
 
-S = "${WORKDIR}/git"
+BRANCH = "master"
 
-BRANCH = "sept-2013/master"
+SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
+           file://defconfig\
+           "
 
-# This commit corresponds to K2_LINUX_03.08.04_13.09 tag
-SRCREV = "20a48dc5309c4434650baef2b6072b5f1016f946"
+S = "${WORKDIR}/git"
 
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
-PR = "${MACHINE_KERNEL_PR}"
+RDEPENDS_kernel-base = ""
 
-SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=${BRANCH}\
-           file://defconfig\
-          "
-- 
1.7.9.5


