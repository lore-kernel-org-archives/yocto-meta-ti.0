Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A70C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 17:22:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.20956.1661188958390334685
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 10:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uhC3fzrK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27MHMYem131030;
	Mon, 22 Aug 2022 12:22:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661188954;
	bh=tQq6lghtYpNa784aJdD7/WaC98yPSfqjRz9uRg7TSnk=;
	h=From:To:Subject:Date;
	b=uhC3fzrK5dJ0rt9q8shj8Um+uHS392HHyBmtARirTMzQ83U7DUqia5ZizvcZunmGc
	 kfst9E//eiMwmsWQE+/9vs9nSZgxKS/Fm4d2HVVedlTnICitsw8SctFH91UftVD2S5
	 ePiG4WrrcoF420T3YZ8zc9KF1TKU6v8UNAK7VxtM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27MHMYCt094289
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Aug 2022 12:22:34 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 22
 Aug 2022 12:22:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 22 Aug 2022 12:22:33 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27MHMX4o011299;
	Mon, 22 Aug 2022 12:22:33 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oQB8C-0007y4-Uz; Mon, 22 Aug 2022 12:22:33 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v4] all: Stop using git://git.ti.com
Date: Mon, 22 Aug 2022 12:22:32 -0500
Message-ID: <20220822172232.30589-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Aug 2022 17:22:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14967

Stop using un-encrypted git:// protocol to access TI repositories.

This is inline with the same arguments as made by github in
https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v4: Remove erroneous .swp file from the commit.
v3: Rework/rebase of the original patch from Nishanth now that our new
    build servers can handle this change.

 classes/ti-pdk-fetch.bbclass                              | 4 ++--
 recipes-bsp/abefw/abefw_1.0.14.bb                         | 2 +-
 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb         | 4 ++--
 recipes-bsp/boot-monitor/boot-monitor_git.bb              | 2 +-
 recipes-bsp/bt-fw/bt-fw_git.bb                            | 2 +-
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb               | 2 +-
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb               | 4 ++--
 recipes-bsp/cmem/cmem.inc                                 | 2 +-
 recipes-bsp/common-csl-ip/common-csl-ip.inc               | 4 ++--
 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb            | 4 ++--
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb                    | 2 +-
 recipes-bsp/dsptop/dsptop.inc                             | 2 +-
 recipes-bsp/edma3-lld/edma3-lld.inc                       | 4 ++--
 recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb   | 4 ++--
 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb    | 2 +-
 recipes-bsp/hplib/hplib.inc                               | 4 ++--
 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb                 | 4 ++--
 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb                     | 4 ++--
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb                      | 2 +-
 recipes-bsp/mad-utils/mad-utils-rtos_git.bb               | 2 +-
 recipes-bsp/mmap-lld/mmap-lld.inc                         | 4 ++--
 recipes-bsp/pktlib/pktlib.inc                             | 4 ++--
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb                     | 4 ++--
 .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb   | 2 +-
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 2 +-
 recipes-bsp/pru/pru-icss_git.bb                           | 2 +-
 recipes-bsp/sa-lld/sa-lld.inc                             | 4 ++--
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb           | 4 ++--
 recipes-bsp/srss-tc/srss-tc_git.bb                        | 2 +-
 recipes-bsp/starterware/starterware.inc                   | 4 ++--
 recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb | 2 +-
 recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb | 2 +-
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc                   | 4 ++--
 recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb               | 2 +-
 recipes-bsp/traceframework/traceframework.inc             | 4 ++--
 recipes-bsp/u-boot/u-boot-ti.inc                          | 4 ++--
 recipes-bsp/uio-module-drv/uio-module-drv.inc             | 4 ++--
 recipes-bsp/vpe-tests/vpe-tests_git.bb                    | 2 +-
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb                   | 4 ++--
 recipes-bsp/wdtimer/wdtimer-rtos_git.bb                   | 4 ++--
 recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb             | 2 +-
 recipes-bsp/x-load/x-load_1.46-psp.bb                     | 2 +-
 recipes-connectivity/uim/uim-sysfs_8.5.bb                 | 2 +-
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb          | 2 +-
 .../wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb  | 2 +-
 recipes-connectivity/wlconf/wlconf_8.7.3.bb               | 2 +-
 recipes-devtools/gdbc6x/gdbc6x.inc                        | 2 +-
 recipes-devtools/k3conf/k3conf_git.bb                     | 2 +-
 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb        | 2 +-
 .../libgles/ti-img-rogue-umlibs_1.15.6133109.bb           | 2 +-
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb    | 2 +-
 recipes-kernel/linux/linux-ti-mainline_git.bb             | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb             | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb              | 4 ++--
 recipes-ti/ctoolslib/libaet_git.bb                        | 2 +-
 recipes-ti/dsplib/dsplib.inc                              | 4 ++--
 recipes-ti/ipc/ipc-transport.inc                          | 4 ++--
 recipes-ti/ipc/ti-ipc-rtos.inc                            | 8 ++++----
 recipes-ti/ipc/ti-ipc.inc                                 | 4 ++--
 recipes-ti/ipc/ti-rpmsg-char.inc                          | 4 ++--
 recipes-ti/mathlib/mathlib.inc                            | 4 ++--
 recipes-ti/mpm-transport/mpm-transport_git.bb             | 2 +-
 recipes-ti/multiprocmgr/multiprocmgr.inc                  | 4 ++--
 recipes-ti/openmp-rtos/openmp-rtos_git.bb                 | 6 +++---
 recipes-ti/secdev/ti-k3-secdev_git.bb                     | 2 +-
 recipes-ti/swtools/swtools_git.bb                         | 4 ++--
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb                | 4 ++--
 recipes-ti/udma/udma_git.bb                               | 2 +-
 recipes-ti/uio-test-pruss/uio-test-pruss_git.bb           | 4 ++--
 69 files changed, 108 insertions(+), 108 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index cacd71a4..0efc4dd0 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,6 +1,6 @@
-TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
+TI_PDK_GIT_URI ?= "git://git.ti.com/git/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
-TI_PDK_GIT_PROTOCOL ?= "git"
+TI_PDK_GIT_PROTOCOL ?= "https"
 TI_PDK_SRCREV ?= "a1ace885998e9adbcbbd0abf8b9ded6ba9ec54ff"
 
 TI_PDK_VERSION ?= "2020.5.6"
diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.0.14.bb
index 302bdcde..03580e80 100644
--- a/recipes-bsp/abefw/abefw_1.0.14.bb
+++ b/recipes-bsp/abefw/abefw_1.0.14.bb
@@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 COMPATIBLE_MACHINE = "pandaboard|omap5-evm"
 
-SRC_URI = "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=git"
+SRC_URI = "git://git.ti.com/git/glsdk/abefw-omap4plus.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
index 0cb9ff17..f42caa36 100644
--- a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
+++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://audk2gaddonver.h;beginline=8;endline=47;md5=7a3996aaf
 COMPATIBLE_MACHINE = "k2g"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-AUDK2G_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/audk2g-addon.git"
-AUDK2G_ADDON_GIT_PROTOCOL = "git"
+AUDK2G_ADDON_GIT_URI = "git://git.ti.com/git/processor-sdk/audk2g-addon.git"
+AUDK2G_ADDON_GIT_PROTOCOL = "https"
 AUDK2G_ADDON_GIT_BRANCH = "master"
 AUDK2G_ADDON_GIT_DESTSUFFIX = "git/ti/addon/audk2g"
 
diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 9c436d1c..f85c29f6 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "u-boot-mkimage-native"
 
-SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/processor-firmware/ks2-boot-monitor.git;protocol=https;branch=${BRANCH}"
 
 PV = "4.0+git${SRCPV}"
 
diff --git a/recipes-bsp/bt-fw/bt-fw_git.bb b/recipes-bsp/bt-fw/bt-fw_git.bb
index f3d740b1..c3f4415f 100644
--- a/recipes-bsp/bt-fw/bt-fw_git.bb
+++ b/recipes-bsp/bt-fw/bt-fw_git.bb
@@ -8,7 +8,7 @@ CLEANBROKEN = "1"
 
 SRCREV = "0ee619b598d023fffc77679f099bc2a4815510e4"
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/ti-bt/service-packs.git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/ti-bt/service-packs.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index bbbc3ec1..37b2d108 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -9,7 +9,7 @@ PR = "r0"
 SRCREV = "fb484c5e54f2e31cf0a338d2927a06a2870bcc2c"
 BRANCH ?= "ti-v4.1.y"
 
-SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
index 38f9a43e..dc323985 100644
--- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
+++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
@@ -9,8 +9,8 @@ COMPATIBLE_MACHINE = "k2g|omapl137-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CMB_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/circmicarray-addon.git"
-CMB_ADDON_GIT_PROTOCOL = "git"
+CMB_ADDON_GIT_URI = "git://git.ti.com/git/processor-sdk/circmicarray-addon.git"
+CMB_ADDON_GIT_PROTOCOL = "https"
 CMB_ADDON_GIT_BRANCH = "master"
 CMB_ADDON_GIT_DESTSUFFIX = "git/ti/addon"
 
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index f568fa81..b8171bb3 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -9,7 +9,7 @@ SRCREV = "86269258a48e0a9008dd9d5ebfae9da7ce843393"
 
 PV = "4.20.00.01+git${SRCPV}"
 
-SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/ipc/ludev.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 COMPATIBLE_HOST ?= "null"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index 23586fd7..a85d2059 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -8,8 +8,8 @@ PV = "03.03.00.17B"
 INC_PR = "r0"
 PE = "2"
 
-CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
-CSL_GIT_PROTOCOL ="git"
+CSL_GIT_URI = "git://git.ti.com/git/keystone-rtos/common-csl-ip.git"
+CSL_GIT_PROTOCOL ="https"
 CSL_GIT_BRANCH = "release"
 CSL_GIT_DESTSUFFIX = "git"
 
diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index 8cb62b2a..ea16d11f 100755
--- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -9,11 +9,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit deploy
 inherit update-alternatives
 
-PROTOCOL = "git"
+PROTOCOL = "https"
 BRANCH = "master"
 SRCREV = "91f1628507bf7f8716f0bc7cafe88ad7f14c94f5"
 
-SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index 6ddbe683..4f114412 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -8,7 +8,7 @@ inherit features_check
 
 REQUIRED_MACHINE_FEATURES = "dsp"
 
-SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
+SRC_URI = "git://git.ti.com/git/glsdk/dspdce.git;protocol=https"
 
 SRCREV = "de6e599f067b25c46cc0c8f74a22cc3b8aafbae8"
 
diff --git a/recipes-bsp/dsptop/dsptop.inc b/recipes-bsp/dsptop/dsptop.inc
index 31f775e2..ec159c75 100644
--- a/recipes-bsp/dsptop/dsptop.inc
+++ b/recipes-bsp/dsptop/dsptop.inc
@@ -3,6 +3,6 @@ SRCREV = "816485e68430bbec643eac9498bfa5303eb2c2e1"
 PV = "1.4.0"
 INC_PR = "r2"
 
-SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/sdo-emu/dsptop.git;protocol=https;branch=${BRANCH}"
 
 BRANCH = "master"
diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index 34d3170f..b076ab30 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "TI EDMA3 low level driver and test code"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
 
-EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
-EDMA3_LLD_GIT_PROTOCOL = "git"
+EDMA3_LLD_GIT_URI = "git://git.ti.com/git/keystone-rtos/edma3_lld.git"
+EDMA3_LLD_GIT_PROTOCOL = "https"
 EDMA3_LLD_GIT_BRANCH = "master"
 
 # Below commit ID corresponds to version 2.12.05.30E
diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
index bf8aba6a..f759e21e 100644
--- a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
+++ b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://fault_mgmt.h;beginline=1;endline=41;md5=4be5df2b9c314
 COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-FAULT_MANAGEMENT_GIT_URI = "git://git.ti.com/keystone-rtos/fault_mgmt.git"
-FAULT_MANAGEMENT_GIT_PROTOCOL = "git"
+FAULT_MANAGEMENT_GIT_URI = "git://git.ti.com/git/keystone-rtos/fault_mgmt.git"
+FAULT_MANAGEMENT_GIT_PROTOCOL = "https"
 FAULT_MANAGEMENT_GIT_BRANCH = "master"
 FAULT_MANAGEMENT_GIT_DESTSUFFIX = "git/ti/instrumentation/fault_mgmt"
 
diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index d36bcd56..13060b9d 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -15,7 +15,7 @@ BRANCH = "ti-${PV}-k5.10"
 
 SRCREV = "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
 
-SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/src"
 
diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
index dda47344..f279ba42 100644
--- a/recipes-bsp/hplib/hplib.inc
+++ b/recipes-bsp/hplib/hplib.inc
@@ -5,8 +5,8 @@ DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
-HPLIB_GIT_URI = "git://git.ti.com/keystone-rtos/hplib.git"
-HPLIB_GIT_PROTOCOL = "git"
+HPLIB_GIT_URI = "git://git.ti.com/git/keystone-rtos/hplib.git"
+HPLIB_GIT_PROTOCOL = "https"
 HPLIB_GIT_BRANCH = "master"
 
 # Below Commit ID corresponds to "DEV.HPLIB.01.01.00.08"
diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
index 59b75b3a..cdea82c8 100644
--- a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
+++ b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
@@ -19,8 +19,8 @@ COMPATIBLE_MACHINE = "c66x"
 
 CLEANBROKEN = "1"
 
-IBL_BOOT_GIT_URI = "git://git.ti.com/keystone-rtos/ibl.git"
-IBL_BOOT_GIT_PROTOCOL = "git"
+IBL_BOOT_GIT_URI = "git://git.ti.com/git/keystone-rtos/ibl.git"
+IBL_BOOT_GIT_PROTOCOL = "https"
 IBL_BOOT_GIT_BRANCH = "master"
 IBL_BOOT_SRCREV = "ed3f0989d8cdc813b7ca1ed899c4d84b63de3a75"
 
diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
index 93a8a3a1..a1c244fa 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
@@ -11,11 +11,11 @@ COMPATIBLE_MACHINE = "k3"
 PV = "1.0-git${SRCPV}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PROTOCOL = "git"
+PROTOCOL = "https"
 BRANCH = "master"
 SRCREV = "c9f7cfe61b67998a053fe145344ce0c9b5bb22aa"
 
-SRC_URI = "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=${PROTOCOL};branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/keystone-rtos/ipc-lld.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 380c274a..219f915c 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -11,7 +11,7 @@ REQUIRED_MACHINE_FEATURES = "mmip"
 
 RDEPENDS_${PN} = "libdce"
 
-SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
+SRC_URI = "git://git.ti.com/git/ivimm/ipumm.git;protocol=https"
 
 SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
 
diff --git a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
index 0144aad2..58227f8b 100644
--- a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
+++ b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
@@ -16,7 +16,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "c66x"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/mad-utils.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/keystone-rtos/mad-utils.git;protocol=https;branch=${BRANCH}"
 SRCREV = "2458510f76eddfa837c2b83448965e233156944b"
 PR = "r0"
 
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index 7e11a4c5..79105da1 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -4,8 +4,8 @@ COMPATIBLE_MACHINE = "keystone"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
 
-MMAP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git"
-MMAP_LLD_GIT_PROTOCOL = "git"
+MMAP_LLD_GIT_URI = "git://git.ti.com/git/keystone-rtos/mmap-lld.git"
+MMAP_LLD_GIT_PROTOCOL = "https"
 MMAP_LLD_GIT_BRANCH = "master"
 MMAP_LLD_GIT_DESTSUFFIX = "git/ti/runtime/mmap"
 
