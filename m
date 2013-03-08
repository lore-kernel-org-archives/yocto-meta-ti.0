Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC41EE01520
	for <meta-ti@yoctoproject.org>; Fri,  8 Mar 2013 13:18:18 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1DA3152A8D; Fri,  8 Mar 2013 21:18:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130308211818.1DA3152A8D@arago-project.org>
Date: Fri,  8 Mar 2013 21:18:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : keystone: unify and cleanup configs
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
X-List-Received-Date: Fri, 08 Mar 2013 21:18:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c2e972c6eae7242a3c68698337159c82b5a6eeb6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c2e972c6eae7242a3c68698337159c82b5a6eeb6

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar  5 16:29:17 2013 -0500

keystone: unify and cleanup configs

* Centralize common/SoC settings in keystone.inc SOC_FAMILY config.
* Set/override uncommon specifics in machine configs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc |    4 ++++
 conf/machine/keystone-evm.conf    |   13 -------------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index bd447d4..047cc18 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -11,8 +11,12 @@ MACHINE_KERNEL_PR = "r5"
 
 KERNEL_IMAGETYPE = "uImage"
 
+UBOOT_MACHINE = "tci6638_evm_config"
+
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
 EXTRA_IMAGEDEPENDS += "u-boot"
 EXTRA_IMAGEDEPENDS += "boot-monitor"
+
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat"
diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index 13df843..a2c05f8 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -2,17 +2,7 @@
 #@NAME: Keystone 2 machine
 #@DESCRIPTION: Machine configuration for the TI Keystone 2
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-XSERVER = "xserver-xorg \
-           xf86-input-evdev \
-           xf86-video-fbdev"
-
-GUI_MACHINE_CLASS = "bigscreen"
-
 require conf/machine/include/keystone.inc
-#EXTRA_IMAGEDEPENDS = "u-boot"
-
-PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
 
 IMAGE_FSTYPES += "ubi tar.bz2 cpio"
 
@@ -20,9 +10,6 @@ SERIAL_CONSOLE = "115200 ttyS0"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
-UBOOT_MACHINE = "tci6638_evm_config"
-
-MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
 # do ubiattach /dev/ubi_ctrl -m 4
 # From dmesg:
 # UBI: smallest flash I/O unit:    2048


