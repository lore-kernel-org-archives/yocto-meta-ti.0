Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A36C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 11:14:10 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.60112.1710155645174461974
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 04:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Rvfw9piE;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: u-kumar1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42BBE4Rq084296;
	Mon, 11 Mar 2024 06:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710155644;
	bh=4adlNwCLYfbUfjSK/PLuGvnnimcoIbBUkrx1MbWNKTs=;
	h=From:To:CC:Subject:Date;
	b=Rvfw9piEQQ4CVOtxFGbb5/1EM1qQwLn/JB9sNbgkl4kOu4oeiQMEYF+S3J58jpHPF
	 o70a++RA3jGNcjMI7xIv5868Ap33DUbCS0KrDHA5KAXdewZpWW3VsQ7vGfygQ4+YS/
	 tcT/bSPSvTpuiNWrnPpm/+9WX80cLtTkd2SiuinI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42BBE4Wq008054
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Mar 2024 06:14:04 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Mar 2024 06:14:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Mar 2024 06:14:03 -0500
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (udit-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.227.18])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42BBE0h6014966;
	Mon, 11 Mar 2024 06:14:01 -0500
From: Udit Kumar <u-kumar1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <sbellary@baylibre.com>, <sinthu.raja@mistralsolutions.com>,
        <reatmon@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH] export ov10635 camera device tree overlay
Date: Mon, 11 Mar 2024 16:43:59 +0530
Message-ID: <20240311111359.1556157-1-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Mar 2024 11:14:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17505

Adding ov10635 camera overlay in default build


Signed-off-by: Udit Kumar <u-kumar1@ti.com>
---
 meta-ti-bsp/conf/machine/am57xx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
index 43a6a833..9a06e801 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -29,6 +29,7 @@ KERNEL_DEVICETREE = " \
     am57xx-beagle-x15-revc.dtb \
     am5729-beagleboneai.dtb \
     am571x-idk.dtb \
+    ov10635.dtbo \
     am572x-idk.dtb \
     am574x-idk.dtb \
 "
-- 
2.34.1


