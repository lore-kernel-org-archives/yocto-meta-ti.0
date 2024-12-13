Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCB7E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 15:39:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.18458.1734104356490769779
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 07:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A4GWHpr4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BDFdFKq056831;
	Fri, 13 Dec 2024 09:39:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734104355;
	bh=mtsL5m5DT05VktutXkD/LG+Xp2WMMHFZgXcKdwNV/1k=;
	h=From:To:CC:Subject:Date;
	b=A4GWHpr4a1xnzTNTp4NzC1YkZRVc1iy334mCIwzMbicixD6iJ4U694vyixDoXWXgY
	 4BPE+40rbxpt1pezZhq+sAcVoCg9wNXst427es1eRUlFipm0MhiiUcf2Ao4bVkfW9H
	 eTZ7lDyxKLxe+YiwMZH6CoU5cZZioSijVbw7kfnY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDFdFGR037292
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Dec 2024 09:39:15 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Dec 2024 09:39:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Dec 2024 09:39:15 -0600
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDFdFfe079191;
	Fri, 13 Dec 2024 09:39:15 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH] meta-ti-bsp: ti-rtos-bin: Move this with the other firmware recipes
Date: Fri, 13 Dec 2024 09:39:15 -0600
Message-ID: <20241213153915.56965-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Dec 2024 15:39:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18102

All other firmware recipes are in recipes-bsp. There is nothing much
special about this set of firmware so move it to match.

This firmware is the pre-compiled "echo test" example for various
remote cores. The directory name is not very clear on that, so fix
that up too.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti-rtos-echo-test-fw}/ti-rtos-firmware.bb                     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/{recipes-ti/ti-rtos-bin => recipes-bsp/ti-rtos-echo-test-fw}/ti-rtos-firmware.bb (100%)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-echo-test-fw/ti-rtos-firmware.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
rename to meta-ti-bsp/recipes-bsp/ti-rtos-echo-test-fw/ti-rtos-firmware.bb
-- 
2.39.2


