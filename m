Return-Path: <b-kapoor@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94012C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 06:17:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5038.1677133029407550603
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 22:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LeCZaj0D;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: b-kapoor@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31N6H8R2065789
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 00:17:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677133028;
	bh=R/eEOX2mB9OV9hy4hP/0EoPTrewpPh0whr+ListtLPg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LeCZaj0DXOV60wA8RYeAV1Qboa9KPw/0p63LNPpVTDmfSK7e+ljkn9iUaircq2qzJ
	 MLGNqBVE7Emo3E3CwFcv1x8dXwDe9sVY0BlbdWcFo+o2vnwExqOV/enZInTXpn9+3T
	 Eer2s6OU0NA6CVbeqLuthSx9HflZ0HwQPnVWv75A=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31N6H8ZO113103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 00:17:08 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Feb 2023 00:17:07 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Feb 2023 00:17:08 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31N6H7tI068802;
	Thu, 23 Feb 2023 00:17:07 -0600
From: Bhavya Kapoor <b-kapoor@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <b-kapoor@ti.com>, <reatmon@ti.com>
Subject: [meta-ti][dunfell][PATCH 3/4] conf: machine: j721s2-evm: Add uarts overlay for J721S2
Date: Thu, 23 Feb 2023 11:47:02 +0530
Message-ID: <20230223061703.735524-3-b-kapoor@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223061703.735524-1-b-kapoor@ti.com>
References: <20230223061703.735524-1-b-kapoor@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15927

Add device tree overlay for extending support for mcu_uart0 as well as
wkup_uart0 for boards with J721S2 SoC. This overlay will mainly be used
for the purpose of testing uart instances.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
---
 conf/machine/j721s2-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index ba260b89..952b0792 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -39,6 +39,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721s2-cpb-csi2-ov5640.dtbo \
     ti/k3-j721s2-fpdlink-cpb-fusion.dtbo \
     ti/k3-j721s2-gesi-exp-board.dtbo \
+    ti/k3-j721s2-common-proc-board-uarts.dtbo \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
-- 
2.34.1


