Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0868CC25B0E
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 01:41:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5969.1660268493795999448
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 18:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ejqGOheN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27C1fVJY054306;
	Thu, 11 Aug 2022 20:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660268491;
	bh=btJiZzVgSLDQOpFabAxAsdFQ24t0m9Y3RPNt+iX/5wo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ejqGOheNHzDQaqi4gcWp9zzHQeqTSeauRd+3Z7UxU4Q7g1Gq8WTqDawNx/daOPlc9
	 KM5Nilk4u/ql7N5VteuKTfi90wRvc6ugPnlPZvPu51/Z2SBEygY9+J6FwJ2H05YFNk
	 KVO8DSXS9bHBEfseZPHJIEPq1HgFHBtRg7rts2lQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27C1fVvb028764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Aug 2022 20:41:31 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 11
 Aug 2022 20:41:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 11 Aug 2022 20:41:31 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27C1fUVq026781;
	Thu, 11 Aug 2022 20:41:30 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 2/3] ti-sci-fw: Use ti-k3-secdev if
 TI_SECURE_DEV_PKG_K3 is not defined
Date: Thu, 11 Aug 2022 20:41:27 -0500
Message-ID: <20220812014128.1185-2-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220812014128.1185-1-afd@ti.com>
References: <20220812014128.1185-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Aug 2022 01:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14955

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 18652dd4..adf73a5e 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,4 +1,5 @@
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+require recipes-ti/includes/ti-paths.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native virtual/bootloader"
 DEPENDS_remove_am65xx-evm-k3r5 = " virtual/bootloader"
@@ -8,6 +9,7 @@ DEPENDS_remove_am65xx-hs-evm-k3r5-sr2 = " virtual/bootloader"
 DEPENDS_remove_j7-evm-k3r5 = " virtual/bootloader"
 DEPENDS_remove_j7-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS_remove_j7-hs-evm-k3r5-sr1-1 = " virtual/bootloader"
+DEPENDS_append = " ${@ '' if '${TI_SECURE_DEV_PKG_K3}' else 'ti-k3-secdev-native' }"
 
 CLEANBROKEN = "1"
 PR = "${INC_PR}.2"
@@ -18,7 +20,7 @@ COMPATIBLE_MACHINE_aarch64 = "null"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-TI_SECURE_DEV_PKG ?= ""
+TI_SECURE_DEV_PKG = "${@ '${TI_SECURE_DEV_PKG_K3}' or '${TI_K3_SECDEV_INSTALL_DIR}' }"
 export TI_SECURE_DEV_PKG
 
 SYSFW_SOC ?= "unknown"
-- 
2.36.1


