Return-Path: <vaishnav.a@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41897C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:12:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.85579.1677485553906720050
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 00:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GuqnjUzB;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: vaishnav.a@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31R8CXKT075614
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 02:12:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677485553;
	bh=cH0T6Th66GZRu/Od9s+NoJBR4o9FDprnolQON4z4SNE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GuqnjUzBdmbMCcWxY6bswhWTNx39tPCx+0DjzsQcP1t0PKjou4ckKRz3QjtSa3Om4
	 60jLSalDBUYHhWWUBt/CLA44ASeslyYumf+Hay0RkCY4TInx/D/b21MLGiktYpKnmH
	 7kvRXvwMOwHTInFTvLFEqeLNtGcP7SYqPpG9PJ3I=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31R8CXjI045824
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 02:12:33 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 27
 Feb 2023 02:12:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 27 Feb 2023 02:12:32 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31R8CV3O035874;
	Mon, 27 Feb 2023 02:12:32 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <u-kumar1@ti.com>, <vaishnav.a@ti.com>
Subject: [meta-ti][dunfell][PATCH 2/3] conf: machine: j721s2-evm: Add MCSPI loopback overlay for J721S2
Date: Mon, 27 Feb 2023 13:42:27 +0530
Message-ID: <20230227081228.10841-2-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230227081228.10841-1-vaishnav.a@ti.com>
References: <20230227081228.10841-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 08:12:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15956

Add the MCSPI loopback overlay file for J721S2 EVM which helps
users to enable MCU-MAIN MCSPI loopback applications, even though
the overlay is named j7200-mcspi-loopback.dtbo, same can be used
for testing on other J7 platforms as well.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 conf/machine/j721s2-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index ba260b89..ab6f9479 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -39,6 +39,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721s2-cpb-csi2-ov5640.dtbo \
     ti/k3-j721s2-fpdlink-cpb-fusion.dtbo \
     ti/k3-j721s2-gesi-exp-board.dtbo \
+    ti/k3-j7200-mcspi-loopback.dtbo \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
-- 
2.17.1


