Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88089E00AB3; Thu, 13 Sep 2018 11:21:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,T_FILL_THIS_FORM_SHORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95985E0093B
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 11:21:22 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DILLfv103561
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 13:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536862881;
	bh=4p8AOiDnZC/T3aXN+UocptSl5FN2iGc1qUP/Mz+olbs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZNftSsbAEFDfKahgaXPGv3o6NhzQ8Q6Gz64IId0CrI8042QOTrVbUbJ1ouFwQcVhf
	alPZ3S+GOjgqidrJZwGGJuP1f8zlfFtC2NQ34M3WroAPoD0FFE2KeaqdveooTvGkxf
	SsUPYOlodED+yJMzK70BrsIj+2al04AZvkOv2+Bk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DILLjQ012277
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 13:21:21 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 13:21:21 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 13:21:21 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DILKgY011751;
	Thu, 13 Sep 2018 13:21:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 13 Sep 2018 18:17:38 +0000
Message-ID: <20180913181739.27111-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180913181739.27111-1-denys@ti.com>
References: <20180913181739.27111-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/3] mathlib: add new recipe to build MATHLIB from source
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
X-List-Received-Date: Thu, 13 Sep 2018 18:21:23 -0000
Content-Type: text/plain

From: Jianzhong Xu <xuj@ti.com>

Signed-off-by: Jianzhong Xu <xuj@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/mathlib/mathlib-c66x.inc        | 29 --------
 recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb |  9 ---
 recipes-ti/mathlib/mathlib-c66x_git.bb     |  6 ++
 recipes-ti/mathlib/mathlib-c674x_git.bb    |  5 ++
 recipes-ti/mathlib/mathlib.inc             | 77 ++++++++++++++++++++++
 5 files changed, 88 insertions(+), 38 deletions(-)
 delete mode 100644 recipes-ti/mathlib/mathlib-c66x.inc
 delete mode 100644 recipes-ti/mathlib/mathlib-c66x_3.1.1.0.bb
 create mode 100644 recipes-ti/mathlib/mathlib-c66x_git.bb
 create mode 100644 recipes-ti/mathlib/mathlib-c674x_git.bb
 create mode 100644 recipes-ti/mathlib/mathlib.inc

diff --git a/recipes-ti/mathlib/mathlib-c66x.inc b/recipes-ti/mathlib/mathlib-c66x.inc
deleted file mode 100644
index 7951e6ca..00000000
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
index 50746fb9..00000000
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
index 00000000..28bf8c6e
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
index 00000000..8c042bbf
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
index 00000000..ccb1de60
--- /dev/null
+++ b/recipes-ti/mathlib/mathlib.inc
@@ -0,0 +1,77 @@
+SUMMARY = "MATHLIB contains optimized floating-point math functions for TI DSPs"
+HOMEPAGE = "http://git.ti.com/ep-processor-libraries/mathlib"
+LICENSE = "BSD-3-Clause"
+
+require ../includes/ti-paths.inc
+
+PV = "3_1_2_2"
+PR = "r0"
+
+COMPATIBLE_MACHINE = "am57xx-evm|keystone|c66x|omapl1"
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
+SRC_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git;protocol=git;branch=master"
+SRCREV = "195355db20f53295cfeef0bcfba0a8d8fdb0a753"
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
+
+	zip -9 -y -r -q ${DEPLOYDIR}/${MATHLIB_PACKAGE_NAME}.zip ./${MATHLIB_PACKAGE_NAME}
+	rm -r ./${MATHLIB_PACKAGE_NAME}
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${MATHLIB_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch"
-- 
2.17.1


