Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B543EE010B9; Sun, 17 Jun 2018 12:37:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CADFE010B9
	for <meta-ti@yoctoproject.org>; Sun, 17 Jun 2018 12:37:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E0B3B207AB;
	Sun, 17 Jun 2018 19:37:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id aOe5HwlZiRCG; Sun, 17 Jun 2018 19:37:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7E3AB20B1F;
	Sun, 17 Jun 2018 19:37:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A2B0C1634A5;
	Sun, 17 Jun 2018 15:37:25 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Sun, 17 Jun 2018 15:37:19 -0400
Message-Id: <1529264243-32781-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/5] machine: k3.inc: add new SOC family definition for K3
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:29 -0000

The AM654 SoC is a lead device of the K3 Multicore SoC architecture
platform, targeted for broad market and industrial control with aim to
meet the complex processing needs of modern embedded products.

See AM65x Technical Reference Manual (SPRUID7, April 2018)
for further details: http://www.ti.com/lit/pdf/spruid7

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/k3.inc | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 conf/machine/include/k3.inc

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
new file mode 100644
index 0000000..96699db
--- /dev/null
+++ b/conf/machine/include/k3.inc
@@ -0,0 +1,32 @@
+require conf/machine/include/ti-soc.inc
+SOC_FAMILY_append = ":k3"
+
+require conf/machine/include/arm/arch-arm64.inc
+
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r0"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
+
+KERNEL_IMAGETYPE = "Image"
+KERNEL_IMAGETYPES = "Image vmlinux.gz"
+
+UBOOT_ARCH = "arm"
+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
+
+EXTRA_IMAGEDEPENDS += " \
+    virtual/bootloader \
+"
+
+MACHINE_GUI_CLASS = "smallscreen"
+
+# Use the expected value of the ubifs filesystem's volume name in the kernel
+# and u-boot.
+UBI_VOLNAME = "rootfs"
+
+# List common SoC features, may need to add touchscreen for specific machines
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet pci"
+# Not ready yet - sgx dsp mmip
-- 
2.7.4


