Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DEAC54E67
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 07:00:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2689.1711436445630477705
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Mar 2024 00:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vKpvYGdR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a0123456@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42Q70ifN002772
	for <meta-ti@lists.yoctoproject.org>; Tue, 26 Mar 2024 02:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711436444;
	bh=Ks4w6SrqAJVjq4jVlivKhxFnL+VVSsX+yOYJapm0a+0=;
	h=From:To:CC:Subject:Date;
	b=vKpvYGdRTGWqDOaBgTepGnl44BPnwDPIF1JZwnvieBw6VniDfEjRUSuxgdc8otTVY
	 uTooQrs50UMdap+ytf+rZ2nZW5OKftOJ4eNucjaGFGx61csEeWsDmA/u5jI/GL4hev
	 x3WjI2xEl04Zdt8ttqlfaAlq5ZKwocXynoZPqJwQ=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42Q70itu080364
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 26 Mar 2024 02:00:44 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 26
 Mar 2024 02:00:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 26 Mar 2024 02:00:44 -0500
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42Q70h7P125265;
	Tue, 26 Mar 2024 02:00:44 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <a-limaye@ti.com>, Ryan Eatmon <reatmon@ti.com>, <vaishnav.a@ti.com>,
        <j-luthra@ti.com>, <r-ravikumar@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: j721s2/j784s4: Pick overlays for V3Link cameras
Date: Tue, 26 Mar 2024 12:30:41 +0530
Message-ID: <20240326070041.699601-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 26 Mar 2024 07:00:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17554

am69 and am68 sk boards supports V3Link cameras interfaced via V3Link
camera fusion board. Refer to
commit b7a97b1b (conf: machine: am62axx: Pick overlays for V3Link cameras)
for details

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 1 +
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index ecb1836f..c4e8af90 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -12,6 +12,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-fpdlink \
     ti/k3-j7200-evm-mcspi-loopback \
     ti/k3-am68-sk \
+    ti/k3-v3link \
 "
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 40a63651..e451bf47 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -12,6 +12,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-fpdlink \
     ti/k3-j7200-evm-mcspi-loopback \
     ti/k3-am69-sk \
+    ti/k3-v3link \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.34.1


