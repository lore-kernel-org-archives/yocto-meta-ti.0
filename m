Return-Path: <j-humphreys@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E55C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 20:16:44 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.2122.1658348196362217807
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 13:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FS4WWlEx;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-humphreys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26KKGXn9095122;
	Wed, 20 Jul 2022 15:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658348193;
	bh=lekN5HEzSY+3fXs3HoHCi/SKpcsZo4Z1M04nwfd4eHk=;
	h=From:To:CC:Subject:Date;
	b=FS4WWlExpRVDKsE7TmksHUY3wdi0Svt/ozhtrG/R6Oht3cNuE6b8S0Iy2X0LgKCaC
	 egvPXcpz8kaD14FeqYGiJxarnEhvhAt7yRk7uYd3b0fktLZbB7I2mo+k3DLpmymnK4
	 4Dd44qhmKSOU373xP2Mu1rfcMQPSvtU6fzMwTwuc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26KKGX0t017948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Jul 2022 15:16:33 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Jul 2022 15:16:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Jul 2022 15:16:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26KKGWdA032381;
	Wed, 20 Jul 2022 15:16:32 -0500
From: Jonathan Humphreys <j-humphreys@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>,
        Jonathan Humphreys
	<j-humphreys@ti.com>
Subject: [dunfell/master][PATCH] j7200-hs-evm-k3r5: Move J7200 HS evm support
 to PG2.0
Date: Wed, 20 Jul 2022 15:16:28 -0500
Message-ID: <20220720201628.18927-1-j-humphreys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Jul 2022 20:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14888

With J7200 PG1.0 being deprecated, use PG2.0 sysfw when building images for j7200-hs-evm.

Signed-off-by: Jonathan Humphreys <j-humphreys@ti.com>
---
 conf/machine/j7200-hs-evm-k3r5.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/j7200-hs-evm-k3r5.conf b/conf/machine/j7200-hs-evm-k3r5.conf
index 488f19ec..3f134877 100644
--- a/conf/machine/j7200-hs-evm-k3r5.conf
+++ b/conf/machine/j7200-hs-evm-k3r5.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/k3r5.inc
 
-SYSFW_SOC = "j7200"
+SYSFW_SOC = "j7200_sr2"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
-- 
2.17.1


