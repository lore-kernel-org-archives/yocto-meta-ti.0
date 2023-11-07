Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2C5C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 23:53:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1982.1699401198233194879
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 15:53:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XkammvPk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7NrHlU064852
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Nov 2023 17:53:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699401197;
	bh=Y5zgLD3gllkHk4lhPTcEq2IvOftLfLYF29cOtHZV9ws=;
	h=From:To:CC:Subject:Date;
	b=XkammvPkutGtVsq97gVFTkargWoeAnB7/rrSjICfSnpBYPLAcv233CLrvzeM0zSwk
	 OK9NldYpqqeHBikqvykQ3MJfBIwpOQu8blxW05ZEbrREtMK10T0nkbM3fSYOeqTayi
	 JRYoG38IuRwlQTSCS2Fx/GpVveGDqb8YkP0fqBW0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7NrHQm021085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Nov 2023 17:53:17 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 17:53:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 17:53:16 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7NrGxJ014003;
	Tue, 7 Nov 2023 17:53:16 -0600
From: Praneeth Bajjuri <praneeth@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Jai Luthra
	<j-luthra@ti.com>
Subject: [kirkstone PATCH] conf: machine: am62*: extend picking common overlays by prefix
Date: Tue, 7 Nov 2023 17:53:16 -0600
Message-ID: <20231107235316.29646-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 23:53:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17262

commit f5851386 ("conf: machine: am62*: Pick common overlays by prefix")
picks common HDMI and CSI overlays for am62 platform variants.

Adding capability to extend the same prefix for common overlays for
am62 family in more generic way to include new mcan overlays added [1]

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=3b01c392627f

given the differences in SK-AM62-LP containing  B2B HDMI Samtec connector,
just added the kernel prefix to pick common mcan overlay.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm.conf   | 3 +--
 meta-ti-bsp/conf/machine/am62pxx-evm.conf   | 3 +--
 meta-ti-bsp/conf/machine/am62xx-evm.conf    | 3 +--
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index ef60e9d1..22f61401 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -6,8 +6,7 @@ require conf/machine/include/am62axx.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62a7 \
-    ti/k3-am62x-sk-csi2 \
-    ti/k3-am62x-sk-hdmi \
+    ti/k3-am62x-sk \
     ti/k3-fpdlink \
 "
 
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index 931de953..5e0bab97 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -6,8 +6,7 @@ require conf/machine/include/am62pxx.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62p5 \
-    ti/k3-am62x-sk-csi2 \
-    ti/k3-am62x-sk-hdmi \
+    ti/k3-am62x-sk \
 "
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index b60ba156..fadbc6f4 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -7,8 +7,7 @@ require conf/machine/include/ti-extras.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am625 \
-    ti/k3-am62x-sk-csi2 \
-    ti/k3-am62x-sk-hdmi \
+    ti/k3-am62x-sk \
 "
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 0d2f89ca..afa5e061 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62-lp \
     ti/k3-am625-sk \
     ti/k3-am62x-sk-hdmi \
+    ti/k3-am62x-sk-mcan \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.17.1


