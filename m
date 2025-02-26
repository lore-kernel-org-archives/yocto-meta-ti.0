Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B96C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 14:26:41 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.5405.1740575247832783136
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Feb 2025 05:07:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WgfgjS91;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: y-abhilashchandra@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QD7RmA2082566
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Wed, 26 Feb 2025 07:07:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740575247;
	bh=ZgJWpRD1YzogVS2PFISDLR5cTClXc1xySpZ+37w9wVc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WgfgjS91vjL9EaarBrv58/DuASS5owzD653cGq0++rrm2FCjKyfRziBTsw7BS2JBS
	 Pvh7a9Bj8U6/uE5B95xYWtQ+z0h3Ogzs0NRhMF66juphkQznA2P5ud2elrUBlOexiN
	 LibkyOmBU5lON7iI9s7dH/wMIgWchRZy5Y2cqDfY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QD7Rc6009296
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 26 Feb 2025 07:07:27 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 07:07:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 07:07:27 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QD7IqK121230;
	Wed, 26 Feb 2025 07:07:25 -0600
From: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <vaishnav.a@ti.com>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v3 2/2] conf: machine: j721s2/j784s4: Pick overlays for DS90UB954
Date: Wed, 26 Feb 2025 18:37:16 +0530
Message-ID: <20250226130716.453754-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226130716.453754-1-y-abhilashchandra@ti.com>
References: <20250226130716.453754-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Feb 2025 14:26:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18339

DS90UB954-Q1EVM can be used to connect FPDLink-III based sensors to
TI EVMs. So pick the DS90UB954-Q1EVM overlay.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 1 +
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 5cb28309..f0600f33 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -20,6 +20,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721s2-common-proc-board.dtb \
     ti/k3-j721s2-evm-gesi-exp-board.dtbo \
     ti/k3-j721s2-evm-pcie1-ep.dtbo \
+    ti/k3-j721s2-evm-ub954.dtbo \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index e1443ef5..3940a95f 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -23,6 +23,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j784s4-evm-quad-port-eth-exp1.dtbo \
     ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtbo \
     ti/k3-j784s4-evm.dtb \
+    ti/k3-j721s2-evm-ub954.dtbo \
 "
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
-- 
2.34.1


