Return-Path: <denys@ti.com>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 044B0E003D7
	for <meta-ti@yoctoproject.org>; Thu,  1 Nov 2012 18:01:00 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCU00LX15H57Z01@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 01 Nov 2012 20:00:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D0F0D20011; Thu,
	01 Nov 2012 21:00:41 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 01 Nov 2012 21:00:38 -0400
Message-id: <1351818039-5698-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.12.4
In-reply-to: <1351818039-5698-1-git-send-email-denys@ti.com>
References: <1351818039-5698-1-git-send-email-denys@ti.com>
Subject: [PATCH 1/2] conf/machine: add keystone SOC and keystone-evm machine
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
X-List-Received-Date: Fri, 02 Nov 2012 01:01:01 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/keystone.inc | 14 ++++++++++++++
 conf/machine/keystone-evm.conf    | 23 +++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 conf/machine/include/keystone.inc
 create mode 100644 conf/machine/keystone-evm.conf

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
new file mode 100644
index 0000000..1914128
--- /dev/null
+++ b/conf/machine/include/keystone.inc
@@ -0,0 +1,14 @@
+SOC_FAMILY = "keystone"
+require conf/machine/include/soc-family.inc
+
+require conf/machine/include/tune-cortexa15.inc
+PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r1"
+
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
+
+EXTRA_IMAGEDEPENDS += "u-boot"
diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
new file mode 100644
index 0000000..188d53c
--- /dev/null
+++ b/conf/machine/keystone-evm.conf
@@ -0,0 +1,23 @@
+#@TYPE: Machine
+#@NAME: Keystone 2 machine
+#@DESCRIPTION: Machine configuration for the TI Keystone 2
+
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-video-fbdev"
+
+GUI_MACHINE_CLASS = "bigscreen"
+
+require conf/machine/include/keystone.inc
+#EXTRA_IMAGEDEPENDS = "u-boot"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
+
+IMAGE_FSTYPES += "tar.bz2"
+
+SERIAL_CONSOLE = "115200 ttyO0"
+
+UBOOT_MACHINE = "keystone_config"
+
+MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
-- 
1.7.12.4


