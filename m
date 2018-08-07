Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1AE1AE00805; Tue,  7 Aug 2018 07:46:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,T_FILL_THIS_FORM_SHORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0DC5E007D1
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2018 07:46:00 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w77Ek0dJ029885
	for <meta-ti@yoctoproject.org>; Tue, 7 Aug 2018 09:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533653160;
	bh=t1I5a3cpxKCTDoK7n27UQ3n8YQTqd6RsF84zeI/qg6A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Khd2yQ2VLaMxLUb9/Ef2o3cZp8yj9cMqJIwaNrJmvil1O24FOQ5XfO/Fzg3HEO2Ej
	jsawm+YQSQ8vupYL0cix7RmUs5X14Jg0hzOYXqcw+/+2K516mAalVMdhiOYDvcD7lp
	HlpEb3mk2JYwV113oQuY1NzJ5c3pEPiSdsBfXv7w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77Ek0IR003069
	for <meta-ti@yoctoproject.org>; Tue, 7 Aug 2018 09:46:00 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 7 Aug 2018 09:46:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 7 Aug 2018 09:46:00 -0500
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77EjrZ8027637;
	Tue, 7 Aug 2018 09:45:59 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 Aug 2018 10:45:46 -0400
Message-ID: <1533653146-29074-3-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1533653146-29074-1-git-send-email-xuj@ti.com>
References: <1533653146-29074-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 3/3] Added DSPLIB recipe to build DSPLIB from source.
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
X-List-Received-Date: Tue, 07 Aug 2018 14:46:02 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-ti/dsplib/dsplib-c64xp_git.bb    |  9 ++++
 recipes-ti/dsplib/dsplib-c66x.inc        | 30 ------------
 recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb |  9 ----
 recipes-ti/dsplib/dsplib-c66x_git.bb     | 10 ++++
 recipes-ti/dsplib/dsplib-c674x_git.bb    |  9 ++++
 recipes-ti/dsplib/dsplib.inc             | 79 ++++++++++++++++++++++++++++++++
 recipes-ti/includes/ti-paths.inc         |  4 +-
 7 files changed, 110 insertions(+), 40 deletions(-)
 create mode 100644 recipes-ti/dsplib/dsplib-c64xp_git.bb
 delete mode 100644 recipes-ti/dsplib/dsplib-c66x.inc
 delete mode 100644 recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
 create mode 100644 recipes-ti/dsplib/dsplib-c66x_git.bb
 create mode 100644 recipes-ti/dsplib/dsplib-c674x_git.bb
 create mode 100644 recipes-ti/dsplib/dsplib.inc

