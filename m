Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78D7C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 11:26:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.51511.1699269973845319915
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 03:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HnA0Fl65;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: kamlesh@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A6BQBFg058790;
	Mon, 6 Nov 2023 05:26:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699269971;
	bh=/ltlKl1fNu6/OGDcVXdqPn6KNJPksJZ0KHlYzN7+3Q0=;
	h=From:Date:Subject:To:CC;
	b=HnA0Fl65avVSWTF3e+ZDWID/9vpcHbnKqbWxyDv1IZ615+J6/laJlf9Zv636NV8Z8
	 w+CJXTcbyOGujR9Gm8pVYkb17DVJNPq2DJcpgeup4kCO2yiumUiOZUJoMAULhC9t+t
	 7X8NFlVGDwcz+WSFe2KfV4PvNA4tbIm5zQmgq2rU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A6BQB2m099666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Nov 2023 05:26:11 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Nov 2023 05:26:11 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Nov 2023 05:26:11 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A6BQAoO005659;
	Mon, 6 Nov 2023 05:26:11 -0600
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Mon, 6 Nov 2023 16:55:50 +0530
Subject: [PATCH] optee-os: Enable OP-TEE TRNG in AM62X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231106-enable-trng-v1-1-59cb0b4f9bcb@ti.com>
X-B4-Tracking: v=1; b=H4sIAD3NSGUC/x2NwQqDMBAFf0X23AVjaWr7K8VDok9dLGvZhCKI/
 97Y48AMs1OCCRI9q50MX0myagF3qaifg05gGQpTUzdX52rP0BDf4Gw6MW5+vD8G71u0VIoYEjh
 a0H4+m0VsSXlVsGLLp/AxjLL9d6/uOH7bDJ2HfgAAAA==
To: <vigneshr@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699269970; l=1123;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=B2T9CQe+2X2ewszJ/Qev2s7+XDl6big1OL6XBSHyS5I=;
 b=6Kd+S1m4vHbMbHeSeYI3Qrlw4zGHohf5ShaIzaT4vaYFv4pQXh9qP3561nH2+VupLFUyAIKHh
 4ilpTttEPPvDkdMd52EMjASAPQYoJss2GWIQk3wEfaHt2HFZqXWsIeK
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Nov 2023 11:26:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17243

Enable TRNG in AM62X, as bugs related to TRNG has been fixed now.

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
index 91b66a36..d1c15cb2 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
@@ -6,7 +6,7 @@ inherit ti-secdev
 
 EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
-EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
 

---
base-commit: d5e768e29b3f8091cbdedb702ff4185f73af4f3d
change-id: 20231106-enable-trng-e56f79d668e8

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>


