Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE7CE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 10:48:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.98409.1733741322356192315
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 02:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tHDXGEL4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-shenai@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B9AmfMo052204
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 04:48:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733741321;
	bh=wHlHZp7vJzVMQtcj4LnHbF8+5r1TwlkBif0DiQXRlls=;
	h=From:To:CC:Subject:Date;
	b=tHDXGEL4BTSNTkVt/HIyrHujqLgm7SlNqW/J7vpgYcB/pnz5rgl1YOs9U4d9fEYWQ
	 IPcFB94/GbVwt9ptbXQ9E/JhrjXR3zTCCZ3KObcKrExGTHsQ6iqPZvCjTdYla3x8tO
	 9/taeLlIipQpf3xWcbyml45FNLn5jJl9ZY9G2H+M=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9Amf8n086871
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 04:48:41 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 04:48:41 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 04:48:41 -0600
Received: from aashvij.dhcp.ti.com (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9AmdjQ105041;
	Mon, 9 Dec 2024 04:48:39 -0600
From: Aashvij Shenai <a-shenai@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <c-shilwant@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <kamlesh@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v4] recipes-security: optee: Remove software PRNG for am62pxx
Date: Mon, 9 Dec 2024 16:18:16 +0530
Message-ID: <20241209104816.1437010-1-a-shenai@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Dec 2024 10:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18099

With the latest TIFS fix [1], AM62P is able to leverage the hardware-TRNG
instead of having to fallback into the software-PRNG.

Background:
The default priv-id for A53 cores in SYSFW for AM62P was chosen to be 4
while the other K3 SOCs were configured at 1. Any firewall TISCI API
call that used 1 would not be able to run on AM62P. The TIFS fix changes
the AM62P value from 4 to 1.

[1] -
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=98de0a4290ec200cc224d4a5a6f42d2126230e2f

Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
---

Changelog:
v3 -> v4:
  - Fixed grammatical errors in commit message
  
v2 -> v3:
  - Updated commit message to give background and branch link
  - Updated commit title to conform to standard
  
v1 -> v2:
  - Updated commit message to include fix and moved test logs

Testlogs: https://gist.github.com/AashvijShenai/9ea3e128ab29f703c2b6d988cfd0b82a

---
 meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index 43b8ce1c..f131f1ff 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -6,7 +6,7 @@ EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
 EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
 EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
-EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
 
-- 
2.34.1


