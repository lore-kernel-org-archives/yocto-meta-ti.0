Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59B4C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 22:34:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.4414.1664231694304286203
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 15:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vJxUhvKw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28QMYqpH025531;
	Mon, 26 Sep 2022 17:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664231692;
	bh=aemydfD62AlwVxd3gV7OuzRQTDuagPiYHkzxzXLA4u0=;
	h=From:To:CC:Subject:Date;
	b=vJxUhvKwohTxZTxtby+8588TEIXMNuBstxZBsjvvE/GcfM9SGQ9ZNsMG93DtZVM1y
	 JU6EFMI1HLuCZ6gChN6/EnhoTM4Cw3/meqFQs/XTvxyXOav5Vy8K8Zv2F+mUwhpJqu
	 Tzx0HuojQN9a5SDdZxnlX49LUu4Jp8KCpBxEfpsE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28QMYqDh086738
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Sep 2022 17:34:52 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 26
 Sep 2022 17:34:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 26 Sep 2022 17:34:52 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28QMYpqC104495;
	Mon, 26 Sep 2022 17:34:51 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Hari
 Nagalla <hnagalla@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH] trusted-firmware-a: Update to latest
 upstream master
Date: Mon, 26 Sep 2022 17:34:50 -0500
Message-ID: <20220926223450.9096-1-afd@ti.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 26 Sep 2022 22:34:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15098

Notable changes include support for J784s4.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index a1df380f..53e88d7e 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,6 +1,6 @@
 PV_k3 = "2.6"
 LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
-SRCREV_tfa_k3 = "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
+SRCREV_tfa_k3 = "1309c6c805190bd376c0561597653f3f8ecd0f58"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.37.3


