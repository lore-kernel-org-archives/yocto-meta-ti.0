Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839E6C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 00:24:21 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.4242.1651105459141453181
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 17:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=W54oMKcR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23S0OHSk086600;
	Wed, 27 Apr 2022 19:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651105457;
	bh=/RhdCrVu7KJ+vmkZVM5ZFABCGeElmHHrnuWV8V0PRkI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=W54oMKcRX2STm8jdQIeWE0AQPOA96fhmsvaVt5mLUXIWHmGI6iBphn20jdD+YKEd0
	 8fva1UAlampOr26M/EXYiCwUrpu9WIkSZUYDdifdj7M57ruWz8831vJFipS6A+VqPA
	 nRUBE/K50D1tLVxroVYjKm/+PYddufZ3+fpKyBW4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23S0OHeA102680
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Apr 2022 19:24:17 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 19:24:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 19:24:17 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23S0OHeA024906;
	Wed, 27 Apr 2022 19:24:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1njrxB-0007sX-53; Wed, 27 Apr 2022 19:24:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/4] linux-ti-staging: Bump to 08.03.00.002
 release
Date: Wed, 27 Apr 2022 19:24:14 -0500
Message-ID: <20220428002416.30029-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220428002416.30029-1-reatmon@ti.com>
References: <20220428002416.30029-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Apr 2022 00:24:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14624

Updated the linux version for 08.03.00.002

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 4e7c2cb4..cb34a7aa 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "3297d854f0fbdc7940878a5d5caa0bd823be5207"
+SRCREV = "45b6d4fdf6550061582b89d0b794a1cc7c1dc4b2"
 PV = "5.10.109+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1


