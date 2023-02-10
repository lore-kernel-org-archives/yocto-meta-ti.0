Return-Path: <a-bhatia1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2252BC636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 03:54:13 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.5881.1676001244483346283
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 19:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=L9dMv0qU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-bhatia1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31A3s36o053951;
	Thu, 9 Feb 2023 21:54:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676001243;
	bh=A+EGa1qt2iGILMGsv8wrcqkIRQw3EpqPI4A4IeJsVG0=;
	h=From:To:CC:Subject:Date;
	b=L9dMv0qUqmceLGhGVIXPlS6us8HAkKX/+ZKCj5ZNx7WpAqtm/IJFMZiOVWS4fUkaH
	 iiUd0k+qFKzXEZDjjRKm6de+B5iTklKdpZlp5mHInYmw5T4lo+/jRoqcAWtS+JharQ
	 jT96p2wwfR8qCTJFAtATCwzar8HPvP25NUUjiOtM=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31A3s3EF107160
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Feb 2023 21:54:03 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 9
 Feb 2023 21:54:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 9 Feb 2023 21:54:02 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31A3s2LN074801;
	Thu, 9 Feb 2023 21:54:02 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: Meta-TI List <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [dunfell][PATCH] conf: machine: am62xx-lp-evm: Add OLDI Panel overlay
Date: Fri, 10 Feb 2023 09:24:01 +0530
Message-ID: <20230210035401.21933-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 03:54:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15789

Add the Microtips OLDI Panel DT overlay for AM62 LP SK.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 conf/machine/am62xx-lp-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/am62xx-lp-evm.conf b/conf/machine/am62xx-lp-evm.conf
index 3230b84df90e..5efca18d1af0 100644
--- a/conf/machine/am62xx-lp-evm.conf
+++ b/conf/machine/am62xx-lp-evm.conf
@@ -11,6 +11,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-skeleton.dtb \
     ti/k3-am625-sk-lpmdemo.dtb \
     ti/k3-am625-sk-csi2-ov5640.dtbo \
+    ti/k3-am62x-lp-sk-oldi-panel.dtbo \
 "
 
 SPL_BINARY = "tispl.bin_HS"	
-- 
2.39.1


