Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8B19E00CD9; Mon, 27 Jun 2016 11:31:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBF1EE00CB5
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 11:31:20 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5RIUHs5005793
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 13:30:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5RIVJUr020068
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 13:31:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Jun 2016 13:31:18 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5RIVICR031505;	Mon, 27 Jun 2016 13:31:19 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Jun 2016 14:31:03 -0400
Message-ID: <1467052268-22676-1-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 1/6] Add makefile support to ti-pdk.bbclass for RTOS components
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
X-List-Received-Date: Mon, 27 Jun 2016 18:31:22 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 classes/ti-pdk.bbclass                           |   59 ++++++++++++++++----
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb |   65 ++++++++++++++++++++++
 2 files changed, 112 insertions(+), 12 deletions(-)
 create mode 100644 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index ae76fdf..fd7c3e7 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -3,14 +3,26 @@ require recipes-ti/includes/ti-staging.inc
 
 inherit perlnative
 
-DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native"
+DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-pdk-build-rtos"
 
-DEPENDS_append_omap-a15 = " ti-cgt6x-native ti-ccsv6-native"
-DEPENDS_append_keystone = " ti-cgt6x-native"
+DEPENDS_append_omap-a15 = " ti-ccsv6-native"
+DEPENDS_remove_ti33x = "ti-cgt6x-native"
+DEPENDS_remove_ti43x = "ti-cgt6x-native"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
+# HTML hyperlink text
+PDK_COMP_LINK_TEXT ?= ""
+
+DOC_FILE = "API_Documentation_${PN}.html"
+
+create_doc_link () {
+    PDK_COMP_DIR=`get_build_dir_bash`
+
+    echo "<a href=\"${PDK_COMP_DIR}/docs/doxygen/html/index.html\">${PDK_COMP_LINK_TEXT}</a>" >> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras/doc/${DOC_FILE}
+}
+
 get_build_dir_bash() {
   if [ -f ${S}/package.xdc ]
   then
@@ -36,6 +48,10 @@ export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
 export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
 export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
 
+XDCMAKE ?= "1"
+LIMSOCS ?= ""
+LIMBOARDS ?= ""
+
 PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
 
 do_configure() {
@@ -43,24 +59,43 @@ do_configure() {
 
     mkdir -p ${BUILD_DIR}
     cp -r ${S}/* ${BUILD_DIR}
-    cd ${BUILD_DIR}
 
-    sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
-    find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
-    find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
-    find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
-    find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
+    if [ "${XDCMAKE}" == "1" ]
+    then
+        cd ${BUILD_DIR}
+
+        sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
+        find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
+        find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
+        find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
+        find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
+    fi
 }
 
 do_compile() {
-    ${XDC_INSTALL_DIR}/xdc clean ${PARALLEL_XDC} -PR .
-    ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS="${XDCARGS}" ROOTDIR="${ROOTDIR}" -PR .
-    ${XDC_INSTALL_DIR}/xdc release XDCARGS="${XDCARGS}" -PR .
+
+    if [ "${XDCMAKE}" == "1" ]
+    then
+        ${XDC_INSTALL_DIR}/xdc clean ${PARALLEL_XDC} -PR .
+        ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS="${XDCARGS}" ROOTDIR="${ROOTDIR}" -PR .
+        ${XDC_INSTALL_DIR}/xdc release XDCARGS="${XDCARGS}" -PR .
+    else
+        BUILD_DIR=${B}/`get_build_dir_bash`
+        cd ${BUILD_DIR}
+
+        make release LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
+    fi
 }
 
 do_install () {
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
     find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
+    
+    if [ "${PDK_COMP_LINK_TEXT}" != "" ]
+    then
+        install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras/doc
+        create_doc_link
+    fi
 }
 
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
new file mode 100644
index 0000000..3a3ab55
--- /dev/null
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -0,0 +1,65 @@
+DESCRIPTION = "Package containing PDK makefile infrastructure"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de09f5475185f3fd56de1e310"
+
+require recipes-ti/includes/ti-paths.inc
+
+PV = "01.00.00.00A"
+PR = "r4"
+
+PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
+PDK_BUILD_GIT_PROTOCOL = "git"
+PDK_BUILD_GIT_BRANCH = "master"
+
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.00A"
+PDK_BUILD_SRCREV = "8a026319765cc125e2daef709841bb3ce1a8d325"
+
+BRANCH = "${PDK_BUILD_GIT_BRANCH}"
+SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${PDK_BUILD_SRCREV}"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
+
+S = "${WORKDIR}/git/"
+
+CLEANBROKEN = "1"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
+    
+    install -m 0755 Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
+
+    sed -i -e "s|c\:/ti/ccsv5/utils/cygwin|\$(XDC_INSTALL_PATH)/bin|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/Rules.make
+
+    install -m 0755 makerules/build_config.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/common.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/component.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/env.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/platform.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_a8.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_a8_extend.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_a9.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_m4.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 am571x/config_am571x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
+    install -m 0755 am571x/config_am571x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
+    install -m 0755 am571x/config_am571x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
+    install -m 0755 am571x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
+    install -m 0755 am572x/config_am572x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
+    install -m 0755 am572x/config_am572x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
+    install -m 0755 am572x/config_am572x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
+    install -m 0755 am572x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-- 
1.7.10.4


