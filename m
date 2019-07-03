Return-Path: <jbergsagel@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1AE56E00C43; Tue,  2 Jul 2019 19:45:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D49DE0090E
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2019 19:45:20 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x632jJk0004761
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 21:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562121919;
	bh=AI2eafswaM7dR36n7jTPUNX+BqocB1q/BPeU+ltpoKE=;
	h=From:To:CC:Subject:Date;
	b=VM+1hMM9U6Fo/8zgEowINcHnkil0if+BjZ40JN7Dymp0BNskKj1Gdimlxe1DjzZ4p
	h2Ry+k56qfgu/vYVu0qcZjb2DnDNERp8C/PAb8LYKj4fDCjgpvHYVgUeCBwFc2ZgSJ
	AaYYr9JwWpfD65KsGVdFlgCyG6A5pSUmZ/GKURRs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x632jJvK021253
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 21:45:19 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 21:45:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 21:45:18 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x632jIcL124253;
	Tue, 2 Jul 2019 21:45:18 -0500
Received: from localhost (udc0211050.dhcp.ti.com [128.247.77.185])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x632jIm04402; Tue, 2 Jul 2019 21:45:18 -0500 (CDT)
From: Jonathan Bergsagel <jbergsagel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 2 Jul 2019 21:43:52 -0500
Message-ID: <20190703024352.21891-1-jbergsagel@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Santosh Jha <sjha@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v3] ipc-lld: add J721E IPC echo_test firmware binaries
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
X-List-Received-Date: Wed, 03 Jul 2019 02:45:23 -0000
Content-Type: text/plain

Adds the R5 and DSP echo_test firmware binaries to be
used for testing Linux IPC on J721E SOCs.

Signed-off-by: Jonathan Bergsagel <jbergsagel@ti.com>
---
 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb | 146 ++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb

diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
new file mode 100644
index 000000000000..f8157d8c6e5b
--- /dev/null
+++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
@@ -0,0 +1,146 @@
+SUMMARY = "R5 and DSP IPC Echo Test Firmware Binaries"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
+
+inherit deploy
+inherit update-alternatives
+
+PV = "1.0-git${SRCPV}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PROTOCOL = "git"
+BRANCH = "master"
+SRCREV = "66764a5f063db606ea9db23380694bfd7d4aeafb"
+
+SRC_URI = "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=${PROTOCOL};branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+R5_DSP_FW_DIR = "${S}/examples/echo_test/binaries"
+
+# make sure that lib/firmware, and all its contents are part of the package
+FILES_${PN} += "${base_libdir}/firmware"
+
+# install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
+do_install() {
+  install -d ${D}${base_libdir}/firmware/pdk-ipc
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
+}
+
+TARGET_MCU_R5FSS0_0 = "j7-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1 = "j7-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0 = "j7-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1 = "j7-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0 = "j7-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1 = "j7-main-r5f1_1-fw"
+TARGET_C66_0 = "j7-c66_0-fw"
+TARGET_C66_1 = "j7-c66_1-fw"
+TARGET_C7X = "j7-c71_0-fw"
+ALTERNATIVE_${PN} = "\
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
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
+ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
+ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
+ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release.strip.xer5f"
+ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release.strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release.strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release.strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release.strip.xer5f"
+ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release.strip.xe66"
+ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release.strip.xe66"
+ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release.strip.xe71"
+
+ALTERNATIVE_PRIORITY = "10"
+
+# copy the executables into the deploy directory
+do_deploy () {
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${DEPLOYDIR}/
+  install ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${DEPLOYDIR}/
+}
+addtask deploy after do_install before do_build
+
+# This is used to prevent the build system to strip the executables
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+# This is used to prevent the build system to split the debug info in a separate file
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
+INSANE_SKIP_${PN} += "arch"
+
+# we don't want to configure and build the source code
+do_compile[noexec] = "1"
+do_configure[noexec] = "1"
-- 
2.17.1


