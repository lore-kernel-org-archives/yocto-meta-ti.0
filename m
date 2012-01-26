Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D427E01374
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 10:46:41 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QIkc9K018946
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 12:46:39 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QIkcB6006175
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 00:16:38 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 00:16:38 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QIkSQI011887;
	Fri, 27 Jan 2012 00:16:37 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Jan 2012 12:46:25 -0600
Message-ID: <1327603585-5599-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] matrix-gui: update to latest version
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
X-List-Received-Date: Thu, 26 Jan 2012 18:46:41 -0000
Content-Type: text/plain

* Update to the latest version of matrix-gui and the matrix-gui
  supporting recipes.  These use a git repository instead of
  tarballs for the submenu and demo description files.
* This support was ported from the arago project overlay

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb       |   18 ----
 recipes-ti/matrix/matrix-gui-3d-demos_2.0.bb       |   22 ++++
 recipes-ti/matrix/matrix-gui-apps-git.inc          |   10 ++
 recipes-ti/matrix/matrix-gui-apps-images_2.0.bb    |   20 ++++
 .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb   |   17 +++
 .../matrix/matrix-gui-camera-loopback_2.0.bb       |   18 ++++
 ...-gui-clocks_1.1.bb => matrix-gui-clocks_2.0.bb} |   18 ++--
 recipes-ti/matrix/matrix-gui-coming-soon_1.0.bb    |   17 ---
 recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb   |   19 ----
 recipes-ti/matrix/matrix-gui-crypto-demos_2.0.bb   |   17 +++
 .../matrix/matrix-gui-display-control_1.0.bb       |   21 ----
 .../matrix/matrix-gui-display-control_2.0.bb       |   18 ++++
 .../matrix/matrix-gui-multimedia-demos_2.0.bb      |   17 +++
 recipes-ti/matrix/matrix-gui-oprofile-demos_2.0.bb |   17 +++
 recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb       |   21 ----
 recipes-ti/matrix/matrix-gui-pm-demos_2.0.bb       |   17 +++
 recipes-ti/matrix/matrix-gui-pru-demos_2.0.bb      |   17 +++
 recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb      |   20 ----
 recipes-ti/matrix/matrix-gui-qt4-demos_2.0.bb      |   17 +++
 recipes-ti/matrix/matrix-gui-settings-demos_2.0.bb |   17 +++
 recipes-ti/matrix/matrix-gui-submenus_1.0.bb       |  105 --------------------
 recipes-ti/matrix/matrix-gui-submenus_2.0.bb       |   50 +++++++++
 recipes-ti/matrix/matrix-gui-usb-demos_2.0.bb      |   17 +++
 recipes-ti/matrix/matrix-gui-v4l2-demos_2.0.bb     |   17 +++
 recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb     |   19 ----
 recipes-ti/matrix/matrix-gui-wifi-demos_2.0.bb     |   17 +++
 recipes-ti/matrix/matrix-gui/init                  |   57 ++++++++---
 recipes-ti/matrix/matrix-gui_2.0.bb                |   39 ++++++-
 28 files changed, 406 insertions(+), 273 deletions(-)
 delete mode 100644 recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-3d-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-apps-git.inc
 create mode 100644 recipes-ti/matrix/matrix-gui-apps-images_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-camera-loopback_2.0.bb
 rename recipes-ti/matrix/{matrix-gui-clocks_1.1.bb => matrix-gui-clocks_2.0.bb} (66%)
 delete mode 100644 recipes-ti/matrix/matrix-gui-coming-soon_1.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-crypto-demos_2.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-display-control_1.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-display-control_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-multimedia-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-oprofile-demos_2.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-pm-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-pru-demos_2.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-qt4-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-settings-demos_2.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-submenus_1.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-submenus_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-usb-demos_2.0.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-v4l2-demos_2.0.bb
 delete mode 100644 recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb
 create mode 100644 recipes-ti/matrix/matrix-gui-wifi-demos_2.0.bb

