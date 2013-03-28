Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8ECFE014BD
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 12:14:42 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKD00GPYXGI9YI1@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 28 Mar 2013 14:14:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EBD2B2004C; Thu,
	28 Mar 2013 15:14:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 28 Mar 2013 15:14:35 -0400
Message-id: <1364498075-1118-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCHv2] linux-ti-staging: rename to have version in name, update to latest
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
X-List-Received-Date: Thu, 28 Mar 2013 19:14:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Update to the latest kernel sources.  This also requires changing
  the dtb file names since the omap5 devices have changed to use
  uevm instead of panda and sevm instead of evm.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
v2 - merge Chase's changes to dtb files

 .../linux/{linux-ti-staging_git.bb => linux-ti-staging_3.8.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-kernel/linux/{linux-ti-staging_git.bb => linux-ti-staging_3.8.bb} (91%)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
similarity index 91%
rename from recipes-kernel/linux/linux-ti-staging_git.bb
rename to recipes-kernel/linux/linux-ti-staging_3.8.bb
index 081a0e6..3353792 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -32,7 +32,7 @@ DEPENDS_ti33x += "am33x-cm3"
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
-KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-evm.dts arch/arm/boot/dts/omap5-panda.dts"
+KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts arch/arm/boot/dts/omap5-uevm.dts"
 
 COMPATIBLE_MACHINE = "ti33x|omap-a15"
 
@@ -40,11 +40,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.8.y"
 
-SRCREV = "a91f8e121dbe0b5fb84000d9ae14fac8880c44a7"
+SRCREV = "a0a13c3cf6ff2ca9bf1b1c9163ba04c3c71811bd"
 PV = "3.8.4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
-- 
1.8.1.5


