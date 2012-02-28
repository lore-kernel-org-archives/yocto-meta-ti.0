Return-Path: <raj.khem@gmail.com>
Received: from mail-pw0-f48.google.com (mail-pw0-f48.google.com
	[209.85.160.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0022DE013BA
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2012 11:39:28 -0800 (PST)
Received: by pbcup7 with SMTP id up7so3383646pbc.35
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2012 11:39:28 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.129.137 as permitted sender) client-ip=10.68.129.137; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.129.137 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.129.137])
	by 10.68.129.137 with SMTP id nw9mr57734020pbb.73.1330457968768
	(num_hops = 1); Tue, 28 Feb 2012 11:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ua4EYFX/Vv9VRpRIKIA8N7aLEnzYaXqEDs/Otoz2u2Q=;
	b=qZ9lPdxEOVtaPVq3yFsVaDZgoBIUxmmaiaRTE2ZQuE8jMchp202n9pN2yfoVK8w4yV
	9BJtnn/3YtZAeHlUxm6OR2K4nxL36bBhoma2qbuglgFqPOtTmugKaLDuh4ZJWGbJMZWZ
	cqjAHy4gun9ERtVitLRBFc6cscwTBt2bowA3Q=
Received: by 10.68.129.137 with SMTP id nw9mr48647484pbb.73.1330457968528;
	Tue, 28 Feb 2012 11:39:28 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id x8sm16440748pbr.11.2012.02.28.11.39.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 11:39:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 28 Feb 2012 11:39:16 -0800
Message-Id: <1330457956-1854-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] meta-ti: Fix quotes to make new bitbake happy
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
X-List-Received-Date: Tue, 28 Feb 2012 19:39:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/u-boot/u-boot.inc                      |    2 +-
 recipes-bsp/x-load/x-load.inc                      |    2 +-
 recipes-bsp/x-load/x-load_git.bb                   |    2 +-
 recipes-ti/c6accel/ti-c6accel.inc                  |    2 +-
 recipes-ti/codec-engine/ti-codec-engine.inc        |    2 +-
 recipes-ti/dmai/ti-dmai.inc                        |    2 +-
 recipes-ti/dsplink/ti-dsplink.inc                  |    2 +-
 recipes-ti/gstreamer-ti/gstreamer-ti.inc           |    2 +-
 .../local-power-manager/ti-local-power-manager.inc |    2 +-
 recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb       |    4 ++--
 recipes-ti/matrix/matrix-gui-apps.inc              |    2 +-
 recipes-ti/matrix/matrix-gui-clocks_1.1.bb         |    4 ++--
 recipes-ti/matrix/matrix-gui-common.inc            |    2 +-
 recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb   |    2 +-
 .../matrix/matrix-gui-display-control_1.0.bb       |    4 ++--
 recipes-ti/matrix/matrix-gui-e.inc                 |    2 +-
 recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb       |    4 ++--
 recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb      |    4 ++--
 recipes-ti/matrix/matrix-gui-submenus_1.0.bb       |    4 ++--
 recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb     |    4 ++--
 recipes-ti/matrix/matrix-gui.inc                   |    2 +-
 recipes-ti/syslink/ti-syslink.inc                  |    2 +-
 22 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot.inc b/recipes-bsp/u-boot/u-boot.inc
