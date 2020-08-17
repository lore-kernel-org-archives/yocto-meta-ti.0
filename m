Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.54757.1597702276024660712
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Aug 2020 15:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7A78440C36;
	Mon, 17 Aug 2020 22:11:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2k8bCK2t9Pwk; Mon, 17 Aug 2020 22:11:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 772C540C43;
	Mon, 17 Aug 2020 22:11:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1C943174466;
	Mon, 17 Aug 2020 18:11:12 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 6/6] conf/machine: introduce new j7200 platform
Date: Mon, 17 Aug 2020 18:11:01 -0400
Message-Id: <1597702261-12174-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597702261-12174-1-git-send-email-denis@denix.org>
References: <1597702261-12174-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

The J7200 SoC is a part of the K3 Multicore SoC architecture platform.
It is targeted for automotive gateway, vehicle compute systems,
Vehicle-to-Vehicle (V2V) and Vehicle-to-Everything (V2X) applications.
The SoC aims to meet the complex processing needs of modern embedded
products.

Some highlights of this SoC are:
* Dual Cortex-A72s in a single cluster, two clusters of lockstep
  capable dual Cortex-R5F MCUs and a Centralized Device Management and
  Security Controller (DMSC).
* Configurable L3 Cache and IO-coherent architecture with high data
  throughput capable distributed DMA architecture under NAVSS.
* Integrated Ethernet switch supporting up to a total of 4 external ports
  in addition to legacy Ethernet switch of up to 2 ports.
* Upto 1 PCIe-GEN3 controller, 1 USB3.0 Dual-role device subsystems,
  20 MCANs, 3 McASP, eMMC and SD, OSPI/HyperBus memory controller, I3C and
  I2C, eCAP/eQEP, eHRPWM among other peripherals.
* One hardware accelerator block containing AES/DES/SHA/MD5 called SA2UL
  management.

See J7200 Technical Reference Manual (SPRUIU1, June 2020)
for further details: https://www.ti.com/lit/pdf/spruiu1

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/j7200-evm-k3r5.conf | 14 ++++++++++++++
 conf/machine/j7200-evm.conf      | 22 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 conf/machine/j7200-evm-k3r5.conf
 create mode 100644 conf/machine/j7200-evm.conf

diff --git a/conf/machine/j7200-evm-k3r5.conf b/conf/machine/j7200-evm-k3r5.conf
new file mode 100644
index 0000000..a889481
--- /dev/null
+++ b/conf/machine/j7200-evm-k3r5.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: J7200 EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J7200 EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j7200"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE = "j7200_evm_r5_defconfig"
+UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
new file mode 100644
index 0000000..d2a8177
--- /dev/null
+++ b/conf/machine/j7200-evm.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: J7200 EVM
+#@DESCRIPTION: Machine configuration for the TI J7200 EVM
+
+require conf/machine/include/j7.inc
+
+SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-j7200-common-proc-board.dtb \
+"
+
+UBOOT_MACHINE = "j7200_evm_a72_config"
+
+IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
+
+do_image_wic[depends] += "trusted-firmware-a:do_deploy"
+do_image_tar[depends] += "trusted-firmware-a:do_deploy"
+
+do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-- 
2.7.4

