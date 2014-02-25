Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AA9BE0080A
	for <meta-ti@yoctoproject.org>; Mon, 24 Feb 2014 16:25:05 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1I0059FZSOIG30@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 24 Feb 2014 18:24:40 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8960D20092; Mon,
	24 Feb 2014 19:24:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 24 Feb 2014 19:24:24 -0500
Message-id: <1393287864-828-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-ti-staging: ARM_SCU patch got merged, add PREEMPT_VOLUNTARY patch, reshuffle
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
X-List-Received-Date: Tue, 25 Feb 2014 00:25:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...02-ARM-config-Add-HAVE_ARM_SCU-for-AM43XX.patch | 37 ----------------------
 ...onfig-omap-Change-PREEMPTion-to-voluntary.patch | 33 +++++++++++++++++++
 ...e-ARM-config-omap-Disable-SMP-for-AM335x.patch} | 16 ++++++----
 recipes-kernel/linux/linux-ti-staging_3.12.bb      | 10 +++---
 4 files changed, 47 insertions(+), 49 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging/0002-ARM-config-Add-HAVE_ARM_SCU-for-AM43XX.patch
 create mode 100644 recipes-kernel/linux/linux-ti-staging/0004-ARM-config-omap-Change-PREEMPTion-to-voluntary.patch
 rename recipes-kernel/linux/linux-ti-staging/{0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch => 0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch} (78%)

diff --git a/recipes-kernel/linux/linux-ti-staging/0002-ARM-config-Add-HAVE_ARM_SCU-for-AM43XX.patch b/recipes-kernel/linux/linux-ti-staging/0002-ARM-config-Add-HAVE_ARM_SCU-for-AM43XX.patch
deleted file mode 100644
index 8137bb3..0000000
--- a/recipes-kernel/linux/linux-ti-staging/0002-ARM-config-Add-HAVE_ARM_SCU-for-AM43XX.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5b2aa64ccdeef659a9688730753199ba5b8e60b1 Mon Sep 17 00:00:00 2001
-From: Dave Gerlach <d-gerlach@ti.com>
-Date: Fri, 21 Feb 2014 10:25:33 +0000
-Subject: [PATCH 2/4] ARM: config: Add HAVE_ARM_SCU for AM43XX
-
-CONFIG_HAVE_ARM_SCU only gets selected if CONFIG_SMP is selected in an OMAP
-system however AM43XX needs this option regardless of CONFIG_SMP as it is
-important for controlling power in the SoC. Without this suspend will
-not work as scu_power_mode becomes an empty function.
-
-AM43XX requires SCU CPU Power Status bits for A9 core to be set to off mode
-in order for the MSTANDBY signal to be asserted from the MPU during WFI.
-This signal is used by the PRCM to determine when it is appropriate to
-clock gate the MPU clock domain and also trigger M3_IRQ2 to tell the wkup_m3
-firmware to put the part into the desired sleep more.
-
-Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
-Tested-by: Sekhar Nori <nsekhar@ti.com>
----
- arch/arm/mach-omap2/Kconfig |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
-index 959f6fc..373d576 100644
---- a/arch/arm/mach-omap2/Kconfig
-+++ b/arch/arm/mach-omap2/Kconfig
-@@ -85,6 +85,7 @@ config SOC_AM43XX
- 	depends on ARCH_MULTI_V7
- 	select CPU_V7
- 	select ARCH_OMAP2PLUS
-+	select HAVE_ARM_SCU
- 	select MULTI_IRQ_HANDLER
- 	select ARM_GIC
- 	select COMMON_CLK
--- 
-1.7.0.4
-
diff --git a/recipes-kernel/linux/linux-ti-staging/0004-ARM-config-omap-Change-PREEMPTion-to-voluntary.patch b/recipes-kernel/linux/linux-ti-staging/0004-ARM-config-omap-Change-PREEMPTion-to-voluntary.patch
new file mode 100644
index 0000000..469a0c7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/0004-ARM-config-omap-Change-PREEMPTion-to-voluntary.patch
@@ -0,0 +1,33 @@
+From 54821ed9f986a0023bbc3fa08060e1f2c8efb6b5 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Mon, 24 Feb 2014 13:16:20 -0600
+Subject: [PATCH 1/2] ARM: config: omap: Change PREEMPTion to voluntary
+
+* Change the default PREEMPT mode to voluntary which reduces the
+  overhead and increases performance for many use cases such as
+  UDP networking and cryptography.
+* Based on recommendations from Joel Fernandes <joelf@ti.com>
+
+Signed-off-by: Joel Fernandes <joelf@ti.com>
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ arch/arm/configs/omap2plus_defconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
+index 3975b08..a34b45a 100644
+--- a/arch/arm/configs/omap2plus_defconfig
++++ b/arch/arm/configs/omap2plus_defconfig
+@@ -38,7 +38,7 @@ CONFIG_ARM_ERRATA_411920=y
+ CONFIG_PCIE_DRA7XX=y
+ CONFIG_SMP=y
+ CONFIG_NR_CPUS=2
+-CONFIG_PREEMPT=y
++CONFIG_PREEMPT_VOLUNTARY=y
+ CONFIG_CMA=y
+ CONFIG_ZBOOT_ROM_TEXT=0x0
+ CONFIG_ZBOOT_ROM_BSS=0x0
+-- 
+1.8.3.2
+
diff --git a/recipes-kernel/linux/linux-ti-staging/0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch b/recipes-kernel/linux/linux-ti-staging/0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
similarity index 78%
rename from recipes-kernel/linux/linux-ti-staging/0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
rename to recipes-kernel/linux/linux-ti-staging/0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
index b01c4d0..8e016b4 100644
--- a/recipes-kernel/linux/linux-ti-staging/0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
+++ b/recipes-kernel/linux/linux-ti-staging/0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
@@ -1,7 +1,8 @@
-From 89783143b64210e8f159fd875b23aa9af1fd51b0 Mon Sep 17 00:00:00 2001
+From 2f6cbe000b1d31c91eee0248f24b0c306aadeb63 Mon Sep 17 00:00:00 2001
 From: Santosh Shilimkar <santosh.shilimkar@ti.com>
 Date: Thu, 13 Feb 2014 08:52:41 -0500
