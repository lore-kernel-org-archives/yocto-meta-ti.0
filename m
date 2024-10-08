Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1614CEF17E
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 20:41:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6407.1728420056723782384
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 13:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=epFKYzxd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 498KetVi048328;
	Tue, 8 Oct 2024 15:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728420055;
	bh=dE4fPEJfUAkfVCQc9Z5xwbCX8KI8f3kclsjTXH8Kafc=;
	h=From:To:Subject:Date;
	b=epFKYzxdD7eCbZc764tR/H5wIiZ0sMQgsu3iLA0k4bqD8/CSZCyyce7lKVKQviC1C
	 gi7w1VFS6rPhWKSGHhwbnzRy4qvCkdFTQGn1H+EgrLcl0C1Bgjlr9kpK3KAOQYUFNy
	 zQw2obh6w7a8GalITHT92uVApnoC8MmpicuUFIAA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498KetuX055665;
	Tue, 8 Oct 2024 15:40:55 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Oct 2024 15:40:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Oct 2024 15:40:55 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498KetRh063110;
	Tue, 8 Oct 2024 15:40:55 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1syH0o-0000ay-Sg; Tue, 08 Oct 2024 15:40:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-bsp: Fix copy/paste error for bsp-6_12 setting
Date: Tue, 8 Oct 2024 15:40:54 -0500
Message-ID: <20241008204054.2246-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 20:41:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17992

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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


