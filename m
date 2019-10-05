Return-Path: <sjha@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E629E00A04; Sat,  5 Oct 2019 07:14:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04EF4E00924
	for <meta-ti@yoctoproject.org>; Sat,  5 Oct 2019 07:14:17 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x95EEHnh070028
	for <meta-ti@yoctoproject.org>; Sat, 5 Oct 2019 09:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570284857;
	bh=uFEejnDCSVCw3XCmnsDFK66MyRtrxAmkvcVsiPtpFAU=;
	h=From:To:CC:Subject:Date;
	b=Ix1CNTYERile74H6UcMOgJDKasdMuocWU0OQRIL7nig6QTSEoO2rqG8x5ObBwIqdR
	nUe98Vifc4g3yEOjsdRqE9grC31YmV1P+Jh6lINViNEWdMbBe25jxzwrNgSp7Z0XSx
	RvQRkdspaYfkPi9VDj0jdon/VrtjVEE4F4SnMWyE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x95EEHCt125847
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sat, 5 Oct 2019 09:14:17 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sat, 5 Oct 2019 09:14:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sat, 5 Oct 2019 09:14:17 -0500
Received: from uda0132919.dal.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x95EEGYM018432;
	Sat, 5 Oct 2019 09:14:16 -0500
From: Santosh Jha <sjha@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sat, 5 Oct 2019 09:14:28 -0500
Message-ID: <20191005141428.30497-1-sjha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] IPCLLD: Added ipc_echo_testb for j721e RR5Fs
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
X-List-Received-Date: Sat, 05 Oct 2019 14:14:19 -0000
Content-Type: text/plain

- Added R5F binaries of ipc_echo_testb
- Added alternate target for symbolic link

Signed-off-by: Santosh Jha <sjha@ti.com>

---

Fixes: compilation issue for AM65xx

---
---
 .../ipc-lld/ipc-lld-examples-rtos_git.bb      | 108 +++++++++++++++++-
 recipes-bsp/ipc-lld/ipc-lld.inc               |   4 +-
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
index 44f76675..75db2162 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
@@ -6,8 +6,9 @@ DEPENDS += " ipc-lld-rtos common-csl-ip-rtos sciclient-rtos board-rtos"
 
 REMOTE_FW_DIR = "${S}/examples/echo_test/yocto_bin"
 REMOTE_FW_BIN_DIR = "${REMOTE_FW_DIR}/ipc_echo_test/bin"
+REMOTE_FWB_BIN_DIR = "${REMOTE_FW_DIR}/ipc_echo_testb/bin"
 
-DST_BIN_PATH = "${base_libdir}/firmware/pdk-ipc/"
+DST_BIN_PATH = "${base_libdir}/firmware/pdk-ipc"
 
 do_configure[noexec] = "1"
 
@@ -35,9 +36,114 @@ do_install() {
             #removing map files copied in previous line
             rm ${D}${DST_BIN_PATH}/*.map
         done
+
+        #remove mpu binarires
+        rm ${D}${DST_BIN_PATH}/ipc_echo_test_mpu1_0_release.xa*
+
     done
 }
 
+do_install_append_j7-evm() {
+    #copy ipc_echo_testb binaries for J721
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_0_release.xer5f ${D}${DST_BIN_PATH}
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_1_release.xer5f ${D}${DST_BIN_PATH}
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_0_release.xer5f ${D}${DST_BIN_PATH}
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu2_1_release.xer5f ${D}${DST_BIN_PATH}
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_0_release.xer5f ${D}${DST_BIN_PATH}
+    install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_1_release.xer5f ${D}${DST_BIN_PATH}
+}
+
+
+# Set up names for the firmwares
+ALTERNATIVE_${PN}_am65xx = "\
+                    am65x-mcu-r5f0_0-fw \
+                    am65x-mcu-r5f0_1-fw \
+                    "
+ALTERNATIVE_${PN}_j7-evm = "\
+                    j7-mcu-r5f0_0-fw \
+                    j7-mcu-r5f0_1-fw \
+                    j7-main-r5f0_0-fw \
+                    j7-main-r5f0_1-fw \
+                    j7-main-r5f1_0-fw \
+                    j7-main-r5f1_1-fw \
+                    j7-c66_0-fw \
+                    j7-c66_1-fw \
+                    j7-c71_0-fw\
+                    "
+
+# Set up link names for the firmwares
+
+TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1_am65xx = "am65x-mcu-r5f0_1-fw"
+
+TARGET_MCU_R5FSS0_0_j7-evm = "j7-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1_j7-evm = "j7-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0_j7-evm = "j7-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1_j7-evm = "j7-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0_j7-evm = "j7-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1_j7-evm = "j7-main-r5f1_1-fw"
+TARGET_C66_0_j7-evm = "j7-c66_0-fw"
+TARGET_C66_1_j7-evm = "j7-c66_1-fw"
+TARGET_C7X_j7-evm = "j7-c71_0-fw"
+
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
+
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
+ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
+ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
+
+# Create the firmware alternatives
+
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release.xer5f"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.xer5f"
+
+ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release.xer5f"
+ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release.xer5f"
+ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release.xe66"
+ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release.xe66"
+ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release.xe71"
+
+ALTERNATIVE_PRIORITY = "10"
+
+# copy the executables into the deploy directory
+
+do_deploy() {
+    :
+}
+
+do_deploy_am65xx() {
+    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
+}
+
+do_deploy_j7-evm() {
+    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FWB_BIN_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${DEPLOYDIR}/
+    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${DEPLOYDIR}/
+    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${DEPLOYDIR}/
+    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_c7x_1_release.xe71 ${DEPLOYDIR}/
+}
 # make sure that lib/firmware, and all its contents are part of the package
 FILES_${PN} += "${base_libdir}/firmware"
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-lld.inc
index 1ecf8dbf..06683a06 100644
--- a/recipes-bsp/ipc-lld/ipc-lld.inc
+++ b/recipes-bsp/ipc-lld/ipc-lld.inc
@@ -18,7 +18,7 @@ SRC_URI = "${IPCLLD_GIT_URI};protocol=${IPCLLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${IPCLLD_SRCREV}"
 PV = "01.00.00.00"
-PR = "r0"
+PR = "r1"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
@@ -33,3 +33,5 @@ export PDK_IPC_ROOT_PATH = "${IPCLLD_PACKAGE_BASE}/package/all/pdk_/packages"
 PDK_COMP_LINK_TEXT = "IPCLLD"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${PDK_INSTALL_PATH} "
+
+TI_PDK_LIMIT_CORES_append_am65xx-evm = " mcu1_1 "
-- 
2.17.1