index 9303568..720f995 100644
--- a/recipes-bsp/u-boot/u-boot.inc
+++ b/recipes-bsp/u-boot/u-boot.inc
@@ -44,7 +44,7 @@ do_install () {
 
 FILES_${PN} = "/boot ${sysconfdir}"
 # no gnu_hash in uboot.bin, by design, so skip QA
-INSANE_SKIP_${PN} = True
+INSANE_SKIP_${PN} = "1"
 
 inherit deploy
 
diff --git a/recipes-bsp/x-load/x-load.inc b/recipes-bsp/x-load/x-load.inc
index c8ab3e9..7a9638b 100644
--- a/recipes-bsp/x-load/x-load.inc
+++ b/recipes-bsp/x-load/x-load.inc
@@ -17,7 +17,7 @@ XLOAD_USB_SYMLINK ?= "x-load-usb-${MACHINE}.bin"
 MLO_IMAGE ?= "MLO-${MACHINE}-${PV}-${PR}"
 MLO_SYMLINK ?= "MLO-${MACHINE}"
 MLO_SYMLINK_NOMACHINE ?= "MLO"
-XLOAD_LOAD_ADDRESS ?= 0x40200800
+XLOAD_LOAD_ADDRESS ?= "0x40200800"
 
 do_compile () {
 	unset LDFLAGS
diff --git a/recipes-bsp/x-load/x-load_git.bb b/recipes-bsp/x-load/x-load_git.bb
index 1017e38..dd8bce2 100644
--- a/recipes-bsp/x-load/x-load_git.bb
+++ b/recipes-bsp/x-load/x-load_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://gitorious.org/x-loader/x-loader.git;branch=master;protocol=git
 S = "${WORKDIR}/git"
 
 XLOAD_MACHINE_beagleboard = "omap3530beagle_config"
-CONFIG_HEADER_beagleboard = 1
+CONFIG_HEADER_beagleboard = "1"
 XLOAD_MACHINE_omap3-touchbook = "omap3530beagle_config"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-ti/c6accel/ti-c6accel.inc b/recipes-ti/c6accel/ti-c6accel.inc
index 138072c..638c9be 100644
--- a/recipes-ti/c6accel/ti-c6accel.inc
+++ b/recipes-ti/c6accel/ti-c6accel.inc
@@ -84,6 +84,6 @@ do_install() {
 
 PACKAGES += "ti-c6accel-apps"
 FILES_ti-c6accel-apps = "${installdir}/c6accel-apps/*"
-INSANE_SKIP_ti-c6accel-apps = True
+INSANE_SKIP_ti-c6accel-apps = "1"
 RDEPENDS_ti-c6accel-apps += "ti-cmem-module ti-dsplink-module"
 
diff --git a/recipes-ti/codec-engine/ti-codec-engine.inc b/recipes-ti/codec-engine/ti-codec-engine.inc
index 4fb5575..15bd464 100644
--- a/recipes-ti/codec-engine/ti-codec-engine.inc
+++ b/recipes-ti/codec-engine/ti-codec-engine.inc
@@ -194,6 +194,6 @@ RDEPENDS_ti-codec-engine-examples_append_omap3    = " ti-dsplink-module ti-lpm-m
 RDEPENDS_ti-codec-engine-examples_append_omapl137 = " ti-dsplink-module"
 RDEPENDS_ti-codec-engine-examples_append_omapl138 = " ti-dsplink-module"
 FILES_ti-codec-engine-examples = "${installdir}/ti-codec-engine-examples/*"
-INSANE_SKIP_ti-codec-engine-examples = True
+INSANE_SKIP_ti-codec-engine-examples = "1"
 
 FILES_${PN}-dbg += "${installdir}/ti-codec-engine-examples/*/.debug"
diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index b22495a..23481b7 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -145,7 +145,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES += "ti-dmai-apps"
 FILES_ti-dmai-apps = "${installdir}/ti-dmai-apps/*"
-INSANE_SKIP_ti-dmai-apps = True
+INSANE_SKIP_ti-dmai-apps = "1"
 
 RDEPENDS_ti-dmai-apps_dm6446    += "ti-codecs-dm6446-server   ti-cmem-module ti-dsplink-module"
 RDEPENDS_ti-dmai-apps_dm6467    += "ti-codecs-dm6467          ti-cmem-module ti-dsplink-module"
diff --git a/recipes-ti/dsplink/ti-dsplink.inc b/recipes-ti/dsplink/ti-dsplink.inc
index 9b23e5b..ce7cbf9 100644
--- a/recipes-ti/dsplink/ti-dsplink.inc
+++ b/recipes-ti/dsplink/ti-dsplink.inc
@@ -208,4 +208,4 @@ PACKAGES += "ti-dsplink-examples"
 RDEPENDS_ti-dsplink-examples_append = " ti-dsplink-module"
 RDEPENDS_ti-dsplink-examples_append_omap3 += " ti-lpm-module ti-lpm-utils"
 FILES_ti-dsplink-examples = "${installdir}/ti-dsplink-examples/*"
-INSANE_SKIP_ti-dsplink-examples = True
+INSANE_SKIP_ti-dsplink-examples = "1"
diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti.inc b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
index 6a483c3..896186d 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
@@ -41,7 +41,7 @@ PLATFORM_dm365         = "dm365"
 PLATFORM_omapl137      = "omapl137"
 PLATFORM_omapl138      = "omapl138"
 PLATFORM              ?= "UNDEFINED_PLATFORM"
-GST_TI_PLATFORM = ${PLATFORM}
+GST_TI_PLATFORM        = "${PLATFORM}"
 
 XDC_PLATFORM_dm6446    = "ti.platforms.evmDM6446"
 XDC_PLATFORM_dm6467    = "ti.platforms.evmDM6467"
diff --git a/recipes-ti/local-power-manager/ti-local-power-manager.inc b/recipes-ti/local-power-manager/ti-local-power-manager.inc
index 46ea86b..9155c76 100644
--- a/recipes-ti/local-power-manager/ti-local-power-manager.inc
+++ b/recipes-ti/local-power-manager/ti-local-power-manager.inc
@@ -130,4 +130,4 @@ pkg_postrm_ti-lpm-module_append () {
 PACKAGES += "ti-lpm-utils"
 RDEPENDS_ti-lpm-utils += "ti-lpm-module"
 FILES_ti-lpm-utils = "${installdir}/ti-lpm-utils/*"
-INSANE_SKIP_ti-lpm-utils = True
+INSANE_SKIP_ti-lpm-utils = "1"
diff --git a/recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb b/recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb
index ece9b2e..5aad3a8 100644
--- a/recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb
+++ b/recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb
@@ -5,12 +5,12 @@ LICENSE = "CC-BY-SA"
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/603/5030/3ddemos_1.0.tar.gz"
 
-S = ${WORKDIR}/3ddemos
+S = "${WORKDIR}/3ddemos"
 
 require matrix-gui-apps.inc
 
 # Make sure 3D submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-3d
+RDEPENDS +=  "matrix-gui-submenus-3d"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
diff --git a/recipes-ti/matrix/matrix-gui-apps.inc b/recipes-ti/matrix/matrix-gui-apps.inc
index 9449c06..4d3b609 100644
--- a/recipes-ti/matrix/matrix-gui-apps.inc
+++ b/recipes-ti/matrix/matrix-gui-apps.inc
@@ -1,6 +1,6 @@
 require matrix-gui-paths.inc
 
-MATRIX_FILES_DIR ?= ${S}
+MATRIX_FILES_DIR ?= "${S}"
 
 # Append a generic function to the do_install step that will look in the
 # MATRIX_FILES_DIR for .desktop files and then:
diff --git a/recipes-ti/matrix/matrix-gui-clocks_1.1.bb b/recipes-ti/matrix/matrix-gui-clocks_1.1.bb
index 2fb7d1d..cb32854 100644
--- a/recipes-ti/matrix/matrix-gui-clocks_1.1.bb
+++ b/recipes-ti/matrix/matrix-gui-clocks_1.1.bb
@@ -6,12 +6,12 @@ inherit allarch
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/673/5096/clocks_1.1.tar.gz"
 
-S = ${WORKDIR}/clocks
+S = "${WORKDIR}/clocks"
 
 require matrix-gui-apps.inc
 
 # Make sure power submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-power
+RDEPENDS +=  "matrix-gui-submenus-power"
 
 # Break out the individual files into separate packages.  That way only the
 # clocks supported for each device can be installed.  Prepend the list so
diff --git a/recipes-ti/matrix/matrix-gui-common.inc b/recipes-ti/matrix/matrix-gui-common.inc
index 6b61081..16fe79d 100644
--- a/recipes-ti/matrix/matrix-gui-common.inc
+++ b/recipes-ti/matrix/matrix-gui-common.inc
@@ -28,7 +28,7 @@ SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=ano
 
 S = "${WORKDIR}/trunk"
 
-PACKAGE_ARCH = ${MACHINE_ARCH}
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_install() {
     install -d ${D}/${bindir}
diff --git a/recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb b/recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb
index dfc3a93..14f7a9d 100644
--- a/recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb
+++ b/recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb
@@ -6,7 +6,7 @@ inherit allarch
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/688/5114/cryptodemos_1.2.tar.gz"
 
-S = ${WORKDIR}/cryptodemos
+S = "${WORKDIR}/cryptodemos"
 
 require matrix-gui-apps.inc
 
diff --git a/recipes-ti/matrix/matrix-gui-display-control_1.0.bb b/recipes-ti/matrix/matrix-gui-display-control_1.0.bb
index 09b68b3..a2ee57c 100644
--- a/recipes-ti/matrix/matrix-gui-display-control_1.0.bb
+++ b/recipes-ti/matrix/matrix-gui-display-control_1.0.bb
@@ -8,12 +8,12 @@ inherit allarch
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/674/5097/displaycontrol_1.1.tar.gz"
 
-S = ${WORKDIR}/displaycontrol
+S = "${WORKDIR}/displaycontrol"
 
 require matrix-gui-apps.inc
 
 # Make sure display submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-display
+RDEPENDS +=  "matrix-gui-submenus-display"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
diff --git a/recipes-ti/matrix/matrix-gui-e.inc b/recipes-ti/matrix/matrix-gui-e.inc
index 481f4f4..1973e1b 100644
--- a/recipes-ti/matrix/matrix-gui-e.inc
+++ b/recipes-ti/matrix/matrix-gui-e.inc
@@ -32,7 +32,7 @@ INITSCRIPT_PARAMS = "defaults 99"
 
 CXXFLAGS_omapl138_append = " -DPlatform_omapl138 "
 CXXFLAGS_dm365_append = " -DPlatform_dm365 "
-PACKAGE_ARCH = ${MACHINE_ARCH}
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit qt4e update-rc.d
 
diff --git a/recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb b/recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb
index 70e72f9..92ff63a 100644
--- a/recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb
+++ b/recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb
@@ -8,12 +8,12 @@ inherit allarch
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/676/5099/pmdemos_1.1.tar.gz"
 
-S = ${WORKDIR}/pmdemos
+S = "${WORKDIR}/pmdemos"
 
 require matrix-gui-apps.inc
 
 # Make sure power submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-power
+RDEPENDS +=  "matrix-gui-submenus-power"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
diff --git a/recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb b/recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb
index e4e43c7..43797df 100644
--- a/recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb
+++ b/recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb
@@ -7,12 +7,12 @@ inherit allarch
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/608/5036/qt4demos_1.0.tar.gz"
 
-S = ${WORKDIR}/qt4demos
+S = "${WORKDIR}/qt4demos"
 
 require matrix-gui-apps.inc
 
 # Make sure qt4 submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-qt4
+RDEPENDS +=  "matrix-gui-submenus-qt4"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
diff --git a/recipes-ti/matrix/matrix-gui-submenus_1.0.bb b/recipes-ti/matrix/matrix-gui-submenus_1.0.bb
index 83bd18e..76505f2 100644
--- a/recipes-ti/matrix/matrix-gui-submenus_1.0.bb
+++ b/recipes-ti/matrix/matrix-gui-submenus_1.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/699/5133/arm_1.1.tar.gz;
            https://gforge.ti.com/gf/download/frsrelease/703/5138/oprofile_1.1.tar.gz;name=oprofiletarball \
 "
 
-S = ${WORKDIR}
+S = "${WORKDIR}"
 
 # List of submenus to build packages for
 SUBMENUS = "arm 3d cryptos display ethernet multimedia power pru qt4 settings usb wifi oprofile"
@@ -47,7 +47,7 @@ PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display ${PN}-ethernet ${PN}
 PROVIDES += "${PACKAGES}"
 
 # All submenu packages should depend on matrix-gui being installed
-RDEPENDS +=  matrix-gui
+RDEPENDS +=  "matrix-gui"
 
 # Add the files for each submenu package
 FILES_${PN}-arm = "${MATRIX_APP_DIR}/arm/*"
diff --git a/recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb b/recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb
index be79356..5b30775 100644
--- a/recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb
+++ b/recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb
@@ -6,12 +6,12 @@ inherit allarch
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/678/5101/wifidemos_1.1.tar.gz"
 
-S = ${WORKDIR}/wifidemos
+S = "${WORKDIR}/wifidemos"
 
 require matrix-gui-apps.inc
 
 # Make sure wifi submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-wifi
+RDEPENDS +=  "matrix-gui-submenus-wifi"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
diff --git a/recipes-ti/matrix/matrix-gui.inc b/recipes-ti/matrix/matrix-gui.inc
index 40494a9..7f51877 100644
--- a/recipes-ti/matrix/matrix-gui.inc
+++ b/recipes-ti/matrix/matrix-gui.inc
@@ -28,7 +28,7 @@ S = "${WORKDIR}/trunk"
 
 CXXFLAGS_omapl138_append = " -DPlatform_omapl138 "
 CXXFLAGS_dm365_append = " -DPlatform_dm365 "
-PACKAGE_ARCH = ${MACHINE_ARCH}
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit qt4x11
 
diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-syslink.inc
index d7df8c1..04c59c1 100644
--- a/recipes-ti/syslink/ti-syslink.inc
+++ b/recipes-ti/syslink/ti-syslink.inc
@@ -236,6 +236,6 @@ update-modules || true
 PACKAGES =+ "ti-syslink-examples"
 RRECOMMENDS_ti-syslink-examples_append = " ti-syslink-module"
 FILES_ti-syslink-examples = "${installdir}/ti-syslink-examples/*"
-INSANE_SKIP_ti-syslink-examples = True
+INSANE_SKIP_ti-syslink-examples = "1"
 
 FILES_ti-syslink-dev = "${libdir}/*"
-- 
1.7.9


