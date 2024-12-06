Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F27FE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 05:36:08 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.30853.1733463364068765265
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 21:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rxmaxBTX;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-shenai@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B65a3HQ1864177
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Thu, 5 Dec 2024 23:36:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733463363;
	bh=COnt0vtQQHwQDAyyFb9okyMhLYgOictri9AKUiFt5X8=;
	h=From:To:CC:Subject:Date;
	b=rxmaxBTXQVZbTPUb6It6NKwsWJg9Y5e1/aywFQTf32yN8AxWHdo+jOttW4Et5T6Ny
	 Fu0hBDVeEsyGkAE5f0HToBRiySGcLpaXhdt4+3dU3Be66x3KLJ0ZRWP6Fu6RmBSOYB
	 8hRMdxtNfBKQALDXQnCiQnTcL0PbKzRk26BlDU+Y=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B65a3ZH064204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 5 Dec 2024 23:36:03 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 23:36:02 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 23:36:02 -0600
Received: from aashvij.dhcp.ti.com (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B65a0P7087683;
	Thu, 5 Dec 2024 23:36:01 -0600
From: Aashvij Shenai <a-shenai@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <c-shilwant@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <kamlesh@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2] am62p: PRNG: Remove software PRNG
Date: Fri, 6 Dec 2024 11:05:21 +0530
Message-ID: <20241206053521.1126544-1-a-shenai@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Dec 2024 05:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18085

With the latest TIFS fix [1], AM62P is able to leverage the hardware-TRNG
instead of having to fallback into the software-PRNG.

[1] - commit: 98de0a4290ec200cc224d4a5a6f42d2126230e2f ("ti-sysfw:
am65x/am64x/am62x/am62ax/am62px: update to version v10.01.08")

Repo: https://git.ti.com/git/processor-firmware/ti-linux-firmware.git
Branch: ti-linux-firmware

Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
---

Changelog:
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


