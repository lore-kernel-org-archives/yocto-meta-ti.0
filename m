Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60417E01481
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 11:36:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E8CB952AA7; Tue, 26 Mar 2013 18:36:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326183618.E8CB952AA7@arago-project.org>
Date: Tue, 26 Mar 2013 18:36:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: Add panda dts file as supported DTS
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
X-List-Received-Date: Tue, 26 Mar 2013 18:36:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 233da46564f12849636ddac506b4aee36bc71646
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=233da46564f12849636ddac506b4aee36bc71646

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Mar 25 08:05:50 2013 -0500

linux-ti-staging: Add panda dts file as supported DTS

* Add the omap5-panda.dts file as a supported DTS to be built.
  This file is for use on the panda and uEVM boards.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap-a15.inc            |    2 +-
 recipes-kernel/linux/linux-ti-staging_git.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index fa2037a..702898f 100644
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
 


