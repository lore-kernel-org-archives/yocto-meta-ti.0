Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9373FE01691
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2013 09:33:54 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1A973529D3; Mon, 14 Oct 2013 16:33:51 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131014163351.1A973529D3@arago-project.org>
Date: Mon, 14 Oct 2013 16:33:51 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : recipes: cruft removal and seasonal cleanup
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
X-List-Received-Date: Mon, 14 Oct 2013 16:33:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b3df09902da0d2469a02e9975d404e26c4c5ec0e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b3df09902da0d2469a02e9975d404e26c4c5ec0e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sun Oct 13 18:25:19 2013 -0400

recipes: cruft removal and seasonal cleanup

* Eliminate need for BBMASK - remove images requiring systemd/angstrom dependency
* Move ti-test packagegroup to proper location and update from latest Arago
* Move BoneScript and Bone GSG recipes to recipes-ti/beagleboard
* README in recipes-ti warns about unsupported nature of those packages

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 README                                             |    7 ----
 .../packagegroups}/packagegroup-ti-test.bb         |    8 +++--
 recipes-misc/images/cloud9-gfx-image.bb            |   15 --------
 recipes-misc/images/cloud9-gnome-image.bb          |   19 ----------
 recipes-misc/images/cloud9-image.bb                |   37 --------------------
 recipes-misc/images/ti-hw-bringup-image.bb         |   32 -----------------
 .../packagegroup/packagegroup-ti-drivers.bb        |   34 ------------------
 recipes-ti/README                                  |    1 +
 .../beagleboard}/beaglebone-getting-started.bb     |    0
 .../beagleboard}/bonescript.bb                     |    0
 .../beagleboard}/bonescript/bone101.service        |    0
 .../beagleboard}/bonescript/bonescript-git         |    0
 recipes-ti/matrix/README                           |    5 ---
 ...pro-add-dbus-to-QT-features-to-fix-linkin.patch |   31 ----------------
 14 files changed, 6 insertions(+), 183 deletions(-)

diff --git a/README b/README
index 0df391f..61ed5a3 100644
--- a/README
+++ b/README
@@ -11,12 +11,6 @@ layers: meta
 branch: master
 
 
-When not depending on meta-openembedded and not using systemd, you may need to
-mask few miscellaneous recipes requiring systemd, by adding this to local.conf:
-
-BBMASK = "meta-ti/recipes-misc"
-
-
 The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
 distributions and layer stacks, such as:
 distro-less (only with OE-Core), with Yocto/Poky, with Angstrom or Arago.
@@ -27,4 +21,3 @@ Please follow the recommended setup procedures of your OE distribution.
 Send pull requests, patches, comments or questions to meta-ti@yoctoproject.org
 
 Maintainers: Denys Dmytriyenko <denys@ti.com>
-             Koen Kooi <koen@dominion.thruhere.net>
diff --git a/recipes-ti/packagegroup/packagegroup-ti-test.bb b/recipes-core/packagegroups/packagegroup-ti-test.bb
similarity index 70%
rename from recipes-ti/packagegroup/packagegroup-ti-test.bb
rename to recipes-core/packagegroups/packagegroup-ti-test.bb
index fc19bc5..6971f07 100644
--- a/recipes-ti/packagegroup/packagegroup-ti-test.bb
+++ b/recipes-core/packagegroups/packagegroup-ti-test.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+PR = "r1"
 
-inherit allarch packagegroup
+inherit packagegroup
 
 TEST = "\
     bonnie++ \
@@ -11,6 +11,9 @@ TEST = "\
     iperf \
     lmbench \
     rt-tests \
+    evtest \
+    bc \
+    memtester \
     "
 
 TI_TEST = "\
@@ -21,4 +24,3 @@ RDEPENDS_${PN} = "\
     ${TEST} \
     ${TI_TEST} \
     "
