Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E712E00E6C; Thu, 19 May 2016 10:24:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC1B7E00D91
	for <meta-ti@yoctoproject.org>; Thu, 19 May 2016 10:24:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4JHOACr011270
	for <meta-ti@yoctoproject.org>; Thu, 19 May 2016 12:24:10 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4JHOAWq017411
	for <meta-ti@yoctoproject.org>; Thu, 19 May 2016 12:24:10 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 19 May 2016 12:24:10 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4JHOAGv029009;	Thu, 19 May 2016 12:24:10 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 May 2016 13:24:09 -0400
Message-ID: <1463678649-33720-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v4] ti-ipc-rtos: Update to include examples and documentation with the package
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
X-List-Received-Date: Thu, 19 May 2016 17:24:13 -0000
Content-Type: text/plain

Updated to new version 3.42.01.03
Added procedures and source urls for adding examples and documentation
into src package.
Added dependency on doxygen for document creation
Added big endian c66 targets
Updated uniform formatting

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous version of patch
Introduced IPC_PACKAGE_DIR to gather src package
Allowed empty test binaries for some platforms may not have test
binaries.

---
---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 112 ++++++++++++++++++++++++++++++++------
 recipes-ti/ipc/ti-ipc.inc         |   8 +--
 2 files changed, 99 insertions(+), 21 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 4c0fc74..497fa95 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,9 +2,42 @@ require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 require ti-ipc.inc
 
-PR = "${INC_PR}.4"
+TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/ipc/ipc-examples.git"
+TI_IPC_EXAMPLES_DEST_SUFFIX = "git/ipc-examples"
+TI_IPC_EXAMPLES_GIT_PROTOCOL = "git"
+TI_IPC_EXAMPLES_GIT_BRANCH = "master"
+TI_IPC_EXAMPLES_NAME = "ipc-examples"
 
-DEPENDS = "ti-xdctools ti-sysbios"
+SRC_URI += "${TI_IPC_EXAMPLES_GIT_URI};\
+destsuffix=${TI_IPC_EXAMPLES_DEST_SUFFIX};\
+protocol=${TI_IPC_EXAMPLES_GIT_PROTOCOL};\
+branch=${TI_IPC_EXAMPLES_GIT_BRANCH};\
+name=${TI_IPC_EXAMPLES_NAME}"
+
+TI_IPC_METADATA_GIT_URI = "git://git.ti.com/ipc/ipc-metadata.git"
+TI_IPC_METADATA_DEST_SUFFIX = "git/ipc-metadata"
+TI_IPC_METADATA_GIT_PROTOCOL = "git"
+TI_IPC_METADATA_GIT_BRANCH = "master"
+TI_IPC_METADATA_NAME = "ipc-metadata"
+
+SRC_URI += "${TI_IPC_METADATA_GIT_URI};\
+destsuffix=${TI_IPC_METADATA_DEST_SUFFIX};\
+protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
+branch=${TI_IPC_METADATA_GIT_BRANCH};\
+name=${TI_IPC_METADATA_NAME}"
+
+# Corresponds to tag: 3.42.01.03
+SRCREV_ipc-examples = "bd4f28bd46467553e6610629ff13b4b5b3ba3af0"
+
+# Corresponds to tag: 3.42.01.03
+SRCREV_ipc-metadata = "4d01fe4a7c41d2ce76a62b4325e66753d59b298c"
+
+S_ipc-examples = "${WORKDIR}/git/ipc-examples"
+S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "ti-xdctools ti-sysbios doxygen-native"
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
 "
@@ -26,6 +59,7 @@ IPC_TARGETS = ""
 IPC_TARGETS_omap-a15 = "\
     gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
     ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
     ti.targets.arm.elf.M4F="${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
@@ -33,18 +67,60 @@ IPC_TARGETS_omap-a15 = "\
 IPC_TARGETS_keystone = " \
     gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
 "
 
 EXTRA_OEMAKE = "\
     PLATFORM=${PLATFORM} \
     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
     BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
-    ${IPC_TARGETS} -f ipc-bios.mak\
+    ${IPC_TARGETS} \
 "
 
