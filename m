Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DF8BE00496
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2013 11:52:15 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 36B7852A28; Tue, 12 Feb 2013 19:52:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130212195215.36B7852A28@arago-project.org>
Date: Tue, 12 Feb 2013 19:52:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am335x-evm, omap3*: drop remaining TARGET_ARCH, wrecking sstate
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
X-List-Received-Date: Tue, 12 Feb 2013 19:52:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 544c6ee5673376d19547353ef0683d712d0856e9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=544c6ee5673376d19547353ef0683d712d0856e9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb  7 16:44:37 2013 -0500

am335x-evm, omap3*: drop remaining TARGET_ARCH, wrecking sstate

Bump MACHINE_KERNEL_PR to rebuild the correct sstate.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf      |    1 -
 conf/machine/include/omap3.inc    |    3 +--
 conf/machine/include/ti33x.inc    |    2 +-
 conf/machine/omap3-touchbook.conf |    3 ---
 conf/machine/omap3evm.conf        |    2 --
 5 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index e86c41b..762f787 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -1,7 +1,6 @@
 #@TYPE: Machine
 #@NAME: AM335x EVM
 #@DESCRIPTION: Machine configuration for the TI AM335x EVM
-TARGET_ARCH = "arm"
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 XSERVER = "xserver-xorg \
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 8ce0ebc..f038b0c 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r122"
+MACHINE_KERNEL_PR = "r123"
 
 KERNEL_IMAGETYPE = "uImage"
 
@@ -12,4 +12,3 @@ UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
 EXTRA_IMAGEDEPENDS += "u-boot x-load"
-
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 223f814..713a30a 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r16"
+MACHINE_KERNEL_PR = "r17"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/conf/machine/omap3-touchbook.conf b/conf/machine/omap3-touchbook.conf
index 95d93ac..8439e0a 100644
--- a/conf/machine/omap3-touchbook.conf
+++ b/conf/machine/omap3-touchbook.conf
@@ -1,7 +1,6 @@
 #@TYPE: Machine
 #@NAME: Always Innovating touchbook
 #@DESCRIPTION: Machine configuration for the http://www.alwaysinnovating.com/touchbook/
-TARGET_ARCH = "arm"
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 XSERVER = "xserver-xorg \
@@ -43,7 +42,5 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
 # UBI: sub-page size:              512
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
 
-
-
 # and sdio
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa touchscreen"
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index 16caf05..dfedf0f 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -1,7 +1,6 @@
 #@TYPE: Machine
 #@NAME: OMAP3 EVM
 #@DESCRIPTION: Machine configuration for the TI OMAP3 EVM
-TARGET_ARCH = "arm"
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 XSERVER = "xserver-xorg \
@@ -49,4 +48,3 @@ MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
 # UBI: physical eraseblock size:   131072 bytes (128 KiB)
 # UBI: sub-page size:              512
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
-


