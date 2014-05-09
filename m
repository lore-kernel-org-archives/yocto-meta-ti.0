Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 238C5E00B68; Thu,  8 May 2014 21:56:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RCVD_IN_DNSWL_NONE,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 3603 seconds by postgrey-1.32 at yocto-www;
	Thu, 08 May 2014 21:56:22 PDT
Received: from vms173021pub.verizon.net (unknown [206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D075FE00B62
	for <meta-ti@yoctoproject.org>; Thu,  8 May 2014 21:56:22 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N5A00551G9F2BA0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 08 May 2014 22:56:09 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9AF1F20363; Thu,
	08 May 2014 23:56:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 08 May 2014 23:55:45 -0400
Message-id: <1399607745-24450-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1399607745-24450-1-git-send-email-denis@denix.org>
References: <1399607745-24450-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] linux-keystone: update to the latest tag 03.10.10_14.03_03
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
X-List-Received-Date: Fri, 09 May 2014 04:56:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-keystone-rt_3.10.bb | 7 +++----
 recipes-kernel/linux/linux-keystone_3.10.bb    | 7 +++----
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
-- 
1.9.2


