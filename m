Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCF54E007E6
	for <meta-ti@yoctoproject.org>; Fri, 14 Feb 2014 14:30:15 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1000FA1BUDF5P0@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 14 Feb 2014 16:30:13 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5ED0D201BF; Fri,
	14 Feb 2014 17:30:13 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 14 Feb 2014 17:30:12 -0500
Message-id: <1392417012-24492-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-ti-staging: update with QSPI partition fixes and properly list LCD patches
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
X-List-Received-Date: Fri, 14 Feb 2014 22:30:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.12.bb |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 29d1a4f..220495a 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,11 +36,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "c883f50c5bbf1bf5bfaeb550991caf5fc77a1c4d"
+SRCREV = "9d5b470605a6e5df5c46444c2b2c108d21f9a24a"
 PV = "3.12.10"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
@@ -57,8 +57,8 @@ SRC_URI_append_ti33x = "file://0004-Not-for-merge-ARM-config-omap-Disable-SMP-fo
 SRC_URI_append_ti43x = "file://0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
 
 # LCD resume fixes
-SRC_URI += "0001-ARM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch \
-            0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_ops.patch \
-            0003-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch \
-            0004-ARM-OMAP2-omap_hwmod-Maintain-legacy-context-loss-count.patch \
+SRC_URI += "file://0001-ARM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch \
+            file://0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_ops.patch \
+            file://0003-ARM-OMAP2-am43xx-Add-context-offset-for-dss-hwmod.patch \
+            file://0004-ARM-OMAP2-omap_hwmod-Maintain-legacy-context-loss-count.patch \
             "
-- 
1.7.9.5


