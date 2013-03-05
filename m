Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7748DE014CD
	for <meta-ti@yoctoproject.org>; Tue,  5 Mar 2013 14:11:35 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJ700CL9KATIC71@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 05 Mar 2013 16:11:18 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EC7AC205DC; Tue,
	05 Mar 2013 17:11:15 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 05 Mar 2013 17:11:09 -0500
Message-id: <1362521470-10038-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1362521470-10038-1-git-send-email-denis@denix.org>
References: <1362521470-10038-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] omap3-touchbook: remove machine definition, since it's unsupported
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
X-List-Received-Date: Tue, 05 Mar 2013 22:11:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

There is no support for this device from meta-ti. Plus I don't have the device.
If there's anyone willing to maintain it, please let me know or feel free to
take it to a separate layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/omap3-touchbook.conf | 46 ---------------------------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 conf/machine/omap3-touchbook.conf

diff --git a/conf/machine/omap3-touchbook.conf b/conf/machine/omap3-touchbook.conf
deleted file mode 100644
index 6c52d9e..0000000
--- a/conf/machine/omap3-touchbook.conf
+++ /dev/null
@@ -1,46 +0,0 @@
-#@TYPE: Machine
-#@NAME: Always Innovating touchbook
-#@DESCRIPTION: Machine configuration for the http://www.alwaysinnovating.com/touchbook/
-
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-XSERVER = "xserver-xorg \
-           xf86-input-evdev \
-           xf86-input-mouse \
-           xf86-input-tslib \
-           xf86-video-fbdev \
-           xf86-video-omapfb \
-           xf86-input-keyboard"
-
-# Only has DVI connector for external screen
-GUI_MACHINE_CLASS = "bigscreen"
-
-require conf/machine/include/omap3.inc
-
-PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
-
-IMAGE_FSTYPES += "tar.bz2"
-EXTRA_IMAGECMD_jffs2 = "-lnp "
-
-# Guesswork
-SERIAL_CONSOLE = "115200 ttyS2"
-
-UBOOT_MACHINE = "omap3_beagle_config"
-XLOAD_MACHINE = "beagleboard_config"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    129024 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1996 LEBs
-MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
-
-# do ubiattach /dev/ubi_ctrl -m 4
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
-
-# and sdio
-MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa touchscreen sgx"
-- 
1.8.1.5


