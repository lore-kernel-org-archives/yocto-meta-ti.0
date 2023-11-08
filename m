Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D777DC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 15:17:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.16444.1699456670262001159
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 07:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sTAnovol;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: kamlesh@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8FHnue073260;
	Wed, 8 Nov 2023 09:17:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699456669;
	bh=M81lnGVArwiX81ogisZGGQXkdpd1AY5FCExpktvCAYk=;
	h=From:Date:Subject:To:CC;
	b=sTAnovolAIOpTaQjeqP9XGq0qz4ltTrfw6fFBezX5Z85LKzffsmbqc+U94xfDyeGI
	 8e3+2LOJcM43rg76AetBKOafjdleJCLETbA5r0rYA3DecABxalgeuB9lMhDxf7630T
	 7vmw82lFocY7v5cFH8brOrt2RUtI9TbfVtOe00iA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8FHmLr004625
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Nov 2023 09:17:48 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 09:17:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 09:17:49 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8FHljd007429;
	Wed, 8 Nov 2023 09:17:48 -0600
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Wed, 8 Nov 2023 20:47:46 +0530
Subject: [PATCH v4] optee-os: Enable OP-TEE TRNG in AM62X and AM62PX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231108-wip-enable-trng-v4-1-69499e0cd53a@ti.com>
X-B4-Tracking: v=1; b=H4sIAJqmS2UC/x3N0QqCQBCF4VeRuW7AdaWsV4kudu2ogzHKrFQgv
 nu7Xf4cPs5OCSZIdKt2MrwlyaI52lNF/RR0BMszNzV1452rO/7IytAQX+DNdGRcfRzOnXdoL5R
 VDAkcLWg/FTeLzWlbFAWWfTUM8v0/3h/H8QOWHCwagQAAAA==
To: <vigneshr@ti.com>, <praneeth@ti.com>, <afd@ti.com>, <m-chawdhry@ti.com>,
        <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699456667; l=1676;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=gPbP4/o3NGTflNH7P3tUJwJBF6gddh5qCtp2mtswApU=;
 b=31rEckleOKmIzSvDlmYTlMUknfQegH1YtlVUeI9Ct0f8hsm2lMTW87EbO2rGi4IDKnpyqyE3L
 qr3U5bXSLd3DawKUqsQhpS5CHmCso4eNafvLBZBcBqBC9U1RyuJmTTs
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 15:17:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17272

Enable TRNG in AM62X and AM62PX, as bugs related to TRNG has been fixed now.

TF-A fix:
https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d7a7135d32a8c7da004c0c19b75bd4e2813f9759

OP-TEE fix:
https://github.com/OP-TEE/optee_os/commit/e313f4765fd0478bb66985827441411793433773

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
Changes in V4:
-rebase on kirkstone-wip

Changes in V3:
-updated commit title and message

Changes in V2:
-updated commit message
-included changes for AM62p
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index b1846cad..a3dd7239 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -3,8 +3,8 @@ inherit ti-secdev
 
 EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
-EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
-EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
 
 do_compile:append:k3() {

---
base-commit: 578823721ebf23485e7cfaaebc6146145996faa2
change-id: 20231108-wip-enable-trng-e93bf6831e47

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>