-Subject: [PATCH 4/4] Not-for-merge: ARM: config: omap: Disable SMP for AM335x build
+Subject: [PATCH 2/2] Not-for-merge: ARM: config: omap: Disable SMP for AM335x
+ build
 
 SMP and SMP_ON_UP introduces some extra barriers and code many fast paths
 including kernel lock functions.
@@ -21,12 +22,13 @@ Disabling SMP in the build introduces one warining in cpuidle44xx.c driver
 and fix is included in the series
 
 Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
- arch/arm/configs/omap2plus_defconfig |    2 --
- 1 files changed, 0 insertions(+), 2 deletions(-)
+ arch/arm/configs/omap2plus_defconfig | 2 --
+ 1 file changed, 2 deletions(-)
 
 diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
-index 3975b08..cfbc2d0 100644
+index a34b45a..bb6beb2 100644
 --- a/arch/arm/configs/omap2plus_defconfig
 +++ b/arch/arm/configs/omap2plus_defconfig
 @@ -36,8 +36,6 @@ CONFIG_OMAP4_ERRATA_I688=y
@@ -35,9 +37,9 @@ index 3975b08..cfbc2d0 100644
  CONFIG_PCIE_DRA7XX=y
 -CONFIG_SMP=y
 -CONFIG_NR_CPUS=2
- CONFIG_PREEMPT=y
+ CONFIG_PREEMPT_VOLUNTARY=y
  CONFIG_CMA=y
  CONFIG_ZBOOT_ROM_TEXT=0x0
 -- 
-1.7.0.4
+1.8.3.2
 
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 32cc5c5..9f39a72 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,11 +36,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "d5e4bfd196e114c885c5c42cf0a7b3edc7e54829"
+SRCREV = "c559824b17bfc194cc072dac0720ac8e23373871"
 PV = "3.12.10"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "h+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "i+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
@@ -49,9 +49,9 @@ SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;bra
 
 # Latest critical fixes
 SRC_URI += "file://0001-Revert-usb-musb-musb_cppi41-Revert-the-Advisory-1.0..patch \
-            file://0002-ARM-config-Add-HAVE_ARM_SCU-for-AM43XX.patch \
             file://0003-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch \
+            file://0004-ARM-config-omap-Change-PREEMPTion-to-voluntary.patch \
             "
 
-SRC_URI_append_ti33x = "file://0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
-SRC_URI_append_ti43x = "file://0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
+SRC_URI_append_ti33x = "file://0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
+SRC_URI_append_ti43x = "file://0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
-- 
1.8.3.2


