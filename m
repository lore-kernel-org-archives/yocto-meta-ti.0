Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C817AE006C6
	for <meta-ti@yoctoproject.org>; Tue, 18 Feb 2014 07:55:45 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1700GP687ZKJ00@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 18 Feb 2014 09:55:26 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 08D3F200AC; Tue,
	18 Feb 2014 10:55:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 18 Feb 2014 10:55:10 -0500
Message-id: <1392738910-13720-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-ti-staging: remove local patches that got merged to kernel tree
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
X-List-Received-Date: Tue, 18 Feb 2014 15:55:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.12.bb | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 2561e12..0b4815e 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,25 +36,13 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "9d5b470605a6e5df5c46444c2b2c108d21f9a24a"
+SRCREV = "d5e4bfd196e114c885c5c42cf0a7b3edc7e54829"
 PV = "3.12.10"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "
-
-# Performance fixes
-SRC_URI += "file://0001-ARM-config-omap-Sync-up-omap2plus-defconfig-with-sav.patch \
-            file://0002-ARM-config-omap-Make-advanced-networking-features-as.patch \
-            file://0003-ARM-config-omap-Disable-extra-debug-options.patch \
-            "
-# LCD resume fixes
-SRC_URI += "file://0001-ARM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch \
-            file://0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_ops.patch \
-            file://0003-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch \
-            file://0004-ARM-OMAP2-omap_hwmod-Maintain-legacy-context-loss-count.patch \
-            "
-- 
1.8.3.2


