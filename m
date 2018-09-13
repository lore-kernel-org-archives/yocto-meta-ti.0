Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1311CE00A16; Thu, 13 Sep 2018 14:02:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,T_FILL_THIS_FORM_SHORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2408DE006AF
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 14:02:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DL2Ya7020952
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 16:02:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536872554;
	bh=CasObeufU2QjKq2LS4L/FkuJN6rYHTkb2aV1/TIvnmU=;
	h=From:To:CC:Subject:Date;
	b=p59V9Vtxq+wYxA+v/Urt4MiiGgoNDf9CFvxrI8Rr3zAWnpt8l8BGciyxgOHQPuQl6
	HGjPcVtIpyilDtkhXPo/DYNlOyoHZpfW/KY8i1LeMs01Pf2wGfQdmH9DRGEt+p+Wn5
	vfOLJyPq1+CJoekIyVozb0BNs/cTw7pk/twXQTL8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DL2YGL004062
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 16:02:34 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 16:02:34 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 16:02:34 -0500
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DL2YAZ009248;
	Thu, 13 Sep 2018 16:02:34 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 13 Sep 2018 17:02:28 -0400
Message-ID: <1536872548-40269-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/3 v3] Added MATHLIB recipe to build MATHLIB from source.
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
X-List-Received-Date: Thu, 13 Sep 2018 21:02:36 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
Change from previous version of patch:
1. Removed COMPATIBLE_MACHINE
2. Corrected incorrect white spaces, indentations, blank lines.
---
---
 recipes-ti/mathlib/mathlib-c66x.inc        | 29 ------------
 recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb |  9 ----
 recipes-ti/mathlib/mathlib-c66x_git.bb     |  6 +++
 recipes-ti/mathlib/mathlib-c674x_git.bb    |  5 +++
 recipes-ti/mathlib/mathlib.inc             | 72 ++++++++++++++++++++++++++++++
 5 files changed, 83 insertions(+), 38 deletions(-)
 delete mode 100644 recipes-ti/mathlib/mathlib-c66x.inc
 delete mode 100644 recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb
 create mode 100644 recipes-ti/mathlib/mathlib-c66x_git.bb
 create mode 100644 recipes-ti/mathlib/mathlib-c674x_git.bb
 create mode 100644 recipes-ti/mathlib/mathlib.inc

