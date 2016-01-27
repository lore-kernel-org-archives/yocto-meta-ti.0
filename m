Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 565B4E00B8C; Wed, 27 Jan 2016 12:55:02 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4791FE00BAA
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BA5C252AB3; Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205449.BA5C252AB3@arago-project.org>
Date: Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : common-csl-ip: Upgrade to version 3.3.0.1B
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
X-List-Received-Date: Wed, 27 Jan 2016 20:55:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e887c3f2a6166adaf420eb2c5789e468de2633da
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e887c3f2a6166adaf420eb2c5789e468de2633da

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jan 27 03:16:42 2016 +0000

common-csl-ip: Upgrade to version 3.3.0.1B

* Re-implement common-csl-ip-rtos using the ti-pdk class

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../common-csl-ip/common-csl-ip-rtos_git.bb        |   43 +++++++-------------
 recipes-bsp/common-csl-ip/common-csl-ip.inc        |   11 ++---
 recipes-bsp/common-csl-ip/common-csl-ip_git.bb     |    6 +++
 3 files changed, 25 insertions(+), 35 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index f8dc1ba..6f7d3cc 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -1,36 +1,23 @@
 require common-csl-ip.inc
-
 PR = "${INC_PR}.0"
 
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-DEPENDS = "ti-xdctools ti-cgt6x-native ti-sysbios"
-
-CSL_GIT_DESTSUFFIX = "git/ti/csl"
+inherit ti-pdk
 
-export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr"
-export XDCCGROOT="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export XDCPATH="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages"
+DEPENDS_remove = "${PN}"
 
-do_configure() {
-    sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
-    find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
-    find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
-    find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
-    find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
-}
+XDCARGS_ti33x = "am335x"
+XDCARGS_ti43x = "am437x"
+XDCARGS_omap-a15 = "am571x am572x"
+XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2l-evm = "k2l"
+XDCARGS_k2e-evm = "k2e"
 
-do_compile() {
-    ${XDC_INSTALL_DIR}/xdc .make
-    ${XDC_INSTALL_DIR}/xdc clean
-    ${XDC_INSTALL_DIR}/xdc release
-}
+do_configure_append() {
+    # Create empty makefile
+    # If libraries are supported for this device, then this will be overwritten
+    cat > ${BUILD_DIR}/makefile << __EOF__
+# Nothing to do
+all:
 
-do_install () {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
-    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
+__EOF__
 }
-
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN}-dev += "${PDK_INSTALL_DIR_RECIPE}/packages"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index 74abab0..c81b0f1 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -5,19 +5,16 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 COMPATIBLE_MACHINE = "keystone|dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-INC_PR = "r4"
+PV = "3.3.0.1B"
+INC_PR = "r0"
 
 CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
 CSL_GIT_PROTOCOL ="git"
 CSL_GIT_BRANCH = "master"
-CSL_GIT_BRANCH_dra7xx = "releases/PROCESSOR-SDK.01.00.00"
 CSL_GIT_DESTSUFFIX = "git"
 
-# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.01.00A
-CSL_SRCREV = "17bb083f0d5ed4ad6f38c991210a6a8e9aaf9c56"
-
-# commit ID corresponds to PROCESSOR-SDK-ALPHA-1
-CSL_SRCREV_dra7xx = "37c5311ddf289f83b1432a9422816722d264bf55"
+# commit ID corresponds to DEV.CSL_PROCESSOR-SDK.03.03.00.01B
+CSL_SRCREV = "48bb80a8d5919e17528a21be5d3ea6437dfc0425"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
index 77f7858..9ea87d3 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
@@ -4,6 +4,12 @@ PR = "${INC_PR}.0"
 
 ALLOW_EMPTY_${PN} = "1"
 
+CLEANBROKEN = "1"
+
+do_compile() {
+    :
+}
+
 do_install () {
     install -d ${D}${includedir}/ti/csl
     find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl


