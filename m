Return-Path: <a-dutta@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC97C0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 05:55:37 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.5726.1739253335462430733
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 21:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=G1RIuxSR;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-dutta@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51B5tXFn3547178
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 23:55:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739253334;
	bh=UF4hIADT1+DJaL2KFidq9MlZYU/bGWTeIkgqSQ7fjJs=;
	h=From:To:CC:Subject:Date;
	b=G1RIuxSR7bRuyjIozZOnxXI0Qr36ba+y+nkbSZFhud+M6uosJG7objwBZ1k6TbcGc
	 otHnKouVY8bDRqmOpzLU7wzhR/M2s05YcuTV9W6t9p9eEP4BjcY1R+Ly76Q8zVKRJF
	 m1jOXEGaE5UKBaXjUZ1kvdGtj+CBFmo3W/7LZAOk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51B5tX7B030913
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 23:55:33 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 23:55:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 23:55:33 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.227.92])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51B5tV0f064621;
	Mon, 10 Feb 2025 23:55:31 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>, <c-shilwant@ti.com>,
        <a-limaye@ti.com>
Subject: [meta-ti][scarthgap][PATCH] conf: machine: j722s: Change overlay in KERNEL_DEVICETREE_PREFIX
Date: Tue, 11 Feb 2025 11:25:30 +0530
Message-ID: <20250211055530.16704-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Feb 2025 05:55:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18298

Currently, the overlay mentioned in KERNEL_DEVICETREE_PREFIX in case
of j722s is "k3-j7200-evm-mcspi-loopback" which is incorrect. Change
the overlay to "k3-am625-sk-mcspi-loopback.dtso" in order to carry
out SPI loopback tests successfully.

Fixes: 13b691a9bc2d ("conf: machine: j722s: Add overlay to
KERNEL_DEVICETREE_PREFIX")

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---

Test link: https://gist.github.com/anuragdutta731/f93908b31d524ff0c52c3fd314449948

 meta-ti-bsp/conf/machine/j722s-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
index 8f42866c..52a6cfbd 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
@@ -7,7 +7,7 @@ require conf/machine/include/j722s.inc
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j722s \
     ti/k3-fpdlink \
-    ti/k3-j7200-evm-mcspi-loopback \
+    ti/k3-am625-sk-mcspi-loopback \
     ti/k3-v3link \
 "
 
-- 
2.34.1


