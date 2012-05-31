Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EACB0E006D9
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2012 16:29:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 72D25529AB; Thu, 31 May 2012 23:29:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120531232925.72D25529AB@arago-project.org>
Date: Thu, 31 May 2012 23:29:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-mainline 3.2.18: build in usbhid and tsc2007 and run ' make oldconfig'
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2012 23:29:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4f684c71cc3a1624bc5fa26bfe02e963ee4b22ca
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4f684c71cc3a1624bc5fa26bfe02e963ee4b22ca

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May 29 09:42:19 2012 +0200

linux-mainline 3.2.18: build in usbhid and tsc2007 and run 'make oldconfig'

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-mainline-3.2/beagleboard/defconfig |   16 +++++-----------
 1 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig b/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig
index e9a83e6..eaf9548 100644
--- a/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig
+++ b/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig
@@ -1,6 +1,6 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Linux/arm 3.2.16 Kernel Configuration
+# Linux/arm 3.2.18 Kernel Configuration
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -461,7 +461,7 @@ CONFIG_USE_OF=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 # CONFIG_ARM_APPENDED_DTB is not set
-CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO2,115200"
+CONFIG_CMDLINE=" debug "
 CONFIG_CMDLINE_FROM_BOOTLOADER=y
 # CONFIG_CMDLINE_EXTEND is not set
 # CONFIG_CMDLINE_FORCE is not set
@@ -1890,7 +1890,7 @@ CONFIG_TOUCHSCREEN_USB_NEXIO=y
 CONFIG_TOUCHSCREEN_TOUCHIT213=m
 CONFIG_TOUCHSCREEN_TSC_SERIO=m
 CONFIG_TOUCHSCREEN_TSC2005=m
-CONFIG_TOUCHSCREEN_TSC2007=m
+CONFIG_TOUCHSCREEN_TSC2007=y
 CONFIG_TOUCHSCREEN_W90X900=m
 CONFIG_TOUCHSCREEN_ST1232=m
 CONFIG_TOUCHSCREEN_TPS6507X=m
@@ -3012,17 +3012,11 @@ CONFIG_HIDRAW=y
 #
 # USB Input Devices
 #
-CONFIG_USB_HID=m
+CONFIG_USB_HID=y
 CONFIG_HID_PID=y
 CONFIG_USB_HIDDEV=y
 
 #
-# USB HID Boot Protocol drivers
-#
-# CONFIG_USB_KBD is not set
-# CONFIG_USB_MOUSE is not set
-
-#
 # Special HID drivers
 #
 CONFIG_HID_A4TECH=m
@@ -3915,7 +3909,7 @@ CONFIG_MSDOS_PARTITION=y
 CONFIG_BSD_DISKLABEL=y
 CONFIG_MINIX_SUBPARTITION=y
 CONFIG_SOLARIS_X86_PARTITION=y
-CONFIG_UNIXWARE_DISKLABEL=y
+# CONFIG_UNIXWARE_DISKLABEL is not set
 CONFIG_LDM_PARTITION=y
 # CONFIG_LDM_DEBUG is not set
 CONFIG_SGI_PARTITION=y


