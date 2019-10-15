Return-Path: <sjha@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3384BE00D4F; Tue, 15 Oct 2019 05:20:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69219E00D00
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 05:20:41 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9FCKePf122551
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 07:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571142040;
	bh=fqPmeK/UmXF0bbWNFQdTwff455cf3+eUSLtN7OU2/V0=;
	h=From:To:CC:Subject:Date;
	b=iMpchaaa286U1s1qVtY+u6CFK9KfAx5E2QUJdwsx5zysS0Cz2OU8Jvi/tnGRLrM8p
	paKBVlMJuRnWd1pSgJNvC7AD1ZRmmGDG67L5C+AhDScZiyG1h2JPNbJI0GnTzl//QU
	Bm1pJSfWbPntMvMx990tQuVKJl6NKbWDJ5UnwvHo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9FCKevD128343
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 07:20:40 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 15 Oct 2019 07:20:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 15 Oct 2019 07:20:40 -0500
Received: from uda0132919.dal.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9FCKeF8070617;
	Tue, 15 Oct 2019 07:20:40 -0500
From: Santosh Jha <sjha@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 15 Oct 2019 07:20:42 -0500
Message-ID: <20191015122042.28104-1-sjha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 2] ipc-lld: inherit update-alternatives for softlink
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
X-List-Received-Date: Tue, 15 Oct 2019 12:20:42 -0000
Content-Type: text/plain

- Fixed softlink  - inherit update-alternatives
- Added all-bios binaries in install

---
Changes:
 - Removed 'inherit deploy'
 - Updated Commit message
 - Removed deploy appends
 - Fixed typo in commit message
---

Signed-off-by: Santosh Jha <sjha@ti.com>

Signed-off-by: Santosh Jha <sjha@ti.com>
---
 .../ipc-lld/ipc-lld-examples-rtos_git.bb      | 45 +++++++------------
 recipes-bsp/ipc-lld/ipc-lld.inc               |  2 +-
 2 files changed, 17 insertions(+), 30 deletions(-)

diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
index 75db2162..e4e8f09f 100644
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
 
@@ -116,37 +121,19 @@ ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test
 
 ALTERNATIVE_PRIORITY = "10"
 
-# copy the executables into the deploy directory
-
-do_deploy() {
-    :
-}
-
-do_deploy_am65xx() {
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
-    install ${REMOTE_FW_BIN_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
-}
+#add source and all rtos binaries package
+PACKAGES =+ "${PN}-src"
+PACKAGES =+ "${PN}-allrtos"
 
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
+FILES_${PN}-src += "${PDK_INSTALL_DIR_RECIPE}/packages"
+FILES_${PN}-allrtos_append_am65xx += "${RTOS_ALL_CORES_BIN_DIR}/am65xx_evm"
+FILES_${PN}-allrtos_append_j7-evm += "${RTOS_ALL_CORES_BIN_DIR}/j721e_evm"
+FILES_${PN}-allrtos_append_am65xx += "${RTOS_2_CORES_BIN_DIR}/am65xx_evm"
+FILES_${PN}-allrtos_append_j7-evm += "${RTOS_2_CORES_BIN_DIR}/j721e_evm"
+FILES_${PN}-allrtos_append_am65xx += "${LINUX_2_CORES_BIN_DIR}/am65xx_evm"
+FILES_${PN}-allrtos_append_j7-evm += "${LINUX_2_CORES_BIN_DIR}/j721e_evm"
 
 INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
 
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


