Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39A04E003D6
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 19:55:09 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id EF0B152AB4; Sat, 17 Nov 2012 03:55:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121117035508.EF0B152AB4@arago-project.org>
Date: Sat, 17 Nov 2012 03:55:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine: add keystone SOC and keystone-evm machine
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
X-List-Received-Date: Sat, 17 Nov 2012 03:55:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 089bd2b7aa66f0accfa0262b7d7139c2be3a65d0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=089bd2b7aa66f0accfa0262b7d7139c2be3a65d0

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Nov  1 20:43:07 2012 -0400

conf/machine: add keystone SOC and keystone-evm machine

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc |   14 ++++++++++++++
 conf/machine/keystone-evm.conf    |   23 +++++++++++++++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)

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


