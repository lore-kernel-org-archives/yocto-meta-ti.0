Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B501E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 14:41:12 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.20559.1736347269909333472
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 06:41:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Q9OdJgdp;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508Ef8fX3116159
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 08:41:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736347268;
	bh=8/OY1j5oBgG1K3Fev3pWeMHpnqXK0RkL+xZGEvSoF6g=;
	h=From:To:Subject:Date;
	b=Q9OdJgdpGsmLVW+9EG84NaARjKx+SLkvowz0DTqyGEDXYene/OP4js2JvDNBnIopp
	 Q58tURGEp27HU4w71du9E8E59yVT04wRkMLT5x65Y7j/MZjxUoY+LQcuzaAG89Lh0g
	 vkp3NdLPoWY1j8NqDt2e7BdH0KW4LI7UxZ/lbsYY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508Ef8i1018793
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 08:41:08 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 08:41:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 08:41:08 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508Ef8rC120573;
	Wed, 8 Jan 2025 08:41:08 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tVXF6-0006se-79; Wed, 08 Jan 2025 08:41:08 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-bsp: Change to 6.12 as the default
Date: Wed, 8 Jan 2025 08:41:08 -0600
Message-ID: <20250108144108.26409-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jan 2025 14:41:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18166

We are moving to 6.12 to be our new LTS, so we are switching the default
BSP to that.  You can still access the 6.6 kernel if you need to by using
the BSP system and setting TI_PREFERRED_BSP = "ti-6_6" in your
local.conf.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 083177dc..f19a0c9c 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -4,7 +4,7 @@
 # well as a dedicated machine override.
 
 # Supported options are: mainline, next, ti-6_12, ti-6_6, ti-6_1
-TI_PREFERRED_BSP ??= "ti-6_6"
+TI_PREFERRED_BSP ??= "ti-6_12"
 
 # Use bsp-* namespace for overrides
 MACHINEOVERRIDES =. "bsp-${TI_PREFERRED_BSP}:"
-- 
2.17.1


