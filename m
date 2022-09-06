Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D0DC38145
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 18:07:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2659.1662487637535470023
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 11:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=viXHJYlr;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 286I7GO5055806;
	Tue, 6 Sep 2022 13:07:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662487636;
	bh=JZt8+2BtLjfO5QQcqxOdSfCfSPpKakh47ZfodKSP0qY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=viXHJYlrlX4UD4XaztaK0eobw937JStG/uzSMD3LqQj3BTOfdfwNnXVE/nE4U+l0k
	 EkPbj/CQkG0Fit0ui4EcTM32/IczveSh1/qM2l2D6wft9SCOpzCuesNN/mjdzlB9JL
	 cYkM474ZpPLx6AJxmmzM2UsTIskCryviGlsLczAY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 286I7GqP050247
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Sep 2022 13:07:16 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 6 Sep
 2022 13:07:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 6 Sep 2022 13:07:16 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 286I7FTs004377;
	Tue, 6 Sep 2022 13:07:15 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH v2 2/2] optee-os: Lower log level for AM62x
Date: Tue, 6 Sep 2022 13:07:15 -0500
Message-ID: <20220906180715.18109-2-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220906180715.18109-1-afd@ti.com>
References: <20220906180715.18109-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Sep 2022 18:07:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14994

During resume from low power mode suspend OP-TEE prints some messages
on the UART. It seems this UART is not powered at this point in the
sequence breaking suspend/resume. We should track down the exact
prints and quiet them. Until we get that fix upstream, lets lower
the log level for this platform to unblock the LPM work.

Signed-off-by: Andrew Davis <afd@ti.com>
Acked-by: Anand Gadiyar <gadiyar@ti.com>
---

Changes from v1:
 - Added am62xx-lp-evm to change

 recipes-security/optee/optee-os_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index c715d47d..e7de5157 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -6,8 +6,8 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
 
 EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
-EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y"
-EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_WITH_SOFTWARE_PRNG=y"
+EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE_append_j721s2-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 EXTRA_OEMAKE_append_j721s2-hs-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 
-- 
2.36.1


