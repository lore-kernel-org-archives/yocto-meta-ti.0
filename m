Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 41080E0098A; Fri, 28 Jun 2019 05:41:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3B9CE00942
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 05:41:05 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5SCf5DS000946
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 07:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561725665;
	bh=sAet5a3ETpGDteS5XETJceHz34kOSMCYzJxLDrTmokY=;
	h=From:To:CC:Subject:Date;
	b=OPjG/35Mx0D7U/aNcfP8m9fvvFgUkRqrrcs6D9mfH3cZ6OvIkIItu7SyjJ+P+7sRr
	CGi5VJUGq3owHMARsdHx/NQfyQLopNu4YJBAyJulB3HX10OestQ9ga7xmeV56X3AJv
	NjKauUFthNvCsMITUYFZs0y2WdpZhWVg8ZTHJh2M=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5SCf5BO046950
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 07:41:05 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 28 Jun 2019 07:41:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 28 Jun 2019 07:41:04 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5SCf4EU099562;
	Fri, 28 Jun 2019 07:41:04 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Jun 2019 08:24:24 -0400
Message-ID: <1561724664-7146-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.01][PATCH] csl-rti-dwwdtest-fw: add MCU watchdog test firmware
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
X-List-Received-Date: Fri, 28 Jun 2019 12:41:06 -0000
Content-Type: text/plain

* add firmware for the R5F core to test the detection of watchdog
  timeout events to trigger SOC reset though DMSC.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../common-csl-ip/csl-rti-dwwdtest-fw_git.bb       | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb

diff --git a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb b/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
new file mode 100644
index 0000000..55e583b
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
@@ -0,0 +1,77 @@
+SUMMARY = "MCU Watchdog test firmware"
+DESCRIPTION = "Firmware for the R5F core to test the detection of watchdog timeout events to trigger SOC reset though DMSC."
+
+require recipes-bsp/common-csl-ip/common-csl-ip.inc
+require recipes-ti/includes/ti-paths.inc
+
+LIC_FILES_CHKSUM = "file://../../../COPYING.txt;md5=5857833e20836213677fac33f9aded21"
+
+S = "${WORKDIR}/${CSL_GIT_DESTSUFFIX}/example/rti/rti_dwwdtest_app"
+
+COMPATIBLE_MACHINE = "am65xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS = "ti-cgt-arm-native \
+           ti-pdk-build-rtos \
+           uart-lld-rtos \
+           board-rtos \
+           sciclient-rtos \
+           udma-lld-rtos"
+
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export TOOLCHAIN_PATH_R5 = "${M4_TOOLCHAIN_INSTALL_DIR}"
+
+EXTRA_OEMAKE = "WDT_RESET=enable DEST_ROOT=${S}"
+
+do_compile() {
+    for soc in ${TI_PDK_LIMIT_SOCS}
+    do
+        for board in ${TI_PDK_LIMIT_BOARDS}
+        do
+            oe_runmake SOC=$soc BOARD=$board
+        done
+    done
+}
+
+do_install() {
+    install -d ${D}${base_libdir}/firmware/rti_dwwdtest
+
+    for board in ${TI_PDK_LIMIT_BOARDS}
+    do
+        install -d ${D}${base_libdir}/firmware/rti_dwwdtest/$board
+        install -m 0644 csl_rti_dwwd_test_app/bin/$board/csl_rti_dwwd_test_app_mcu1_0_release.xer5f \
+                        ${D}${base_libdir}/firmware/rti_dwwdtest/$board
+    done
+}
+
+# Create separate package for each firmware so we can utilize
+# update-alternatives.
+PACKAGES =+ "${PN}-evm ${PN}-idk"
+RDEPENDS_${PN} = "${PN}-evm ${PN}-idk"
+ALLOW_EMPTY_${PN} = "1"
+
+FILES_${PN}-evm = "${base_libdir}/firmware/rti_dwwdtest/am65xx_evm"
+FILES_${PN}-idk = "${base_libdir}/firmware/rti_dwwdtest/am65xx_idk"
+
+# We are packaging R5 firmware
+INSANE_SKIP_${PN}-evm = "arch"
+INSANE_SKIP_${PN}-idk = "arch"
+
+# Configure update-alternatives as there may be other firmwares provided in an
+# image.
+inherit update-alternatives
+
+# It might be nice to dynamically declare the following based on
+# TI_PDK_LIMIT_BOARDS, but that is probably overkill.
+ALTERNATIVE_${PN}-evm = "am65x-mcu-r5f0_0-fw"
+ALTERNATIVE_${PN}-idk = "am65x-mcu-r5f0_0-fw"
+
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/am65x-mcu-r5f0_0-fw"
+
+ALTERNATIVE_TARGET_${PN}-evm = "${base_libdir}/firmware/rti_dwwdtest/am65xx_evm/csl_rti_dwwd_test_app_mcu1_0_release.xer5f"
+ALTERNATIVE_TARGET_${PN}-idk = "${base_libdir}/firmware/rti_dwwdtest/am65xx_idk/csl_rti_dwwd_test_app_mcu1_0_release.xer5f"
+
+# Use a lesser priority than ipc example fw
+# See meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb
+ALTERNATIVE_PRIORITY_${PN}-evm = "4"
+ALTERNATIVE_PRIORITY_${PN}-idk = "3"
-- 
2.7.4


