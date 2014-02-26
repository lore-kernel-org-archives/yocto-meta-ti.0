Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19487E00946
	for <meta-ti@yoctoproject.org>; Wed, 26 Feb 2014 13:47:36 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C155452A69; Wed, 26 Feb 2014 21:47:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140226214735.C155452A69@arago-project.org>
Date: Wed, 26 Feb 2014 21:47:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : linux-keystone: Update latest tag
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
X-List-Received-Date: Wed, 26 Feb 2014 21:47:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fcecf575282a4926179f9131521b369751aae394
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fcecf575282a4926179f9131521b369751aae394

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon Feb 24 22:05:51 2014 +0000

linux-keystone: Update latest tag

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    6 +++---
 recipes-kernel/linux/linux-keystone_3.10.bb    |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index 9c2f904..65625f3 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -10,15 +10,15 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_RT_LINUX_03.10.10_13.12"
-SRCREV = "8fa9091d0f9c91a048a975ddebbf2f492e73bf61"
+#This commit corresponds to "K2_RT_LINUX_03.10.10_14.02"
+SRCREV = "c78aa253ac385faae8b6c845a388e215395a8010"
 PV = "3.10.10"
 
 BRANCH = "master-rt"
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index 2384ede..d97520a 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -10,15 +10,15 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_LINUX_03.10.10_13.12"
-SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
+#This commit corresponds to "K2_LINUX_03.10.10_14.02"
+SRCREV = "93515476b357304e6fc075c004a1cfa91a0751d0"
 PV = "3.10.10"
 
 BRANCH = "master"


