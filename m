Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0733CFB45C
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 20:46:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6538.1728420395968995140
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 13:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xsv6ltVg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 498KkZ0P127887;
	Tue, 8 Oct 2024 15:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728420395;
	bh=eIqvtZskQHKzV5D6pjXINTye/bPeIeBFdnYfgBrCZ/4=;
	h=From:To:Subject:Date;
	b=xsv6ltVg7DXj2vdLaMeW8OdYqAu2ZoFDrH1yUo5o6217uDpPLWv7FYPoraFPt9dWd
	 +MSkibvV2A2X81qzeuvL1cXAtxgJyklxpfS5ZhnOf8rFA29op8C0AcJx5666whEdeK
	 0vq7cxLEf5TgC+binjvln2vdUgxEs0NNId6RIfsM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 498KkZma098034
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Oct 2024 15:46:35 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Oct 2024 15:46:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Oct 2024 15:46:34 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498KkYsl068691;
	Tue, 8 Oct 2024 15:46:34 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1syH6I-0000rp-Gy; Tue, 08 Oct 2024 15:46:34 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] ti-bsp: Fix copy/paste error for bsp-ti-6_12 setting
Date: Tue, 8 Oct 2024 15:46:34 -0500
Message-ID: <20241008204634.3288-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 20:46:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17993

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix commit message.

 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 9a15e164..4cb2aab4 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -46,7 +46,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
 
 # GPU support requires out-of-tree SGX and Rogue drivers not available
 # in 6.12 yet
-MACHINE_FEATURES:remove:bsp-next = "gpu"
+MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
 
 # ==========
 # ti-6_6
-- 
2.17.1


