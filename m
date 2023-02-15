Return-Path: <vaishnav.a@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995F4C64EC7
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 12:19:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13588.1676463589926887462
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 04:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KspXyDNz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: vaishnav.a@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FCJn7q102551
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 06:19:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676463589;
	bh=frs4kGtYRIpQzfvzuRRJMlnJbS7KTK7xYC2bn7dmr1Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KspXyDNzukENh7WIW5xJnkTkNomIn6sTwtQBi8RFnP51xg3SSMw08oEEJrIQL+/Nq
	 2slvvICohfEaGVBosUlvhHSskzaLcy6H+IdXoBRpsiOrHODHRdAsZS8v34wqCvSue2
	 ggFCoVv403+BD6rEyD8+tU6yHiz96bJYlEpDQ8dU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FCJnYb015702
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 06:19:49 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 06:19:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 06:19:48 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FCJl16048249;
	Wed, 15 Feb 2023 06:19:48 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <m-chawdhry@ti.com>, <j-choudhary@ti.com>, <vaishnav.a@ti.com>
Subject: [meta-ti][dunfell][PATCH 2/4] conf: machine: j7-evm: Add camera overlays for J721E EVM
Date: Wed, 15 Feb 2023 17:49:43 +0530
Message-ID: <20230215121945.3631-2-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230215121945.3631-1-vaishnav.a@ti.com>
References: <20230215121945.3631-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15852

Add the following overlay files on J721E EVM:

1. Fusion board (For FPDLink-III cameras)
2. IMX390 FPDLink camera module
3. IMX219 RPi-compatible camera module

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 conf/machine/j7-evm.conf | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 514695d6..7fb78019 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -16,7 +16,28 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
     ti/k3-j721e-proc-board-tps65917.dtb \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
+    ti/k3-j721e-cpb-csi2-ov5640.dtbo \
+    ti/k3-j721e-fpdlink-cpb-fusion.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
     ti/k3-j721e-sk.dtb \
+    ti/k3-j721e-fpdlink-sk-fusion.dtbo \
+    ti/k3-j721e-sk-csi2-ov5640.dtbo \
+    ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.17.1


