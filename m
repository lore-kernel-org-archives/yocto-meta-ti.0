Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56089E014D4
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 06:05:59 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2PD5vxS016511
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 08:05:58 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2PD5u6M026987
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 18:35:56 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 25 Mar 2013 18:35:55 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2PD5r4K030926;
	Mon, 25 Mar 2013 18:35:54 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 25 Mar 2013 08:05:50 -0500
Message-ID: <1364216750-29038-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] linux-ti-staging: Add panda dts file as supported DTS
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
X-List-Received-Date: Mon, 25 Mar 2013 13:05:59 -0000
Content-Type: text/plain

* Add the omap5-panda.dts file as a supported DTS to be built.
  This file is for use on the panda and uEVM boards.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/include/omap-a15.inc            |    2 +-
 recipes-kernel/linux/linux-ti-staging_git.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 3ea1a05..585900d 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa15.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r0"
+MACHINE_KERNEL_PR = "r1"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 3dc2001..081a0e6 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -32,7 +32,7 @@ DEPENDS_ti33x += "am33x-cm3"
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
-KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-evm.dts"
+KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-evm.dts arch/arm/boot/dts/omap5-panda.dts"
 
 COMPATIBLE_MACHINE = "ti33x|omap-a15"
 
-- 
1.7.0.4