-
diff --git a/recipes-misc/images/cloud9-gfx-image.bb b/recipes-misc/images/cloud9-gfx-image.bb
deleted file mode 100644
index 67423f6..0000000
--- a/recipes-misc/images/cloud9-gfx-image.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-# Image with cloud9 ide, gfx and hw tools installed
-
-require cloud9-image.bb
-
-IMAGE_INSTALL += " \
-                  packagegroup-core-x11-xserver \
-                  angstrom-gnome-icon-theme-enable gtk-engine-clearlooks gtk-theme-clearlooks angstrom-clearlooks-theme-enable \
-                  e-wm-config-default e-wm-config-standard e-wm-config-illume2 \
-                  xserver-nodm-init \
-                  xserver-common \
-                  ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common \
-                 "
-
-export IMAGE_BASENAME = "Cloud9-IDE-gfx"
-
diff --git a/recipes-misc/images/cloud9-gnome-image.bb b/recipes-misc/images/cloud9-gnome-image.bb
deleted file mode 100644
index c183244..0000000
--- a/recipes-misc/images/cloud9-gnome-image.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# Image with cloud9 ide, gfx and hw tools installed
-
-require cloud9-image.bb
-
-# SoC specific packages, mostly 3D or multimedia related
-SOCSUPPORT = ""
-SOCSUPPORT_omap3 = "xbmc libgles-omap3-x11demos gstreamer-ti omapfbplay"
-SOCSUPPORT_ti33x = "xbmc libgles-omap3-x11demos gst-ffmpeg mplayer2 beaglebone-capes"
-
-IMAGE_INSTALL += " \
-                  angstrom-packagegroup-gnome gimp abiword gedit midori epiphany firefox matchbox-terminal \
-                  ${SOCSUPPORT} \
-                  ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common \
-                  xinput-calibrator \
-                  xterm \
-                 "
-
-export IMAGE_BASENAME = "Cloud9-IDE-GNOME"
-
diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
deleted file mode 100644
index 519a8bb..0000000
--- a/recipes-misc/images/cloud9-image.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-# Image with cloud9 ide and hw tools installed
-
-require ti-hw-bringup-image.bb
-
-FATPAYLOAD = "${datadir}/beaglebone-getting-started/*"
-
-ROOTFSTYPE_beaglebone = "ext4"
-
-IMAGE_INSTALL += " \
-	systemd-analyze \
-	cloud9 \
-	packagegroup-sdk-target \
-	vim vim-vimrc \
-	procps \
-	beaglebone-tester \
-	screen minicom \
-	git \
-	beaglebone-getting-started bonescript \
-	led-config \
-	opencv-dev \
-	cronie-systemd ntpdate \
-	nano \
-	minicom \
-	hicolor-icon-theme \
-	gateone \
-	tar \
-	gdb gdbserver \
-	nodejs-dev \
-	mplayer2 \
-	tslib-tests tslib-calibrate \
-	iproute2 canutils \
-	connman-tests \
-	rsync \
-"
-
-export IMAGE_BASENAME = "Cloud9-IDE"
-
diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
deleted file mode 100644
index 62b4c73..0000000
--- a/recipes-misc/images/ti-hw-bringup-image.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-# Image for assisting in hardware bringup
-
-include recipes-images/angstrom/systemd-image.bb
-
-EXTRA_MACHINE_IMAGE_INSTALL ?= ""
-
-# Hokey-pokey workaround for MUSB bugs
-EXTRA_MACHINE_IMAGE_INSTALL_ti33x = "gadget-init"
-
-IMAGE_INSTALL += " \
-	usbutils \
-	i2c-tools \
-	alsa-utils \
-	devmem2 \
-	iw \
-	bonnie++ \
-	hdparm \
-	iozone3 \
-	iperf \
-	lmbench \
-	rt-tests \
-	evtest \
-	bc \
-	packagegroup-ti-test \
-	kernel-modules \
-	${EXTRA_MACHINE_IMAGE_INSTALL} \
-"
-
-export IMAGE_BASENAME = "TI-hw-bringup"
-
-# This doesn't work with the current genext2fs in oe-core
-# inherit sdcard_image
diff --git a/recipes-misc/packagegroup/packagegroup-ti-drivers.bb b/recipes-misc/packagegroup/packagegroup-ti-drivers.bb
deleted file mode 100644
index b391fac..0000000
--- a/recipes-misc/packagegroup/packagegroup-ti-drivers.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "Task for extra drivers for Texas Instruments SoCs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-
-inherit packagegroup
-
-RDEPENDS_${PN} = "\
-	zd1211-firmware \
-	linux-firmware-wl12xx \
-	rfkill \
-	cpufrequtils \
-	"
-
-RRECOMMENDS_${PN} = "\
-	\
-	kernel-module-bluetooth \
-	kernel-module-hci-usb \
-	kernel-module-hci-uart \
-	\
-	kernel-module-wl12xx \
-	kernel-module-wl12xx-sdio \
-	kernel-module-wl12xx-spi \
-	\
-	kernel-module-wl1271 \
-	kernel-module-wl1271-sdio \
-	kernel-module-wl1271-spi \
-	kernel-module-btwilink \
-	\
-	kernel-module-rt73usb \
-	kernel-module-rt2x00usb \
-	kernel-module-zd1211rw \
-	\
-	omap3-sgx-modules \
-	"
diff --git a/recipes-ti/README b/recipes-ti/README
new file mode 100644
index 0000000..9907901
--- /dev/null
+++ b/recipes-ti/README
@@ -0,0 +1 @@
+Note: many of the packages in this area are not actively maintained.
diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
similarity index 100%
rename from recipes-misc/payload/beaglebone-getting-started.bb
rename to recipes-ti/beagleboard/beaglebone-getting-started.bb
diff --git a/recipes-misc/payload/bonescript.bb b/recipes-ti/beagleboard/bonescript.bb
similarity index 100%
rename from recipes-misc/payload/bonescript.bb
rename to recipes-ti/beagleboard/bonescript.bb
diff --git a/recipes-misc/payload/bonescript/bone101.service b/recipes-ti/beagleboard/bonescript/bone101.service
similarity index 100%
rename from recipes-misc/payload/bonescript/bone101.service
rename to recipes-ti/beagleboard/bonescript/bone101.service
diff --git a/recipes-misc/payload/bonescript/bonescript-git b/recipes-ti/beagleboard/bonescript/bonescript-git
similarity index 100%
rename from recipes-misc/payload/bonescript/bonescript-git
rename to recipes-ti/beagleboard/bonescript/bonescript-git
diff --git a/recipes-ti/matrix/README b/recipes-ti/matrix/README
deleted file mode 100644
index ed77596..0000000
--- a/recipes-ti/matrix/README
+++ /dev/null
@@ -1,5 +0,0 @@
-Matrix app has been moved to meta-arago-extras layer of the meta-arago repo:
-git://arago-project.org/git/meta-arago.git
-
-This meta-arago-extras layer is distro-agnostic and not Arago-specific, so
-it can be used with any OE-Core based distribution.
diff --git a/recipes-ti/matrix/files/0001-matrix_gui.pro-add-dbus-to-QT-features-to-fix-linkin.patch b/recipes-ti/matrix/files/0001-matrix_gui.pro-add-dbus-to-QT-features-to-fix-linkin.patch
deleted file mode 100644
index 324f980..0000000
--- a/recipes-ti/matrix/files/0001-matrix_gui.pro-add-dbus-to-QT-features-to-fix-linkin.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 420cadec0f7a6048a0fafccf4c658d543b7dbf19 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <k-kooi@ti.com>
-Date: Tue, 26 Jul 2011 14:25:39 +0200
-Subject: [PATCH] matrix_gui.pro: add dbus to QT features to fix linking with  -Wl,--as-needed
-
-This fixes:
-
-| ccache arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -fno-tree-vectorize -mthumb-interwork -mno-thumb --sysroot=/home/koen/angstrom-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-rpath-link,/home/koen/angstrom-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib -o matrix_gui main.o mainwindow.o buttonfactory.o buttonlaunch.o customstyle.o menupage.o osdmanager.o matrixcontrol.o moc_mainwindow.o moc_buttonfactory.o moc_buttonlaunch.o moc_customstyle.o moc_menupage.o moc_osdmanager.o moc_matrixcontrol.o    -L/home/koen/angstrom-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib -lpng -lfreetype -lz -lgthread-2.0 -lQtWebKit -lQtGui -lQtNetwork -lQtCore -lpthread
-| ux-gnueabi/4.5.4/ld: }: invalid DSO for symbol `QDBusConnection::registerService(QString const&)' definition
-| /home/koen/angstrom-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libQtDBus.so.4: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-
-Signed-off-by: Koen Kooi <k-kooi@ti.com>
----
- matrix_gui.pro |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/matrix_gui.pro b/matrix_gui.pro
-index 5463310..908e8a7 100644
---- a/matrix_gui.pro
-+++ b/matrix_gui.pro
-@@ -1,4 +1,5 @@
--QT += webkit \
-+QT += dbus \ 
-+    webkit \
-     network
- LIBS += -lpng -lfreetype -lz -lgthread-2.0
- HEADERS = mainwindow.h \
--- 
-1.7.4.4
-


