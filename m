Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E769E00566
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 15:13:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2F4AE52A1B; Wed,  5 Feb 2014 23:13:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140205231329.2F4AE52A1B@arago-project.org>
Date: Wed,  5 Feb 2014 23:13:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : linux-keystone: Update to linux kernel version 3.10
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
X-List-Received-Date: Wed, 05 Feb 2014 23:13:32 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 2bae56cfdc0f797f6a680a37280ae8cbbdd45e7a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2bae56cfdc0f797f6a680a37280ae8cbbdd45e7a

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Feb  5 17:52:07 2014 -0500

linux-keystone: Update to linux kernel version 3.10

- Updated Source URL & version
- Added device tree file
- Added LOADADDR extra args
- Added PV 3.10.10

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../defconfig                                      |    0
 ...ux-keystone_3.8.4.bb => linux-keystone_3.10.bb} |   26 +++++++++++--------
 2 files changed, 15 insertions(+), 11 deletions(-)

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


