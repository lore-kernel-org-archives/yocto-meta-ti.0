Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D5BC77B73
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 00:28:25 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8620.1682641699525223367
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 17:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BtILIu6+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33S0SEpS023816;
	Thu, 27 Apr 2023 19:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682641694;
	bh=oJoveciGThL+I6UtTJBNEbUzvkaFxppWtL91UXDSDiw=;
	h=From:To:CC:Subject:Date;
	b=BtILIu6+x3N3iA01W/ryvNgdoNzUHHIypu3HShc5gw1PvyJ6mFfj8mfVxjj9UgziV
	 L2MyPi8VbGCE/wwRmdhfeKba3lPuy3mSdKXDweDdimeAxzt1bg181pflDUGxdnggtc
	 YYNw9oWF9heqITdCEnzZ6lwK3bhUkgc8ZYEW8CYg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33S0SEn8094077
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 19:28:14 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 19:28:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 19:28:14 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33S0SEGM017344;
	Thu, 27 Apr 2023 19:28:14 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] all: http to https everything
Date: Thu, 27 Apr 2023 19:28:09 -0500
Message-ID: <20230428002809.1930898-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Apr 2023 00:28:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16453

From: Randolph Sapp <rs@ti.com>

All of the software-dl links 302 to https urls anyway. Just jump
straight to the secure version.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-bsp/cmem/cmem.inc                         | 2 +-
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc                         | 2 +-
 meta-ti-extras/recipes-ti/bios/ti-sysbios.inc                 | 4 ++--
 meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc              | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc     | 4 ++--
 meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc       | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc            | 2 +-
 meta-ti-extras/recipes-ti/dsplib/dsplib.inc                   | 2 +-
 .../framework-components/ti-framework-components.inc          | 4 ++--
 meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc              | 4 ++--
 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc             | 2 +-
 meta-ti-extras/recipes-ti/mathlib/mathlib.inc                 | 2 +-
 meta-ti-extras/recipes-ti/osal/ti-osal.inc                    | 4 ++--
 meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc                  | 4 ++--
 meta-ti-extras/recipes-ti/xdais/ti-xdais.inc                  | 4 ++--
 15 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
index 683e1763..a5bafc83 100644
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
+++ b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
+HOMEPAGE = "https://processors.wiki.ti.com/index.php/Category:CMEM"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=26be509e4bb413905bda8309e338e2b1"
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
index 44be2466..fae038f1 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
-HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
+HOMEPAGE="https://processors.wiki.ti.com/index.php/Category:IPC"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
diff --git a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
index f31decec..0acb3d84 100644
--- a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
+++ b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI SYS/BIOS v6 Kernel"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios"
+HOMEPAGE = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 
@@ -9,7 +9,7 @@ require ../includes/ti-eula-unpack.inc
 
 S = "${WORKDIR}/bios_${PV}"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=sysbiosbin"
+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=sysbiosbin"
 BINFILE="bios_${PV}.bin"
 TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
 
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
index f0992aa7..77d23b6d 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
@@ -11,7 +11,7 @@ require ../includes/ti-eula-unpack.inc
 
 S = "${WORKDIR}/cgt470_${PV}"
 
-SRC_URI = "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
+SRC_URI = "https://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
 
 BINFILE="ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin"
 TI_BIN_UNPK_CMDS="Y:qY:workdir: : "
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
index 7051fccc..4e136497 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
@@ -1,5 +1,5 @@
-DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
+DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - https://rtsc.eclipse.org)"
+HOMEPAGE = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
 
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
index 47f73b6d..0eaa7227 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
@@ -2,4 +2,4 @@ require ti-xdctools-common.inc
 
 S = "${WORKDIR}/xdctools_${PV}_core"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdccore/xdctools_${PV}_core_linux.zip;name=xdczip"
+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdccore/xdctools_${PV}_core_linux.zip;name=xdczip"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc
index 1415f83e..f53a9d90 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc
+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc
@@ -3,7 +3,7 @@ require ../includes/ti-eula-unpack.inc
 
 S = "${WORKDIR}/xdctools_${PV}"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdctools_setuplinux_${PV}.bin;name=xdcbin"
+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdctools_setuplinux_${PV}.bin;name=xdcbin"
 
 BINFILE="xdctools_setuplinux_${PV}.bin"
 TI_BIN_UNPK_CMDS="Y:workdir:Y"
diff --git a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
index 6ebc3b34..5b33f33d 100644
--- a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
+++ b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
@@ -1,5 +1,5 @@
 SUMMARY = "DSPLIB contains optimized signal processing functions for TI DSPs"
-HOMEPAGE = "http://git.ti.com/ep-processor-libraries/dsplib"
+HOMEPAGE = "https://git.ti.com/ep-processor-libraries/dsplib"
 LICENSE = "BSD-3-Clause"
 
 require ../includes/ti-paths.inc
