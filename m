Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C59ACE009EB; Fri,  5 Jun 2015 07:18:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BD0BE009EA
	for <meta-ti@yoctoproject.org>; Fri,  5 Jun 2015 07:18:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8469D529AE; Fri,  5 Jun 2015 14:18:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150605141820.8469D529AE@arago-project.org>
Date: Fri,  5 Jun 2015 14:18:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : rtos-recipes: Add files to ${PN}-dev instead of ${PN}.
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
X-List-Received-Date: Fri, 05 Jun 2015 14:18:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 1714615b48acaea903d562435cbda90200e313f0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1714615b48acaea903d562435cbda90200e313f0

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri Jun  5 16:56:29 2015 +0000

rtos-recipes: Add files to ${PN}-dev instead of ${PN}.

* These packages only contain firmware development files.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../common-csl-ip/common-csl-ip-rtos_git.bb        |    5 ++++-
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb        |    7 ++++---
 recipes-ti/bios/ti-sysbios.inc                     |    4 ++++
 recipes-ti/bios/ti-sysbios_6.41.02.41.bb           |    4 +---
 .../ti-framework-components.inc                    |    3 ++-
 .../ti-framework-components_3.40.00.02.bb          |    2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc                     |    3 ++-
 recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb           |    1 +
 recipes-ti/xdais/ti-xdais.inc                      |    5 +++++
 recipes-ti/xdais/ti-xdais_7.24.00.04.bb            |    3 +--
 10 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 5d4a552..c1fb566 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -3,6 +3,8 @@ require common-csl-ip.inc
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
+PR = "r1"
+
 DEPENDS = "ti-xdctools ti-cgt6x-native ti-sysbios"
 
 S = "${WORKDIR}/ti/csl"
@@ -30,4 +32,5 @@ do_install () {
     find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
 }
 
-FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${PDK_INSTALL_DIR_RECIPE}/packages"
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index 246d7a8..a4e0df6 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -2,7 +2,7 @@ require edma3-lld.inc
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "ti-cgt6x-native ti-sysbios ti-xdctools"
 
@@ -70,6 +70,7 @@ do_install () {
     cp -pPrf ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
 }
 
-INSANE_SKIP_${PN} = "arch"
+INSANE_SKIP_${PN}-dev = "arch"
 
-FILES_${PN} += "${EDMA3_LLD_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${EDMA3_LLD_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/bios/ti-sysbios.inc b/recipes-ti/bios/ti-sysbios.inc
index d04a158..c44fec3 100644
--- a/recipes-ti/bios/ti-sysbios.inc
+++ b/recipes-ti/bios/ti-sysbios.inc
@@ -19,3 +19,7 @@ do_install() {
     cp -pPrf ${S}/* ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
 }
 
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${SYSBIOS_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch ldflags staticdev"
diff --git a/recipes-ti/bios/ti-sysbios_6.41.02.41.bb b/recipes-ti/bios/ti-sysbios_6.41.02.41.bb
index fcad086..ccc6ad1 100644
--- a/recipes-ti/bios/ti-sysbios_6.41.02.41.bb
+++ b/recipes-ti/bios/ti-sysbios_6.41.02.41.bb
@@ -1,7 +1,7 @@
 require ti-sysbios.inc
 
 PV = "6_41_02_41"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=a4af75ec6d586c5267c71075eebff418"
 
@@ -10,5 +10,3 @@ SRC_URI[sysbiosbin.sha256sum] = "2c47b4a3aa9513d10e5811a8ac7ed1d6ce3d13df57a0bff
 
 TI_BIN_UNPK_CMDS=""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-
-INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/framework-components/ti-framework-components.inc b/recipes-ti/framework-components/ti-framework-components.inc
index b8d3f7c..e111ec4 100644
--- a/recipes-ti/framework-components/ti-framework-components.inc
+++ b/recipes-ti/framework-components/ti-framework-components.inc
@@ -17,4 +17,5 @@ do_install() {
 
 INSANE_SKIP_${PN} = "ldflags"
 
-FILES_${PN} += "${FC_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${FC_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb b/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb
index 2dd8548..78f764d 100644
--- a/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb
+++ b/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb
@@ -1,7 +1,7 @@
 require ti-framework-components.inc
 
 PV = "3_40_00_02"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://framework_components_${PV}_Manifest.html;md5=e3ce0b3e17175b7200f346d0c6dbbcc6"
 
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index fe179f5..d14c756 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -15,4 +15,5 @@ do_install() {
     cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
 }
 
-FILES_${PN} += "${IPC_INSTALL_DIR_RECIPE}"
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${IPC_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb b/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb
index 07a8136..e3f64b7 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb
@@ -1,6 +1,7 @@
 require ti-ipc-rtos.inc
 
 PV = "3_36_01_11"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
 
diff --git a/recipes-ti/xdais/ti-xdais.inc b/recipes-ti/xdais/ti-xdais.inc
index 2e7eb13..a7017e7 100644
--- a/recipes-ti/xdais/ti-xdais.inc
+++ b/recipes-ti/xdais/ti-xdais.inc
@@ -14,3 +14,8 @@ do_install() {
     install -d ${D}${XDAIS_INSTALL_DIR_RECIPE}
     cp -pPrf ${S}/* ${D}${XDAIS_INSTALL_DIR_RECIPE}
 }
+
+INSANE_SKIP_${PN}-dev = "arch"
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${XDAIS_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
index 0f27514..8148f73 100644
--- a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
+++ b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
@@ -1,10 +1,9 @@
 require ti-xdais.inc
 
 PV = "7_24_00_04"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://xdais_7_24_00_04_Manifest.html;md5=fd16442230745f0877cfe1c622669fd6"
 
 SRC_URI[xdaistarball.md5sum] = "f7514085b531f2ae49b37b30194e4989"
 SRC_URI[xdaistarball.sha256sum] = "79fd30377ab4c497292aeefb0565f81703d9020d1242b02ca9968c561e0de9a1"
-
-INSANE_SKIP_${PN} = "installed-vs-shipped"


