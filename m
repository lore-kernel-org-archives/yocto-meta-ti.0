Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BBCECAAD6
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 19:16:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.41305.1661541407306113742
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 12:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fpwKpG3r;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27QJGhku010851;
	Fri, 26 Aug 2022 14:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661541403;
	bh=fqd8O6sAznxojGr9lmNlJekT9JKoM9Ylt3ypQhzWG1I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fpwKpG3r1MzRHRbfJzPlf9tvIAALZSSn4zRvngTWJ1LxJBM5wf6dMjytyjQJWvESZ
	 lmP6OO+GVLQqnWowZ4LR48Q0sg4ENiCSy68UceyGfamcTz+3ngcVaZKWBG5xAuOAAL
	 MBcbQO4nQZVuNnVr7fyvfntIdzNgi5hnyUKPnX2Q=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27QJGhbe084812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Aug 2022 14:16:43 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 26
 Aug 2022 14:16:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 26 Aug 2022 14:16:42 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27QJGf79096992;
	Fri, 26 Aug 2022 14:16:42 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Anand Gadiyar <gadiyar@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 2/2] optee-os: Lower log level for AM62x
Date: Fri, 26 Aug 2022 14:16:41 -0500
Message-ID: <20220826191641.31116-2-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220826191641.31116-1-afd@ti.com>
References: <20220826191641.31116-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Aug 2022 19:16:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14969

During resume from low power mode suspend OP-TEE prints some messages
on the UART. It seems this UART is not powered at this point in the
sequence breaking suspend/resume. We should track down the exact
prints and quiet them. Until we get that fix upstream, lets lower
the log level for this platform to unblock the LPM work.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 4081b324..3cda8559 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -6,7 +6,7 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
 
 EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
-EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y"
+EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE_append_j721s2-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 EXTRA_OEMAKE_append_j721s2-hs-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 
-- 
2.36.1


