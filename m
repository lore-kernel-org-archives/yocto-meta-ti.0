Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A858EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 08:04:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3664.1688025868973666272
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Jun 2023 01:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=E6LJzPIP;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35T84ROf078828
	for <meta-ti@lists.yoctoproject.org>; Thu, 29 Jun 2023 03:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688025867;
	bh=7z+MBvEDvnSgDdDWtmM8L85AgHXSlfl2AIW5RfxGz1E=;
	h=From:To:CC:Subject:Date;
	b=E6LJzPIPrdtTEeMV3lIsnFwD76NcXlqApTb8fM+Yen0nhyUDJVUi+//t7+389c1CD
	 +pINNBspgmCSM1h5Y7Z81UUj/qDkJl90UBAgzpGU4rdxx5/xxSTiqI5XF8ovj04uEH
	 8ythJdSzhQEjGQn8SVI059BaDL/QNQuRcHf+sUQw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35T84Rnk020166
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 29 Jun 2023 03:04:27 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Jun 2023 03:04:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Jun 2023 03:04:27 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35T84Pre020123;
	Thu, 29 Jun 2023 03:04:25 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>,
        <a-chirania@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: j7*: Update KERNERL_DEVICETREE_PREFIX to match latest filenames
Date: Thu, 29 Jun 2023 13:34:22 +0530
Message-ID: <20230629080422.379634-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 Jun 2023 08:04:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16801

1) The k3-fpdlink-* dtbs were missing.
2) k3-j7200-mcspi-loopback.dts -> k3-j7200-evm-mcspi-loopback.dtso

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/j721e-evm.conf  | 3 ++-
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 3 ++-
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index 8682ad60..5e1f6dca 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -6,7 +6,8 @@ require conf/machine/include/j721e.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j721e \
-    ti/k3-j7200-mcspi-loopback \
+    ti/k3-fpdlink \
+    ti/k3-j7200-evm-mcspi-loopback \
 "
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 4816f9cf..56a949e5 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -9,7 +9,8 @@ OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j721s2 \
-    ti/k3-j7200-mcspi-loopback \
+    ti/k3-fpdlink \
+    ti/k3-j7200-evm-mcspi-loopback \
     ti/k3-am68-sk \
 "
 
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 47290cc0..2421b0b9 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -9,7 +9,8 @@ OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j784s4 \
-    ti/k3-j7200-mcspi-loopback \
+    ti/k3-fpdlink \
+    ti/k3-j7200-evm-mcspi-loopback \
     ti/k3-am69-sk \
 "
 
-- 
2.34.1


