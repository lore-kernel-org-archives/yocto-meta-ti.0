Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6BF1E008C3
	for <meta-ti@yoctoproject.org>; Mon, 24 Feb 2014 08:05:54 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1OG5rRY016084
	for <meta-ti@yoctoproject.org>; Mon, 24 Feb 2014 10:05:53 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1OG5rxr021606
	for <meta-ti@yoctoproject.org>; Mon, 24 Feb 2014 10:05:53 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 24 Feb 2014 10:05:52 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1OG5qJb000441;	Mon, 24 Feb 2014 10:05:52 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 24 Feb 2014 11:05:51 -0500
Message-ID: <1393257951-21767-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] linux-keystone: Update latest tag
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
X-List-Received-Date: Mon, 24 Feb 2014 16:05:56 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
changes from last patch
- Bumped PR
---
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
-- 
1.7.9.5