diff --git a/recipes-ti/dsplib/dsplib-c64xp_git.bb b/recipes-ti/dsplib/dsplib-c64xp_git.bb
new file mode 100644
index 0000000..1038d44
--- /dev/null
+++ b/recipes-ti/dsplib/dsplib-c64xp_git.bb
@@ -0,0 +1,9 @@
+MATHLIB_INSTALL_DIR = "${MATHLIB_C64P_INSTALL_DIR}/packages"
+DSPLIB_INSTALL_DIR_RECIPE = "${DSPLIB_C64P_INSTALL_DIR_RECIPE}"
+DSPLIB_INSTALL_DIR = "${DSPLIB_C64P_INSTALL_DIR}"
+DSPLIB_BUILD_TARGET = "c64Px"
+
+DEPENDS = ""
+
+include dsplib.inc
+
diff --git a/recipes-ti/dsplib/dsplib-c66x.inc b/recipes-ti/dsplib/dsplib-c66x.inc
deleted file mode 100644
index 7ff99c2..0000000
--- a/recipes-ti/dsplib/dsplib-c66x.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "DSPLIB contains optimized general-purpose signal-processing routines for TI DSPs"
-HOMEPAGE = "http://www.ti.com/tool/sprc265"
-SECTION = "devel"
-LICENSE = "BSD-3-Clause"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-unpack.inc
-
-COMPATIBLE_MACHINE = "omap-a15|keystone"
-
-SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/dsplib/${PV}/exports/${BINFILE};name=dsplib"
-
-BINFILE = "dsplib_c66x_${PV}_Linux.bin"
-TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
-TI_BIN_UNPK_CMDS = ""
-
-do_install() {
-    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-    install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
-}
-
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN}-dev += "${DSPLIB_C66_INSTALL_DIR_RECIPE}"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INSANE_SKIP_${PN}-dev = "arch"
diff --git a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb b/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
deleted file mode 100644
index f1273f3..0000000
--- a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require dsplib-c66x.inc
-
-PV = "3_4_0_0"
-PR = "r1"
-
-LIC_FILES_CHKSUM = "file://packages/ti/dsplib/dsplib.h;beginline=9;endline=35;md5=17733f9e1100f8a628512f47c4bf676a"
-
-SRC_URI[dsplib.md5sum] = "66785604729c153dcad5282097dee8bf"
-SRC_URI[dsplib.sha256sum] = "e88909b6271ce6c4c62e2ab90181b7adb36c7f28f5c52836668eb35888785ce8"
diff --git a/recipes-ti/dsplib/dsplib-c66x_git.bb b/recipes-ti/dsplib/dsplib-c66x_git.bb
new file mode 100644
index 0000000..cbc25d0
--- /dev/null
+++ b/recipes-ti/dsplib/dsplib-c66x_git.bb
@@ -0,0 +1,10 @@
+MATHLIB_INSTALL_DIR = "${MATHLIB_C66_INSTALL_DIR}/packages"
+DSPLIB_INSTALL_DIR_RECIPE = "${DSPLIB_C66_INSTALL_DIR_RECIPE}"
+DSPLIB_INSTALL_DIR = "${DSPLIB_C66_INSTALL_DIR}"
+DSPLIB_BUILD_TARGET = "c66x"
+
+DEPENDS = "mathlib-c66x"
+
+include dsplib.inc
+
+
diff --git a/recipes-ti/dsplib/dsplib-c674x_git.bb b/recipes-ti/dsplib/dsplib-c674x_git.bb
new file mode 100644
index 0000000..07c6892
--- /dev/null
+++ b/recipes-ti/dsplib/dsplib-c674x_git.bb
@@ -0,0 +1,9 @@
+MATHLIB_INSTALL_DIR = "${MATHLIB_C674_INSTALL_DIR}/packages"
+DSPLIB_INSTALL_DIR_RECIPE = "${DSPLIB_C674_INSTALL_DIR_RECIPE}"
+DSPLIB_INSTALL_DIR = "${DSPLIB_C674_INSTALL_DIR}"
+DSPLIB_BUILD_TARGET = "c674x"
+
+DEPENDS = "mathlib-c674x"
+
+include dsplib.inc
+
diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
new file mode 100644
index 0000000..e6ca8e3
--- /dev/null
+++ b/recipes-ti/dsplib/dsplib.inc
@@ -0,0 +1,79 @@
+SUMMARY = "DSPLIB contains optimized signal processing functions for TI DSPs"
+HOMEPAGE = "http://git.ti.com/ep-processor-libraries/dsplib"
+LICENSE = "BSD-3-Clause"
+
+require ../includes/ti-paths.inc
+
+PV = "3_4_0_1"
+PR = "r0"
+
+COMPATIBLE_MACHINE = "am57xx-evm|keystone|c66x|omapl1"
+
+DEPENDS += "ti-cgt6x-native \
+           ti-xdctools-native \
+           ti-sysbios \
+           doxygen-native \ 
+           zip-native \ 
+           swtools "
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git;protocol=git;branch=master"
+SRCREV = "aa1f9256579c3f8ff3ef38135def551d650f2d54"
+
+LIC_FILES_CHKSUM = "file://ti/dsplib/src/common/c66/lnk.cmd;beginline=1;endline=37;md5=0f0c9c4d51d8af75419781591ace190b"
+
+export DSPLIB_WORK_DIR="${S}"
+export CGTOOLS_INSTALL_DIR  = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export C64PCODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
+export C674CODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
+export C66CODEGENTOOL ="${CGTOOLS_INSTALL_DIR}"
+export SWTOOLS_PATH = "${SWTOOLS_INSTALL_DIR}/ti/mas/swtools"
+export XDCBUILDCFG="${SWTOOLS_PATH}/config.bld"
+export INCDIR="${MATHLIB_INSTALL_DIR}/"
+
+PATH_append = ":${XDC_INSTALL_DIR}"
+
+XDCPATH.="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
+XDCPATH.="${SWTOOLS_INSTALL_DIR};${MATHLIB_INSTALL_DIR};${DSPLIB_WORK_DIR};"
+
+export XDCPATH
+
+DSPLIB_PACKAGE_NAME = "dsplib_${DSPLIB_BUILD_TARGET}_${PV}"
+
+do_compile() {
+	cd ${DSPLIB_WORK_DIR}/ti/dsplib;
+	xdc XDCARGS="${DSPLIB_BUILD_TARGET} bundle" XDCOPTIONS="-v"
+}
+
+do_install() {
+	install -d ${D}${DSPLIB_INSTALL_DIR_RECIPE}
+
+	find -name "${DSPLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${DSPLIB_INSTALL_DIR_RECIPE} \;
+	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/* ${D}${DSPLIB_INSTALL_DIR_RECIPE}
+	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/.metadata ${D}${DSPLIB_INSTALL_DIR_RECIPE}
+	rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib
+}
+
+
+inherit deploy
+addtask deploy before do_build after do_install
+
+do_deploy() {
+	install -d ${DEPLOYDIR}
+	# zip up files in ${D}${DSPLIB_INSTALL_DIR_RECIPE}
+	# and place the zip file in ${DEPLOYDIR}
+	mkdir ./${DSPLIB_PACKAGE_NAME}
+	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/* ./${DSPLIB_PACKAGE_NAME}
+	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/.metadata ./${DSPLIB_PACKAGE_NAME}
+	zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip ./${DSPLIB_PACKAGE_NAME}
+	rm -r ./${DSPLIB_PACKAGE_NAME}
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${DSPLIB_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev = "arch"
+
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 91b4186..cfd10b4 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -17,6 +17,7 @@ export DMAI_INSTALL_DIR_RECIPE       = "${installdir}/ti-dmai-tree"
 export DSP_BENCHMARK_INSTALL_DIR_RECIPE = "${installdir}/ti-dsp-benchmark-tree"
 export DSPLIB_C64P_INSTALL_DIR_RECIPE = "${installdir}/ti-dsplib-c64p-tree"
 export DSPLIB_C674_INSTALL_DIR_RECIPE = "${installdir}/ti-dsplib-c674x-tree"
+export DSPLIB_C66_INSTALL_DIR_RECIPE  = "${installdir}/ti-dsplib-c66x-tree"
 export DSPLIB_INSTALL_DIR_RECIPE     = "${installdir}/ti-dsplib-tree"
 export DVSDK_DEMOS_INSTALL_DIR_RECIPE= "${installdir}/ti-dvsdk-demos-tree"
 export DVTB_INSTALL_DIR_RECIPE       = "${installdir}/ti-dvtb-tree"
@@ -49,7 +50,6 @@ export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
 export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
 export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
-export DSPLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-dsplib-c66x-tree"
 export MATHLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c66x-tree"
 export MATHLIB_C674INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c674x-tree"
 export IMGLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-imglib-c66x-tree"
@@ -98,6 +98,8 @@ export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTAL
 export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
 export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
 export SWTOOLS_INSTALL_DIR         = "${STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}"
+export DSPLIB_C64P_INSTALL_DIR     = "${STAGING_DIR_TARGET}${DSPLIB_C64P_INSTALL_DIR_RECIPE}"
+export DSPLIB_C674_INSTALL_DIR     = "${STAGING_DIR_TARGET}${DSPLIB_C674_INSTALL_DIR_RECIPE}"
 export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
 export MATHLIB_C674INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C674_INSTALL_DIR_RECIPE}"
 export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
-- 
1.9.1


