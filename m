Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB39C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 16:04:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.17793.1699459478209302766
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 08:04:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=L0MrQv8L;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8G4b7T047131
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 10:04:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699459477;
	bh=IKJY98OeGEXPAR2VLSviE1YmNW9y+J+xni0VcJOf4Mk=;
	h=From:To:CC:Subject:Date;
	b=L0MrQv8L2mkKSS0lbOmv4vNB5xap+BFeuObq9OjEX0Kanl9ujbsaTL3bPV0FRPg6I
	 VkpgKgpLXFW+I8TOej72/Va/k7zVpDQ124ce+2nSYNSjwUkFptbHnK4vMLpRHpRh+p
	 ERn9ON0O2Aaf3p+Z4IGFsSiCBeqHcykzf+kx0Frk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8G4bVv118395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 10:04:37 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 10:04:37 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 10:04:37 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8G4bCW028232;
	Wed, 8 Nov 2023 10:04:37 -0600
From: Praneeth Bajjuri <praneeth@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Jai Luthra
	<j-luthra@ti.com>
Subject: [kirkstone PATCH v2] conf: machine: am62*: extend picking common overlays by prefix
Date: Wed, 8 Nov 2023 10:04:37 -0600
Message-ID: <20231108160437.15536-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 16:04:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17274

commit f5851386 ("conf: machine: am62*: Pick common overlays by prefix")
picks common HDMI and CSI overlays for am62 platform variants.

Adding capability to extend the same prefix for common overlays for applicable
am62 platforms in more generic way to include new mcan overlays added [1]

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=3b01c392627f

given the differences in SK-AM62-LP containing  B2B HDMI Samtec connector,
just added the kernel prefix to pick common mcan overlay.

for am62pxx: It has 4 MCANs vs all other am62xx devices have 3 MCANs,
hence keeping this prefix seperate for am62pxx to pick right overlay.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
v2: updated am62xxsip conf and updated for am62pxx to pick different
mcan overlay

 meta-ti-bsp/conf/machine/am62axx-evm.conf   | 3 +--
 meta-ti-bsp/conf/machine/am62xx-evm.conf    | 3 +--
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf | 4 ++--
 4 files changed, 5 insertions(+), 6 deletions(-)

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
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index b3bda44a..cae58afe 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -6,8 +6,8 @@ require conf/machine/include/am62xx.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am625 \
-    ti/k3-am62x-sk-csi2 \
-    ti/k3-am62x-sk-hdmi \
+    ti/k3-am62x-sk \
+
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.17.1