+RELEASE_TYPE = "GA"
+RELEASE_SUFFIX = ""
+
+IPC_PACKAGE_DIR = "${S}/ipc-package"
+
 do_compile() {
-  oe_runmake clean
-  oe_runmake all
+  oe_runmake -f ipc-bios.mak clean
+  oe_runmake -f ipc-bios.mak release
+
+  cd ${S_ipc-metadata}
+  oe_runmake .all-files IPC_INSTALL_DIR="${S}" \
+    BUILD_HOST_OS="linux" \
+    RELEASE_TYPE="${RELEASE_TYPE}"
+
+  cd ${S_ipc-examples}/src
+  oe_runmake .examples \
+    IPCTOOLS="${S_ipc-metadata}/src/etc"
+
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${S}"
+    oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${S}"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake extract PLATFORM=${ALT_PLATFORM} HOSTOS="bios" IPC_INSTALL_DIR="${S}"
+      oe_runmake extract PLATFORM=${ALT_PLATFORM} HOSTOS="linux" IPC_INSTALL_DIR="${S}"
+    fi
+  fi
+
+  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
+  install -d ${IPC_PACKAGE_DIR}
+  # Copy docs and other meta files
+  cp -pPrf  ${S_ipc-metadata}/exports/ipc_${IPC_VERSION}/* -d ${IPC_PACKAGE_DIR}
+
+  # Copy example folders corresponding to the platforms
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    install -d ${IPC_PACKAGE_DIR}/examples
+    cp -pPf ${S_ipc-examples}/src/examples/*.* ${IPC_PACKAGE_DIR}/examples/
+    cp -pPf ${S_ipc-examples}/src/examples/makefile ${IPC_PACKAGE_DIR}/examples/
+    cp -pPrf ${S_ipc-examples}/src/examples/${PLATFORM}* ${IPC_PACKAGE_DIR}/examples/
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      cp -pPrf ${S_ipc-examples}/src/examples/${ALT_PLATFORM}* ${IPC_PACKAGE_DIR}/examples/
+    fi
+    find ${IPC_PACKAGE_DIR}/examples/ -name "*zip" -type f | xargs -I {} rm {}
+  fi
 }
 
 do_compile_append() {
@@ -52,25 +128,27 @@ do_compile_append() {
 }
 
 do_install() {
-    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
+  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
+  # Copy docs and other meta files
+  install -d ${D}${IPC_INSTALL_DIR_RECIPE}
+  cp -pPrf  ${IPC_PACKAGE_DIR}/* -d ${D}${IPC_INSTALL_DIR_RECIPE}
 
-    install -d ${D}${base_libdir}/firmware/ipc
-    cp -pPrf ${S}/packages/ti/ipc/tests/bin/* ${D}${base_libdir}/firmware/ipc
+  install -d ${D}${base_libdir}/firmware/ipc
+  cp -pPrf ${S}/packages/ti/ipc/tests/bin/* ${D}${base_libdir}/firmware/ipc || true
 }
 
 ALTERNATIVE_PRIORITY = "5"
 
 pkg_postinst_${PN}-fw_omap-a15 () {
-	update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66 ${ALTERNATIVE_PRIORITY}
-	update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66 ${ALTERNATIVE_PRIORITY}
-	update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4 dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 ${ALTERNATIVE_PRIORITY}
-	update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4 dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4 ${ALTERNATIVE_PRIORITY}
+  update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66 ${ALTERNATIVE_PRIORITY}
+  update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66 ${ALTERNATIVE_PRIORITY}
+  update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4 dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 ${ALTERNATIVE_PRIORITY}
+  update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4 dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4 ${ALTERNATIVE_PRIORITY}
 }
 
 pkg_postrm_${PN}-fw_omap-a15 () {
-	update-alternatives --remove dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
-	update-alternatives --remove dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
-	update-alternatives --remove dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
-	update-alternatives --remove dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
+  update-alternatives --remove dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
+  update-alternatives --remove dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
+  update-alternatives --remove dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
+  update-alternatives --remove dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
 }
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 69127aa..27b360d 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,15 +8,15 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "3.42"
 
-#Corresponds to 3.42.00.02
-TI_IPC_SRCREV = "a520969994378fb2629d7dfc25f306c3a711b5bc"
+#Corresponds to 3.42.01.03
+TI_IPC_SRCREV = "dc6c5082f478225b7fbce4216173e6c5b36100b4"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
-SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH}"
+SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
 SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
-PV = "3.42.00.02"
+PV = "3.42.01.03"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


