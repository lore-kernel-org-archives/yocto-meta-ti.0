Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8EA9DE0093E; Sat,  2 Apr 2016 11:29:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E709AE007B5
	for <meta-ti@yoctoproject.org>; Sat,  2 Apr 2016 11:29:45 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7741352A24; Sat,  2 Apr 2016 18:29:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160402182944.7741352A24@arago-project.org>
Date: Sat,  2 Apr 2016 18:29:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : recipes-ti: prevent any stripping of binaries due to different arch/format
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
X-List-Received-Date: Sat, 02 Apr 2016 18:29:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 565e7335f8411518cd0ef81036622917d160bec0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=565e7335f8411518cd0ef81036622917d160bec0

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sun Apr  3 00:05:21 2016 +0000

recipes-ti: prevent any stripping of binaries due to different arch/format

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb |    3 +++
 recipes-ti/devtools/ti-xdctools-common.inc         |    3 +++
 recipes-ti/devtools/ti-xdctools_3.32.00.06.bb      |    2 --
 recipes-ti/xdais/ti-xdais.inc                      |    3 +++
 recipes-ti/xdais/ti-xdais_7.24.00.04.bb            |    2 --
 5 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb b/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
index f533c0d..270169d 100644
--- a/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
+++ b/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
@@ -37,6 +37,9 @@ FILES_${PN} += "\
   ${M4_TOOLCHAIN_INSTALL_DIR_RECIPE} \
 "
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN} = "arch libdir ldflags staticdev textrel dev-so"
 
 EXCLUDE_FROM_SHLIBS = "1"
diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtools/ti-xdctools-common.inc
index 2d5f2d7..17166ca 100644
--- a/recipes-ti/devtools/ti-xdctools-common.inc
+++ b/recipes-ti/devtools/ti-xdctools-common.inc
@@ -11,6 +11,9 @@ do_install() {
     cp -pPrf ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
 }
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN} = "installed-vs-shipped"
 
 # Prevent internal libs from getting picked up
diff --git a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
index 6db742a..19bbe5d 100644
--- a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
@@ -1,5 +1,3 @@
-INHIBIT_PACKAGE_STRIP = "1"
-
 require recipes-ti/devtools/ti-xdctools-core.inc
 
 PV = "3_32_00_06"
diff --git a/recipes-ti/xdais/ti-xdais.inc b/recipes-ti/xdais/ti-xdais.inc
index a7017e7..a12ad64 100644
--- a/recipes-ti/xdais/ti-xdais.inc
+++ b/recipes-ti/xdais/ti-xdais.inc
@@ -15,6 +15,9 @@ do_install() {
     cp -pPrf ${S}/* ${D}${XDAIS_INSTALL_DIR_RECIPE}
 }
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN}-dev = "arch"
 
 ALLOW_EMPTY_${PN} = "1"
diff --git a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
index 6c81960..8148f73 100644
--- a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
+++ b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
@@ -1,5 +1,3 @@
-INHIBIT_PACKAGE_STRIP = "1"
-
 require ti-xdais.inc
 
 PV = "7_24_00_04"