diff --git a/recipes-ti/mathlib/mathlib-c66x.inc b/recipes-ti/mathlib/mathlib-c66x.inc
deleted file mode 100644
index 7951e6c..0000000
--- a/recipes-ti/mathlib/mathlib-c66x.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "MATHLIB contains optimized general-purpose signal-processing routines for TI DSPs"
-HOMEPAGE = "http://www.ti.com/tool/mathlib"
-SECTION = "devel"
-LICENSE = "BSD-3-Clause"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-unpack.inc
-
-COMPATIBLE_MACHINE = "omap-a15|keystone"
-
-SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/mathlib/${PV}/exports/${BINFILE};name=mathlib"
-
-S = "${WORKDIR}/mathlib-c66x-${PV}"
-
-BINFILE = "mathlib_c66x_${PV}_Linux.bin"
-TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
-TI_BIN_UNPK_CMDS = ""
-
-do_install() {
-    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-    install -d ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
-}
-
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN}-dev += "${MATHLIB_C66_INSTALL_DIR_RECIPE}"
-
-INSANE_SKIP_${PN}-dev = "arch"
diff --git a/recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb b/recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb
deleted file mode 100644
index 50746fb..0000000
--- a/recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require mathlib-c66x.inc
-
-PV = "3_1_1_0"
-PR = "r1"
-
-LIC_FILES_CHKSUM = "file://packages/ti/mathlib/mathlib.h;beginline=9;endline=35;md5=954ed7074e987be574989f985f1897db"
-
-SRC_URI[mathlib.md5sum] = "f3c9ad06dfcea780b5362c57a4bc48b8"
-SRC_URI[mathlib.sha256sum] = "85df897c94e8768e9a1f186c21702ed3887d39cda6dc67cb4580fa3f083e8925"
diff --git a/recipes-ti/mathlib/mathlib-c66x_git.bb b/recipes-ti/mathlib/mathlib-c66x_git.bb
new file mode 100644
index 0000000..28bf8c6
--- /dev/null
+++ b/recipes-ti/mathlib/mathlib-c66x_git.bb
@@ -0,0 +1,6 @@
+MATHLIB_BUILD_TARGET = "c66x"
+MATHLIB_INSTALL_DIR_RECIPE = "${MATHLIB_C66_INSTALL_DIR_RECIPE}"
+MATHLIB_INSTALL_DIR = "${MATHLIB_C66_INSTALL_DIR}"
+
+include mathlib.inc
+
diff --git a/recipes-ti/mathlib/mathlib-c674x_git.bb b/recipes-ti/mathlib/mathlib-c674x_git.bb
new file mode 100644
index 0000000..8c042bb
--- /dev/null
+++ b/recipes-ti/mathlib/mathlib-c674x_git.bb
@@ -0,0 +1,5 @@
+MATHLIB_BUILD_TARGET = "c674x"
+MATHLIB_INSTALL_DIR_RECIPE = "${MATHLIB_C674_INSTALL_DIR_RECIPE}"
+MATHLIB_INSTALL_DIR = "${MATHLIB_C674_INSTALL_DIR}"
+
+include mathlib.inc
diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
new file mode 100644
index 0000000..56a9fb4
--- /dev/null
+++ b/recipes-ti/mathlib/mathlib.inc
@@ -0,0 +1,72 @@
+SUMMARY = "MATHLIB contains optimized floating-point math functions for TI DSPs"
+HOMEPAGE = "http://git.ti.com/ep-processor-libraries/mathlib"
+LICENSE = "BSD-3-Clause"
+
+require ../includes/ti-paths.inc
+
+PV = "3_1_2_2"
+PR = "r0"
+
+DEPENDS = "ti-cgt6x-native \
+           ti-xdctools-native \
+           ti-sysbios \
+           doxygen-native \
+           zip-native \
+           swtools "
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://git@bitbucket.itg.ti.com/proc_libs/mathlib.git;protocol=ssh;branch=mathlib_yocto_debug"
+SRCREV = "21cbf86f43b934050e5396099d8c48d773c63db6"
+
+LIC_FILES_CHKSUM = "file://ti/mathlib/src/acosdp/acosdp.h;beginline=1;endline=35;md5=c133f7e139b46385906c861dd9552250"
+
+export MATHLIB_WORK_DIR="${S}"
+export CGTOOLS_INSTALL_DIR  = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export C64PCODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
+export C674CODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
+export C66CODEGENTOOL ="${CGTOOLS_INSTALL_DIR}"
+export SWTOOLS_PATH = "${SWTOOLS_INSTALL_DIR}/ti/mas/swtools"
+export XDCBUILDCFG="${SWTOOLS_PATH}/config.bld"
+
+PATH_append = ":${XDC_INSTALL_DIR}"
+
+XDCPATH.="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
+XDCPATH.="${SWTOOLS_INSTALL_DIR};${MATHLIB_WORK_DIR};"
+
+export XDCPATH
+
+MATHLIB_PACKAGE_NAME = "mathlib_${MATHLIB_BUILD_TARGET}_${PV}"
+
+do_compile() {
+	cd ${MATHLIB_WORK_DIR}/ti/mathlib;
+	xdc XDCARGS="${MATHLIB_BUILD_TARGET} bundle" XDCOPTIONS="-v"
+}
+
+do_install() {
+	install -d ${D}${MATHLIB_INSTALL_DIR_RECIPE}
+
+	find -name "${MATHLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${MATHLIB_INSTALL_DIR_RECIPE} \;
+	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/* ${D}${MATHLIB_INSTALL_DIR_RECIPE}
+	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/.metadata ${D}${MATHLIB_INSTALL_DIR_RECIPE}
+	rm -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib
+}
+
+inherit deploy
+addtask deploy before do_build after do_install
+
+do_deploy() {
+	install -d ${DEPLOYDIR}
+	# zip up files in ${D}${MATHLIB_INSTALL_DIR_RECIPE}
+	# and place the zip file in ${DEPLOYDIR}
+	mkdir ./${MATHLIB_PACKAGE_NAME}
+	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/* ./${MATHLIB_PACKAGE_NAME}
+	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/.metadata ./${MATHLIB_PACKAGE_NAME}
+	zip -9 -y -r -q ${DEPLOYDIR}/${MATHLIB_PACKAGE_NAME}.zip ./${MATHLIB_PACKAGE_NAME}
+	rm -r ./${MATHLIB_PACKAGE_NAME}
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${MATHLIB_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch"
-- 
1.9.1