diff --git a/recipes-bsp/pktlib/pktlib.inc b/recipes-bsp/pktlib/pktlib.inc
index af3f8bb1..8e4ac7c9 100644
--- a/recipes-bsp/pktlib/pktlib.inc
+++ b/recipes-bsp/pktlib/pktlib.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://docs/Doxyfile;md5=91d01dc3788e1f405f000b2089191a0a"
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PKTLIB_GIT_URI = "git://git.ti.com/keystone-rtos/pktlib.git"
-PKTLIB_GIT_PROTOCOL = "git"
+PKTLIB_GIT_URI = "git://git.ti.com/git/keystone-rtos/pktlib.git"
+PKTLIB_GIT_PROTOCOL = "https"
 PKTLIB_GIT_BRANCH = "master"
 PKTLIB_GIT_DESTSUFFIX = "git/ti/runtime/pktlib"
 
diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index 25fcb65e..f765e910 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -9,8 +9,8 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 
-PM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pm-lld.git"
-PM_LLD_GIT_PROTOCOL = "git"
+PM_LLD_GIT_URI = "git://git.ti.com/git/keystone-rtos/pm-lld.git"
+PM_LLD_GIT_PROTOCOL = "https"
 
 PM_LLD_GIT_BRANCH = "master"
 
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index 3a20d809..7fcbd96a 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -20,7 +20,7 @@ PROVIDES = "virtual/gpudriver"
 BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
 
 SRC_URI = " \
-    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
+    git://git.ti.com/git/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
     file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
 "
 
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index a1b0765c..796c4ec9 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -20,7 +20,7 @@ PROVIDES = "virtual/gpudriver"
 
 BRANCH = "ti-img-sgx/${PV}/k5.10"
 
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 1ceba057..e687e4b5 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PRU-Package-v6.1-Manifest.html;md5=1e37797ebe9254922f
 inherit update-alternatives
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
 SRCREV = "ae1decf0b494b2904e6157e1379691ffc468f0cf"
 
 PV = "6.1.0"
diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index d4993cb9..3f0947e2 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -3,8 +3,8 @@ COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
 
-SA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/sa-lld.git"
-SA_LLD_GIT_PROTOCOL = "git"
+SA_LLD_GIT_URI = "git://git.ti.com/git/keystone-rtos/sa-lld.git"
+SA_LLD_GIT_PROTOCOL = "https"
 SA_LLD_GIT_BRANCH = "master"
 SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
 
diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
index 442c4cb1..e683090a 100644
--- a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
+++ b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://serdes_diag.h;beginline=1;endline=42;;md5=68e7ce6fdc0
 COMPATIBLE_MACHINE = "keystone|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SERDES_DIAG_GIT_URI = "git://git.ti.com/keystone-rtos/serdes_diag.git"
-SERDES_DIAG_GIT_PROTOCOL = "git"
+SERDES_DIAG_GIT_URI = "git://git.ti.com/git/keystone-rtos/serdes_diag.git"
+SERDES_DIAG_GIT_PROTOCOL = "https"
 SERDES_DIAG_GIT_BRANCH = "master"
 SERDES_DIAG_GIT_DESTSUFFIX = "git/ti/diag/serdes_diag"
 
diff --git a/recipes-bsp/srss-tc/srss-tc_git.bb b/recipes-bsp/srss-tc/srss-tc_git.bb
index 483bde00..b94dc17f 100644
--- a/recipes-bsp/srss-tc/srss-tc_git.bb
+++ b/recipes-bsp/srss-tc/srss-tc_git.bb
@@ -10,7 +10,7 @@ BRANCH = "master"
 # This commit corresponds to tag DEV.SRSS-TC-01.00.00.01A
 SRCREV = "107cd1433ef5785e5647ef086a4cc77566506604"
 
-SRC_URI = "git://git.ti.com/keystone-linux/srss-tc.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/keystone-linux/srss-tc.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-bsp/starterware/starterware.inc b/recipes-bsp/starterware/starterware.inc
index 82b012ad..92e20e45 100644
--- a/recipes-bsp/starterware/starterware.inc
+++ b/recipes-bsp/starterware/starterware.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=35;md5=286cbb5dce3e34829
 COMPATIBLE_MACHINE = "ti33x|ti43x"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
-STARTERWARE_GIT_PROTOCOL = "git"
+STARTERWARE_GIT_URI = "git://git.ti.com/git/keystone-rtos/starterware.git"
+STARTERWARE_GIT_PROTOCOL = "https"
 STARTERWARE_GIT_BRANCH = "master"
 
 # Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.12A"
diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
index 2fe95cb8..bd863c0a 100644
--- a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
@@ -15,6 +15,6 @@ EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/jacinto7_multimedia/viddec-test-app.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
index 35dacd12..71f5cfbf 100644
--- a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
@@ -15,6 +15,6 @@ EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/jacinto7_multimedia/videnc-test-app.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index ced7b5cb..25accd71 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -32,8 +32,8 @@ SRCREV_FORMAT = "imggen"
 K3_IMAGE_GEN_BRANCH ?= "master"
 
 SRC_URI = " \
-	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
-	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=${K3_IMAGE_GEN_BRANCH};destsuffix=imggen;name=imggen \
+	git://git.ti.com/git/processor-firmware/ti-linux-firmware.git;protocol=https;branch=${BRANCH} \
+	git://git.ti.com/git/k3-image-gen/k3-image-gen.git;protocol=https;branch=${K3_IMAGE_GEN_BRANCH};destsuffix=imggen;name=imggen \
 "
 
 S = "${WORKDIR}/git"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
index 9e68fdff..c8ca26bd 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
@@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRCREV = "ab507546f0f3f217f4c782a20845856e14b38224"
 BRANCH ?= "ti-linux-firmware"
 
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/processor-firmware/ti-linux-firmware.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 TARGET = "ti-sci-firmware-k2g.bin"
diff --git a/recipes-bsp/traceframework/traceframework.inc b/recipes-bsp/traceframework/traceframework.inc
index 33b87d9c..54b859ae 100644
--- a/recipes-bsp/traceframework/traceframework.inc
+++ b/recipes-bsp/traceframework/traceframework.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
 COMPATIBLE_MACHINE = "tci6614-evm|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-TRACEFRAMEWORK_GIT_URI = "git://git.ti.com/keystone-rtos/traceframework.git"
-TRACEFRAMEWORK_GIT_PROTOCOL = "git"
+TRACEFRAMEWORK_GIT_URI = "git://git.ti.com/git/keystone-rtos/traceframework.git"
+TRACEFRAMEWORK_GIT_PROTOCOL = "https"
 TRACEFRAMEWORK_GIT_BRANCH = "master"
 TRACEFRAMEWORK_GIT_DESTSUFFIX = "git/ti/instrumentation/traceframework"
 
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index e7020613..97f9fa2b 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -16,8 +16,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
 
 BRANCH ?= "master"
-UBOOT_GIT_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git"
-UBOOT_GIT_PROTOCOL = "git"
+UBOOT_GIT_URI = "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
+UBOOT_GIT_PROTOCOL = "https"
 SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
 
 PV_append = "+git${SRCPV}"
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
index daae836f..43fedd04 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -7,8 +7,8 @@ UIO_MODULE_DRV_SRCREV = "78c535afe8f8cc0b715500a63eab0bc3606c0579"
 
 PV = "2.3.1.0+git${SRCPV}"
 
-UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git"
-UIO_MODULE_DRV_GIT_PROTOCOL = "git"
+UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/git/keystone-linux/uio-module-drv.git"
+UIO_MODULE_DRV_GIT_PROTOCOL = "https"
 SRC_URI = "${UIO_MODULE_DRV_GIT_URI};protocol=${UIO_MODULE_DRV_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${UIO_MODULE_DRV_SRCREV}"
diff --git a/recipes-bsp/vpe-tests/vpe-tests_git.bb b/recipes-bsp/vpe-tests/vpe-tests_git.bb
index 92c425b1..1e646688 100644
--- a/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
 BRANCH ?= "master"
 
-SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/vpe_tests/vpe_tests.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
index e2834a63..b4118cbd 100644
--- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=32;md5=4303d306ea53eb
 COMPATIBLE_MACHINE = "omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-VPS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/vps.git"
-VPS_LLD_GIT_PROTOCOL = "git"
+VPS_LLD_GIT_URI = "git://git.ti.com/git/keystone-rtos/vps.git"
+VPS_LLD_GIT_PROTOCOL = "https"
 VPS_LLD_GIT_BRANCH = "master"
 VPS_LLD_GIT_DESTSUFFIX = "git/ti/drv/vps"
 
diff --git a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb b/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
index 59ebf31f..43c4ffb0 100644
--- a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
+++ b/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
@@ -8,8 +8,8 @@ inherit ti-pdk
 COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-WATCHDOG_TIMER_GIT_URI = "git://git.ti.com/keystone-rtos/wdtimer.git"
-WATCHDOG_TIMER_GIT_PROTOCOL = "git"
+WATCHDOG_TIMER_GIT_URI = "git://git.ti.com/git/keystone-rtos/wdtimer.git"
+WATCHDOG_TIMER_GIT_PROTOCOL = "https"
 WATCHDOG_TIMER_GIT_BRANCH = "master"
 WATCHDOG_TIMER_GIT_DESTSUFFIX = "git/ti/instrumentation/wdtimer"
 
diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
index 50b6c297..c769670f 100644
--- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
+++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
@@ -3,7 +3,7 @@ LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
 SRC_URI = " \
-	git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
+	git://git.ti.com/git/wilink8-wlan/wl18xx_fw.git;protocol=https;branch=${BRANCH} \
 	file://0001-Add-Makefile-to-install-firmware-files.patch \
 "
 
diff --git a/recipes-bsp/x-load/x-load_1.46-psp.bb b/recipes-bsp/x-load/x-load_1.46-psp.bb
index 5713927b..413328e1 100644
--- a/recipes-bsp/x-load/x-load_1.46-psp.bb
+++ b/recipes-bsp/x-load/x-load_1.46-psp.bb
@@ -12,7 +12,7 @@ PE = "1"
 
 # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
 SRCREV_pn-${PN} = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
