Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F03C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 10:35:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.20652.1673433341657950947
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 02:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XsP98iCo;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-luthra@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30BAZajF024986;
	Wed, 11 Jan 2023 04:35:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673433337;
	bh=OWM6Fy4LYwyc1SOnQHuOMGoc5NIesmw/qLCbvOZj1+k=;
	h=From:To:CC:Subject:Date;
	b=XsP98iCopHkQ3at0OWg+5UZjPPJwKxLDI+HWM+adDrPfl5vSLBKvL6sryh3Pj7wef
	 Bc45Mkoxwfr8W5QK2NdLwTQU0sqWEyml096X2HlRJ24EwtjBcNm11z6Eei83Fiv+ky
	 OFZ3mnSUOnGFvHch824TY4JpRpgHOwuS8JlIKIT4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30BAZacL004472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Jan 2023 04:35:36 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 11
 Jan 2023 04:35:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 11 Jan 2023 04:35:36 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30BAZZC2082589;
	Wed, 11 Jan 2023 04:35:36 -0600
From: Jai Luthra <j-luthra@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Jai Luthra <j-luthra@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: am62axx: Add overlays for IMX390 cameras
Date: Wed, 11 Jan 2023 16:05:34 +0530
Message-ID: <20230111103534.16719-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Jan 2023 10:35:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15547

IMX390 is a 2MP FPDLink-III raw camera. This sensor was originally
targeted for J7-based devices, but AM62A can re-use the existing
overlays. Both the CM and RCM type of modules are supported.

As AM62A only has one CSI-RX port, we only use 4 out of the 8 total
FPDLink ports on the fusion board.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 conf/machine/am62axx-evm.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/conf/machine/am62axx-evm.conf b/conf/machine/am62axx-evm.conf
index 897d2278..e7a59d2e 100644
--- a/conf/machine/am62axx-evm.conf
+++ b/conf/machine/am62axx-evm.conf
@@ -12,6 +12,14 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62a7-fpdlink-ov2312-0-3.dtbo \
     ti/k3-am62a7-fpdlink-sk-fusion.dtbo \
     ti/k3-am62a7-sk-csi2-imx219.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
+    ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
 "
 
 UBOOT_MACHINE = "am62ax_evm_a53_defconfig"
-- 
2.17.1


