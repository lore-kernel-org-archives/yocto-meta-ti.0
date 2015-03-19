Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55400E00832; Thu, 19 Mar 2015 13:26:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15741E00777
	for <meta-ti@yoctoproject.org>; Thu, 19 Mar 2015 13:26:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2JKQ4bF018190
	for <meta-ti@yoctoproject.org>; Thu, 19 Mar 2015 15:26:04 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2JKQ3l6003352
	for <meta-ti@yoctoproject.org>; Thu, 19 Mar 2015 15:26:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Mar 2015 15:26:03 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2JKQ2ro031310;	Thu, 19 Mar 2015 15:26:03 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Mar 2015 16:26:01 -0400
Message-ID: <1426796761-10458-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] linux-keystone: update to new kernel version 3.10.61
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
X-List-Received-Date: Thu, 19 Mar 2015 20:26:07 -0000
Content-Type: text/plain

- Branch names changed to release version specific branch

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
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
-- 
1.7.9.5


