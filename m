Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDB1C4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 07:49:55 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8898.1699429789656000070
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 23:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UQmf1rRZ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: kamlesh@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A87nmqU066463;
	Wed, 8 Nov 2023 01:49:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699429788;
	bh=IWMMilFOCrDPkqWCWwM59p6UR5hE9l5oPKi1ucvf40E=;
	h=From:Date:Subject:To:CC;
	b=UQmf1rRZS4ySjQgWwtHULUm6nCaM8m3VgsH7tat65yIMqsL+KZlr3agWXj2nyyJWE
	 scIe+gT5Ln4mw8C7zQ1kyNOIEpAiUMFy9LbhhLrFF+d946sEb3FtphmyUSwn7OdAkY
	 38F+NZXDB7FbTtHGE6TyqUSjNxicXHVWD2Tv7QMk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A87nmOv082311
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Nov 2023 01:49:48 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 01:49:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 01:49:48 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A87nl7P115611;
	Wed, 8 Nov 2023 01:49:47 -0600
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Wed, 8 Nov 2023 13:19:35 +0530
Subject: [PATCH v2] optee-os: Enable OP-TEE TRNG in AM62X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231106-enable-trng-v2-1-25ed49b7d8c9@ti.com>
X-B4-Tracking: v=1; b=H4sIAI49S2UC/22NTQ6CMBBGr0Jm7RiKUsGV9zAsOmWACVpM2xAM4
 e4W1i7f95O3QmAvHOCereB5liCTS1CcMrCDcT2jtImhyIuLUrlGdoZejNG7HrnU3a1uta64gvQ
 gExjJG2eH/TOKH0OcHKPjJe6Dj+dOlkP3bBIPknr/Peyz2tP/olmhwrK2lNO1q8nSI8rZTm9ot
 m37AfOa3U/EAAAA
To: <vigneshr@ti.com>, <praneeth@ti.com>, <afd@ti.com>, <m-chawdhry@ti.com>,
        <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699429786; l=1513;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=C1NaXflfrnKQAHTjM61kubPCBce7UZYz+ZXWletGios=;
 b=mW9+IVPca/TNGBoUSH51dsCSdP5FXLPpwmEy8DCa9mbNG2CdV276X1NAhVRyqBkGhxlviMlOS
 8Gj/1CoNRlEBHCiok90f6AX8/L027sXupUtdCmOeywlxf1wbUKn8tpW
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 07:49:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17268

Enable TRNG in AM62X, as bugs related to TRNG has been fixed now.

TF-A fix:
https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d7a7135d32a8c7da004c0c19b75bd4e2813f9759

OPTEE fix:
https://github.com/OP-TEE/optee_os/commit/e313f4765fd0478bb66985827441411793433773

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
Changes in V2:
-updated commit message
-included changes for AM62p
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
index 91b66a36..435efced 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
@@ -6,8 +6,8 @@ inherit ti-secdev
 
 EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
-EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
-EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
 
 do_compile:append:k3() {

---
base-commit: d5e768e29b3f8091cbdedb702ff4185f73af4f3d
change-id: 20231106-enable-trng-e56f79d668e8

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>


