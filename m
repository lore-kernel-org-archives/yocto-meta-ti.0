Return-Path: <vaishnav.a@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AF6C7EE30
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:12:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.85548.1677485551648069792
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 00:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qDoZPog3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: vaishnav.a@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31R8CVd5075609
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 02:12:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677485551;
	bh=KP9X73m+bJ0eEv7bhfBouii2w1z2DGihQ+oc4ngbCF8=;
	h=From:To:CC:Subject:Date;
	b=qDoZPog3vyb/gq15EosRnLdaNUTWgf22aM1yyGTIEvMnExM4aQoLZ52jcQ1F5RzMI
	 WB06LD2KlRqDLxY9ncqcEvhlhckG49/xrubCwSRyc52EbqOO2PYIaxAxbfvkdXsARq
	 cnH7WIAsJRtESNdmhK3sRrJ88TuGq5upTVvjbnL8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31R8CUiQ013519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 02:12:30 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 27
 Feb 2023 02:12:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 27 Feb 2023 02:12:30 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31R8CT7Q121133;
	Mon, 27 Feb 2023 02:12:30 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <u-kumar1@ti.com>, <vaishnav.a@ti.com>
Subject: [meta-ti][dunfell][PATCH 1/3] conf: machine: j7-evm: Add MCSPI loopback overlay for J721E
Date: Mon, 27 Feb 2023 13:42:26 +0530
Message-ID: <20230227081228.10841-1-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 08:12:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15955

Add the MCSPI loopback overlay file for J721E EVM which helps
users to enable MCU-MAIN MCSPI loopback applications, even though
the overlay is named j7200-mcspi-loopback.dtbo, same can be used
for testing on other J7 platforms as well.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 conf/machine/j7-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 7fb78019..ee2db658 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -38,6 +38,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-fpdlink-sk-fusion.dtbo \
     ti/k3-j721e-sk-csi2-ov5640.dtbo \
     ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
+    ti/k3-j7200-mcspi-loopback.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.17.1


