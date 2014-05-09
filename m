Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7570FE0073D; Fri,  9 May 2014 11:06:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27DFDE009C1
	for <meta-ti@yoctoproject.org>; Fri,  9 May 2014 11:06:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C958052AB2; Fri,  9 May 2014 17:57:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140509175752.C958052AB2@arago-project.org>
Date: Fri,  9 May 2014 17:57:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-keystone: update to the latest tag 03.10.10_14. 03_03
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
X-List-Received-Date: Fri, 09 May 2014 18:06:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 990d8f62257029e25fc2b8786155bcf5dc483659
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=990d8f62257029e25fc2b8786155bcf5dc483659

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri May  9 09:55:45 2014 +0000

linux-keystone: update to the latest tag 03.10.10_14.03_03

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    7 +++----
 recipes-kernel/linux/linux-keystone_3.10.bb    |    7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index 65625f3..cbd02d6 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -10,15 +10,15 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_RT_LINUX_03.10.10_14.02"
-SRCREV = "c78aa253ac385faae8b6c845a388e215395a8010"
+# This commit corresponds to "K2_RT_LINUX_03.10.10_14.03_03"
+SRCREV = "6b482abe6a18d004230ca54da866f4627f02125b"
 PV = "3.10.10"
 
 BRANCH = "master-rt"
@@ -29,4 +29,3 @@ SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANC
 S = "${WORKDIR}/git"
 
 RDEPENDS_kernel-base = ""
-
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index d97520a..54cb86a 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -10,15 +10,15 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_LINUX_03.10.10_14.02"
-SRCREV = "93515476b357304e6fc075c004a1cfa91a0751d0"
+# This commit corresponds to "K2_LINUX_03.10.10_14.03_03"
+SRCREV = "07176920ed86dfdae97d272f574c3e2760d687ef"
 PV = "3.10.10"
 
 BRANCH = "master"
@@ -29,4 +29,3 @@ SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANC
 S = "${WORKDIR}/git"
 
 RDEPENDS_kernel-base = ""
-