diff --git a/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc b/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
index 81407ed7..f88f38b8 100644
--- a/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
+++ b/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI Framework Components"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc"
+HOMEPAGE = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 
@@ -7,7 +7,7 @@ require recipes-ti/includes/ti-paths.inc
 
 S = "${WORKDIR}/framework_components_${PV}"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc/${PV}/exports/framework_components_${PV},lite.tar.gz;name=fctarball"
+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc/${PV}/exports/framework_components_${PV},lite.tar.gz;name=fctarball"
 
 do_install() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
diff --git a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
index ab5cbdb6..93c58d43 100644
--- a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
+++ b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "IMGLIB contains optimized general-purpose image/video processing routines for TI DSPs"
-HOMEPAGE = "http://www.ti.com/tool/sprc264"
+HOMEPAGE = "https://www.ti.com/tool/sprc264"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 
@@ -9,7 +9,7 @@ require ../includes/ti-unpack.inc
 
 COMPATIBLE_MACHINE = "omap-a15"
 
-SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/imglib/${PV}/exports/${BINFILE};name=imglib"
+SRC_URI = "https://software-dl.ti.com/sdoemb/sdoemb_public_sw/imglib/${PV}/exports/${BINFILE};name=imglib"
 
 S = "${WORKDIR}/imglib-c66x-${PV}"
 
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
index 09352505..b004a18a 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:IPC"
+HOMEPAGE = "https://processors.wiki.ti.com/index.php/Category:IPC"
 require recipes-ti/ipc/ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
diff --git a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
index 6ad073ec..6741933d 100644
--- a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
+++ b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
@@ -1,5 +1,5 @@
 SUMMARY = "MATHLIB contains optimized floating-point math functions for TI DSPs"
-HOMEPAGE = "http://git.ti.com/ep-processor-libraries/mathlib"
+HOMEPAGE = "https://git.ti.com/ep-processor-libraries/mathlib"
 LICENSE = "BSD-3-Clause"
 
 require ../includes/ti-paths.inc
diff --git a/meta-ti-extras/recipes-ti/osal/ti-osal.inc b/meta-ti-extras/recipes-ti/osal/ti-osal.inc
index b0470793..583b33c7 100644
--- a/meta-ti-extras/recipes-ti/osal/ti-osal.inc
+++ b/meta-ti-extras/recipes-ti/osal/ti-osal.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI Operating System Abstraction Library (OSAL)"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal"
+HOMEPAGE = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal"
 LICENSE = "BSD-3-Clause & EPL-1.0"
 SECTION = "devel"
 
@@ -8,7 +8,7 @@ require ../includes/ti-staging.inc
 
 S = "${WORKDIR}/osal_${PV}"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal/${PV}/exports/osal_${PV}.tar.gz;name=osaltarball"
+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal/${PV}/exports/osal_${PV}.tar.gz;name=osaltarball"
 
 do_install() {
     install -d ${D}${OSAL_INSTALL_DIR_RECIPE}
diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
index 6b5e186c..a704e023 100644
--- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
+++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI Vision Library (VLIB) for C66x"
-HOMEPAGE = "http://software-dl.ti.com/libs/vlib/latest/index_FDS.html"
+HOMEPAGE = "https://software-dl.ti.com/libs/vlib/latest/index_FDS.html"
 SECTION = "devel"
 LICENSE = "TI-TSPA & BSD-3-Clause"
 
@@ -9,7 +9,7 @@ require ../includes/ti-eula-unpack.inc
 
 COMPATIBLE_MACHINE = "omap-a15"
 
-SRC_URI = "http://software-dl.ti.com/libs/vlib/${PV}//exports/vlib_c66x_obj_${PV}_Linux.bin;name=vlibbin"
+SRC_URI = "https://software-dl.ti.com/libs/vlib/${PV}//exports/vlib_c66x_obj_${PV}_Linux.bin;name=vlibbin"
 
 S = "${WORKDIR}/vlib_c66x_${PV}"
 
diff --git a/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc b/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
index 67d19022..58eba0ee 100644
--- a/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
+++ b/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI eXpress DSP Algorithm Interface Standard (XDAIS) specification"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais"
+HOMEPAGE = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais"
 LICENSE = "GPL-2.0-only"
 SECTION = "devel"
 
@@ -8,7 +8,7 @@ require ../includes/ti-staging.inc
 
 S = "${WORKDIR}/xdais_${PV}"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais/${PV}/exports/xdais_${PV}.tar.gz;name=xdaistarball"
+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais/${PV}/exports/xdais_${PV}.tar.gz;name=xdaistarball"
 
 do_install() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-- 
2.40.0


