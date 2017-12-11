Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47F68E00D03; Mon, 11 Dec 2017 14:30:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.214.68 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (jpewhacker[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C355BE00CC4
	for <meta-ti@yoctoproject.org>; Mon, 11 Dec 2017 14:30:00 -0800 (PST)
Received: by mail-it0-f68.google.com with SMTP id 68so19630306ite.4
	for <meta-ti@yoctoproject.org>; Mon, 11 Dec 2017 14:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HtSEdG50fxXhLBcscqjigsdj2dt7tkq/l+kig6MpsPs=;
	b=sTp2kUAT8iywg1nHMrHbQfhxVcX8jy2h8QYVnqFdLsABCI30QfKG6hD5dPzhcArAqf
	tq6btqDId7vXUHPgVtXIt4aSFYEVPLXPyfGrNUekAtVOqf6UgSSsc0lCrPI8pshD3VdC
	WrgqT4eL5vbisa2+r/SjZE/1dyknShH13Zt85Rap8FkYeR6afXw9vRqZRUmWJsq4rjaG
	vSsILLH+re2j1PdoiKVMf3s+ANSfM/Y2VjB/16bd89V0/pZW+jc0nI0mVIl/7I6ysnrO
	3l4HRbYjKSfFOtHOxeIUd0K3aaQmKDvtwY3bQZTadygvNTUGb9MQv+u9rwXCSO13LQKq
	JIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HtSEdG50fxXhLBcscqjigsdj2dt7tkq/l+kig6MpsPs=;
	b=sMWlOldGB2I+ICxFi8lYP3bXfDsO8cAjbzbY7z02wniCGAUnPxe6g6vzpEVu10ztRg
	SHukOdeE43ugtAckidoYdOr8AtKNV/kPc8KzQ5YNvNwk+O+XBCVIUC3B7EXQqebdjF+L
	yKdf+WzpSO63KAPcdIR3kCXc7N1+5BoI0UPr+JYQ0m12cGlRqd0e/3eeupwjPFGSheEN
	e9brHOLiUKxb41Laq4MDE55y19aLX/jAja5di01X0D5HHvbWsMRtuYFa4t+zu+AqVoK3
	OJVTiTUnScKUy5ZQ9ZkbvAoQGKKuJw0jwZStLMv7ViIMouTkEzWoI+EoF/ImMzqvJf8Z
	RRBw==
X-Gm-Message-State: AKGB3mJBT8LANHwDguJu0XKO7VIu6qVX1p5vZNeHx2AewY38qyx6qnGv
	8hpR8oD0d4CzFxMQIM8iurge28ym
X-Google-Smtp-Source: ACJfBotTNUe2o0HunEGMEQAyuMtUtlAoJYYMbw4fsmzFvpSyXuPmkKiM765sMWNKr1DG2FGGkDlcWA==
X-Received: by 10.36.145.21 with SMTP id i21mr3251916ite.22.1513031399633;
	Mon, 11 Dec 2017 14:29:59 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	q62sm4276621itb.31.2017.12.11.14.29.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 14:29:58 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-ti@yoctoproject.org,
	Denys Dmytriyenko <denys@ti.com>
Date: Mon, 11 Dec 2017 16:28:57 -0600
Message-Id: <20171211222857.17997-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171128195856.28289-1-JPEWhacker@gmail.com>
References: <20171128195856.28289-1-JPEWhacker@gmail.com>
Cc: "Mertz, Timothy" <timothy.mertz@garmin.com>
Subject: [morty][PATCH v2] Make ti-xdctools a native recipe
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
X-List-Received-Date: Mon, 11 Dec 2017 22:30:02 -0000

From: "Mertz, Timothy" <timothy.mertz@garmin.com>

ti-xdctools should be a native recipe as it more accurately reflects how
it is supposed to be used. In addition, this allows it to be built as
nativesdk and included in SDK image tools

Signed-off-by: "Mertz, Timothy" <timothy.mertz@garmin.com>
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/ti-pdk.bbclass                                    | 2 +-
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb                    | 2 +-
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb               | 2 +-
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb                      | 2 +-
 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb              | 2 +-
 recipes-ti/c6accel/ti-c6accel.inc                         | 2 +-
 recipes-ti/codec-engine/ti-codec-engine.inc               | 2 +-
 recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb  | 2 +-
 recipes-ti/devtools/ti-xdctools_3.50.03.33.bb             | 4 ++++
 recipes-ti/dmai/ti-dmai.inc                               | 2 +-
 recipes-ti/dsplink/ti-dsplink.inc                         | 2 +-
 recipes-ti/includes/ti-paths.inc                          | 2 +-
 recipes-ti/ipc/ti-ipc-examples-linux_git.bb               | 2 +-
 recipes-ti/ipc/ti-ipc-examples_git.bb                     | 2 +-
 recipes-ti/ipc/ti-ipc-rtos_git.bb                         | 2 +-
 recipes-ti/local-power-manager/ti-local-power-manager.inc | 2 +-
 recipes-ti/openmp-rtos/openmp-rtos_git.bb                 | 2 +-
 recipes-ti/syslink/ti-syslink.inc                         | 2 +-
 18 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index f876802c..b84b161a 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -3,7 +3,7 @@ require recipes-ti/includes/ti-staging.inc
 
 inherit perlnative
 
-DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos"
+DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos"
 
 DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
 DEPENDS_remove_ti33x = "ti-cgt6x-native"
diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index 2bada7b6..2756c2d8 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -17,7 +17,7 @@ require recipes-ti/includes/ti-paths.inc
 PR = "r4"
 inherit update-alternatives
 
-DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
+DEPENDS = "ti-xdctools-native ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
 
 export HWVERSION = "ES10"
 export BIOSTOOLSROOT = "${STAGING_DIR_TARGET}/usr/share/ti"
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index f5244785..edd67e37 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -3,7 +3,7 @@ require recipes-ti/includes/ti-paths.inc
 
 PR = "${INC_PR}.1"
 
-DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
+DEPENDS = "ti-sysbios ti-xdctools-native gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 633cb135..7fa06a87 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -28,7 +28,7 @@ require recipes-ti/includes/ti-paths.inc
 
 inherit update-alternatives
 
-DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
+DEPENDS = "ti-xdctools-native ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
 
 export HWVERSION="ES10"
 export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
diff --git a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
index f4dc51dc..79b584be 100644
--- a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
+++ b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "TI gdb-server to be used with c6xgdb."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=82c616b6c8f9c11c46feaaf8f9a11495"
 
-DEPENDS = "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios ti-xdctools"
+DEPENDS = "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios ti-xdctools-native"
 
 PR = "${INC_PR}.0"
 
diff --git a/recipes-ti/c6accel/ti-c6accel.inc b/recipes-ti/c6accel/ti-c6accel.inc
index 65990a85..7e7fb296 100644
--- a/recipes-ti/c6accel/ti-c6accel.inc
+++ b/recipes-ti/c6accel/ti-c6accel.inc
@@ -29,7 +29,7 @@ BINFILE="c6accel_${PV}_Linux-x86_Setup.bin"
 TI_BIN_UNPK_CMDS="Y:workdir"
 
 DEPENDS = "ti-codec-engine ti-xdais ti-dsplink ti-dspbios" 
-DEPENDS += "ti-edma3lld ti-cgt6x ti-xdctools ti-framework-components" 
+DEPENDS += "ti-edma3lld ti-cgt6x ti-xdctools-native ti-framework-components"
 DEPENDS += "ti-biosutils" 
 
 TIARGS = ' \
diff --git a/recipes-ti/codec-engine/ti-codec-engine.inc b/recipes-ti/codec-engine/ti-codec-engine.inc
index 15bd4642..b4d366eb 100644
--- a/recipes-ti/codec-engine/ti-codec-engine.inc
+++ b/recipes-ti/codec-engine/ti-codec-engine.inc
@@ -18,7 +18,7 @@ S = "${WORKDIR}/codec_engine_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/${PV}/exports/codec_engine_${PV},lite.tar.gz;name=cetarball "
 
-DEPENDS = "ti-framework-components ti-xdais ti-xdctools ti-linuxutils"
+DEPENDS = "ti-framework-components ti-xdais ti-xdctools-native ti-linuxutils"
 DEPENDS_append_dm6446 	= " ti-dspbios ti-dsplink ti-local-power-manager ti-cgt6x ti-biosutils ti-edma3lld"
 DEPENDS_append_dm6467 	= " ti-dspbios ti-dsplink ti-cgt6x ti-biosutils ti-edma3lld"
 DEPENDS_append_omap3	= " ti-dspbios ti-dsplink ti-local-power-manager ti-cgt6x ti-biosutils ti-edma3lld"
diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
index 5c87b4cd..e14f1c1e 100644
--- a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
+++ b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
@@ -68,7 +68,7 @@ TI_BIN_UNPK_CMDS = "Y:workdir"
 
 S = "${CODEC_SUITE_NAME}"
 
-DEPENDS = "ti-cgt6x ti-xdctools ti-dspbios ti-codec-engine ti-linuxutils"
+DEPENDS = "ti-cgt6x ti-xdctools-native ti-dspbios ti-codec-engine ti-linuxutils"
 
 #generic codec
 DSPSUFFIX_omap3530 = "x64P"
diff --git a/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb b/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
index 73ab3bdf..6ab2b94a 100644
--- a/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
@@ -7,3 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endli
 
 SRC_URI[xdczip.md5sum] = "21310b647275a7c7dd5b37dcb96c0b1b"
 SRC_URI[xdczip.sha256sum] = "afe8616773e63b01e79e8cfacaf4d2c8d3b92c798c7f8cf5d1c7b5fe2060bbe4"
+
+FILES_${PN} += "${XDC_INSTALL_DIR_RECIPE}"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index f81b4cff..50621184 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -29,7 +29,7 @@ SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};protocol=https;use
         file://arago-tdox \
 	"
 
-DEPENDS = "virtual/kernel alsa-lib ti-framework-components ti-codec-engine ti-xdctools"
+DEPENDS = "virtual/kernel alsa-lib ti-framework-components ti-codec-engine ti-xdctools-native"
 
 DEPENDS_append_dm6446 	= " ti-codecs-dm6446   ti-dspbios ti-cgt6x ti-linuxutils"
 DEPENDS_append_dm6467 	= " ti-codecs-dm6467   ti-dspbios ti-cgt6x ti-linuxutils"
diff --git a/recipes-ti/dsplink/ti-dsplink.inc b/recipes-ti/dsplink/ti-dsplink.inc
index 78b53cf0..e0096155 100644
--- a/recipes-ti/dsplink/ti-dsplink.inc
+++ b/recipes-ti/dsplink/ti-dsplink.inc
@@ -30,7 +30,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/${PV_DL_PATH}/dsplink_l
            file://ti-dsplink-examples-loadmodules.sh \
            file://ti-dsplink-examples-unloadmodules.sh "
 
-DEPENDS = "ti-dspbios ti-xdctools ti-cgt6x" 
+DEPENDS = "ti-dspbios ti-xdctools-native ti-cgt6x"
 DEPENDS += "virtual/kernel perl-native" 
 
 # SOC_FAMILY configuration
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index ebd4b8a5..3745ec07 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -88,7 +88,7 @@ export SYSBIOS_INSTALL_DIR    = "${STAGING_DIR_TARGET}${SYSBIOS_INSTALL_DIR_RECI
 export SYSLINK_INSTALL_DIR    = "${STAGING_DIR_TARGET}${SYSLINK_INSTALL_DIR_RECIPE}"
 export UIA_INSTALL_DIR        = "${STAGING_DIR_TARGET}${UIA_INSTALL_DIR_RECIPE}"
 export XDAIS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${XDAIS_INSTALL_DIR_RECIPE}"
-export XDC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${XDC_INSTALL_DIR_RECIPE}"
+export XDC_INSTALL_DIR        = "${STAGING_DIR_NATIVE}${XDC_INSTALL_DIR_RECIPE}"
 export PDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
 export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
 export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
index 2340206c..545448c6 100644
--- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running bios"
 require ti-ipc-examples.inc
 
-DEPENDS = "ti-ipc ti-xdctools ti-sysbios ti-ipc-rtos"
+DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos"
 
 do_compile_append() {
 
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
index 5482ce41..36df294e 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running linux"
 require ti-ipc-examples.inc
 
-DEPENDS = "ti-xdctools ti-sysbios ti-ipc-rtos"
+DEPENDS = "ti-xdctools-native ti-sysbios ti-ipc-rtos"
 
 do_compile_append() {
 
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index f4eefa85..4040c4d9 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,7 +2,7 @@ require ti-ipc.inc
 require ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
-DEPENDS = "ti-xdctools ti-sysbios doxygen-native zip-native"
+DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
 
 PACKAGES =+ "${PN}-fw"
 FILES_${PN}-fw = "${base_libdir}/firmware/*"
diff --git a/recipes-ti/local-power-manager/ti-local-power-manager.inc b/recipes-ti/local-power-manager/ti-local-power-manager.inc
index 2f2b5256..0e5d4f29 100644
--- a/recipes-ti/local-power-manager/ti-local-power-manager.inc
+++ b/recipes-ti/local-power-manager/ti-local-power-manager.inc
@@ -21,7 +21,7 @@ S = "${WORKDIR}/local_power_manager_linux_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/lpm/${PV}/exports/local_power_manager_linux_${PV}.tar.gz;name=lpmtarball"
 
-DEPENDS = "ti-dsplink ti-xdctools"
+DEPENDS = "ti-dsplink ti-xdctools-native"
 DEPENDS += "virtual/kernel"
 
 # SOC_FAMILY configuration
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index f5bf4765..97474651 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -19,7 +19,7 @@ SRCREV = "a2a518dcc9154a372b38bd5be8a483359123823c"
 
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 
-DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm zip-native"
+DEPENDS = "common-csl-ip-rtos ti-xdctools-native ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm zip-native"
 DEPENDS_append_k2hk = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2e = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"
diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-syslink.inc
index af5f896a..5ff6af7c 100644
--- a/recipes-ti/syslink/ti-syslink.inc
+++ b/recipes-ti/syslink/ti-syslink.inc
@@ -31,7 +31,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/sy
            file://syslink.pc \
           "
 
-DEPENDS = "ti-sysbios ti-xdctools ti-cgt6x ti-ipc ti-cgt470"
+DEPENDS = "ti-sysbios ti-xdctools-native ti-cgt6x ti-ipc ti-cgt470"
 DEPENDS += "virtual/kernel" 
 
 #common frameq gateMP heapBufMP heapMemMP knlNotify listMP messageQ notify ringIO ringIO_gpp sharedRegion slaveLoader tilerDaemon
-- 
2.14.3


