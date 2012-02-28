Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4B6BE00596
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2012 14:57:23 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 24055529D9; Tue, 28 Feb 2012 22:57:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120228225723.24055529D9@arago-project.org>
Date: Tue, 28 Feb 2012 22:57:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : various recipes: fix quoting to work with bitbake master
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
X-List-Received-Date: Tue, 28 Feb 2012 22:57:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: caaffe1aaddb333f9457b57f4d33838e8bec2afc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=caaffe1aaddb333f9457b57f4d33838e8bec2afc

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Feb 28 16:57:35 2012 +0100

various recipes: fix quoting to work with bitbake master

Changes from the original patch:
* Matrix is no longer available, not fixes necessary
* INSANE_SKIP is set to "1", like in oe-core - may need to list individual QA tests

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/c6accel/ti-c6accel.inc                  |    2 +-
 recipes-ti/dmai/ti-dmai.inc                        |    2 +-
 recipes-ti/dsplink/ti-dsplink.inc                  |    2 +-
 recipes-ti/gstreamer-ti/gstreamer-ti.inc           |    2 +-
 .../local-power-manager/ti-local-power-manager.inc |    2 +-
 recipes-ti/syslink/ti-syslink.inc                  |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

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
index 46ea86b..9155c76 100644
--- a/recipes-ti/local-power-manager/ti-local-power-manager.inc
+++ b/recipes-ti/local-power-manager/ti-local-power-manager.inc
@@ -130,4 +130,4 @@ pkg_postrm_ti-lpm-module_append () {
 PACKAGES += "ti-lpm-utils"
 RDEPENDS_ti-lpm-utils += "ti-lpm-module"
 FILES_ti-lpm-utils = "${installdir}/ti-lpm-utils/*"
-INSANE_SKIP_ti-lpm-utils = True
+INSANE_SKIP_ti-lpm-utils = "1"
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


