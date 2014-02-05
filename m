Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 666D0E007A1
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 14:52:14 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15MqDrR010322
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 16:52:13 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15MqDd6013435
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 16:52:13 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 16:52:13 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s15MqDqx001729;	Wed, 5 Feb 2014 16:52:13 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 5 Feb 2014 17:52:07 -0500
Message-ID: <1391640727-29458-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v4] linux-keystone: Update to linux kernel version 3.10
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
X-List-Received-Date: Wed, 05 Feb 2014 22:52:15 -0000
Content-Type: text/plain

- Updated Source URL & version
- Added device tree file
- Added LOADADDR extra args
- Added PV 3.10.10

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from last revision of patch
- Added PV 3.10.10
- Renamed linux-keystone-3.8.4/defconfig
  -->linux-keystone/defconfig
---
---
 .../defconfig                                      |    0
 ...ux-keystone_3.8.4.bb => linux-keystone_3.10.bb} |   26 +++++++++++---------
 2 files changed, 15 insertions(+), 11 deletions(-)
 rename recipes-kernel/linux/{linux-keystone-3.8.4 => linux-keystone}/defconfig (100%)
 rename recipes-kernel/linux/{linux-keystone_3.8.4.bb => linux-keystone_3.10.bb} (59%)

diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/defconfig b/recipes-kernel/linux/linux-keystone/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-keystone-3.8.4/defconfig
rename to recipes-kernel/linux/linux-keystone/defconfig
diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
similarity index 59%
rename from recipes-kernel/linux/linux-keystone_3.8.4.bb
rename to recipes-kernel/linux/linux-keystone_3.10.bb
index d176f14..2384ede 100644
--- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -3,26 +3,30 @@ DESCRIPTION = "Linux kernel for TI Keystone devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
+COMPATIBLE_MACHINE = "keystone"
+
 inherit kernel
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
 KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
 
-COMPATIBLE_MACHINE = "keystone"
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-S = "${WORKDIR}/git"
+#This commit corresponds to "K2_LINUX_03.10.10_13.12"
+SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
+PV = "3.10.10"
 
-BRANCH = "sept-2013/master"
+BRANCH = "master"
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


