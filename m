Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5180AE0144A
	for <meta-ti@yoctoproject.org>; Sun, 17 Feb 2013 13:51:24 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1CCB152A2C; Sun, 17 Feb 2013 21:51:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130217215124.1CCB152A2C@arago-project.org>
Date: Sun, 17 Feb 2013 21:51:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machines: set default virtual/ bootloader for remaining machines
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
X-List-Received-Date: Sun, 17 Feb 2013 21:51:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 516eff31f6ac2781714701356946ad463acba1cb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=516eff31f6ac2781714701356946ad463acba1cb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sun Feb 17 16:49:28 2013 -0500

machines: set default virtual/bootloader for remaining machines

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/davinci.inc  |    5 +----
 conf/machine/include/keystone.inc |    2 ++
 conf/machine/include/omap3.inc    |    5 ++++-
 conf/machine/include/ti33x.inc    |    5 ++++-
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
index 71eca70..756a1e5 100644
--- a/conf/machine/include/davinci.inc
+++ b/conf/machine/include/davinci.inc
@@ -3,12 +3,11 @@ require conf/machine/include/tune-arm926ejs.inc
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r52"
 
-
 KERNEL_IMAGETYPE = "uImage"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-davinci"
-
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+
 UBOOT_MACHINE = "davinci_dvevm_config"
 
 UBOOT_ENTRYPOINT = "0x80008000"
@@ -19,6 +18,4 @@ EXTRA_IMAGEDEPENDS += "u-boot"
 SERIAL_CONSOLE ?= "115200 ttyS0"
 EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
 
-#ROOT_FLASH_SIZE = "29"
-
 MACHINE_FEATURES = "kernel26 serial ethernet usbhost usbgadget mmc alsa"
diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index b77bccd..bd447d4 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -2,7 +2,9 @@ SOC_FAMILY = "keystone"
 require conf/machine/include/soc-family.inc
 
 require conf/machine/include/tune-cortexa15.inc
+
 PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r5"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index f038b0c..8ebbb08 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -2,12 +2,15 @@ SOC_FAMILY = "omap3"
 require conf/machine/include/soc-family.inc
 
 require conf/machine/include/tune-cortexa8.inc
-PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
+
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r123"
 
 KERNEL_IMAGETYPE = "uImage"
 
+PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 713a30a..93c5042 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -2,10 +2,13 @@ SOC_FAMILY = "ti33x"
 require conf/machine/include/soc-family.inc
 
 require conf/machine/include/tune-cortexa8.inc
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
+
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r17"
 
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+
 KERNEL_IMAGETYPE = "uImage"
 
 UBOOT_ENTRYPOINT = "0x80008000"


