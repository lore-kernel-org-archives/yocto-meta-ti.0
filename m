Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C35FC6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 20:23:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.20500.1681849423925936820
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 13:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hEXMA3Dc;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33IKNfpY123117;
	Tue, 18 Apr 2023 15:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681849421;
	bh=lS7CQX1L2Lrh0pzQG1SRwbct72oKQlljrhmKgLZzM/M=;
	h=From:To:CC:Subject:Date;
	b=hEXMA3DcdZ2CR1Jlf9ok9v491zQ6Kw+BiYSFVMe6HE/d4H8q39z8vB7AKHNeOQJ/C
	 f2qkIRlMu3RKcuBfKBrHFBudKVEeZXFIcrQPu4NxL2u5lc97RE0WyXj8WUL7pGcFtZ
	 40Ildi2eFRvcUuu29XK3GzmvNKxB2JcMmCE4YDRA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33IKNfaG066295
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Apr 2023 15:23:41 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 18
 Apr 2023 15:23:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 18 Apr 2023 15:23:41 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33IKNemt086283;
	Tue, 18 Apr 2023 15:23:40 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] ti-rtos-firmware: Do not provide default CORESDK_RTOS_VERSION
Date: Tue, 18 Apr 2023 15:23:39 -0500
Message-ID: <20230418202340.31072-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Apr 2023 20:23:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16413

The version information should come from the ti-linux-fw.inc and this
version is old anyway.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index ae7bdb81..4cac1bfa 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -25,11 +25,10 @@ PLAT_SFX:am62axx = "am62axx"
 FILESEXTRAPATHS:prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
-CORESDK_RTOS_VERSION ?= "08.00.00.26"
 PV = "${CORESDK_RTOS_VERSION}"
+PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
-PR = "${INC_PR}.0"
 
 # Secure Build
 inherit ti-secdev
-- 
2.39.2


