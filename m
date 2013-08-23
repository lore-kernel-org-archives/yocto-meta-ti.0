Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA2A4E003FA
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 12:59:21 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MS00047E261JJT1@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 23 Aug 2013 14:59:05 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AAFBF20120; Fri,
	23 Aug 2013 15:58:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 23 Aug 2013 15:58:25 -0400
Message-id: <1377287906-17115-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1377287906-17115-1-git-send-email-denis@denix.org>
References: <1377287906-17115-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/4] ti43x: add new SOC family for Sitara AM43xx Cortex-A9 processors
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
X-List-Received-Date: Fri, 23 Aug 2013 19:59:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/ti43x.inc | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 conf/machine/include/ti43x.inc

diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
new file mode 100644
index 0000000..c9ce2bb
--- /dev/null
+++ b/conf/machine/include/ti43x.inc
@@ -0,0 +1,37 @@
+SOC_FAMILY = "ti43x"
+require conf/machine/include/soc-family.inc
+
+require conf/machine/include/tune-cortexa9.inc
+
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+
+# For built-in LCD, add xf86-input-tslib
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-input-keyboard"
+
+# Default to external video, change to smallscreen for built-in LCD
+GUI_MACHINE_CLASS = "bigscreen"
+
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r0"
+
+# Default providers, may need to override for specific machines
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
+
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_ARCH = "arm"
+UBOOT_MACHINE = "am43xx_evm_config"
+
+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
+
+EXTRA_IMAGEDEPENDS += "u-boot"
+
+# List common SoC features, may need to add touchscreen for specific machines
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx"
-- 
1.8.3.2


