Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D114E00803; Thu, 21 Jan 2016 22:00:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19A4BE007B5
	for <meta-ti@yoctoproject.org>; Thu, 21 Jan 2016 22:00:06 -0800 (PST)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1C00DV7BBQW3X0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 21 Jan 2016 23:59:50 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8
	a=7ZLZ53t_Ttnnc-6ogVAA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 337A3161DFD;	Fri,
	22 Jan 2016 00:59:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 22 Jan 2016 00:59:49 -0500
Message-id: <1453442389-22704-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] linux-ti-staging: update to the latest, use RT defconfig for Keystone
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
X-List-Received-Date: Fri, 22 Jan 2016 06:00:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest          | 1 -
 recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest | 1 -
 recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig       | 2 +-
 recipes-kernel/linux/linux-ti-staging-rt_4.1.bb                       | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.1.bb                          | 4 ++--
 5 files changed, 4 insertions(+), 6 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest

diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest b/recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest
deleted file mode 100644
index 28b995e..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.1/configs/systest
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/rt_system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest b/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest
deleted file mode 100644
index 68cfc25..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/configs/systest
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/multi_core_system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig
index 470cf11..6d28753 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig
@@ -1 +1 @@
-use-combined-config=ti_config_fragments/multi_core_defconfig_fragment
+use-combined-config=ti_config_fragments/rt_multi_core_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
index ae958de..7577669 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
 
 BRANCH = "ti-rt-linux-4.1.y"
 
-SRCREV = "e1438117e08a772a560d4f4226c889d5fe48e4fd"
+SRCREV = "715422100565b5362c11ffa446b330ff86e8849c"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index e02e5cd..742c55c 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -59,11 +59,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "e1438117e08a772a560d4f4226c889d5fe48e4fd"
+SRCREV = "b7b07f10f6eada41d3903b1b1dc854659aac3ae6"
 PV = "4.1.15+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "e"
+MACHINE_KERNEL_PR_append = "f"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-- 
2.2.0


