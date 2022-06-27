Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C29C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 20:40:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.46944.1656362446320803343
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 13:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cOUURJzp;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25RKehuT074223;
	Mon, 27 Jun 2022 15:40:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656362443;
	bh=OfQJD0u+EsEbr++49kDePyVvVNwoUR81mw3gt8nblxc=;
	h=From:To:CC:Subject:Date;
	b=cOUURJzpQx/ae+CDkBEO2dPWbF00eIP+eB3nCJE4ESPLHxCxCoJmpwVdl1qIkeX4k
	 9L34BSSUwcqDeEMmbcgOlzMRz/7VzN3R1Tp0rTzB4SoeojsAXdCAaiqF7MBXhwrlAa
	 hqERyDLB5oxcM5XH9Cz4klgNTC/JVZ0ud2veTV8c=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25RKeh5n035237
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jun 2022 15:40:43 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 27
 Jun 2022 15:40:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 27 Jun 2022 15:40:43 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25RKeglq007413;
	Mon, 27 Jun 2022 15:40:42 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH] optee-os: Use software RNG on AM62x and
 J721s2
Date: Mon, 27 Jun 2022 15:40:42 -0500
Message-ID: <20220627204042.27706-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Jun 2022 20:40:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14844

The TRNG driver is not currently functional for these two platforms.
Disable the TRNG driver until fixed.

Reported-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 16c10979..7fe5f26e 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -6,6 +6,10 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
 
 EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
+EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y"
+EXTRA_OEMAKE_append_j721s2-evm = " CFG_WITH_SOFTWARE_PRNG=y"
+EXTRA_OEMAKE_append_j721s2-hs-evm = " CFG_WITH_SOFTWARE_PRNG=y"
+
 do_compile_prepend_ti-soc() {
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
 }
-- 
2.36.1


