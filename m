Return-Path: <h-gou@TI.COM>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7BD15E00BAD; Tue, 11 Jul 2017 12:09:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14E68E00BA2
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 12:09:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6BJ9Vc5020082
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 14:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499800171;
	bh=rX5azsYjiSdMLoaKxfS5C+Y9aIrAidyyWgnsziiR3QE=;
	h=From:To:CC:Subject:Date;
	b=EcsqJWiLsCKsURHFYFqvhdLC9JDuGSOfiQUNHDqqEFMn9WJSvUvbW20LMLvnvLmhB
	RdeSmaVy5GYdCNPSkPHsX3FLS2mWGwoWl7VTp3NNsrOPEjTy14n+FsxAfZ0BL85vt1
	FZb8yb2/1489BCwG2oEUTkmMKjY4glSClqSeSugY=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6BJ9VUq024441
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 14:09:31 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Jul 2017 14:09:31 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6BJ9VkX002811;	Tue, 11 Jul 2017 14:09:31 -0500
From: Hongmei Gou <h-gou@TI.COM>
To: <meta-ti@yoctoproject.org>
Date: Tue, 11 Jul 2017 15:09:28 -0400
Message-ID: <1499800168-27634-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] icss-emac-lld*: upstream version 1.0.0.7C with recipes for linux user space
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
X-List-Received-Date: Tue, 11 Jul 2017 19:09:34 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../icss-emac-lld/icss-emac-lld-test_git.bb        | 47 ++++++++++++++++++++++
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc        | 22 ++++++++++
 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     | 26 ++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld.inc
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
new file mode 100644
index 0000000..f62bf33
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
@@ -0,0 +1,47 @@
+DESCRIPTION = "TI ICSS-EMAC low level driver tests"
+
+DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal"
+
+DEPENDS_append_ti33x = " starterware"
+DEPENDS_append_ti43x = " starterware"
+
+include icss-emac-lld.inc
+
+PR = "${INC_PR}.0"
+
+COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
+
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} ICSS_EMAC_SRC_DIR=${S}"
+
+do_compile_am57xx-evm () {
+#   Build the tests
+    oe_runmake tests DEVICE="am571x" TARGET="SOC_AM571x"
+    oe_runmake clean
+    oe_runmake tests DEVICE="am572x" TARGET="SOC_AM572x"
+}
+
+do_compile_ti33x () {
+#   Build the tests
+    oe_runmake tests DEVICE="am335x" TARGET="SOC_AM335x"
+}
+
+do_compile_ti43x () {
+#   Build the tests
+    oe_runmake tests DEVICE="am437x" TARGET="SOC_AM437x"
+}
+
+do_install_am57xx-evm () {
+#   Install the binary
+    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am571x" TARGET="SOC_AM571x"
+    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am572x" TARGET="SOC_AM572x"
+}
+
+do_install_ti33x () {
+#   Install the binary
+    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am335x" TARGET="SOC_AM335x"
+}
+
+do_install_ti43x () {
+#   Install the binary
+    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am437x" TARGET="SOC_AM437x"
+}
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
new file mode 100644
index 0000000..8e2ffd4
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
@@ -0,0 +1,22 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://icss_emacDrv.h;beginline=1;endline=40;md5=88d270788c1d8516511304f11a28586d"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|k2g-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+ICSS_EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/icss-emac.git"
+ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
+ICSS_EMAC_LLD_GIT_BRANCH = "master"
+ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
+
+# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.07C"
+ICSS_EMAC_LLD_SRCREV = "08cb0540eeab7721fe82b603cb6285393f314117"
+
+BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
+SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
+PV = "01.00.00.07C"
+INC_PR = "r0"
+
+S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
new file mode 100644
index 0000000..272529b
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "TI ICSS-EMAC low level driver library"
+
+DEPENDS="common-csl-ip pruss-lld osal"
+
+include icss-emac-lld.inc
+
+PR = "${INC_PR}.0"
+
+COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
+
+TARGET_NAME_am57xx-evm = "SOC_AM572x"
+TARGET_NAME_ti33x = "SOC_AM335x"
+TARGET_NAME_ti43x = "SOC_AM437x"
+
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} TARGET=${TARGET_NAME}"
+
+do_compile () {
+#   Build the lib
+    oe_runmake clean
+    oe_runmake lib
+}
+
+do_install () {
+#   Install the lib
+    oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
-- 
1.9.1


