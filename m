Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF2F1E00BC1; Fri, 20 Jun 2014 14:11:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86796E00B7B
	for <meta-ti@yoctoproject.org>; Fri, 20 Jun 2014 14:11:53 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H00515K7DQN10@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 20 Jun 2014 16:11:37 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 34C68200BD; Fri,
	20 Jun 2014 17:11:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Jun 2014 17:11:28 -0400
Message-id: <1403298689-22444-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 1/2] linux-ti-staging: update to latest 3.14 stable, as being LTS
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
X-List-Received-Date: Fri, 20 Jun 2014 21:11:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../defconfig                                                |  0
 .../{linux-ti-staging-3.15 => linux-ti-staging-3.14}/ipc.cfg |  0
 .../non-smp.cfg                                              |  0
 .../systest.cfg                                              |  0
 .../{linux-ti-staging_3.15.bb => linux-ti-staging_3.14.bb}   | 12 +++++-------
 5 files changed, 5 insertions(+), 7 deletions(-)
 rename recipes-kernel/linux/{linux-ti-staging-3.15 => linux-ti-staging-3.14}/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging-3.15 => linux-ti-staging-3.14}/ipc.cfg (100%)
 rename recipes-kernel/linux/{linux-ti-staging-3.15 => linux-ti-staging-3.14}/non-smp.cfg (100%)
 rename recipes-kernel/linux/{linux-ti-staging-3.15 => linux-ti-staging-3.14}/systest.cfg (100%)
 rename recipes-kernel/linux/{linux-ti-staging_3.15.bb => linux-ti-staging_3.14.bb} (89%)

diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/defconfig b/recipes-kernel/linux/linux-ti-staging-3.14/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-3.15/defconfig
rename to recipes-kernel/linux/linux-ti-staging-3.14/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg b/recipes-kernel/linux/linux-ti-staging-3.14/ipc.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.14/ipc.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg b/recipes-kernel/linux/linux-ti-staging-3.14/non-smp.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.14/non-smp.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg b/recipes-kernel/linux/linux-ti-staging-3.14/systest.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.14/systest.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging_3.15.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
similarity index 89%
rename from recipes-kernel/linux/linux-ti-staging_3.15.bb
rename to recipes-kernel/linux/linux-ti-staging_3.14.bb
index 64db8da..a3045b2 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.15.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -3,15 +3,13 @@ DESCRIPTION = "Linux kernel for TI devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-DEFAULT_PREFERENCE = "-1"
-
 inherit kernel
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.15:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:"
 
 # Pull in the devicetree files into the rootfs
 RDEPENDS_kernel-base += "kernel-devicetree"
@@ -39,13 +37,13 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "ti-linux-3.15.y"
+BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "3fd9aad17d3b4d1d7ee50ae788c0a096921e7216"
-PV = "3.14+3.15-rc6"
+SRCREV = "9d00dd1187099b0841125220c7432a3507e5b5fa"
+PV = "3.14.8"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "ti_config_fragments"
-- 
2.0.0