-SRC_URI = "git://git.ti.com/git/arago-project-org/x-load-omap3.git;protocol=https"
+SRC_URI = "git://git.ti.com/git/git/arago-project-org/x-load-omap3.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-connectivity/uim/uim-sysfs_8.5.bb b/recipes-connectivity/uim/uim-sysfs_8.5.bb
index 72e2166f..b39d3970 100644
--- a/recipes-connectivity/uim/uim-sysfs_8.5.bb
+++ b/recipes-connectivity/uim/uim-sysfs_8.5.bb
@@ -8,7 +8,7 @@ INITSCRIPT_PARAMS = "defaults 03"
 inherit update-rc.d
 
 SRCREV = "a75f45be2d5c74fc1dd913d08afc30f09a230aa9"
-SRC_URI = "git://git.ti.com/ti-bt/uim.git"
+SRC_URI = "git://git.ti.com/git/ti-bt/uim.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
index 8a759ed8..589fb709 100644
--- a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
+++ b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} = "wl18xx-fw"
 
 #Tag: R8.7_SP3 (8.7.3)
 SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
-SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
+SRC_URI = "git://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
index 6c4b2b43..b59810fe 100644
--- a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
+++ b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c
 # Tag: R8.7_SP3 (8.7.3)
 SRCREV = "a07b6e711d2a70608101d3d6cdc5749c4d8a96d5"
 BRANCH = "sitara-scripts"
-SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/git/wilink8-wlan/wl18xx-target-scripts.git;protocol=https;branch=${BRANCH} \
 file://0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch \
 "
 
diff --git a/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/recipes-connectivity/wlconf/wlconf_8.7.3.bb
index 19f28b75..d9c0b6c7 100644
--- a/recipes-connectivity/wlconf/wlconf_8.7.3.bb
+++ b/recipes-connectivity/wlconf/wlconf_8.7.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85
 
 # Tag: R8.7_SP3 (8.7.3)
 SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
-SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
+SRC_URI = "git://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git;protocol=https"
 
 S = "${WORKDIR}/git/wlconf"
 
diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-devtools/gdbc6x/gdbc6x.inc
index eeb18fb1..54115f4e 100644
--- a/recipes-devtools/gdbc6x/gdbc6x.inc
+++ b/recipes-devtools/gdbc6x/gdbc6x.inc
@@ -4,6 +4,6 @@ SRCREV = "dd0c82fb5763a6b32dc6d68e561efb66ab8283d7"
 PV = "1.1.0"
 INC_PR = "r7"
 
-SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/sdo-emu/gdbc6x.git;protocol=https;branch=${BRANCH}"
 
 BRANCH = "master"
diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
index 567e8d55..10e2631e 100644
--- a/recipes-devtools/k3conf/k3conf_git.bb
+++ b/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE = "k3"
 BRANCH ?= "master"
 SRCREV = "48cb8e8d7dc962229a9f318cd512b4ddeec5cdc5"
 
-SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 55758682..dcdb1209 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -13,7 +13,7 @@ CLEANBROKEN = "1"
 
 BRANCH = "ti-${PV}"
 
-SRC_URI = "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=https;branch=${BRANCH}"
 SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
 
 RRECOMMENDS_${PN} = "ti-gc320-driver"
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index 7921d17b..323978bf 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -14,7 +14,7 @@ PR = "r2"
 
 BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
 
-SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
 SRCREV = "fba0c770b712640ab3761dbe8369d43f89f616ed"
 
 TARGET_PRODUCT_j7-evm = "j721e_linux"
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 319f226f..59bac2f4 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -14,7 +14,7 @@ PR = "r37"
 
 BRANCH = "ti-img-sgx/dunfell/${PV}"
 
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH}"
 SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index 4a5034fd..3b7ad885 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -29,10 +29,10 @@ MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
-KERNEL_GIT_PROTOCOL = "git"
+KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += " \
     ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
-    git://git.ti.com/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
+    git://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
     file://defconfig \
 "
 
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index a29d6f4d..e5707144 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -32,8 +32,8 @@ PV = "5.10.131+git${SRCPV}"
 MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "git"
+KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
 
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index a86223af..3a5516c6 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -28,8 +28,8 @@ PV = "5.4.106+git${SRCPV}"
 MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "git"
+KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
 
diff --git a/recipes-ti/ctoolslib/libaet_git.bb b/recipes-ti/ctoolslib/libaet_git.bb
index 626ba926..27ea8ac9 100644
--- a/recipes-ti/ctoolslib/libaet_git.bb
+++ b/recipes-ti/ctoolslib/libaet_git.bb
@@ -7,7 +7,7 @@ PV = "4.19.0.0"
 
 LIC_FILES_CHKSUM = "file://../ctoolslib_manifest.html;md5=b7dd369a2e07ef9a71795ee5a9bd01bd"
 
-SRC_URI = "git://git.ti.com/sdo-emu/ctoolslib.git;protocol=git;branch=opencl_aetlib_build"
+SRC_URI = "git://git.ti.com/git/sdo-emu/ctoolslib.git;protocol=https;branch=opencl_aetlib_build"
 SRCREV = "de7954abab0f0caa8a2c7b53095c30226d901a31"
 
 DEPENDS = "ti-cgt6x-native"
diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
index 111d83cb..81534c59 100644
--- a/recipes-ti/dsplib/dsplib.inc
+++ b/recipes-ti/dsplib/dsplib.inc
@@ -17,8 +17,8 @@ DEPENDS = "ti-cgt6x-native \
 S = "${WORKDIR}/git"
 
 DSPLIB_GIT_BRANCH = "master"
-DSPLIB_GIT_PROTOCOL = "git"
-DSPLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git"
+DSPLIB_GIT_PROTOCOL = "https"
+DSPLIB_GIT_URI = "git://git.ti.com/git/ep-processor-libraries/dsplib.git"
 DSPLIB_SRCREV = "0390b171042c602e07669fd28a371cc319b90161"
 
 SRC_URI = "${DSPLIB_GIT_URI};protocol=${DSPLIB_GIT_PROTOCOL};branch=${DSPLIB_GIT_BRANCH}"
diff --git a/recipes-ti/ipc/ipc-transport.inc b/recipes-ti/ipc/ipc-transport.inc
index 0c1edef1..ec093560 100644
--- a/recipes-ti/ipc/ipc-transport.inc
+++ b/recipes-ti/ipc/ipc-transport.inc
@@ -1,7 +1,7 @@
 LICENSE = "BSD-3-Clause"
 
-IPC_TRANSPORT_GIT_URI = "git://git.ti.com/keystone-linux/ipc-transport.git"
-IPC_TRANSPORT_GIT_PROTOCOL = "git"
+IPC_TRANSPORT_GIT_URI = "git://git.ti.com/git/keystone-linux/ipc-transport.git"
+IPC_TRANSPORT_GIT_PROTOCOL = "https"
 IPC_TRANSPORT_GIT_BRANCH = "master"
 
 # Below commit ID corresponds to "DEV.IPC-TRANSPORT.02.00.00.02A"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index b6b7892f..6f0f4146 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -1,8 +1,8 @@
 require recipes-ti/includes/ti-paths.inc
 
-TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/ipc/ipc-examples.git"
+TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/git/ipc/ipc-examples.git"
 TI_IPC_EXAMPLES_DEST_SUFFIX = "git/ipc-examples"
-TI_IPC_EXAMPLES_GIT_PROTOCOL = "git"
+TI_IPC_EXAMPLES_GIT_PROTOCOL = "https"
 TI_IPC_EXAMPLES_GIT_BRANCH = "master"
 TI_IPC_EXAMPLES_NAME = "ipc-examples"
 
@@ -12,9 +12,9 @@ protocol=${TI_IPC_EXAMPLES_GIT_PROTOCOL};\
 branch=${TI_IPC_EXAMPLES_GIT_BRANCH};\
 name=${TI_IPC_EXAMPLES_NAME}"
 
-TI_IPC_METADATA_GIT_URI = "git://git.ti.com/ipc/ipc-metadata.git"
+TI_IPC_METADATA_GIT_URI = "git://git.ti.com/git/ipc/ipc-metadata.git"
 TI_IPC_METADATA_DEST_SUFFIX = "git/ipc-metadata"
-TI_IPC_METADATA_GIT_PROTOCOL = "git"
+TI_IPC_METADATA_GIT_PROTOCOL = "https"
 TI_IPC_METADATA_GIT_BRANCH = "master"
 TI_IPC_METADATA_NAME = "ipc-metadata"
 
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 3b0115eb..d8ae6f84 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -4,8 +4,8 @@ HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
 
-TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
-TI_IPC_GIT_PROTOCOL = "git"
+TI_IPC_GIT_URI = "git://git.ti.com/git/ipc/ipcdev.git"
+TI_IPC_GIT_PROTOCOL = "https"
 TI_IPC_GIT_BRANCH = "master"
 
 #Corresponds to 3.51.00.00A
diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
index b499647a..a0e03851 100644
--- a/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -3,9 +3,9 @@ SUMMARY = "TI RPMsg Char Utility Library"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=71987db43a2159cff5ea00505c6fce58"
 
-PROTOCOL = "git"
+PROTOCOL = "https"
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
+SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
 # Initial 0.4.1 release
 SRCREV = "355d2b0bcde5eb5c895a270d1835102d2bc39fbd"
diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
index cfc5409f..5d96e8aa 100644
--- a/recipes-ti/mathlib/mathlib.inc
+++ b/recipes-ti/mathlib/mathlib.inc
@@ -17,8 +17,8 @@ DEPENDS = "ti-cgt6x-native \
 S = "${WORKDIR}/git"
 
 MATHLIB_GIT_BRANCH = "master"
-MATHLIB_GIT_PROTOCOL = "git"
-MATHLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git"
+MATHLIB_GIT_PROTOCOL = "https"
+MATHLIB_GIT_URI = "git://git.ti.com/git/ep-processor-libraries/mathlib.git"
 MATHLIB_SRCREV = "eadcc9547faf69789661b004bb0b5ef53bb69951"
 
 SRC_URI = "${MATHLIB_GIT_URI};protocol=${MATHLIB_GIT_PROTOCOL};branch=${MATHLIB_GIT_BRANCH}"
diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 3c28f28c..bdbd4b04 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -10,7 +10,7 @@ DEPENDS_append_k2e = " hyplnk-lld"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/keystone-linux/mpm-transport.git;protocol=https;branch=${BRANCH}"
 
 BRANCH = "master"
 # This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.04.00
diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index 64fb6f6f..a019496a 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
 SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
 
-MULTIPROCMGR_GIT_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git"
-MULTIPROCMGR_GIT_PROTOCOL = "git"
+MULTIPROCMGR_GIT_URI = "git://git.ti.com/git/keystone-linux/multi-proc-manager.git"
+MULTIPROCMGR_GIT_PROTOCOL = "https"
 MULTIPROCMGR_GIT_BRANCH = "master"
 
 # The following commits correspond to DEV.MPM-3.00.05.00
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 0c93f354..a578b0b7 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI OpenMP RTOS"
-HOMEPAGE = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
+HOMEPAGE = "git://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
 LICENSE = "BSD"
 
 require recipes-ti/includes/ti-paths.inc
@@ -12,8 +12,8 @@ REQUIRED_DISTRO_FEATURES = "openmp"
 PV = "2_06_03_00"
 PR = "r0"
 
-OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
-OPENMP_RTOS_GIT_PROTOCOL = "git"
+OPENMP_RTOS_GIT_URI = "git://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
+OPENMP_RTOS_GIT_PROTOCOL = "https"
 OPENMP_RTOS_GIT_BRANCH = "master"
 
 BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
diff --git a/recipes-ti/secdev/ti-k3-secdev_git.bb b/recipes-ti/secdev/ti-k3-secdev_git.bb
index 28dbe9ee..3851d35a 100644
--- a/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "null"
 COMPATIBLE_MACHINE_class-native = "(.*)"
 COMPATIBLE_MACHINE_class-nativesdk = "(.*)"
 
-GIT_URI = "git://git.ti.com/git/security-development-tools/core-secdev-k3.git"
+GIT_URI = "git://git.ti.com/git/git/security-development-tools/core-secdev-k3.git"
 GIT_PROTOCOL = "https"
 GIT_BRANCH = "master"
 GIT_SRCREV = "eb2c4d734487e5095b94cef3fd7213ee71d9e016"
diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
index 497c0e0d..6a3b0344 100644
--- a/recipes-ti/swtools/swtools_git.bb
+++ b/recipes-ti/swtools/swtools_git.bb
@@ -15,8 +15,8 @@ PR = "r3"
 S = "${WORKDIR}/git"
 
 SWTOOLS_GIT_BRANCH = "master"
-SWTOOLS_GIT_PROTOCOL = "git"
-SWTOOLS_GIT_URI = "git://git.ti.com/ep-processor-libraries/swtools.git"
+SWTOOLS_GIT_PROTOCOL = "https"
+SWTOOLS_GIT_URI = "git://git.ti.com/git/ep-processor-libraries/swtools.git"
 SWTOOLS_SRCREV = "7d1c85e686b1466cd2d535fc9cac5baf1aae24a4"
 
 SRC_URI = "${SWTOOLS_GIT_URI};protocol=${SWTOOLS_GIT_PROTOCOL};branch=${SWTOOLS_GIT_BRANCH}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index e435676f..2f84e60e 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -16,8 +16,8 @@ PLAT_SFX_am65xx = "/am65xx"
 PLAT_SFX_am64xx = "/am64x"
 
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
-TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
-TI_RTOS_METADATA_PROTOCOL ?= "git"
+TI_RTOS_METADATA_URI ?= "git://git.ti.com/git/processor-sdk/coresdk_rtos_releases.git"
+TI_RTOS_METADATA_PROTOCOL ?= "https"
 TI_RTOS_METADATA_SRCREV ?= "2ecbf45af64bc47806623cc5bf7ab493489acaf9"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
diff --git a/recipes-ti/udma/udma_git.bb b/recipes-ti/udma/udma_git.bb
index c905fa58..caea6e8f 100644
--- a/recipes-ti/udma/udma_git.bb
+++ b/recipes-ti/udma/udma_git.bb
@@ -5,7 +5,7 @@ COMPATIBLE_MACHINE = "keystone"
 LIC_FILES_CHKSUM = "file://include/udma.h;startline=1;endline=39;md5=ba3c7f91f970afe073b759ced61d0f27"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-linux/udma.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/keystone-linux/udma.git;protocol=https;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 # Commit corresponds to UDMA.01.00.00.00
 SRCREV = "53d09fb0bc98c41c5eb43623097e363c497d6fd8"
diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
index cbae1b11..2d7a0831 100644
--- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
+++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
@@ -10,8 +10,8 @@ DEPENDS = "ti-cgt-pru-native"
 BRANCH = "master"
 LIC_FILES_CHKSUM = "file://Makefile;startline=1;endline=31;md5=0ee4f2c42eb6b04e37859bb55a18b144"
 
-UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git"
-UIO_TEST_PRUSS_GIT_PROTOCOL = "git"
+UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/git/processor-sdk/uio-test-pruss.git"
+UIO_TEST_PRUSS_GIT_PROTOCOL = "https"
 SRC_URI = "${UIO_TEST_PRUSS_GIT_URI};protocol=${UIO_TEST_PRUSS_GIT_PROTOCOL};branch=${BRANCH}"
 
 # Corresponds to version 01.00.02.00
-- 
2.17.1


