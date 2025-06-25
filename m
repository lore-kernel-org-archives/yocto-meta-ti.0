Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2530C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:07:01 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.22882.1750874812400223947
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rBEqBQMB;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PI6pJs2245998;
	Wed, 25 Jun 2025 13:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750874811;
	bh=z5h88Mngp0f6V8pnlqbImCDx0FOFhneKZAukQs+QbYg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=rBEqBQMBdOaeGx/himr/J67zTxc1KSGBC/7AwQakjShS/nX5fsz/lG2aFFYJxzLXJ
	 T8t9Fy/SfbAsdWfM2Um5cLpAQTdE8c5wR1j54ohASrXqJ5xJoeA4bSlVDGYvhnyC2b
	 RySxUDaGsXxihPKOy3QT2D2mIWmbmVwsePxNhf6E=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PI6ooW1487435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 13:06:51 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:06:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:06:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PI6oYD4075691;
	Wed, 25 Jun 2025 13:06:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uUUWI-0004eZ-HU; Wed, 25 Jun 2025 13:06:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 5/7] meta-ti/all: set S to be in UNPACKDIR in recipes that explicitly set S
Date: Wed, 25 Jun 2025 13:06:48 -0500
Message-ID: <20250625180650.17820-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250625180650.17820-1-reatmon@ti.com>
References: <20250625180650.17820-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:07:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18681

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb       | 2 +-
 meta-ti-extras/recipes-ti/bios/ti-sysbios.inc               | 2 +-
 meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb     | 2 +-
 .../recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb   | 2 +-
 .../devtools/gcc-arm-baremetal_7-2018-q2-update.bb          | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb     | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb    | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc            | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb     | 6 +++---
 meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb        | 4 ++--
 .../recipes-ti/devtools/ti-xdctools_3.55.02.22.bb           | 2 +-
 .../framework-components/ti-framework-components.inc        | 2 +-
 meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc            | 2 +-
 meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc                | 2 +-
 meta-ti-extras/recipes-ti/xdais/ti-xdais.inc                | 2 +-
 15 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb b/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
index 02b03e14..20548443 100644
--- a/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
+++ b/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_ccstudio/UIA/SCMCSD
 SRC_URI[cuia.md5sum] = "ef53989ac70c191841cd656cdc8770be"
 SRC_URI[cuia.sha256sum] = "f16d138a9146fdc7d52cba77bd30596da65835f6ffe4092baf2b33d1c1a4fb0d"
 
-S = "${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVExtra}"
+S = "${UNPACKDIR}/cuia_${CUIA_PV}${CUIA_PVExtra}"
 
 CLEANBROKEN = "1"
 
diff --git a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
index 9f554d48..edcea538 100644
--- a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
+++ b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
@@ -7,7 +7,7 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-eula-unpack.inc
 
-S = "${WORKDIR}/bios_${PV}"
+S = "${UNPACKDIR}/bios_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=sysbiosbin"
 BINFILE = "bios_${PV}.bin"
diff --git a/meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
index d242510f..4b0723df 100644
--- a/meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
+++ b/meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
@@ -10,7 +10,7 @@ SRC_URI[sysbiosbin.md5sum] = "647243209d66d5dd35503b0ec5a84ab9"
 SRC_URI[sysbiosbin.sha256sum] = "b762b7f2343d26d367f952488e529046785128005158cc921c3baef08e97116a"
 
 TI_BIN_UNPK_CMDS = ""
-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${UNPACKDIR}"
 
 BINFILE = "bios_${PV}.run"
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/${BINFILE};name=sysbiosbin"
diff --git a/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb b/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
index 40e5dc36..b248683b 100644
--- a/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
+++ b/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://codec_engine_${PV}_Manifest.html;md5=de7d9c2594a6f386
 SRC_URI[cetarball.md5sum] = "d66a8ccbd6cdfe9f735af9f4a07e2b9b"
 SRC_URI[cetarball.sha256sum] = "ed7b7399903bbf76af06ee6457836f344ad75b903618339bae82b3967f27ffa1"
 
-S = "${WORKDIR}/codec_engine_${PV}"
+S = "${UNPACKDIR}/codec_engine_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/${PV}/exports/codec_engine_${PV},lite.tar.gz;name=cetarball "
 
diff --git a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
index 93a20fa6..df34a39e 100644
--- a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
+++ b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc
 SRC_URI[gcc-arm-none.md5sum] = "299ebd3f1c2c90930d28ab82e5d8d6c0"
 SRC_URI[gcc-arm-none.sha256sum] = "bb17109f0ee697254a5d4ae6e5e01440e3ea8f0277f2e8169bf95d07c7d5fe69"
 
-S = "${WORKDIR}/gcc-arm-none-eabi-7-2018-q2-update"
+S = "${UNPACKDIR}/gcc-arm-none-eabi-7-2018-q2-update"
 
 # only x86_64 is supported
 COMPATIBLE_HOST = "x86_64.*-linux"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb b/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
index a6688e06..4341acb0 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
@@ -9,7 +9,7 @@ require recipes-ti/includes/ti-unpack.inc
 
 PV = "2.61.00"
 PE = "1"
