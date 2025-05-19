Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E480C3ABDD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:45 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.396.1747674100267674366
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P5n3wtE4;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1dd2955495;
	Mon, 19 May 2025 12:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674099;
	bh=1zA9BceK2zbbWggGXgooD3SRM8r2ReSzv83GExtlFOQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=P5n3wtE4FtUrQJsMSx4+9vRuapsDdW67h2Tj9GJkRM1nsvr2TRUVA1+QlATm69v01
	 RLOaQM274ToEJSBDbveIkhOOqj+9MgSLrqjCfMIcsmOksb6M04MJ5ghth1dBsEG9q2
	 WPzQHoVB0J1vCkG0ZUXiSfbbhlemXoUQxYwVfyW8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54JH1d4q888654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 19 May 2025 12:01:39 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:01:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:01:39 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1dFw101397;
	Mon, 19 May 2025 12:01:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3ru-0005vZ-W5; Mon, 19 May 2025 12:01:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 1/3] CLEANUP: Add missing SUMMARY
Date: Mon, 19 May 2025 12:01:36 -0500
Message-ID: <20250519170138.22739-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170138.22739-1-reatmon@ti.com>
References: <20250519170138.22739-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18580

Every recipe should have a SUMMARY and that can only be 72 characters at
most.  Some of these recipes had DESCRIPTIONS and not SUMMARY, some were
missing the SUMMARY, and some had slightly too long values for the SUMMARY.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb         | 2 +-
 .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb      | 2 +-
 meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb              | 2 +-
 .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb         | 2 +-
 .../powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb         | 2 +-
 .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb   | 2 +-
 meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb               | 2 +-
 meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb            | 2 +-
 meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb              | 2 +-
 meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb  | 2 +-
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb            | 2 +-
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb            | 2 +-
 .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb          | 2 +-
 .../powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb          | 2 +-
 .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb                | 2 +-
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc                           | 1 +
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb                        | 1 +
 meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb               | 2 +-
 meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb                   | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb     | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb                 | 2 +-
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb                  | 2 +-
 meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb    | 2 +-
 meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb        | 2 +-
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb                | 2 +-
 .../wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb        | 2 +-
 meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb      | 2 +-
 meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb           | 2 +-
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb            | 2 +-
 meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb     | 2 +-
 .../recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb    | 2 +-
 meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb       | 2 +-
 meta-ti-extras/recipes-ti/bios/ti-sysbios.inc                   | 2 +-
 .../recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb       | 2 +-
 .../recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb   | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb         | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb          | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc                | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb            | 2 +-
 meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb    | 1 +
 .../recipes-ti/framework-components/ti-framework-components.inc | 2 +-
 meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc                | 1 +
 meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc                    | 2 +-
 meta-ti-extras/recipes-ti/xdais/ti-xdais.inc                    | 2 +-
 44 files changed, 44 insertions(+), 40 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index b14a706b..099678b2 100644
--- a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
+SUMMARY = "Cortex-M3 binary blob for suspend-resume"
 
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index a6dc3e25..bc2b7fc2 100644
--- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Kernel drivers for the Vivante GC320 chipset found in TI SoCs"
+SUMMARY = "Kernel drivers for the Vivante GC320 chipset found in TI SoCs"
 HOMEPAGE = "https://git.ti.com/graphics/ti-gc320-driver"
 LICENSE = "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=78d9818a51b9a8e9bb89dea418bac297"
diff --git a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
index ee3a94dc..c43afb5b 100644
--- a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Goodix GT9271 config firmware"
+SUMMARY = "Goodix GT9271 config firmware"
 
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
index f7c871e1..dc55ef9b 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
@@ -1,4 +1,4 @@
-DESCRIPTION =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
+SUMMARY =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
 HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
 LICENSE = "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
index b356ce48..513429bd 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
@@ -1,4 +1,4 @@
-DESCRIPTION =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
+SUMMARY =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
 HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
 LICENSE = "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 18b81d2f..8a4a04ae 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -1,4 +1,4 @@
-DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
+SUMMARY =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
 HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
 LICENSE = "MIT | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://GPL-COPYING;md5=60422928ba677faaa13d6ab5f5baaa1e"
diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index 4ec09a70..00cbea64 100644
--- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Radio Application Firmware"
+SUMMARY = "Radio Application Firmware"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.html;md5=a59aa54b9470f555cf086b91dca0afa3"
 
diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
index 8af49577..a8d9d800 100644
--- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
+++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "VPDMA firmware for Video Input Port and Video Processing Engine"
+SUMMARY = "VPDMA firmware for Video Input Port and Video Processing Engine"
 
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd463c9500441ed91d07a0331baa635c"
diff --git a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
index 7f4e8b77..274cc735 100644
--- a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "VPE test program"
+SUMMARY = "VPE test program"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index fc70e1ed..636ed359 100644
--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Userspace libraries for GC320 chipset on TI SoCs"
+SUMMARY = "Userspace libraries for GC320 chipset on TI SoCs"
 HOMEPAGE = "https://git.ti.com/graphics/ti-gc320-libs"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://Manifest.html;md5=a9121e8936ace09820d23f7626daaca5"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index bdc9ce16..4f59fbdb 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -4,7 +4,7 @@
 
 require recipes-graphics/mesa/mesa.inc
 
-SUMMARY += " (with PowerVR support for TI platforms)"
+SUMMARY += " (with PowerVR for TI parts)"
 
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
 
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index 1ac022d2..e6bd5fde 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -4,7 +4,7 @@
 
 require recipes-graphics/mesa/mesa.inc
 
-SUMMARY += " (with PowerVR support for TI platforms)"
+SUMMARY += " (with PowerVR for TI parts)"
 
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
 
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
index 675edc14..592a0e80 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
+SUMMARY = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
 HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
index 565e92eb..57f48fec 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
+SUMMARY = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
 HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
index 21968fd8..b260abdf 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
+SUMMARY = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
 HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
index 14c323de..c6dfc517 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
@@ -1,3 +1,4 @@
+SUMMARY = "TI Inter Process Communication (IPC) Mechanisms"
 DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:IPC"
 
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
index 7b8f7e34..7c21a114 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
@@ -1,3 +1,4 @@
+SUMMARY = "TI Inter Process Communication (IPC) Mechanisms"
 DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:IPC"
 
diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
index e3267a23..543868a4 100644
--- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Security development tools for High-Security(HS) TI K3 processors."
+SUMMARY = "Security development tools for High-Security(HS) TI K3 processors."
 HOMEPAGE = "https://git.ti.com/cgit/security-development-tools/core-secdev-k3"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
diff --git a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
index 9a5a6ffa..cb968f98 100644
--- a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Firmware files for Bluetooth"
+SUMMARY = "Firmware files for Bluetooth"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f39eac9f4573be5b012e8313831e72a9"
 
diff --git a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
index 74ceed9d..b1fa3ab8 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Debug Sub-System (DebugSS) driver for Keystone and DRA7xx devices"
+SUMMARY = "Debug Sub-System (DebugSS) driver for Keystone and DRA7xx devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
 
diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
index 90ce8943..c725202a 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI dsptop utility."
+SUMMARY = "TI dsptop utility."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=309825aa8f5edfcf2c44912ac094b979"
 
diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
index b01dd6a5..24c3c8e6 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Programmable Real-time Unit Software Package"
+SUMMARY = "Programmable Real-time Unit Software Package"
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
 LICENSE = "BSD-3-Clause & PD"
 
diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
index dbae5a21..11bf6004 100644
--- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
+++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Firmware files for use with TI wl18xx"
+SUMMARY = "Firmware files for use with TI wl18xx"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
diff --git a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
index 2e528376..81d0e24a 100644
--- a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
+++ b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Shared Transport Line Discipline User Mode initialisation Manager Daemon"
+SUMMARY = "Shared Transport Line Discipline User Mode initialisation Manager Daemon"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://uim.c;beginline=1;endline=18;md5=9f0bbfbc10c67689e81a523e2976c31e"
 
diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
index 1e9c445d..f68fab7f 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The calibrator utility for TI wireless solution based on wl18xx driver"
+SUMMARY = "The calibrator utility for TI wireless solution based on wl18xx driver"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
 
diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb
index 87890a31..b065d649 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
+SUMMARY = "Scripts and configuration files for TI wireless drivers"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
 
