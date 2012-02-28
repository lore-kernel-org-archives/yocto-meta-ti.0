Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B3F7E0123C
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 28 Feb 2012 07:57:39 -0800 (PST)
Received: by wgbed3 with SMTP id ed3so2051500wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 28 Feb 2012 07:57:38 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.80.8 as permitted sender)
	client-ip=10.180.80.8; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.80.8 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.80.8])
	by 10.180.80.8 with SMTP id n8mr40264525wix.14.1330444658902 (num_hops
	= 1); Tue, 28 Feb 2012 07:57:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.80.8 with SMTP id n8mr31966907wix.14.1330444658800;
	Tue, 28 Feb 2012 07:57:38 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 9sm49352134wid.2.2012.02.28.07.57.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 07:57:38 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 28 Feb 2012 16:57:35 +0100
Message-Id: <1330444655-22250-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQnt6Y+dqOgiPE36vRzPm85xbubMwb/bKwPFQIElUUe31rnZxzsYCGLiXwHTczypXATxkx+5
Subject: [PATCH] various recipes: fix quoting to work with bitbake master
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
X-List-Received-Date: Tue, 28 Feb 2012 15:57:40 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/c6accel/ti-c6accel.inc                  |    2 +-
 recipes-ti/dmai/ti-dmai.inc                        |    2 +-
 recipes-ti/dsplink/ti-dsplink.inc                  |    2 +-
 recipes-ti/gstreamer-ti/gstreamer-ti.inc           |    2 +-
 .../local-power-manager/ti-local-power-manager.inc |    2 +-
 recipes-ti/matrix/matrix-gui-apps.inc              |    2 +-
 recipes-ti/matrix/matrix-gui-e.inc                 |    2 +-
 recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb       |    4 ++--
 recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb     |    4 ++--
 recipes-ti/syslink/ti-syslink.inc                  |    2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes-ti/c6accel/ti-c6accel.inc b/recipes-ti/c6accel/ti-c6accel.inc
index 138072c..f66c95f 100644
--- a/recipes-ti/c6accel/ti-c6accel.inc
+++ b/recipes-ti/c6accel/ti-c6accel.inc
@@ -84,6 +84,6 @@ do_install() {
 
 PACKAGES += "ti-c6accel-apps"
 FILES_ti-c6accel-apps = "${installdir}/c6accel-apps/*"
-INSANE_SKIP_ti-c6accel-apps = True
+INSANE_SKIP_ti-c6accel-apps = "True"
 RDEPENDS_ti-c6accel-apps += "ti-cmem-module ti-dsplink-module"
 
diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index b22495a..6d94921 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -145,7 +145,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES += "ti-dmai-apps"
 FILES_ti-dmai-apps = "${installdir}/ti-dmai-apps/*"
-INSANE_SKIP_ti-dmai-apps = True
+INSANE_SKIP_ti-dmai-apps = "True"
 
 RDEPENDS_ti-dmai-apps_dm6446    += "ti-codecs-dm6446-server   ti-cmem-module ti-dsplink-module"
 RDEPENDS_ti-dmai-apps_dm6467    += "ti-codecs-dm6467          ti-cmem-module ti-dsplink-module"
diff --git a/recipes-ti/dsplink/ti-dsplink.inc b/recipes-ti/dsplink/ti-dsplink.inc
index 9b23e5b..261f96c 100644
--- a/recipes-ti/dsplink/ti-dsplink.inc
+++ b/recipes-ti/dsplink/ti-dsplink.inc
@@ -208,4 +208,4 @@ PACKAGES += "ti-dsplink-examples"
 RDEPENDS_ti-dsplink-examples_append = " ti-dsplink-module"
 RDEPENDS_ti-dsplink-examples_append_omap3 += " ti-lpm-module ti-lpm-utils"
 FILES_ti-dsplink-examples = "${installdir}/ti-dsplink-examples/*"
-INSANE_SKIP_ti-dsplink-examples = True
+INSANE_SKIP_ti-dsplink-examples = "True"
diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti.inc b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
index 6a483c3..401ee26 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
@@ -41,7 +41,7 @@ PLATFORM_dm365         = "dm365"
 PLATFORM_omapl137      = "omapl137"
 PLATFORM_omapl138      = "omapl138"
 PLATFORM              ?= "UNDEFINED_PLATFORM"
-GST_TI_PLATFORM = ${PLATFORM}
+GST_TI_PLATFORM = "${PLATFORM}"
 
 XDC_PLATFORM_dm6446    = "ti.platforms.evmDM6446"
 XDC_PLATFORM_dm6467    = "ti.platforms.evmDM6467"
diff --git a/recipes-ti/local-power-manager/ti-local-power-manager.inc b/recipes-ti/local-power-manager/ti-local-power-manager.inc
index 46ea86b..9cdcf93 100644
--- a/recipes-ti/local-power-manager/ti-local-power-manager.inc
+++ b/recipes-ti/local-power-manager/ti-local-power-manager.inc
@@ -130,4 +130,4 @@ pkg_postrm_ti-lpm-module_append () {
 PACKAGES += "ti-lpm-utils"
 RDEPENDS_ti-lpm-utils += "ti-lpm-module"
 FILES_ti-lpm-utils = "${installdir}/ti-lpm-utils/*"
-INSANE_SKIP_ti-lpm-utils = True
+INSANE_SKIP_ti-lpm-utils = "True"
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
 
diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-syslink.inc
index d7df8c1..8ac5608 100644
--- a/recipes-ti/syslink/ti-syslink.inc
+++ b/recipes-ti/syslink/ti-syslink.inc
@@ -236,6 +236,6 @@ update-modules || true
 PACKAGES =+ "ti-syslink-examples"
 RRECOMMENDS_ti-syslink-examples_append = " ti-syslink-module"
 FILES_ti-syslink-examples = "${installdir}/ti-syslink-examples/*"
-INSANE_SKIP_ti-syslink-examples = True
+INSANE_SKIP_ti-syslink-examples = "True"
 
 FILES_ti-syslink-dev = "${libdir}/*"
-- 
1.7.2.5


