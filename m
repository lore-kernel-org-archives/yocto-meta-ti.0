Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7ED7C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 21:26:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3726.1708032375804974932
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Feb 2024 13:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eIAR/j/9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41FLQEmE125401;
	Thu, 15 Feb 2024 15:26:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708032374;
	bh=yDeflHnzYWcbk5HgbWzCyQdQgyG7I/A5/puAAw9MHoI=;
	h=From:To:CC:Subject:Date;
	b=eIAR/j/9sPRr2BzwdKBZv/lvypYX9W+l7CTDrGYFbd2MnacZvfuM9lIyDgrnpH3zT
	 Vf+pnZ3TJiBFoA9urjeF9yjSDfedy6GzPIfleD3qQmh3afgvXOqhC5bhSmg1DwUcaj
	 5V2TKoLsVGHKmv6TC75McUYP83v8XvaC3CcQI/jI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41FLQEOQ069426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Feb 2024 15:26:14 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 15:26:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 15:26:14 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41FLQDrk042824;
	Thu, 15 Feb 2024 15:26:13 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: k3: Use Cortex-A53/A72 CPU tune
Date: Thu, 15 Feb 2024 15:26:13 -0600
Message-ID: <20240215212613.57012-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Feb 2024 21:26:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17482

All current K3 devices use either A53 or A72. Use the compile tune
configuration specific for these to allow the compiler to make
better optimizations.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 2415f0ba..7c3579af 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -3,7 +3,7 @@
 require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append = ":k3"
 
-require conf/machine/include/arm/arch-arm64.inc
+require conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
 
 BBMULTICONFIG += "k3r5"
 
-- 
2.39.2


