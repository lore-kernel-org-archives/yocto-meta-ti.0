Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15A06E00734
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:49:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B8FFB52AB4; Mon, 11 Mar 2013 20:49:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130311204906.B8FFB52AB4@arago-project.org>
Date: Mon, 11 Mar 2013 20:49:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap3-touchbook: remove machine definition, since it' s unsupported
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
X-List-Received-Date: Mon, 11 Mar 2013 20:49:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 67493ea85870d3cb8c626a382f07b70af53b7eab
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=67493ea85870d3cb8c626a382f07b70af53b7eab

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar  5 15:13:20 2013 -0500

omap3-touchbook: remove machine definition, since it's unsupported

There is no support for this device from meta-ti. Plus I don't have the device.
If there's anyone willing to maintain it, please let me know or feel free to
take it to a separate layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/omap3-touchbook.conf |   46 -------------------------------------
 1 files changed, 0 insertions(+), 46 deletions(-)

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


