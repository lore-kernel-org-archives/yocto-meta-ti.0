Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABB5C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 15:31:15 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.7794.1665415866678751865
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 08:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ybaELjvh;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-choudhary@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AFV6xC120461
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665415866;
	bh=EdnPbFxpXW1pRocs2cvm6C0ccQunBwB/bGaYGY/beeE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ybaELjvh6cpcTPNDYsBzbyb2NG2tDxS5kxL+k9H8LYgfGHiAEH6ICoNouLpCULo0e
	 0INg8v1U3pa1FnLIHYg/hrU2AN+mOv3gK1b50F5VoCd/Ph/eK71eg63aSUOSexOSoW
	 7iBlamI4nzCgNL213BtPq23UgPebOt0fMBHgEiAw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AFV60m093230
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:31:06 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 10:31:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 10:31:05 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AFV43G030628;
	Mon, 10 Oct 2022 10:31:05 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti][dunfell PATCH v2 4/4] optee-os: Enable TRNG driver as
 OP-TEE support is added
Date: Mon, 10 Oct 2022 21:00:58 +0530
Message-ID: <20221010153058.28310-5-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010153058.28310-1-j-choudhary@ti.com>
References: <20221010153058.28310-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 15:31:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15130

OP-TEE upstream now has support for sa3ul for j721s2 platform.
Re-enable the trng driver which was disabled earlier.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index ff639baa..38d1ce50 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -8,8 +8,6 @@ EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if
 
 EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
-EXTRA_OEMAKE_append_j721s2-evm = " CFG_WITH_SOFTWARE_PRNG=y"
-EXTRA_OEMAKE_append_j721s2-hs-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 
 do_compile_prepend_ti-soc() {
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-- 
2.17.1