diff --git a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
index a2a8b775..a23db663 100644
--- a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Configuration utility for TI wireless drivers"
+SUMMARY = "Configuration utility for TI wireless drivers"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85c90328e3a9438"
 
diff --git a/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb b/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
index 8b16830f..02b03e14 100644
--- a/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
+++ b/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI Unified Instrumentation Architecture in C (cUIA)"
+SUMMARY = "TI Unified Instrumentation Architecture in C (cUIA)"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://cuia_${CUIA_PV}_manifest.html;md5=0eea94e3bb94de4ddee77653eba1c7c5"
 
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index b9d8ca7d..f611e51e 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNU debugger for TI C6X DSP."
+SUMMARY = "GNU debugger for TI C6X DSP."
 SECTION = "devel"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=bf0fe2872eb3dfeebb2cbe38206fe81f"
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
index edb9baa8..b09599ad 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI gdb-server to be used with c6xgdb."
+SUMMARY = "TI gdb-server to be used with c6xgdb."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=82c616b6c8f9c11c46feaaf8f9a11495"
 
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
index d2b5f004..1dc2296d 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Interface for GDB to commincate witha TI C66X DSP"
+SUMMARY = "Interface for GDB to commincate witha TI C66X DSP"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=75859989545e37968a99b631ef42722e"
 
diff --git a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
index ceefe0d6..591bbde8 100644
--- a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Userspace setup for beaglebone capes"
+SUMMARY = "Userspace setup for beaglebone capes"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
diff --git a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
index 3c1861ac..9f554d48 100644
--- a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
+++ b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI SYS/BIOS v6 Kernel"
+SUMMARY = "TI SYS/BIOS v6 Kernel"
 HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
diff --git a/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb b/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
index 2e25ea76..40e5dc36 100644
--- a/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
+++ b/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Codec Engine for TI ARM/DSP processors"
+SUMMARY = "Codec Engine for TI ARM/DSP processors"
 HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
diff --git a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
index 1d557252..93a20fa6 100644
--- a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
+++ b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Baremetal GCC for ARM"
+SUMMARY = "Baremetal GCC for ARM"
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=f77466c63f5787f4bd669c402aabe061"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb b/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
index a0972602..a6688e06 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI CG_XML"
+SUMMARY = "TI CG_XML"
 HOMEPAGE = "http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/index.htm"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
index 52a7d38d..46bc27b9 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI PRU Code Generation Tools"
+SUMMARY = "TI PRU Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
index d905755c..c2b8ca49 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI ARM Code Generation Tools"
+SUMMARY = "TI ARM Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/CodeGenerationTools.htm"
 SECTION = "devel"
 LICENSE = "TI"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
index fd34657a..c00a6a45 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI DSP Code Generation Tools"
+SUMMARY = "TI DSP Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb b/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
index b1361804..1cc334b9 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
@@ -1,3 +1,4 @@
+SUMMARY = "TI XDCtools (RTSC - Real Time Software Components"
 DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
 HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
 SECTION = "devel"
diff --git a/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc b/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
index 81407ed7..84f0f00f 100644
--- a/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
+++ b/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI Framework Components"
+SUMMARY = "TI Framework Components"
 HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
diff --git a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
index ab5cbdb6..6146b474 100644
--- a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
+++ b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
@@ -1,3 +1,4 @@
+SUMMARY = "IMGLIB for TI DSPs"
 DESCRIPTION = "IMGLIB contains optimized general-purpose image/video processing routines for TI DSPs"
 HOMEPAGE = "http://www.ti.com/tool/sprc264"
 SECTION = "devel"
diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
index 51846836..34031fa8 100644
--- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
+++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI Vision Library (VLIB) for C66x"
+SUMMARY = "TI Vision Library (VLIB) for C66x"
 HOMEPAGE = "http://software-dl.ti.com/libs/vlib/latest/index_FDS.html"
 SECTION = "devel"
 LICENSE = "TI-TSPA & BSD-3-Clause"
diff --git a/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc b/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
index 67d19022..36cdf2a6 100644
--- a/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
+++ b/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI eXpress DSP Algorithm Interface Standard (XDAIS) specification"
+SUMMARY = "TI eXpress DSP Algorithm Interface Standard (XDAIS) specification"
 HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais"
 LICENSE = "GPL-2.0-only"
 SECTION = "devel"
-- 
2.17.1


