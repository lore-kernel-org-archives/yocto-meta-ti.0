Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A8C6E014E5
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A534A52A9F; Tue, 26 Mar 2013 00:42:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004227.A534A52A9F@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-am37x: modify am37x specific version to use new namespace feature
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 7a62fcc7db67c58472a069a14c721da842f4099e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7a62fcc7db67c58472a069a14c721da842f4099e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:06:38 2013 -0400

u-boot-am37x: modify am37x specific version to use new namespace feature

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch |    0
 .../0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch     |    0
 ...e-add-usbethaddr-setting-to-enable-networ.patch |    0
 ...dded-function-calls-to-set-volts-speed-on.patch |    0
 ...17evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch |    0
 ...2-omap3evm-Make-the-board-start-at-800MHz.patch |    0
 ...gleboard-Load-uImage-from-VFAT-by-default.patch |    0
 ...03-beagleboard-Make-xM-rev-C-go-to-800MHz.patch |    0
 ...-Load-uImage-to-the-default-kernel-linux-.patch |    0
 ...ot_2012.04.01.bb => u-boot-am37x_2012.04.01.bb} |   18 +++---------------
 10 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-2012.04.01/0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2012.04.01/0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch
rename to recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch
diff --git a/recipes-bsp/u-boot/u-boot-2012.04.01/0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2012.04.01/0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch
rename to recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch
diff --git a/recipes-bsp/u-boot/u-boot-2012.04.01/0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2012.04.01/0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.patch
rename to recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.patch
diff --git a/recipes-bsp/u-boot/u-boot-2012.04.01/0001-omap3_evm-Added-function-calls-to-set-volts-speed-on.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_evm-Added-function-calls-to-set-volts-speed-on.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2012.04.01/0001-omap3_evm-Added-function-calls-to-set-volts-speed-on.patch
rename to recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_evm-Added-function-calls-to-set-volts-speed-on.patch
diff --git a/recipes-bsp/u-boot/u-boot-2012.04.01/0002-am335x-am3517evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-am335x-am3517evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2012.04.01/0002-am335x-am3517evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch
rename to recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-am335x-am3517evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch
diff --git a/recipes-bsp/u-boot/u-boot-2012.04.01/0002-omap3evm-Make-the-board-start-at-800MHz.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-omap3evm-Make-the-board-start-at-800MHz.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2012.04.01/0002-omap3evm-Make-the-board-start-at-800MHz.patch
rename to recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-omap3evm-Make-the-board-start-at-800MHz.patch
diff --git a/recipes-bsp/u-boot/u-boot-2012.04.01/0003-beagleboard-Load-uImage-from-VFAT-by-default.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Load-uImage-from-VFAT-by-default.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2012.04.01/0003-beagleboard-Load-uImage-from-VFAT-by-default.patch
rename to recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Load-uImage-from-VFAT-by-default.patch
diff --git a/recipes-bsp/u-boot/u-boot-2012.04.01/0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2012.04.01/0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch
rename to recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch
diff --git a/recipes-bsp/u-boot/u-boot-2012.04.01/0004-beagleboard-Load-uImage-to-the-default-kernel-linux-.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0004-beagleboard-Load-uImage-to-the-default-kernel-linux-.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2012.04.01/0004-beagleboard-Load-uImage-to-the-default-kernel-linux-.patch
rename to recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0004-beagleboard-Load-uImage-to-the-default-kernel-linux-.patch
diff --git a/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb
similarity index 78%
rename from recipes-bsp/u-boot/u-boot_2012.04.01.bb
rename to recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb
index 6cc63ed..c25cf1e 100644
--- a/recipes-bsp/u-boot/u-boot_2012.04.01.bb
+++ b/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb
@@ -1,22 +1,13 @@
-# Use the version of u-boot.inc in oe-core not the meta-ti version
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for ARM MPU devices"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-DEFAULT_PREFERENCE = "-1"
-
 COMPATIBLE_MACHINE = "am37x-evm|beagleboard"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 BRANCH ?= "master"
 
-SRCREV = "v2012.04.01"
-
-S = "${WORKDIR}/git"
+# v2012.04.01
+SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
 
 SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
 
@@ -44,7 +35,4 @@ SRC_URI += "file://0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.pat
             file://0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch \
             "
 
-UBOOT_SUFFIX = "img"
-
-# Set the name of the SPL that will built so that it is also packaged with u-boot.
 SPL_BINARY = "MLO"


