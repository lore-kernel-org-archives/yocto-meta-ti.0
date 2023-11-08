Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45F2C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:36:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.15249.1699454165312933965
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 06:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jMrys2ZP;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: kamlesh@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8Ea4d8082338;
	Wed, 8 Nov 2023 08:36:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699454164;
	bh=8EX4q71dUbMtfQtB0LNjLyNH5OjL9VqgXehIFDnxS68=;
	h=From:Date:Subject:To:CC;
	b=jMrys2ZPdXIgplve7ST2dUBBDdJ9uiX+4yj7AG1OzzDrbJm5xD0gDy+bM3RK2oN2P
	 E6ysZVqLd4/CloDqkqPgW0LcVKbsdDOfvxcRiAAAsVli0CeylPwHw2MN8TSCnEO9In
	 RjCD6y4GF94aJqttWsnGxfeGUr9Cmy3fg9pmhfyY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8Ea4kt061785
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Nov 2023 08:36:04 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 08:36:03 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 08:36:03 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8Ea3X7093932;
	Wed, 8 Nov 2023 08:36:03 -0600
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Wed, 8 Nov 2023 20:05:54 +0530
Subject: [PATCH v3] optee-os: Enable OP-TEE TRNG in AM62X and AM62PX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231106-enable-trng-v3-1-e93d7d41ccd4@ti.com>
X-B4-Tracking: v=1; b=H4sIAMmcS2UC/32NSw7CIBBAr9KwFlPoF1few7hgYNqSKjVASE3Tu
 wtduDIu38y8eRvx6Ax6cik24jAabxaboDoVRE3SjkiNTkx4ySvGypailfBAGpwdKTbt0Andtj3
 2JBkgPVJw0qopO7Nxsw+LRWpxDfng5XAw65G73RNPJu3d+6hHlqe/Q5FRRhuhoIR6EKDgGsxZL
 U+Sn0T+R+RJ5A3qWkCneyW+4r7vHzT2Nlf9AAAA
To: <vigneshr@ti.com>, <praneeth@ti.com>, <afd@ti.com>, <m-chawdhry@ti.com>,
        <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699454162; l=1578;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=iIZl/mq1Vrc61l0pOhNJkH4ySQ26O+PvZA70wm6B5oE=;
 b=eylqSShqgI84Ogg3u2NPSrYMQV5iW5eciW+FOv7XBEYLoHdZxjjnoKPSlEqycAgdYbHOafdxd
 42VgIvwa2wRCLw5Y3H2GGupJaUTCgmZzKVCNaZnBcih98NSpzquK2s4
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 14:36:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17270

Enable TRNG in AM62X and AM62PX, as bugs related to TRNG has been fixed now.

TF-A fix:
https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d7a7135d32a8c7da004c0c19b75bd4e2813f9759

OP-TEE fix:
https://github.com/OP-TEE/optee_os/commit/e313f4765fd0478bb66985827441411793433773

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
Changes in V3:
-updated commit title and message

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


