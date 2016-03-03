Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77E16E00B9E; Thu,  3 Mar 2016 09:05:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10888E00B3A
	for <meta-ti@yoctoproject.org>; Thu,  3 Mar 2016 09:04:56 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u23H4tQj003778
	for <meta-ti@yoctoproject.org>; Thu, 3 Mar 2016 11:04:55 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u23H4tVP014837
	for <meta-ti@yoctoproject.org>; Thu, 3 Mar 2016 11:04:55 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Mar 2016 11:04:55 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u23H4tFV014308;	Thu, 3 Mar 2016 11:04:55 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 3 Mar 2016 12:04:53 -0500
Message-ID: <1457024693-26303-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-ipc-rtos: Update to include examples, docs etc.
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
X-List-Received-Date: Thu, 03 Mar 2016 17:05:00 -0000
Content-Type: text/plain

Added procedures and source urls for ipc examples and documentation into
src package.
Added dependency on doxygen for document creation
Added big endian c66 targets

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 69 +++++++++++++++++++++++++++++++++++----
 1 file changed, 62 insertions(+), 7 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index eff1001..ffa4495 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,9 +2,19 @@ require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 require ti-ipc.inc
 
-PR = "${INC_PR}.3"
+SRC_URI += "git://git.ti.com/ipc/ipc-examples.git;destsuffix=git/ipc-examples;protocol=git;branch=master;name=ipc-examples"
+# Corresponds to tag: 3.42.00.02
+SRCREV_ipc-examples = "d3dc0e0c8da049fd6c76feb222df13c2c944a6aa"
+SRC_URI += "git://git.ti.com/ipc/ipc-metadata.git;destsuffix=git/ipc-metadata;protocol=git;branch=master;name=ipc-metadata"
+# Corresponds to tag: 3.42.00.02
+SRCREV_ipc-metadata = "e9a608608f1e9c0096112d5fcc41bb7af161a97e"
 
-DEPENDS = "ti-xdctools ti-sysbios"
+S_ipc-examples = "${WORKDIR}/git/ipc-examples"
+S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "ti-xdctools ti-sysbios doxygen-native"
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
 "
@@ -26,6 +36,7 @@ IPC_TARGETS = ""
 IPC_TARGETS_omap-a15 = "\
     gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
     ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
     ti.targets.arm.elf.M4F="${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
@@ -33,29 +44,73 @@ IPC_TARGETS_omap-a15 = "\
 IPC_TARGETS_keystone = " \
     gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+"
+
+IPC_TARGETS_c66x = " \
+    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
 "
 
 EXTRA_OEMAKE = "\
     PLATFORM=${PLATFORM} \
     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
     BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
-    ${IPC_TARGETS} -f ipc-bios.mak\
+    ${IPC_TARGETS} \
 "
+SRCIPK_SRC_DIR = "${D}${IPC_INSTALL_DIR_RECIPE}"
+
+RELEASE_TYPE = "GA"
+RELEASE_SUFFIX = ""
 
 do_compile() {
-  oe_runmake clean
-  oe_runmake all
+  oe_runmake -f ipc-bios.mak clean
+  oe_runmake -f ipc-bios.mak release
 }
 
 do_compile_append() {
-  sourceipk_do_create_srcipk
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
 }
 
 do_install() {
+    IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
+    # Copy docs and other meta files
     install -d ${D}${IPC_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
+    cp -pPrf  ${S_ipc-metadata}/exports/ipc_${IPC_VERSION}/* -d ${D}${IPC_INSTALL_DIR_RECIPE}
 
+    # Copy example folders corresponding to the platforms
+    if [  "${PLATFORM}" != "UNKNOWN" ]; then
+      install -d ${D}${IPC_INSTALL_DIR_RECIPE}/examples
+      cp -pPf ${S_ipc-examples}/src/examples/*.* ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
+      cp -pPf ${S_ipc-examples}/src/examples/makefile ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
+      cp -pPrf ${S_ipc-examples}/src/examples/${PLATFORM}* ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
+      if [ ! -z ${ALT_PLATFORM} ]; then
+        cp -pPrf ${S_ipc-examples}/src/examples/${ALT_PLATFORM}* ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
+      fi
+      find ${D}${IPC_INSTALL_DIR_RECIPE}/examples/ -name "*zip" -type f | xargs -I {} rm {}
+    fi
+
+    # Install firmware images
     install -d ${D}${base_libdir}/firmware
     find . -name "*.xe66" -type f | xargs -I {} install -m 0644 {} ${D}${base_libdir}/firmware/
     find . -name "*.xem4" -type f | xargs -I {} install -m 0644 {} ${D}${base_libdir}/firmware/
+
+    sourceipk_do_create_srcipk
 }
-- 
1.9.1


