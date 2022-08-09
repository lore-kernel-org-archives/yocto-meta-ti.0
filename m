Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCE6C00140
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 01:05:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6590.1660007106627877916
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 18:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CEm+MhoF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 279155xH106757;
	Mon, 8 Aug 2022 20:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660007105;
	bh=gFW9dNnIxX+A3GDywuJuyMDZn3f8rvV/zlKvjo5CswI=;
	h=From:To:CC:Subject:Date;
	b=CEm+MhoFm/GJCuHsiuzHbG9N3yemD03/HdhpBd1ECv1JNOilMH30iz8uZRGngLwLu
	 PDgSBo+qjOdiaRQDnACfNzMbqOsyjVFvaDUx6qxVxOFNBje8w6x4+rxeROMADJQT1j
	 QXARVUEf76EJv7XdkZ+bjvmI+zvXHpayuNhM5ew8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2791550x087595
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Aug 2022 20:05:05 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 8
 Aug 2022 20:05:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 8 Aug 2022 20:05:04 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 279154tr012355;
	Mon, 8 Aug 2022 20:05:04 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH] ti-sci-fw: Add am65xx-evm-k3r5-sr2 to
 combined R5 boot list
Date: Mon, 8 Aug 2022 20:05:04 -0500
Message-ID: <20220809010504.10105-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Aug 2022 01:05:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14939

This machine was missed when making combined R5 boot the default.
Add this machine to fix build failure.

Reported-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 841fe16a..18652dd4 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -2,6 +2,7 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native virtual/bootloader"
 DEPENDS_remove_am65xx-evm-k3r5 = " virtual/bootloader"
+DEPENDS_remove_am65xx-evm-k3r5-sr2 = " virtual/bootloader"
 DEPENDS_remove_am65xx-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS_remove_am65xx-hs-evm-k3r5-sr2 = " virtual/bootloader"
 DEPENDS_remove_j7-evm-k3r5 = " virtual/bootloader"
@@ -57,6 +58,7 @@ EXTRA_OEMAKE = "\
     SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin" \
 "
 EXTRA_OEMAKE_remove_am65xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5-sr2 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_remove_j7-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-- 
2.36.1


