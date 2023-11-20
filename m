Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D983BC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 05:11:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.44530.1700457096312099653
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Nov 2023 21:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a6DCVpOb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: kamlesh@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AK5BYcG050540;
	Sun, 19 Nov 2023 23:11:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700457094;
	bh=xK6vwdntpjqcxthUUsCAZRjZbsACIrv3A4Wvdp8vP7A=;
	h=From:Date:Subject:To:CC;
	b=a6DCVpOblDeGs6BC6ObikTDgKJYMS9EEu+Jerr+1LgGmZT8JRPq7cgBH+MTtrJco5
	 Vpk56FBjiq+4FR9ZqhWRYQXF7zQsY07z4u5qdg3xf5Pk+dnH2Cv9lbZfLXasHTbVJB
	 3Yp9IujMKxOfU+qAKb7/kNfmd5wYzh2WCKmQTkvA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AK5BYxx021664
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 19 Nov 2023 23:11:34 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 19
 Nov 2023 23:11:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 19 Nov 2023 23:11:34 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AK5BXpu054230;
	Sun, 19 Nov 2023 23:11:34 -0600
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Mon, 20 Nov 2023 10:41:28 +0530
Subject: [PATCH v5] optee-os: Enable OP-TEE TRNG in AM62X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231108-wip-enable-trng-v5-1-3cf3e216a4fc@ti.com>
X-B4-Tracking: v=1; b=H4sIAH/qWmUC/3WOQQ6DIBREr2JY9zciaMVV79G4APzqjy0aMLaN8
 e4F912+mbzM7CygJwysyXbmcaNAs4tQXjJmR+0GBOoisyIvBOd5DW9aAJ02T4TVuwFQCdNXteA
 obyxaRgcE47WzY/Im8lNYZ4dJTP3isafPufhoI48Ua/89D2wypf+3NgkcKiWVwtx2pdD3la52f
 rH2OI4f/+I6BssAAAA=
To: <vigneshr@ti.com>, <praneeth@ti.com>, <afd@ti.com>, <m-chawdhry@ti.com>,
        <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700457093; l=1638;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=wNoYfvZhEZamlWdCw5TRqxzvtJ18L0sUTJIrH7C6e3U=;
 b=9gyC7IMo5V1tD3btcAJ9LBxu8RnCiwaXQ+u8FE9o5aSehbrc9zb2Obcl+j1gJMkbSBv6cefjS
 JuVn9pP684aCe6f1XvxxNhXboYiSN4JWNLvaYslYvMQuX9Fnn0E8iVq
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Nov 2023 05:11:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17310

Enable TRNG in AM62X, as bugs related to TRNG has been fixed now.

TF-A fix:
https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d7a7135d32a8c7da004c0c19b75bd4e2813f9759

OP-TEE fix:
https://github.com/OP-TEE/optee_os/commit/e313f4765fd0478bb66985827441411793433773

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
Changes in V5:
-drop changes for AM62px due to boot failure

Changes in V4:
-rebase on kirkstone-wip

Changes in V3:
-updated commit title and message

Changes in V2:
-updated commit message
-included changes for AM62p
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index b1846cad..62d6b4f9 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -3,7 +3,7 @@ inherit ti-secdev
 
 EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
-EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
 

---
base-commit: 63dd9c4e39c90c367293a77a76b74c099abc1015
change-id: 20231108-wip-enable-trng-e93bf6831e47

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>


