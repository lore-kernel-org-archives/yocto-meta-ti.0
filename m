Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E63ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 17:53:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2081.1661968402533300473
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 10:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=C7w7Evaz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27VHrHbk013925;
	Wed, 31 Aug 2022 12:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661968397;
	bh=HNnqONOdlQhlCalcZuIs4VAA5D1IyIDptr9zzEDVhIE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C7w7Evaz3DFgQlnJd2HSfQi6jy2MCtUfjqhTlH2bN4IBGpEbtEjQOwE82Z8FMPosd
	 Jd2baJUutWfrvc3HIP3pH+4sIF4ECWBHOKHZtNZ7wGAYKFU8IH9ImX2ppGQKgPs8zI
	 zkjhKVkOt6+WQMawnnUpk/2uesYruZw/Kv0LDRC0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27VHrH01050910
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Aug 2022 12:53:17 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 31
 Aug 2022 12:53:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 31 Aug 2022 12:53:17 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27VHrFtv033174;
	Wed, 31 Aug 2022 12:53:17 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 3/3] meta-ti: Use new J7 SoC names over
 specific board names
Date: Wed, 31 Aug 2022 12:53:15 -0500
Message-ID: <20220831175315.15942-4-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220831175315.15942-1-afd@ti.com>
References: <20220831175315.15942-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 31 Aug 2022 17:53:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14983

Now that we have SoC names, we can avoid adding features based on the
board name. We expect folks to create their own boards based on these
SoCs, and so using the TI made EVM board name everywhere adds extra churn
when adding a new board. Plus it is more correct for most of these
features as they depend on the SoC, not on the EVM board.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb |  2 +-
 .../ti-img-rogue-driver_1.15.6133109.bb            | 14 +++++---------
 .../ti-img-encode-decode/viddec-test-app_1.0.0.bb  |  2 +-
 .../ti-img-encode-decode/videnc-test-app_1.0.0.bb  |  2 +-
 .../libgles/ti-img-rogue-umlibs_1.15.6133109.bb    |  8 +++-----
 recipes-kernel/linux/kernel-rdepends.inc           |  6 ++----
 6 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index 0967e674..5528bfbc 100644
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -10,7 +10,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "j721e-evm|j721e-hs-evm"
+COMPATIBLE_MACHINE = "j721e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index bdb48b85..2b6916fb 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j721e-evm|j721e-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
+COMPATIBLE_MACHINE = "j721e|j721s2|am62xx"
 
 DEPENDS = "virtual/kernel"
 
@@ -28,15 +28,11 @@ S = "${WORKDIR}/git"
 
 SRCREV = "6d3d62a15ceb85b719c35f34c6c9e35f556b406b"
 
-TARGET_PRODUCT_j721e-evm = "j721e_linux"
-TARGET_PRODUCT_j721e-hs-evm = "j721e_linux"
-TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
-TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
+TARGET_PRODUCT_j721e = "j721e_linux"
+TARGET_PRODUCT_j721s2 = "j721s2_linux"
 TARGET_PRODUCT_am62xx = "am62_linux"
-TARGET_BVNC_j721e-evm = "22.104.208.318"
-TARGET_BVNC_j721e-hs-evm = "22.104.208.318"
-TARGET_BVNC_j721s2-evm = "36.53.104.796"
-TARGET_BVNC_j721s2-hs-evm = "36.53.104.796"
+TARGET_BVNC_j721e = "22.104.208.318"
+TARGET_BVNC_j721s2 = "36.53.104.796"
 TARGET_BVNC_am62xx = "33.15.11.3"
 PVR_BUILD = "release"
 PVR_WS = "wayland"
diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
index 4add7e33..599bd44b 100644
--- a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libdrm ffmpeg"
 
 inherit autotools pkgconfig
 
-COMPATIBLE_MACHINE = "j721e-evm|j721e-hs-evm"
+COMPATIBLE_MACHINE = "j721e"
 
 PR = "r1"
 SRCREV = "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
index a57acf64..54bf594d 100644
--- a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libdrm"
 
 inherit autotools pkgconfig
 
-COMPATIBLE_MACHINE = "j721e-evm|j721e-hs-evm"
+COMPATIBLE_MACHINE = "j721e"
 
 PR = "r0"
 SRCREV = "a5e7d820bea1be24f25a8369d4d4521c784f869a"
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index 5c6484a5..a5609ac5 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -8,7 +8,7 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j721e-evm|j721e-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
+COMPATIBLE_MACHINE = "j721e|j721s2|am62xx"
 
 PR = "r2"
 
@@ -17,10 +17,8 @@ BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
 SRCREV = "fba0c770b712640ab3761dbe8369d43f89f616ed"
 
-TARGET_PRODUCT_j721e-evm = "j721e_linux"
-TARGET_PRODUCT_j721e-hs-evm = "j721e_linux"
-TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
-TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
+TARGET_PRODUCT_j721e = "j721e_linux"
+TARGET_PRODUCT_j721s2 = "j721s2_linux"
 TARGET_PRODUCT_am62xx = "am62_linux"
 PVR_BUILD ?= "release"
 PVR_WS = "wayland"
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index c6bae54b..047c4ec7 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -38,15 +38,13 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2 p
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx = " prueth-fw-am65x-sr2"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721e-evm = " cadence-mhdp-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721e-hs-evm = " cadence-mhdp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721e = " cadence-mhdp-fw"
 
 # Add run-time dependency for Video Decoding firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
 
 # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cnm-wave-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cnm-wave-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2 = " cnm-wave-fw"
 
 # Add run-time dependency for TIFS Low Power Module stub
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
-- 
2.36.1


