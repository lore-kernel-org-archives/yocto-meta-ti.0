Return-Path: <sjha@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDD6CE00DDC; Thu, 31 Oct 2019 12:52:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87060E00973
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2019 12:52:47 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9VJqlUA105579
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2019 14:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572551567;
	bh=LkrQz/oaCYjrF7K/JjcTkZBC7WkMqWMlNlPsVL1n+UY=;
	h=From:To:CC:Subject:Date;
	b=Dq+WlN5PAd7G6SWJbthNr0UNODdcAm0IeyAEQN2NvidYV6qT8Gr3GEGGR+haT5/lz
	Og3w/Zjn4i/sZq42Kko1cPUxhx6Goi7Xt2jiNg/0hiZH2cF6brDYuONgVK53tSQOLH
	hTRCFOoBm6Ta3Xmz4XDnC/fQvRDQ4h6QyDKoP9YE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9VJqlbu000766
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2019 14:52:47 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 31 Oct 2019 14:52:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 31 Oct 2019 14:52:33 -0500
Received: from uda0132919.dal.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9VJqkZp063122;
	Thu, 31 Oct 2019 14:52:46 -0500
From: Santosh Jha <sjha@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 31 Oct 2019 14:53:09 -0500
Message-ID: <20191031195309.26946-1-sjha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 5] ipc-lld: inherit update-alternatives for softlink
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
X-List-Received-Date: Thu, 31 Oct 2019 19:52:51 -0000
Content-Type: text/plain

- Fixed softlink  - inherit update-alternatives
- Added all-bios binaries in install

Signed-off-by: Santosh Jha <sjha@ti.com>

---
Changes:
 - Removed 'inherit deploy'
 - Updated Commit message
 - Removed deploy appends
 - Fixed typo in commit message
 - Modified the script to use stripped image for
   symbolic link
 - removed {PN}-src, renamed allrtos to rtos
---
---
 .../ipc-lld/ipc-lld-examples-rtos_git.bb      | 78 +++++++++----------
 recipes-bsp/ipc-lld/ipc-lld.inc               |  2 +-
 2 files changed, 38 insertions(+), 42 deletions(-)

diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
index 75db2162..6a3e233f 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
@@ -2,11 +2,16 @@ SUMMARY = "echo_test for IPC-LLD"
 
 require ipc-lld.inc
 
+inherit update-alternatives
+
 DEPENDS += " ipc-lld-rtos common-csl-ip-rtos sciclient-rtos board-rtos"
 
-REMOTE_FW_DIR = "${S}/examples/echo_test/yocto_bin"
+REMOTE_FW_DIR = "${S}/examples/yocto_bin"
 REMOTE_FW_BIN_DIR = "${REMOTE_FW_DIR}/ipc_echo_test/bin"
 REMOTE_FWB_BIN_DIR = "${REMOTE_FW_DIR}/ipc_echo_testb/bin"
+RTOS_ALL_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex02_bios_multicore_echo_test/bin"
+RTOS_2_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex01_bios_2core_echo_test/bin"
+LINUX_2_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex03_linux_bios_2core_echo_test/bin"
 
 DST_BIN_PATH = "${base_libdir}/firmware/pdk-ipc"
 
@@ -25,13 +30,18 @@ do_compile() {
 }
 
 do_install() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
     install -d ${D}${DST_BIN_PATH}
 
+    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex02_bios_multicore_echo_test/bin -d ${D}/ex02_bios_multicore_echo_test
+    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex01_bios_2core_echo_test/bin -d ${D}/ex01_bios_2core_echo_test
+    cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex03_linux_bios_2core_echo_test/bin -d ${D}/ex03_linux_bios_2core_echo_test
+
     for board in ${TI_PDK_LIMIT_BOARDS}
     do
         for core in ${TI_PDK_LIMIT_CORES}
         do
-            install -m 0644 ${REMOTE_FW_BIN_DIR}/$board/ipc_echo_test_${core}_release.x* ${D}${DST_BIN_PATH}
+            install -m 0644 ${REMOTE_FW_BIN_DIR}/$board/ipc_echo_test_${core}_release* ${D}${DST_BIN_PATH}
 
             #removing map files copied in previous line
             rm ${D}${DST_BIN_PATH}/*.map
@@ -51,6 +61,13 @@ do_install_append_j7-evm() {
     install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_1_release.xer5f ${D}${DST_BIN_PATH}
     install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_0_release.xer5f ${D}${DST_BIN_PATH}
     install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_1_release.xer5f ${D}${DST_BIN_PATH}
+
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_0_release_strip.xer5f ${D}${DST_BIN_PATH}
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_1_release_strip.xer5f ${D}${DST_BIN_PATH}
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_0_release_strip.xer5f ${D}${DST_BIN_PATH}
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_1_release_strip.xer5f ${D}${DST_BIN_PATH}
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_0_release_strip.xer5f ${D}${DST_BIN_PATH}
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_1_release_strip.xer5f ${D}${DST_BIN_PATH}
 }
 
 
@@ -101,53 +118,32 @@ ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
 
 # Create the firmware alternatives
 
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release.xer5f"
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.xer5f"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
 
-ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release.xer5f"
-ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release.xer5f"
-ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release.xe66"
-ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release.xe66"
-ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release.xe71"
+ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release_strip.xe66"
+ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66"
+ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
 
 ALTERNATIVE_PRIORITY = "10"
 
-# copy the executables into the deploy directory
-
-do_deploy() {
-    :
-}
+#add source and all rtos binaries package
+PACKAGES =+ "${PN}-rtos"
 
-do_deploy_am65xx() {
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
-}
-
-do_deploy_j7-evm() {
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${DEPLOYDIR}/
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${DEPLOYDIR}/
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c7x_1_release.xe71 ${DEPLOYDIR}/
-}
 # make sure that lib/firmware, and all its contents are part of the package
 FILES_${PN} += "${base_libdir}/firmware"
-FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+FILES_${PN}-rtos += "ex02_bios_multicore_echo_test"
+FILES_${PN}-rtos += "ex01_bios_2core_echo_test"
+FILES_${PN}-rtos += "ex03_linux_bios_2core_echo_test"
 
 INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
+INSANE_SKIP_${PN}-rtos = "arch ldflags file-rdeps"
 
 INSANE_SKIP_${PN}-dbg = "arch"
diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-lld.inc
index 06683a06..243678f4 100644
--- a/recipes-bsp/ipc-lld/ipc-lld.inc
+++ b/recipes-bsp/ipc-lld/ipc-lld.inc
@@ -18,7 +18,7 @@ SRC_URI = "${IPCLLD_GIT_URI};protocol=${IPCLLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${IPCLLD_SRCREV}"
 PV = "01.00.00.00"
-PR = "r1"
+PR = "r2"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
-- 
2.17.1


