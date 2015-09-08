Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80E25E00B81; Tue,  8 Sep 2015 15:36:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B49CE00B87
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 15:36:45 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BA6BC52A02; Tue,  8 Sep 2015 22:36:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150908223644.BA6BC52A02@arago-project.org>
Date: Tue,  8 Sep 2015 22:36:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : ti-osal: add the latest version of 1.24.00.09
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
X-List-Received-Date: Tue, 08 Sep 2015 22:36:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0b3a26ca45b0ce88805e04baab151cabb99c7e83
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0b3a26ca45b0ce88805e04baab151cabb99c7e83

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Thu Sep  3 02:04:30 2015 +0000

ti-osal: add the latest version of 1.24.00.09

* ti-osal is added for building dspdce-fw and ipumm-fw in Yocto

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/includes/ti-paths.inc      |    2 ++
 recipes-ti/osal/ti-osal.inc           |   21 +++++++++++++++++++++
 recipes-ti/osal/ti-osal_1.24.00.09.bb |    9 +++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index b902cbb..bd80fa1 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -44,6 +44,7 @@ export VICPLIB_INSTALL_DIR_RECIPE    = "${installdir}/ti-vicplib-tree"
 export XDAIS_INSTALL_DIR_RECIPE      = "${installdir}/ti-xdais-tree"
 export XDC_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdctools-tree"
 export PDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-pdk-tree"
+export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
@@ -78,6 +79,7 @@ export UIA_INSTALL_DIR        = "${STAGING_DIR_TARGET}${UIA_INSTALL_DIR_RECIPE}"
 export XDAIS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${XDAIS_INSTALL_DIR_RECIPE}"
 export XDC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${XDC_INSTALL_DIR_RECIPE}"
 export PDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
+export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"
diff --git a/recipes-ti/osal/ti-osal.inc b/recipes-ti/osal/ti-osal.inc
new file mode 100644
index 0000000..09ee883
--- /dev/null
+++ b/recipes-ti/osal/ti-osal.inc
@@ -0,0 +1,21 @@
+DESCRIPTION = "TI Operating System Abstraction Library (OSAL)"
+HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal"
+LICENSE = "BSD & EPL"
+SECTION = "devel"
+
+require ../includes/ti-paths.inc
+require ../includes/ti-staging.inc
+
+S = "${WORKDIR}/osal_${PV}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal/${PV}/exports/osal_${PV}.tar.gz;name=osaltarball"
+
+do_install() {
+    install -d ${D}${OSAL_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${OSAL_INSTALL_DIR_RECIPE}
+}
+
+INSANE_SKIP_${PN}-dev = "staticdev"
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${OSAL_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/osal/ti-osal_1.24.00.09.bb b/recipes-ti/osal/ti-osal_1.24.00.09.bb
new file mode 100644
index 0000000..226458b
--- /dev/null
+++ b/recipes-ti/osal/ti-osal_1.24.00.09.bb
@@ -0,0 +1,9 @@
+require ti-osal.inc
+
+PV = "1_24_00_09"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://osal_${PV}_Manifest.html;md5=c110191994d011cee4cd02189ed3c9f4"
+
+SRC_URI[osaltarball.md5sum] = "a7ea85447fa0ff0f786d527a52fa6e8b"
+SRC_URI[osaltarball.sha256sum] = "d14f1f43c8a7965e86add69bd813cea56ea7e38abeb55de3fdcdaf4a69f19bf3"


