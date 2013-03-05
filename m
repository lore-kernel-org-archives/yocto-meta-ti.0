Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23279E014C6
	for <meta-ti@yoctoproject.org>; Tue,  5 Mar 2013 14:11:33 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJ700L4JKAGO5X1@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 05 Mar 2013 16:11:17 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A6870204EC; Tue,
	05 Mar 2013 17:11:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 05 Mar 2013 17:10:32 -0500
Message-id: <1362521433-9996-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1362521433-9996-1-git-send-email-denis@denix.org>
References: <1362521433-9996-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/5] keystone: unify and cleanup configs
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
X-List-Received-Date: Tue, 05 Mar 2013 22:11:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Centralize common/SoC settings in keystone.inc SOC_FAMILY config.
* Set/override uncommon specifics in machine configs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/keystone.inc |  4 ++++
 conf/machine/keystone-evm.conf    | 13 -------------
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
-- 
1.8.1.5


