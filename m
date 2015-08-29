Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F52CE00C93; Fri, 28 Aug 2015 17:42:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 644F5E00C90
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 17:41:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1DEB552A65; Sat, 29 Aug 2015 00:41:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150829004158.1DEB552A65@arago-project.org>
Date: Sat, 29 Aug 2015 00:41:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : linux-keystone: update to new version 3.10.72_15.08
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
X-List-Received-Date: Sat, 29 Aug 2015 00:42:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 2ba7261d0abb173b818b176da133ccf53db804e9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2ba7261d0abb173b818b176da133ccf53db804e9

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Aug 25 19:23:38 2015 +0000

linux-keystone: update to new version 3.10.72_15.08

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    6 +++---
 recipes-kernel/linux/linux-keystone_3.10.bb    |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index 51e18d3..b914c52 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -10,7 +10,7 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-MACHINE_KERNEL_PR_append = "d"
+MACHINE_KERNEL_PR_append = "e"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
@@ -19,8 +19,8 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_RT_LINUX_03.10.72_15.##"
-SRCREV = "d607d75a2de99b3723cf9a2ba56f839debbee3c8"
+#This commit corresponds to "K2_RT_LINUX_03.10.72_15.08"
+SRCREV = "dfe5ac2e9d7dba93fad48ca761933503dbdecae2"
 PV = "3.10.72+git${SRCPV}"
 
 BRANCH = "v3.10.72/master-rt"
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index 01573ca..85eecb6 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -10,7 +10,7 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-MACHINE_KERNEL_PR_append = "d"
+MACHINE_KERNEL_PR_append = "e"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
@@ -19,8 +19,8 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_LINUX_03.10.72_15.##"
-SRCREV = "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
+#This commit corresponds to "K2_LINUX_03.10.72_15.08"
+SRCREV = "ca334dedb5c234b1602d991d9b330360a5bc97ad"
 PV = "3.10.72+git${SRCPV}"
 
 BRANCH = "v3.10.72/master"