diff --git a/recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb b/recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb
deleted file mode 100644
index ece9b2e..0000000
--- a/recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "3D demo descriptions for Matrix v2"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrixguiv2apps/"
-LICENSE = "CC-BY-SA"
-
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/603/5030/3ddemos_1.0.tar.gz"
-
-S = ${WORKDIR}/3ddemos
-
-require matrix-gui-apps.inc
-
-# Make sure 3D submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-3d
-
-FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-
-SRC_URI[md5sum] = "998363dbabea3724c4c3283a480cdb60"
-SRC_URI[sha256sum] = "aab5890dffe4e9f36f78a64ec16e7221649bb61ef1ceee2e1246cd666d197268"
diff --git a/recipes-ti/matrix/matrix-gui-3d-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-3d-demos_2.0.bb
new file mode 100644
index 0000000..c1e79b1
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-3d-demos_2.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "3D demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+S = ${WORKDIR}/git/3d_apps
+
+# Make sure 3D submenu has been installed and app images has been installed
+
+# TODO: in the future we may want to consider putting this into the libgles
+#       recipe directly.  Requires broad acceptance of matrix v2 though due
+#       to the matrix-gui-submenus-3d dependency.  So if matrix v2 moves
+#       into the same layer as libgles this may be acceptable, or perhaps
+#       we can use an RRECOMMENDS instead.
+RDEPENDS +=  "matrix-gui-apps-images matrix-gui-submenus-3d libgles-omap3-rawdemos"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+
diff --git a/recipes-ti/matrix/matrix-gui-apps-git.inc b/recipes-ti/matrix/matrix-gui-apps-git.inc
new file mode 100644
index 0000000..c5d81c3
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-apps-git.inc
@@ -0,0 +1,10 @@
+LICENSE = "CC-BY-SA"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
+
+SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
+SRCREV = "27e8eb76f4a405c123a9f816b1b389e20b06f30c"
+BRANCH = "master"
+INC_PR = "r0"
+
+# Pull in the base package for installing matrix applications
+require matrix-gui-apps.inc
diff --git a/recipes-ti/matrix/matrix-gui-apps-images_2.0.bb b/recipes-ti/matrix/matrix-gui-apps-images_2.0.bb
new file mode 100644
index 0000000..311d3a7
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-apps-images_2.0.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Image package for Matrix GUI v2 Applications"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+require matrix-gui-paths.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/images"
+
+do_install(){
+    install -d ${D}${MATRIX_APP_DIR}
+    cp -rf ${S}/ ${D}${MATRIX_APP_DIR}
+}
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui-armbenchmarks-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
new file mode 100644
index 0000000..8b758df
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Arm Benchmarks Applications for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/arm_apps
+
+# Make sure arm submenu and app images has been installed
+RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-arm
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui-camera-loopback_2.0.bb b/recipes-ti/matrix/matrix-gui-camera-loopback_2.0.bb
new file mode 100644
index 0000000..698b3d7
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-camera-loopback_2.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Camera loopback application for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+S = ${WORKDIR}/git/cameraloopback_apps
+
+# Make sure loopback application is compiled and app images has been installed
+RDEPENDS +=  "matrix-gui-apps-images av-examples"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+
+
+
diff --git a/recipes-ti/matrix/matrix-gui-clocks_1.1.bb b/recipes-ti/matrix/matrix-gui-clocks_2.0.bb
similarity index 66%
rename from recipes-ti/matrix/matrix-gui-clocks_1.1.bb
rename to recipes-ti/matrix/matrix-gui-clocks_2.0.bb
index 2fb7d1d..282bd9c 100644
--- a/recipes-ti/matrix/matrix-gui-clocks_1.1.bb
+++ b/recipes-ti/matrix/matrix-gui-clocks_2.0.bb
@@ -1,17 +1,18 @@
 DESCRIPTION = "Clock setting descriptions for Matrix v2"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrixguiv2apps/"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
 
-inherit allarch
+require matrix-gui-apps-git.inc
 
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/673/5096/clocks_1.1.tar.gz"
+PR = "${INC_PR}.0"
 
-S = ${WORKDIR}/clocks
+inherit allarch
 
-require matrix-gui-apps.inc
+S = ${WORKDIR}/git/clocks_apps
 
-# Make sure power submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-power
+# Make sure power submenu and app images has been installed
+RDEPENDS +=  matrix-gui-apps-images matrix-gui-submenus-power
 
 # Break out the individual files into separate packages.  That way only the
 # clocks supported for each device can be installed.  Prepend the list so
@@ -29,6 +30,3 @@ FILES_${PN}-300mhz += "${bindir}/setopp2.sh"
 FILES_${PN}-600mhz += "${bindir}/setopp3.sh"
 FILES_${PN}-800mhz += "${bindir}/setopp4.sh"
 FILES_${PN}-1ghz += "${bindir}/setopp1.sh"
