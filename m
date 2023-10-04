Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50719E8FDCC
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 06:34:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.12579.1696401295239876581
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 23:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F6S0LU+1;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3946YsNL111130
	for <meta-ti@lists.yoctoproject.org>; Wed, 4 Oct 2023 01:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696401294;
	bh=RhMZDh+6GPz6ohGtWCjYLuRCDRRT0cXS1uwyQzwVhkM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F6S0LU+1bRUuYRwD673UHLQi3+7gfGr4y42g5jAfsgo0qBIY0kth3fgu1xPKP1h4x
	 vcjnA+BGEVpgkzi0t4w5jmwgwmvtPeDoOTOtv3ZZ45qiucPkP+uDZj7fddRrk5uVEO
	 JaR4T5cXSDAwPaRxo2b42/hVGlQu201badFct9Mk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3946YsNa112987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 4 Oct 2023 01:34:54 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 01:34:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 01:34:54 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3946Yn1A024388;
	Wed, 4 Oct 2023 01:34:53 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] ti-dm-dw: Preserve structure of the deployed ti-dm-fw binaries
Date: Wed, 4 Oct 2023 12:04:30 +0530
Message-ID: <20231004063430.703304-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231004063430.703304-1-a-limaye@ti.com>
References: <20231004063430.703304-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Oct 2023 06:34:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17049

Preserve the directory structure of the deployed dm firmware so that one
can directly specify the deploy directory for binman based u-boot build.

Additionally, this makes it easier to preserve the same structure inside
the prebuilt-images directory of the tisdk-core-bundle for the same reason.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index f635565d..49638ee9 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -67,11 +67,11 @@ do_install() {
 
 do_deploy() {
     # DM Firmware is needed for rebuilding U-Boot
-    install -d ${DEPLOYDIR}
+    install -d ${DEPLOYDIR}/${DM_FW_DIR}
     for FW_NAME in ${DM_FW_LIST}
     do
-        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}/
-        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}.signed ${DEPLOYDIR}/
+        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}/${DM_FW_DIR}
+        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}.signed ${DEPLOYDIR}/${DM_FW_DIR}
     done
 }
 
-- 
2.34.1


