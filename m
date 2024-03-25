Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16417C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 14:04:23 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.53033.1711375462122965589
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 07:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KiOf0B1z;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a0123456@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42PE4Lx1097635
	for <meta-ti@lists.yoctoproject.org>; Mon, 25 Mar 2024 09:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711375461;
	bh=b4dqWM+D+3DbeXrIwRJPLgiUEa/ecRJY+ldRISMno1o=;
	h=From:To:CC:Subject:Date;
	b=KiOf0B1z9DDkCHfB7QTZ5Yu0K3NA6Gh2lug6l/7law6r56r02BeY3VH3IugjRW4OY
	 nNGX3fynsr/zniuypIz8yfYOft53D0WfvBmP4xUdtlx7MWvbsTXxZd/bsYennAM4QP
	 W9JWK1qQMIFKrd0Rjo5E1QtUBINdrfmQlNWLqDOI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42PE4LH1013693
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 25 Mar 2024 09:04:21 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 25
 Mar 2024 09:04:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 25 Mar 2024 09:04:21 -0500
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42PE4K95018793;
	Mon, 25 Mar 2024 09:04:20 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <a-limaye@ti.com>, Ryan Eatmon <reatmon@ti.com>, <r-ravikumar@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: j722s-evm: Update KERNERL_DEVICETREE_PREFIX to package fpdlink cam dtbos
Date: Mon, 25 Mar 2024 19:34:13 +0530
Message-ID: <20240325140413.653268-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Mar 2024 14:04:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17551

j722s-evm supports capture from fpdlink cams via fpdlink fusion1 board
or V3Link camera fusion board. So package fpdlink camera overlays

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 meta-ti-bsp/conf/machine/j722s-evm.conf | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
index 7e5874ab..74bcdfce 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
@@ -4,7 +4,11 @@
 
 require conf/machine/include/j722s.inc
 
-KERNEL_DEVICETREE_PREFIX = "ti/k3-j722s"
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-j722s \
+    ti/k3-fpdlink \
+    ti/k3-v3link \
+"
 
 KERNEL_DEVICETREE = ""
 
-- 
2.34.1