-
-SRC_URI[md5sum] = "6d50592e364f39d7ed3b2805e6c227cb"
-SRC_URI[sha256sum] = "ab51df1651a391e3f6a947faccf45354ef187508c65cb3de92cc9fef88206e65"
diff --git a/recipes-ti/matrix/matrix-gui-coming-soon_1.0.bb b/recipes-ti/matrix/matrix-gui-coming-soon_1.0.bb
deleted file mode 100644
index 500eee4..0000000
--- a/recipes-ti/matrix/matrix-gui-coming-soon_1.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "coming soon descriptions for Matrix v2"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrixguiv2apps/"
-LICENSE = "CC-BY-SA"
-LIC_FILES_CHKSUM = "file://comingsoon/comingsoon.desktop;md5=01ebad171fad40705288fcabccc770a2"
-
-inherit allarch
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/616/5029/comingsoon_1.0.tar.gz"
-
-S = "${WORKDIR}"
-
-require matrix-gui-apps.inc
-
-FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-
-SRC_URI[md5sum] = "04076ed62be226ffee3f3960237c47f8"
-SRC_URI[sha256sum] = "f00d24a506f39b92ba335479f902bdb97680df3502f81343be5baab45fd2bc95"
diff --git a/recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb b/recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb
deleted file mode 100644
index dfc3a93..0000000
--- a/recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Cryptography demo descriptions for Matrix v2"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrixguiv2apps/"
-LICENSE = "CC-BY-SA"
-
-inherit allarch
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/688/5114/cryptodemos_1.2.tar.gz"
-
-S = ${WORKDIR}/cryptodemos
-
-require matrix-gui-apps.inc
-
-# Make sure crypto submenu has been installed and openssl is available
-RDEPENDS +=  "matrix-gui-submenus-cryptos openssl"
-
-FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-
-SRC_URI[md5sum] = "dfab3e918fee165fb24e00cba5db8918"
-SRC_URI[sha256sum] = "44fa00ce999279c10a51718298157d3006afb018f6f327f1803006b5e7068c8c"
diff --git a/recipes-ti/matrix/matrix-gui-crypto-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-crypto-demos_2.0.bb
new file mode 100644
index 0000000..6ac9d45
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Cryptography demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/cryptos_apps
+
+# Make sure crypto submenu and app images has been installed. Also make sure openssl is available
+RDEPENDS +=  "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui-display-control_1.0.bb b/recipes-ti/matrix/matrix-gui-display-control_1.0.bb
deleted file mode 100644
index 09b68b3..0000000
--- a/recipes-ti/matrix/matrix-gui-display-control_1.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Display control descriptions for Matrix v2"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrixguiv2apps/"
-LICENSE = "CC-BY-SA"
-
-PR = "r1"
-
-inherit allarch
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/674/5097/displaycontrol_1.1.tar.gz"
-
-S = ${WORKDIR}/displaycontrol
-
-require matrix-gui-apps.inc
-
-# Make sure display submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-display
-
-FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-
-SRC_URI[md5sum] = "1032490affff638b993367ce5a451298"
-SRC_URI[sha256sum] = "78d3a6e1e74acb55a927cc7e087cd15c33767cfaf9458200aa863025cee32f2e"
diff --git a/recipes-ti/matrix/matrix-gui-display-control_2.0.bb b/recipes-ti/matrix/matrix-gui-display-control_2.0.bb
new file mode 100644
index 0000000..963e906
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-display-control_2.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Display control descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/displaycontrol_apps
+
+# Make sure display submenu and app images has been installed
+RDEPENDS +=  matrix-gui-apps-images matrix-gui-submenus-display
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+
diff --git a/recipes-ti/matrix/matrix-gui-multimedia-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-multimedia-demos_2.0.bb
new file mode 100644
index 0000000..bbfefd3
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-multimedia-demos_2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Multimedia demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/multimedia_apps
+
+# Make sure multimedia submenu and app images has been installed
+RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-multimedia
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui-oprofile-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-oprofile-demos_2.0.bb
new file mode 100644
index 0000000..af5a760
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-oprofile-demos_2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Oprofile demo applications for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/oprofile_apps
+
+# Make sure profiling submenu and app images  has been installed
+RDEPENDS +=  "matrix-gui-apps-images matrix-gui-submenus-oprofile"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb b/recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb
deleted file mode 100644
index 70e72f9..0000000
--- a/recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Power management demo descriptions for Matrix v2"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrixguiv2apps/"
-LICENSE = "CC-BY-SA"
-
-PR = "r1"
-
-inherit allarch
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/676/5099/pmdemos_1.1.tar.gz"
-
-S = ${WORKDIR}/pmdemos
-
-require matrix-gui-apps.inc
-
-# Make sure power submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-power
-
-FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-
-SRC_URI[md5sum] = "f996f9754c3d140e95501d8b4134f21c"
-SRC_URI[sha256sum] = "229579b71439c0ad4cff60d7ebb4065f6871db57dd5baa4a5983c9f7804655ab"
diff --git a/recipes-ti/matrix/matrix-gui-pm-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-pm-demos_2.0.bb
new file mode 100644
index 0000000..a9ae00b
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-pm-demos_2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Power management demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/power_apps
+
+# Make sure power submenu and app images has been installed
+RDEPENDS +=  matrix-gui-apps-images matrix-gui-submenus-power
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui-pru-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-pru-demos_2.0.bb
new file mode 100644
index 0000000..d4feca4
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-pru-demos_2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "PRU demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/pru_apps
+
+# Make sure pru submenu and app images has been installed
+RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-pru
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb b/recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb
deleted file mode 100644
index e4e43c7..0000000
--- a/recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Qt4 demo descriptions for Matrix v2"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrixguiv2apps/"
-LICENSE = "CC-BY-SA"
-
-
-inherit allarch
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/608/5036/qt4demos_1.0.tar.gz"
-
-S = ${WORKDIR}/qt4demos
-
-require matrix-gui-apps.inc
-
-# Make sure qt4 submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-qt4
-
-FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-
-SRC_URI[md5sum] = "49b65c4af67117ba70e0ddabfe486abe"
-SRC_URI[sha256sum] = "8367c539caf6902961db4b8f38b0fb1f05b7b105d5e7fd143c9503ca0c8a1df2"
diff --git a/recipes-ti/matrix/matrix-gui-qt4-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-qt4-demos_2.0.bb
new file mode 100644
index 0000000..36b805d
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-qt4-demos_2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Qt4 demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/qt4_apps
+
+# Make sure qt4 submenu and app images has been installed
+RDEPENDS +=  matrix-gui-apps-images matrix-gui-submenus-qt4
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui-settings-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-settings-demos_2.0.bb
new file mode 100644
index 0000000..429b074
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-settings-demos_2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Settings demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/settings_apps
+
+# Make sure setting submenu and app images has been installed
+RDEPENDS +=  matrix-gui-apps-images matrix-gui-submenus-settings
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui-submenus_1.0.bb b/recipes-ti/matrix/matrix-gui-submenus_1.0.bb
deleted file mode 100644
index 83bd18e..0000000
--- a/recipes-ti/matrix/matrix-gui-submenus_1.0.bb
+++ /dev/null
@@ -1,105 +0,0 @@
-DESCRIPTION = "Submenu packages for Matrix GUI v2"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrixguiv2apps/"
-LICENSE = "CC-BY-SA"
-LIC_FILES_CHKSUM = "file://settings/settings.desktop;md5=bbd663594c3e13b280ff5fffaddca672"
-
-PR = "r7"
-
-require matrix-gui-paths.inc
-
-# These packages make submenus in matrix and are not architecture specific
-inherit allarch
-
-# List of submenu tarballs to use.  Each tarball contains a desktop file
-# and PNG graphic file for the submenu.
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/699/5133/arm_1.1.tar.gz;name=armtarball \
-           https://gforge.ti.com/gf/download/frsrelease/698/5134/3d_1.1.tar.gz;name=3dtarball \
-           https://gforge.ti.com/gf/download/frsrelease/700/5135/cryptos_1.1.tar.gz;name=cryptostarball \
-           https://gforge.ti.com/gf/download/frsrelease/693/5120/display_1.2.tar.gz;name=displaytarball \
-           https://gforge.ti.com/gf/download/frsrelease/692/5119/ethernet_1.4.tar.gz;name=ethernettarball \
-           https://gforge.ti.com/gf/download/frsrelease/701/5136/multimedia_1.1.tar.gz;name=multimediatarball \
-           https://gforge.ti.com/gf/download/frsrelease/702/5137/power_1.1.tar.gz;name=powertarball \
-           https://gforge.ti.com/gf/download/frsrelease/704/5139/pru_1.1.tar.gz;name=prutarball \
-           https://gforge.ti.com/gf/download/frsrelease/705/5140/qt4_1.1.tar.gz;name=qt4tarball \
-           https://gforge.ti.com/gf/download/frsrelease/694/5121/settings_1.2.tar.gz;name=settingstarball \
-           https://gforge.ti.com/gf/download/frsrelease/695/5122/usb_1.2.tar.gz;name=usbtarball \
-           https://gforge.ti.com/gf/download/frsrelease/697/5124/wifi_1.2.tar.gz;name=wifitarball \
-           https://gforge.ti.com/gf/download/frsrelease/703/5138/oprofile_1.1.tar.gz;name=oprofiletarball \
-"
-
-S = ${WORKDIR}
-
-# List of submenus to build packages for
-SUBMENUS = "arm 3d cryptos display ethernet multimedia power pru qt4 settings usb wifi oprofile"
-
-do_install(){
-	install -d ${D}${MATRIX_APP_DIR}
-
-    for x in ${SUBMENUS}
-    do
-        cp -rf ${S}/$x ${D}${MATRIX_APP_DIR}/
-    done
-}
-
-PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display ${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4 ${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile"
-
-# This should be automatic, but isn't :(
-PROVIDES += "${PACKAGES}"
-
-# All submenu packages should depend on matrix-gui being installed
-RDEPENDS +=  matrix-gui
-
-# Add the files for each submenu package
-FILES_${PN}-arm = "${MATRIX_APP_DIR}/arm/*"
-FILES_${PN}-3d = "${MATRIX_APP_DIR}/3d/*"
-FILES_${PN}-cryptos = "${MATRIX_APP_DIR}/cryptos/*"
-FILES_${PN}-display = "${MATRIX_APP_DIR}/display/*"
-FILES_${PN}-ethernet = "${MATRIX_APP_DIR}/ethernet/*"
-FILES_${PN}-multimedia = "${MATRIX_APP_DIR}/multimedia/*"
-FILES_${PN}-power = "${MATRIX_APP_DIR}/power/*"
-FILES_${PN}-pru = "${MATRIX_APP_DIR}/pru/*"
-FILES_${PN}-qt4 = "${MATRIX_APP_DIR}/qt4/*"
-FILES_${PN}-settings = "${MATRIX_APP_DIR}/settings/*"
-FILES_${PN}-usb = "${MATRIX_APP_DIR}/usb/*"
-FILES_${PN}-wifi = "${MATRIX_APP_DIR}/wifi/*"
-FILES_${PN}-oprofile = "${MATRIX_APP_DIR}/oprofile/*"
-
-# checksums for the submenu tarballs
-SRC_URI[armtarball.md5sum] = "e43585674dac2d6d6860a26c2de5332c"
-SRC_URI[armtarball.sha256um] = "270f82b09fcdc3d1a08570d30ff2a9085e7b61a0f6890f734c658cd6408de155"
-
-SRC_URI[3dtarball.md5sum] = "1cabbb75849e892a5fc7322159750f8a"
-SRC_URI[3dtarball.sha256um] = "df4983c0722a9427584497f737af57c8401a6b3898f71c994a0cfe97e5ade01a"
-
-SRC_URI[cryptostarball.md5sum] = "88d4ece28e75eb28358b43729022c91a"
-SRC_URI[cryptostarball.sha256um] = "7999b2e06d27c30294c104418db79a1f9652a07a066242120cb32d3f86706538"
-
-SRC_URI[displaytarball.md5sum] = "eff9c5ab6667525ab0c452a6319cc5d8"
-SRC_URI[displaytarball.sha256sum] = "834f22c4439bdd97c04160b9e002abcddf22188a01488476b604259324ea09af"
-
-SRC_URI[ethernettarball.md5sum] = "ff82b9a0ce5bbf7b7672073147f415c9"
-SRC_URI[ethernettarball.sha256sum] = "28e74cd7e30fff3c7cb6ac284fb39b98e73ecefa0182ab900f64d293845d51eb"
-
-SRC_URI[multimediatarball.md5sum] = "21064503fc26611cfedf093e478440b3"
-SRC_URI[multimediatarball.sha256sum] = "039d2f7fbbd29b31601cf6596268a5a43f9dd7e86ff888a9ef45515479797d3d"
-
-SRC_URI[powertarball.md5sum] = "406a838e12d7f83bc5a004e748ceb660"
-SRC_URI[powertarball.sha256sum] = "d6c0bc690c1f45cc81fa1673dad08bea03f799adb929e5a3ec3fe4ebda60fca8"
-
-SRC_URI[prutarball.md5sum] = "b0eca67cdc45db2b9aa14987b4761068"
-SRC_URI[prutarball.sha256sum] = "06d3acf5ba2e4d5ff796625b07b470e5cea945700c9571878b8f4ba6f171d2de"
-
-SRC_URI[qt4tarball.md5sum] = "3576ad6bc96fceb18d4d8b0850bf559d"
-SRC_URI[qt4tarball.sha256sum] = "11fd5ca37d72b7129035b7f6101b4b06ac2b69d53abcd6a2751d3e9c7000dec0"
-
-SRC_URI[settingstarball.md5sum] = "f2634670768860954cc63309d1f4f37e"
-SRC_URI[settingstarball.sha256sum] = "fb96e6e4107445e4d5d65e2475513a62e0cf5b52734c9f93e918715abcc09265"
-
-SRC_URI[usbtarball.md5sum] = "63cebc3422af0f09f3eaa0a65b25bcde"
-SRC_URI[usbtarball.sha256sum] = "7178afea3b5b2926ddbf80766f1d457d7a31704869bce62ffc8db4b3d6e063e7"
-
-SRC_URI[wifitarball.md5sum] = "c8ae4df2521276b5b83294153825acf4"
-SRC_URI[wifitarball.sha256sum] = "430f4c161eaf5dc28d524fbf4903274817023414154b2074a0b948e50724a6ff"
-
-SRC_URI[oprofiletarball.md5sum] = "02d0c9eb9fed014170f57ad30f2a5c85"
-SRC_URI[oprofiletarball.sha256sum] = "ebad9018c0bd37f075a248d60e6e5520824d09afd03e71395cfc9949747e33ac"
diff --git a/recipes-ti/matrix/matrix-gui-submenus_2.0.bb b/recipes-ti/matrix/matrix-gui-submenus_2.0.bb
new file mode 100644
index 0000000..e391143
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-submenus_2.0.bb
@@ -0,0 +1,50 @@
+DESCRIPTION = "Submenu packages for Matrix GUI v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+require matrix-gui-paths.inc
+
+# This package does not use a subdirectory as ${S} so we need to
+# reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
+
+PR = "${INC_PR}.8"
+
+# These packages make submenus in matrix and are not architecture specific
+inherit allarch
+
+S = "${WORKDIR}/git"
+
+# List of submenus to build packages for
+SUBMENUS = "arm_submenu 3d_submenu cryptos_submenu display_submenu ethernet_submenu multimedia_submenu power_submenu pru_submenu qt4_submenu settings_submenu usb_submenu wifi_submenu oprofile_submenu"
+
+do_install(){
+    install -d ${D}${MATRIX_APP_DIR}
+
+    for x in ${SUBMENUS}
+    do
+        cp -rf ${S}/$x ${D}${MATRIX_APP_DIR}/
+    done
+}
+
+PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display ${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4 ${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile"
+
+# Make sure app images has been installed
+RDEPENDS += matrix-gui-apps-images
+
+# Add the files for each submenu package
+FILES_${PN}-arm = "${MATRIX_APP_DIR}/arm_submenu/*"
+FILES_${PN}-3d = "${MATRIX_APP_DIR}/3d_submenu/*"
+FILES_${PN}-cryptos = "${MATRIX_APP_DIR}/cryptos_submenu/*"
+FILES_${PN}-display = "${MATRIX_APP_DIR}/display_submenu/*"
+FILES_${PN}-ethernet = "${MATRIX_APP_DIR}/ethernet_submenu/*"
+FILES_${PN}-multimedia = "${MATRIX_APP_DIR}/multimedia_submenu/*"
+FILES_${PN}-power = "${MATRIX_APP_DIR}/power_submenu/*"
+FILES_${PN}-pru = "${MATRIX_APP_DIR}/pru_submenu/*"
+FILES_${PN}-qt4 = "${MATRIX_APP_DIR}/qt4_submenu/*"
+FILES_${PN}-settings = "${MATRIX_APP_DIR}/settings_submenu/*"
+FILES_${PN}-usb = "${MATRIX_APP_DIR}/usb_submenu/*"
+FILES_${PN}-wifi = "${MATRIX_APP_DIR}/wifi_submenu/*"
+FILES_${PN}-oprofile = "${MATRIX_APP_DIR}/oprofile_submenu/*"
diff --git a/recipes-ti/matrix/matrix-gui-usb-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-usb-demos_2.0.bb
new file mode 100644
index 0000000..3801358
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-usb-demos_2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "USB demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/usb_apps
+
+# Make sure usb submenu and app images has been installed
+RDEPENDS +=  "matrix-gui-apps-images matrix-gui-submenus-usb bonnie++"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui-v4l2-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-v4l2-demos_2.0.bb
new file mode 100644
index 0000000..687c9f8
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-v4l2-demos_2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "V4l2 demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/v4l2_apps
+
+# Make sure display submenu and app images has been installed
+RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-display
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb b/recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb
deleted file mode 100644
index be79356..0000000
--- a/recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Wifi demo descriptions for Matrix v2"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrixguiv2apps/"
-LICENSE = "CC-BY-SA"
-
-inherit allarch
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/678/5101/wifidemos_1.1.tar.gz"
-
-S = ${WORKDIR}/wifidemos
-
-require matrix-gui-apps.inc
-
-# Make sure wifi submenu has been installed
-RDEPENDS +=  matrix-gui-submenus-wifi
-
-FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-
-SRC_URI[md5sum] = "60d85261bcad85da7ecd024613343068"
-SRC_URI[sha256sum] = "36fe8bbc461e157b00ebf8f9deab1e5c83eef2f618bc98f2956d974e76534c56"
diff --git a/recipes-ti/matrix/matrix-gui-wifi-demos_2.0.bb b/recipes-ti/matrix/matrix-gui-wifi-demos_2.0.bb
new file mode 100644
index 0000000..bc02c25
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-wifi-demos_2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Wifi demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA"
+PRIORITY = "optional"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = ${WORKDIR}/git/wifi_apps
+
+# Make sure wifi submenu and app images has been installed
+RDEPENDS += matrix-gui-apps-images matrix-gui-submenus-wifi
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/recipes-ti/matrix/matrix-gui/init b/recipes-ti/matrix/matrix-gui/init
index c9253d4..349da53 100644
--- a/recipes-ti/matrix/matrix-gui/init
+++ b/recipes-ti/matrix/matrix-gui/init
@@ -1,35 +1,63 @@
 #! /bin/sh
 
-matrixgui="/usr/bin/qtopia/demos/browser/browser"
-GUI_OPTS="-qws -nogui http://localhost:8080/index.html"
+matrixgui="/usr/bin/matrix_browser"
+ROTATION=__MATRIX_ROT__
+GUI_OPTS="-qws $ROTATION http://localhost:8080/"
 PIDFILE="/var/run/matrix-gui-2.0.pid"
 
 test -x "$matrixgui" || exit 0
 
 export TSLIB_TSDEVICE=/dev/input/touchscreen0
-export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
+export QWS_MOUSE_PROTO=Auto
+tsfile=/etc/pointercal
 
 case "$1" in
   start)
     chvt 4
 
-    # Temporarily create the /dev/input/touchscreen0 symlink if it is
-    # not already present.  On devices like am335x the driver does not
-    # report the right string in /sys/devices/platform/tsc/input/input0/modalias
-    # to match the regular expression in /etc/udev/rules.d/local.rules
-    # to have this symlink created automatically.
-    if [ -e /dev/input/event0 ]
+    # ARM9 devices get a lot of alignment trap errors with the current
+    # version of Qt (4.7.2) that we use.  The printing of these messages
+    # is causing a severe slowdown with matrix and other Qt applications
+    # that matrix launches.  The root cause is under investigation and an
+    # issue is being filed in the Qt JIRA tracker.  For now using the
+    # following command will do a software fixup of the alignment trap errors
+    # in the kernel.  This should have no impact on cortex-A8 devices.
+    echo 2 > /proc/cpu/alignment
+
+    # Do not try to calibrate the touchscreen if it doesn't exist.
+    if [ -e /dev/input/touchscreen0 ]
     then
-        # assume we are going to use event0
-        ln -s /dev/input/event0 /dev/input/touchscreen0
+        export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
+        # Check if the SD card is mounted and the first partition is
+        # vfat.  If so let's write the pointercal file there so that if
+        # someone messes up calibration they can just delete the file from
+        # any system and reboot the board.
+        mount | grep /media/mmcblk0p1 | grep vfat > /dev/null 2>&1
+        if [ "$?" = "0" ]
+        then
+            tsfile=/media/mmcblk0p1/pointercal
+            export TSLIB_CALIBFILE=$tsfile
+        fi
 
-        if [ ! -f /etc/pointercal ] ; then
+        if [ ! -f $tsfile ] ; then
             echo -n "Calibrating touchscreen (first time only)"
             ts_calibrate
             echo "."
+            # If we create a pointercal file and it was not in /etc/pointercal
+            # let's copy it there as well if it does not already exist.
+            if [ ! -f /etc/pointercal -a -f $tsfile ]
+            then
+                cp $tsfile /etc/pointercal
+            fi
         fi
     fi
 
+    #Clear out the the tmp and lock directory
+    cd __MATRIX_WEB_DIR__
+    rm -rf tmp/*
+    rm -rf lock/*
+    cd -
+
 	if [ -e $PIDFILE ]; then
       PIDDIR=/proc/$(cat $PIDFILE)
       if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" = "${matrixgui}" ]; then
@@ -41,11 +69,6 @@ case "$1" in
     fi
 
     echo -n "Starting Matrix GUI application"
-    cd __MATRIX_BASE_DIR__
-    start-stop-daemon --start --quiet --background --exec node -- server.js
-    # Need to investigate how to make the second start-stop command wait
-    # until the start of node is done.
-    sleep 5
     start-stop-daemon --start --quiet --background --exec $matrixgui -- $GUI_OPTS
 	pidof ${matrixgui} > $PIDFILE
     echo "."
diff --git a/recipes-ti/matrix/matrix-gui_2.0.bb b/recipes-ti/matrix/matrix-gui_2.0.bb
index 94a05b4..604101b 100644
--- a/recipes-ti/matrix/matrix-gui_2.0.bb
+++ b/recipes-ti/matrix/matrix-gui_2.0.bb
@@ -1,25 +1,40 @@
 DESCRIPTION = "Matrix GUI Application launcher"
 HOMEPAGE = "https://gforge.ti.com/gf/project/matrix-gui-v2/"
 
-LICENSE = "BSD MIT Apache"
-LIC_FILES_CHKSUM = "file://javascript/jquery-latest.js;md5=9118381924c51c89d9414a311ec9c97f"
+LICENSE = "BSD MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r6"
+PR = "r7"
 
-inherit allarch
+INITSCRIPT_NAME = "matrix-gui-2.0"
+INITSCRIPT_PARAMS = "defaults 97"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit update-rc.d
 
 BRANCH ?= "master"
-SRCREV = "8e2bd5ffdded23bb662476fcd2490fa1526801f8"
+SRCREV = "3a84b47505bf2be27fbcf30933f1261ed031ea9a"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
+           file://init \
            file://php.ini"
 
 require matrix-gui-paths.inc
 
 S = "${WORKDIR}/git"
 
+MATRIX_CONFIG = "800x480_config.ini"
+MATRIX_CONFIG_am3517-evm = "480x272_config.ini"
+MATRIX_CONFIG_am180x-evm = "480x272_config.ini"
+MATRIX_CONFIG_am37x-evm = "640x480_config.ini"
+MATRIX_CONFIG_beagleboard = "640x480_config.ini"
+
+MATRIX_ROT = ""
+MATRIX_ROT_am37x-evm = "-display transformed:Rot90"
+
 do_install(){
 	install -d ${D}${MATRIX_BASE_DIR}
 	install -d ${D}${MATRIX_WEB_DIR}
@@ -27,8 +42,20 @@ do_install(){
 
     # Install our php.ini file
     install -m 0644 ${WORKDIR}/php.ini ${D}${MATRIX_BASE_DIR}/
+
+    # Set the proper path in the init script
+    sed -i -e s=__MATRIX_WEB_DIR__=${MATRIX_WEB_DIR}= ${WORKDIR}/init
+    sed -i -e "s/__MATRIX_ROT__/\"${MATRIX_ROT}\"/" ${WORKDIR}/init
+
+    # Install the init script
+    # TODO: replace init script with systemd files
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-2.0
+
+    # Install the matrix config file to configure the screen resolution
+    install -m 0644 ${S}/matrix_config/${MATRIX_CONFIG} ${D}${MATRIX_WEB_DIR}/matrix_config.ini
 }
 
-RDEPENDS_${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-compress lighttpd-module-expire php php-cgi php-cli"
+RDEPENDS_${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-compress lighttpd-module-expire php php-cgi php-cli matrix-gui-browser refresh-screen"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.7.0.4


