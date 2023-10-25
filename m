Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5D6C25B6D
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 16:56:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.178848.1698252994998315007
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 09:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ywi6LYCb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuXuO047978;
	Wed, 25 Oct 2023 11:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698252993;
	bh=CjnsPm5/nVI2tOUNP6pwSmtHtpEuWgo1h0WVoXKkGrE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ywi6LYCbCdCDtoFDzilczuHUcBOlaIVwqpK9Wxy8bCS261EbdoCiBUsAvbpK+JpxS
	 zsFI5pxc45t7QFdlgXF7p0aaFXlHPP3eDviaEv+JpISC0WrG0rAhgT9vgVAVU4ktdy
	 zO+OHgRoZhHO5Chgem6dBrrGA6FOa5obFxaRTKew=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39PGuXag040408
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Oct 2023 11:56:33 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 25
 Oct 2023 11:56:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 25 Oct 2023 11:56:32 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuVEQ008415;
	Wed, 25 Oct 2023 11:56:32 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 3/8] ti-linux-fw: Do not set source directory when including ti-linux-fw.inc
Date: Wed, 25 Oct 2023 11:56:25 -0500
Message-ID: <20231025165630.2274889-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025165630.2274889-1-afd@ti.com>
References: <20231025165630.2274889-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Oct 2023 16:56:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17188

The common include ti-linux-fw.inc already includes setting this, no need
to set it in each recipe, remove that.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 1 -
 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb         | 1 -
 meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb             | 1 -
 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb   | 2 --
 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb       | 2 --
 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb          | 2 --
 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb   | 2 --
 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb         | 2 --
 meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb         | 2 --
 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb     | 2 --
 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb             | 2 --
 meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb | 1 -
 12 files changed, 20 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index 4263e40f..d88bca6e 100644
--- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -12,7 +12,6 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
 TARGET = "mhdp8546.bin"
 
 do_install() {
diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index b1bc20b9..a9ee7a8e 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -15,7 +15,6 @@ COMPATIBLE_MACHINE = "j721s2|j784s4|am62axx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
 TARGET_WAVE521C = "wave521c_codec_fw.bin"
 
 SOURCE_WAVE521C = "wave521c_k3_codec_fw.bin"
diff --git a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
index 5cd6e131..e58f2d58 100644
--- a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
@@ -12,7 +12,6 @@ COMPATIBLE_MACHINE = "dra7xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
 ORIGIN = "DRA71x-RevA-GT9271_SpecDig_Config.bin"
 TARGET = "goodix_9271_cfg.bin"
 
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 5d95beab..8fe1f838 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -9,8 +9,6 @@ COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
-
 TARGET = " \
     am65x-sr2-pru0-prueth-fw.elf \
     am65x-sr2-pru1-prueth-fw.elf \
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
index f0d4d16d..4f648075 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
@@ -9,8 +9,6 @@ COMPATIBLE_MACHINE = "am65xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
-
 TARGET = " \
     am65x-pru0-prueth-fw.elf \
     am65x-pru1-prueth-fw.elf \
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
index c7db85fc..99b9e11c 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
@@ -8,8 +8,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
-
 TARGET = ""
 TARGET:ti33x = "am335x-pru0-prueth-fw.elf am335x-pru1-prueth-fw.elf"
 TARGET:ti43x = "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
index 12f7b729..a1fe13d3 100644
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
@@ -9,8 +9,6 @@ COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
-
 TARGET = " \
     am65x-sr2-pru0-pruhsr-fw.elf \
     am65x-sr2-pru1-pruhsr-fw.elf \
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
index 47c272a8..2cba6350 100644
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
@@ -9,8 +9,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
-
 TARGET = ""
 TARGET:ti33x = "am335x-pru0-pruhsr-fw.elf am335x-pru1-pruhsr-fw.elf"
 TARGET:ti43x = "am437x-pru0-pruhsr-fw.elf am437x-pru1-pruhsr-fw.elf"
diff --git a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
index fc8e423e..807cf941 100644
--- a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
@@ -9,8 +9,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
-
 TARGET = ""
 TARGET:ti33x = "am335x-pru0-pruprp-fw.elf am335x-pru1-pruprp-fw.elf"
 TARGET:ti43x = "am437x-pru0-pruprp-fw.elf am437x-pru1-pruprp-fw.elf"
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
index 208f8764..b89e8203 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
@@ -9,8 +9,6 @@ COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
-
 TARGET = " \
     am65x-sr2-pru0-prusw-fw.elf \
     am65x-sr2-pru1-prusw-fw.elf \
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
index 68649cf2..d612cdf0 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
@@ -8,8 +8,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
-
 TARGET = ""
 TARGET:ti33x = "am335x-pru0-prusw-fw.elf am335x-pru1-prusw-fw.elf"
 TARGET:ti43x = "am437x-pru0-prusw-fw.elf am437x-pru1-prusw-fw.elf"
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
index 7fb8f8f5..d295a1c1 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -11,7 +11,6 @@ COMPATIBLE_MACHINE = "j721e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/git"
 TARGET = "pvdec_full_bin.fw"
 
 do_install() {
-- 
2.39.2


