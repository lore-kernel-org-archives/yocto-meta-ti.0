Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 947CBE0123F
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 11:36:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EC65F52A9F; Tue, 26 Mar 2013 18:36:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326183618.EC65F52A9F@arago-project.org>
Date: Tue, 26 Mar 2013 18:36:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : omap5-evm: Add OMAP5 EVM configuration
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
X-List-Received-Date: Tue, 26 Mar 2013 18:36:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 0e11ce30492573ef5f51bb5056624fe36d3e8065
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0e11ce30492573ef5f51bb5056624fe36d3e8065

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Tue Mar 26 10:48:08 2013 -0500

omap5-evm: Add OMAP5 EVM configuration

* Add the machine configuration for the OMAP5 EVM device.
* Create the omap-a15.inc file to be shared with all OMAP
  Cortex-A15 derivative devices.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap-a15.inc |   25 +++++++++++++++++++++++++
 conf/machine/omap5-evm.conf       |   36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
new file mode 100644
index 0000000..fa2037a
--- /dev/null
+++ b/conf/machine/include/omap-a15.inc
@@ -0,0 +1,25 @@
+SOC_FAMILY = "omap-a15"
+require conf/machine/include/soc-family.inc
+
+require conf/machine/include/tune-cortexa15.inc
+
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r0"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_ARCH = "arm"
+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
+
+EXTRA_IMAGEDEPENDS += "virtual/bootloader"
+
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-video-fbdev"
+
+GUI_MACHINE_CLASS = "smallscreen"
diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
new file mode 100644
index 0000000..0504bb6
--- /dev/null
+++ b/conf/machine/omap5-evm.conf
@@ -0,0 +1,36 @@
+#@TYPE: Machine
+#@NAME: OMAP5 EVM
+#@DESCRIPTION: Machine configuration for the TI OMAP5 uEVM
+
+require conf/machine/include/omap-a15.inc
+
+IMAGE_FSTYPES += "ubi tar.gz"
+
+SERIAL_CONSOLE = "115200 ttyO0"
+
+# UBI information.  Note that this is board and kernel specific.  Changes
+# in your kernel port may require changes in these variables.  For more
+# details about this board please see
+# http://processors.wiki.ti.com/index.php/UBIFS_Support
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1988 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+# UBI: VID header offset:          2048 (aligned 2048)
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+
+UBOOT_MACHINE = "omap5_evm_config"
+
+# Currently removing the sgx machine feature because there is no SGX package
+# available for omap5
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"


