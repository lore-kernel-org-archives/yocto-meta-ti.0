Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03ED9C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 10:10:11 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.8624.1672827005246721899
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 02:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vZPKgkzx;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-luthra@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304AA2B4102609;
	Wed, 4 Jan 2023 04:10:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672827002;
	bh=dA4J3e1ovorUX7K/6OGVFPqtavUYeHAaF3WT3dMPwYU=;
	h=From:To:CC:Subject:Date;
	b=vZPKgkzxCFv/aP4A0bbvTj3KNrLsd7GI2u9mbGxxTc3HFc9XOdtsGbbmCYtP2OKb5
	 CoSdlYiQBojEBHaGVRau5uCO0s3rE2sm+oDUHNelKSvGR/C6LV/lN8TM0TljSMg4Lk
	 amyeZP0B3IMl/7ED7z7ZSDJxbwjeEEd6wlTEAmVE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304AA2Zh106297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Jan 2023 04:10:02 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 04:10:01 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 04:10:01 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304AA0Dn024416;
	Wed, 4 Jan 2023 04:10:01 -0600
From: Jai Luthra <j-luthra@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: am62axx: Add camera overlays for AM62A SK
Date: Wed, 4 Jan 2023 15:39:58 +0530
Message-ID: <20230104100958.31125-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 10:10:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15515

Add the following overlay files on AM62A SK:

1. Fusion board (For FPDLink-III cameras)
2. OV2312 FPDLink camera module
3. IMX219 RPi-compatible camera module

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 conf/machine/am62axx-evm.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/conf/machine/am62axx-evm.conf b/conf/machine/am62axx-evm.conf
index 4eb179f3..897d2278 100644
--- a/conf/machine/am62axx-evm.conf
+++ b/conf/machine/am62axx-evm.conf
@@ -6,6 +6,12 @@ require conf/machine/include/am62axx.inc
 
 KERNEL_DEVICETREE = " \
     ti/k3-am62a7-sk.dtb \
+    ti/k3-am62a7-fpdlink-ov2312-0-0.dtbo \
+    ti/k3-am62a7-fpdlink-ov2312-0-1.dtbo \
+    ti/k3-am62a7-fpdlink-ov2312-0-2.dtbo \
+    ti/k3-am62a7-fpdlink-ov2312-0-3.dtbo \
+    ti/k3-am62a7-fpdlink-sk-fusion.dtbo \
+    ti/k3-am62a7-sk-csi2-imx219.dtbo \
 "
 
 UBOOT_MACHINE = "am62ax_evm_a53_defconfig"
-- 
2.17.1


