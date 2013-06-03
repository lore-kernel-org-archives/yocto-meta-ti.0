Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77A22E014E1
	for <meta-ti@yoctoproject.org>; Mon,  3 Jun 2013 15:06:12 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r53M6B3E023742
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 17:06:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r53M6Bsq008391
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 17:06:11 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 3 Jun 2013 17:06:11 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id r53M682H020489;
	Mon, 3 Jun 2013 17:06:09 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 3 Jun 2013 17:11:45 -0500
Message-ID: <1370297506-25495-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] linux-ti-staging: Add dra7xx-evm support
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
X-List-Received-Date: Mon, 03 Jun 2013 22:06:12 -0000
Content-Type: text/plain

* Add the DTB entries for the dra7xx-evm machine type
* Update to the latest git sources which have dra7xx-evm support.
* Update the PV to match the latest source version

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.8.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 4b93932..f62cbe2 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -18,6 +18,7 @@ RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
 KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts arch/arm/boot/dts/omap5-uevm.dts"
+KERNEL_DEVICETREE_dra7xx-evm = "arch/arm/boot/dts/dra7-evm.dts"
 
 COMPATIBLE_MACHINE = "ti33x|omap-a15"
 
@@ -26,8 +27,8 @@ S = "${WORKDIR}/git"
 BRANCH = "ti-linux-3.8.y"
 
 # This commit corresponds to ti2013.04.00 release tag
-SRCREV = "23e7f725a6af4ca44660c06bc3569f6ce705d1d0"
-PV = "3.8.8"
+SRCREV = "54d80897fd69e30702f3b6f115d77d37ad78f9ef"
+PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
-- 
1.7.0.4