-S = "${WORKDIR}/cg_xml_${PV}"
+S = "${UNPACKDIR}/cg_xml_${PV}"
 
 SRC_URI = "\
     http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/cg_xml_v${@'${PV}'.replace('.','_')}/cgxml-${PV}-linux-installer.run;name=cgxmlbin_linux \
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
index b7b6d9b1..031d889f 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
@@ -8,7 +8,7 @@ require recipes-ti/includes/ti-unpack.inc
 require recipes-ti/includes/ti-staging.inc
 require recipes-ti/includes/ti-paths.inc
 
-S = "${WORKDIR}/ti-cgt-arm-${PV}"
+S = "${UNPACKDIR}/ti-cgt-arm-${PV}"
 
 PE = "1"
 PR = "r0"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
index c2b8ca49..f32bc0d3 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
@@ -9,7 +9,7 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-eula-unpack.inc
 
-S = "${WORKDIR}/cgt470_${PV}"
+S = "${UNPACKDIR}/cgt470_${PV}"
 
 SRC_URI = "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
 
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
index 0cc068e4..adf21563 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
@@ -11,14 +11,14 @@ LICENSE = "TI-TSPA"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
 
-S = "${WORKDIR}/c6000_7.4.16"
+S = "${UNPACKDIR}/c6000_7.4.16"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-unpack.inc
 
 BINFILE = "ti_cgt_c6000_7.4.16_linux_installer_x86.bin"
 BINFILE_NAME = "cgt6x_7.4.16_x86_installer"
-TI_BIN_UNPK_ARGS = "--prefix ${WORKDIR} --mode unattended"
+TI_BIN_UNPK_ARGS = "--prefix ${UNPACKDIR} --mode unattended"
 TI_BIN_UNPK_CMDS = ""
 
 SRC_URI = "http://install.source.dir.local/${BINFILE};name=${BINFILE_NAME}"
@@ -32,7 +32,7 @@ COMPATIBLE_HOST:class-target = "null"
 
 do_install() {
     install -d ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
-    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
+    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${UNPACKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
 }
 
 FILES:${PN} += "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
index b45b52a3..04b16032 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
@@ -30,11 +30,11 @@ TI_BIN_UNPK_CMDS = ""
 SRC_URI[cgt7x_x86_installer.md5sum]    = "813840908f333dd2a31f92edec71c1fb"
 SRC_URI[cgt7x_x86_installer.sha256sum] = "21379811a8857489f72ca8ec45a46eb086ced0bdbb58e78f73a86e63984ab2f5"
 
-S = "${WORKDIR}/c7000_${PV}"
+S = "${UNPACKDIR}/c7000_${PV}"
 
 do_install() {
     install -d ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
-    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c7000_${PV}/ti-cgt-c7000_${PV}.STS/. ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
+    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${UNPACKDIR}/c7000_${PV}/ti-cgt-c7000_${PV}.STS/. ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
 }
 
 
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb b/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
index 1cc334b9..969518e2 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
@@ -70,7 +70,7 @@ COMPATIBLE_HOST:ti-soc = "(.*)"
 COMPATIBLE_HOST:class-native = "(.*)"
 COMPATIBLE_HOST:class-nativesdk = "(.*)"
 
-S = "${WORKDIR}/xdctools_${PV}_core"
+S = "${UNPACKDIR}/xdctools_${PV}_core"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdccore/xdctools_${PV}_core_linux.zip;name=xdczip"
 
diff --git a/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc b/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
index 84f0f00f..6a1768a3 100644
--- a/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
+++ b/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 
 require recipes-ti/includes/ti-paths.inc
 
-S = "${WORKDIR}/framework_components_${PV}"
+S = "${UNPACKDIR}/framework_components_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc/${PV}/exports/framework_components_${PV},lite.tar.gz;name=fctarball"
 
diff --git a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
index 6146b474..8fa2ceca 100644
--- a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
+++ b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "omap-a15"
 
 SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/imglib/${PV}/exports/${BINFILE};name=imglib"
 
-S = "${WORKDIR}/imglib-c66x-${PV}"
+S = "${UNPACKDIR}/imglib-c66x-${PV}"
 
 BINFILE = "imglib_c66x_${PV}_Linux.bin"
 TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
index 34031fa8..94c5d33b 100644
--- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
+++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "omap-a15"
 
 SRC_URI = "http://software-dl.ti.com/libs/vlib/${PV}//exports/vlib_c66x_obj_${PV}_Linux.bin;name=vlibbin"
 
-S = "${WORKDIR}/vlib_c66x_${PV}"
+S = "${UNPACKDIR}/vlib_c66x_${PV}"
 
 BINFILE = "vlib_c66x_obj_${PV}_Linux.bin"
 TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
diff --git a/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc b/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
index 36cdf2a6..070e28c3 100644
--- a/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
+++ b/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
@@ -6,7 +6,7 @@ SECTION = "devel"
 require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 
-S = "${WORKDIR}/xdais_${PV}"
+S = "${UNPACKDIR}/xdais_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais/${PV}/exports/xdais_${PV}.tar.gz;name=xdaistarball"
 
-- 
2.17.1


