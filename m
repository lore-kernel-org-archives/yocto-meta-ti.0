Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A32E77173
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 08:45:51 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.96651.1733733949383780541
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 00:45:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tdztoJuA;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-shenai@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B98jmsO2484260
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 02:45:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733733948;
	bh=a4bK7SxPV1iA7Zfqm6bs+9hiHf5+ZwN7vGOiZFgRtdU=;
	h=From:To:CC:Subject:Date;
	b=tdztoJuA2AzQh2Au7Di5r+M55tEzBs1dy5JZSuR2TdCo0rtQLXy1kqKdbnPy6n13D
	 DxB3I+ua4WMlT/ehyFAcXjsIyzeFLGHWMMnF59Z5MgrVQ8vrJIls/lzCeuiSlqEPLx
	 4E7mS6nBRHdc1+D0F5iR+MnT0s+v3E7nMyUuPItM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B98jmRN031829
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 02:45:48 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 02:45:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 02:45:48 -0600
Received: from aashvij.dhcp.ti.com (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B98jkSJ078716;
	Mon, 9 Dec 2024 02:45:46 -0600
From: Aashvij Shenai <a-shenai@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <c-shilwant@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <kamlesh@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v3] recipes-security: optee: Remove softare PRNG for am62pxx
Date: Mon, 9 Dec 2024 14:15:31 +0530
Message-ID: <20241209084531.1412473-1-a-shenai@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Dec 2024 08:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18093

With the latest TIFS fix [1], AM62P is able to leverage the hardware-TRNG
instead of having to fallback into the software-PRNG.

Backgroud:
The default priv-id for A53 cores in SYSFW for AM62P was chosen to be 4
while the other K3 SOCs were configured at 1. Any firewall TISCI API
call that used 1 would not be able to run on AM62P. The TIFS fix changes
the AM62P value from 4 to 1.

[1] -
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=98de0a4290ec200cc224d4a5a6f42d2126230e2f

Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
---

Changelog:
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


