Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898B3C25B0F
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 02:49:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.2719.1659667778108684638
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 19:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UqaSpebL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2752nb0V090734;
	Thu, 4 Aug 2022 21:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659667777;
	bh=wIz013/vMQXJdoThWuZs4/oD6Hke5EUdOLTbuCqN7ag=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UqaSpebLurY+YH29DwNSFUqPhEbLOPuYbLjPi6sOXdwJdYLbXiSs6cH8DmQoupTys
	 br+Oh6Val1b3UTNe+zEw2LPqWUXm5/NfQoIuNDf6PE3sgJXl8GDxlfXepnMH26YJUd
	 gVnTuXN0/APxMLSVxVCx/cN8BKCk8Dzd3Ue1kRyI=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2752nbvd123460
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 21:49:37 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 21:49:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 21:49:36 -0500
Received: from ula0226330.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2752nYES111537;
	Thu, 4 Aug 2022 21:49:36 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 6/8] ti-sci-fw: Make combined R5 boot the
 default
Date: Thu, 4 Aug 2022 21:49:32 -0500
Message-ID: <20220805024934.23349-6-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805024934.23349-1-afd@ti.com>
References: <20220805024934.23349-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Aug 2022 02:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14930

Going forward, the combined tiboot3.bin is going to be the standard. Only
AM65x and J721e will still use the split boot.

Set DEPENDS and EXTRA_OEMAKE for combined boot and override only for the
two split boot platforms. This makes it easier to add new platforms and
simplifies deployment logic.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/j7-hs-evm.conf            |  1 +
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 30 ++++++++++++--------------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
index 5cb2a3cd..ff998dc7 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -17,6 +17,7 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
+SYSFW_SYMLINK = ""
 
 BBMULTICONFIG += "k3r5-sr1-1"
 
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 1b2ea184..b06f6abe 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,13 +1,12 @@
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
-DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
-DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_j7200-hs-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_j721s2-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_j721s2-hs-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_am64xx-hs-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_am62xx-evm-k3r5 = " virtual/bootloader"
+DEPENDS = "openssl-native u-boot-mkimage-native dtc-native virtual/bootloader"
+DEPENDS_remove_am65xx-evm-k3r5 = " virtual/bootloader"
+DEPENDS_remove_am65xx-hs-evm-k3r5 = " virtual/bootloader"
+DEPENDS_remove_am65xx-hs-evm-k3r5-sr2 = " virtual/bootloader"
+DEPENDS_remove_j7-evm-k3r5 = " virtual/bootloader"
+DEPENDS_remove_j7-hs-evm-k3r5 = " virtual/bootloader"
+DEPENDS_remove_j7-hs-evm-k3r5-sr1-1 = " virtual/bootloader"
 
 CLEANBROKEN = "1"
 PR = "${INC_PR}.2"
@@ -54,15 +53,14 @@ do_configure[noexec] = "1"
 EXTRA_OEMAKE = "\
     CROSS_COMPILE=${TARGET_PREFIX} SOC=${SYSFW_SOC} SOC_TYPE=${SYSFW_SUFFIX} \
     CONFIG=${SYSFW_CONFIG} SYSFW_DIR="${S}/ti-sysfw" \
+    SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin" \
 "
-
-EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_j721s2-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_j721s2-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_am62xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_am65xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5-sr2 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_j7-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_j7-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_j7-hs-evm-k3r5-sr1-1 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
 do_compile() {
 	cd ${WORKDIR}/imggen/
-- 
2.36.1


