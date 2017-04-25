Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F780E00AE4; Tue, 25 Apr 2017 04:26:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5C21E00A9B
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 04:26:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3PBQAi5005837
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 06:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493119570;
	bh=bSpA4jY3RYrBwguSDo1CwsDiGdkMQ9GRdJr0WEESBHM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dchcuVVrok4i2b/aaeIDiIIQ+AzfJyfJjBtQDyo4u1ahaPAtxeYhDThI4GXgPmUSn
	y6chIfLbH1eLNMwFBJnpSRWKDigOehnh3FFgxc5WxhF4b7vJoBj1Qpsx+sU4MyaLbY
	9E3akA2Nh9tEOVsQXespCspDTYMYTLt4IGNg3rqk=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PBQADW026087
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 06:26:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Apr 2017 06:26:10 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PBQ6dK023407;
	Tue, 25 Apr 2017 06:26:09 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 25 Apr 2017 16:56:04 +0530
Message-ID: <1493119564-36769-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1493119564-36769-1-git-send-email-a0393906@ti.com>
References: <1493119564-36769-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [morty v3 3/3] ti-ccsv6: Remove the recipe and other dependencies
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
X-List-Received-Date: Tue, 25 Apr 2017 11:26:14 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb | 45 ----------------------
 recipes-ti/includes/ti-paths.inc                   |  2 -
 2 files changed, 47 deletions(-)
 delete mode 100644 recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb

diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb b/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb
deleted file mode 100644
index 334c7df..0000000
--- a/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-DESCRIPTION = "TI DSP Code Generation Tools"
-HOMEPAGE = "http://processors.wiki.ti.com/index.php/Download_CCS#Code_Composer_Studio_Version_6_Downloads"
-LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
-
-LIC_FILES_CHKSUM = "file://${WORKDIR}/ccsv6/doc/EULA/EULA.doc;md5=24fb8a52ac52d3938b5888362edb295a"
-
-inherit native
-
-require recipes-ti/includes/ti-unpack.inc
-require recipes-ti/includes/ti-staging.inc
-require recipes-ti/includes/ti-paths.inc
-
-TI_CGT_ARM_VERSION = "15.12.1.LTS"
-
-SRC_URI = "http://install.source.dir.local/CCS${PV}_linux.tar.gz;name=ccsv6"
-
-S = "${WORKDIR}/CCS${PV}_linux"
-
-BINFILE = "CCS${PV}_linux/ccs_setup_${PV}.bin"
-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-TI_BIN_UNPK_CMDS = ""
-
-SRC_URI[ccsv6.md5sum] = "ceaa5023c1a4b51bc637d3de1a15786b"
-SRC_URI[ccsv6.sha256sum] = "fb3205a21942da09684c871371513707c841c4fd8d88a62f6a7865b0a86cc492"
-
-do_install() {
-    install -d ${D}${CCSV6_INSTALL_DIR_RECIPE}
-    cp -r ${WORKDIR}/ccsv6/. ${D}${CCSV6_INSTALL_DIR_RECIPE}
-
-    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
-    cp -r ${WORKDIR}/ccsv6/tools/compiler/ti-cgt-arm_${TI_CGT_ARM_VERSION}/. \
-          ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
-}
-
-FILES_${PN} += "\
-  ${CCSV6_INSTALL_DIR_RECIPE} \
-  ${M4_TOOLCHAIN_INSTALL_DIR_RECIPE} \
-"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INSANE_SKIP_${PN} = "arch libdir ldflags staticdev textrel dev-so"
-
-EXCLUDE_FROM_SHLIBS = "1"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index e7d3e82..a7ea9a7 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -46,7 +46,6 @@ export XDC_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdctools-tree"
 export PDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-pdk-tree"
 export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
-export CCSV6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
 export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
 export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
 export DSPLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-dsplib-c66x-tree"
@@ -93,7 +92,6 @@ export XDC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${XDC_INSTALL_DIR_RECIPE}"
 export PDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
 export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
 export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
-export CCSV6_INSTALL_DIR           = "${STAGING_DIR_NATIVE}${CCSV6_INSTALL_DIR_RECIPE}"
 export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
 export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
 export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
-- 
1.9.1


