Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E8EC63708
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 21:43:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.29578.1670449394180064267
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 13:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yn8cfaee;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhDEi002154;
	Wed, 7 Dec 2022 15:43:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670449393;
	bh=1noi1ONQ+Oo85c2fS72YuQ/YWfeLmHUnLAU9whmpbyY=;
	h=From:To:CC:Subject:Date;
	b=yn8cfaeeYnjc07QxWsL2B5JazdQTiKOLYgjLIl8QjX+7Z2ShGuGMDEoEgz8DEQqY0
	 O4QYdRO1zhZbmYhHbHq2YVaPqttRt4w7ExPkr6V7sTeJN/XFwNfc4+tQ0xleb6ene+
	 vTwc0y5e6gVjm36UqRacROunryXy4dBRjKlDtr+o=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B7LhDdp021365
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Dec 2022 15:43:13 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 7
 Dec 2022 15:43:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 7 Dec 2022 15:43:13 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhCOU007888;
	Wed, 7 Dec 2022 15:43:12 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/7] conf: machine: Remove multi-certificate image comment
Date: Wed, 7 Dec 2022 15:43:06 -0600
Message-ID: <20221207214312.21735-1-afd@ti.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 21:43:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15422

Multi-cert is already now the default, no need to add a comment on that.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/j7.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/j7.inc b/meta-ti-bsp/conf/machine/include/j7.inc
index 4ea3a5d8..cf4cc440 100644
--- a/meta-ti-bsp/conf/machine/include/j7.inc
+++ b/meta-ti-bsp/conf/machine/include/j7.inc
@@ -3,5 +3,3 @@ SOC_FAMILY:append = ":j7"
 
 OPTEEMACHINE = "k3-j721e"
 OPTEEOUTPUTMACHINE = "k3"
-
-# Use default IMAGE_BOOT_FILES_LEGACY files
-- 
2.38.1


