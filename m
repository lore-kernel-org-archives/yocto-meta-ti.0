Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2160E00953; Thu, 19 Mar 2015 14:30:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E962E00832
	for <meta-ti@yoctoproject.org>; Thu, 19 Mar 2015 14:30:39 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D9ABB529F8; Thu, 19 Mar 2015 21:30:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150319213038.D9ABB529F8@arago-project.org>
Date: Thu, 19 Mar 2015 21:30:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : linux-keystone: update to new kernel version 3.10.61
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
X-List-Received-Date: Thu, 19 Mar 2015 21:30:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 6c23743f0fb18284b622288c2d39e5c74495ff9f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6c23743f0fb18284b622288c2d39e5c74495ff9f

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Mar 20 02:26:01 2015 +0000

linux-keystone: update to new kernel version 3.10.61

- Branch names changed to release version specific branch

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-keystone-rt_3.10.bb |   10 +++++-----
 recipes-kernel/linux/linux-keystone_3.10.bb    |   10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index 860d421..5560ad2 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -10,7 +10,7 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
@@ -19,11 +19,11 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_RT_LINUX_03.10.10_14.09_01"
-SRCREV = "2b53a7b58e95c2cf3426fe95203e7fc082bc56e9"
-PV = "3.10.10"
+#This commit corresponds to "K2_RT_LINUX_03.10.61_15.02"
+SRCREV = "e2e31a1d996d2ed8dd06dab1221e159033432b72"
+PV = "3.10.61"
 
-BRANCH = "master-rt"
+BRANCH = "v3.10.61/master-rt"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
            file://defconfig\
            "
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index 4475632..005aff4 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -10,7 +10,7 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
@@ -19,11 +19,11 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_LINUX_03.10.10_14.09_01"
-SRCREV = "a59abdfadb821f27cc43b16d3f641960ba143746"
-PV = "3.10.10"
+#This commit corresponds to "K2_LINUX_03.10.61_15.02"
+SRCREV = "a17b4c3fd6c93f908daf032786f90c0321296957"
+PV = "3.10.61"
 
-BRANCH = "master"
+BRANCH = "v3.10.61/master"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
            file://defconfig\
            "


