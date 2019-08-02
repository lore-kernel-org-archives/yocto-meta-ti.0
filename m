Return-Path: <jbergsagel@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 342CBE00BD5; Fri,  2 Aug 2019 10:36:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FFBAE00B31
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 10:36:53 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72Haqi7090939
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 12:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564767412;
	bh=dC0762otX7QfKnNDwfUg2pilnFPNSliiHwqrMw+3Wj0=;
	h=From:To:CC:Subject:Date;
	b=KBF+eeVlUEINR0fFTD8R6xaC8sO0EI70qmcV+EwMfxzh8OFX/vFms0/AO0EEIwIJo
	jh81XKRorYZT2NTjoZl7jZE0296OYRAaYcIDhV5UnNwCDs4N3E57xj/nBw0X5xR1RR
	POmD81YluLPiu2+PtVHAMCEir/UFVthX03TnN/Y8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72HaqhI121199
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 12:36:52 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 12:36:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 12:36:52 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72Haq80046326;
	Fri, 2 Aug 2019 12:36:52 -0500
Received: from localhost (udc0211050.dhcp.ti.com [128.247.77.185])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x72HaqZ22473; Fri, 2 Aug 2019 12:36:52 -0500 (CDT)
From: Jonathan Bergsagel <jbergsagel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 2 Aug 2019 12:34:46 -0500
Message-ID: <20190802173446.23892-1-jbergsagel@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Suman Anna <s-anna@ti.com>
Subject: [PATCH] ipc-lld: add AM65xx IPC echo_test firmware binaries
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
X-List-Received-Date: Fri, 02 Aug 2019 17:36:54 -0000
Content-Type: text/plain

Use IPC/LLD based IPC echo test firmware for AM65xx
Linux IPC testing.
Updated location of J721E firmware binaries as well,
with latest IPC/LLD commit.

Signed-off-by: Jonathan Bergsagel <jbergsagel@ti.com>
---
 recipes-bsp/ipc-lld/ipc-lld-fw-am65x_git.bb | 68 +++++++++++++++++++++
 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb       |  6 +-
 2 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 recipes-bsp/ipc-lld/ipc-lld-fw-am65x_git.bb

diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw-am65x_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw-am65x_git.bb
new file mode 100644
index 000000000000..afe3ce240816
--- /dev/null
+++ b/recipes-bsp/ipc-lld/ipc-lld-fw-am65x_git.bb
@@ -0,0 +1,68 @@
+SUMMARY = "AM65x R5 IPC Echo Test Firmware Binaries"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
+
+inherit deploy
+inherit update-alternatives
+
+COMPATIBLE_MACHINE = "am65xx"
+
+PV = "1.0-git${SRCPV}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PROTOCOL = "git"
+BRANCH = "master"
+SRCREV = "81392da08fab2b5cfc23d63dbe71b7244a6af477"
+
+SRC_URI = "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=${PROTOCOL};branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+R5_FW_DIR = "${S}/examples/echo_test/binaries/am65xx"
+
+# make sure that lib/firmware, and all its contents are part of the package
+FILES_${PN} += "${base_libdir}/firmware"
+
+# install the R5 ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
+do_install() {
+  install -d ${D}${base_libdir}/firmware/pdk-ipc
+  install -m 0644 ${R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+  install -m 0644 ${R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
+}
+
+TARGET_MCU_R5FSS0_0 = "am65x-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1 = "am65x-mcu-r5f0_1-fw"
+ALTERNATIVE_${PN} = "\
+                    am65x-mcu-r5f0_0-fw \
+                    am65x-mcu-r5f0_1-fw \
+                    "
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release.strip.xer5f"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.strip.xer5f"
+
+ALTERNATIVE_PRIORITY = "10"
+
+# copy the executables into the deploy directory
+do_deploy () {
+  install ${R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
+  install ${R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
+  install ${R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
+  install ${R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
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
diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
index f8157d8c6e5b..82cc11186aac 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
@@ -6,18 +6,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
 inherit deploy
 inherit update-alternatives
 
+COMPATIBLE_MACHINE = "j7-evm"
+
 PV = "1.0-git${SRCPV}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PROTOCOL = "git"
 BRANCH = "master"
-SRCREV = "66764a5f063db606ea9db23380694bfd7d4aeafb"
+SRCREV = "81392da08fab2b5cfc23d63dbe71b7244a6af477"
 
 SRC_URI = "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-R5_DSP_FW_DIR = "${S}/examples/echo_test/binaries"
+R5_DSP_FW_DIR = "${S}/examples/echo_test/binaries/j721e"
 
 # make sure that lib/firmware, and all its contents are part of the package
 FILES_${PN} += "${base_libdir}/firmware"
-- 
2.17.1


