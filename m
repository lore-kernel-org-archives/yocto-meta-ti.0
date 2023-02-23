Return-Path: <b-kapoor@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90893C636D7
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 06:17:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.5082.1677133030648773933
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 22:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ofpwpVEs;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: b-kapoor@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31N6H9Z5032109
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 00:17:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677133029;
	bh=8ruA+UumAgokMktWePTjWQDgH5CDDk7itnqMgRxnJhg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ofpwpVEsoj8TItBIeYRdzEhi8SQDz4oUvWqfE815oLYFwHVX7z4ICJ8NkkWdeS07W
	 9gyAo1c6Fy4zn/huGj5mIh+VkeeznMZ+sL0w5x21l9Nz3qZHnttw6S/ZF2K8n+1TQF
	 Nkj5vtaJNAgM4ITRjQ49q1dE9xsK/OP71tsjEjpA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31N6H9kN113134
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 00:17:09 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Feb 2023 00:17:09 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Feb 2023 00:17:09 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31N6H8Wp027322;
	Thu, 23 Feb 2023 00:17:09 -0600
From: Bhavya Kapoor <b-kapoor@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <b-kapoor@ti.com>, <reatmon@ti.com>
Subject: [meta-ti][dunfell][PATCH 4/4] conf: machine: j784s4-evm: Add uarts overlay for J784S4
Date: Thu, 23 Feb 2023 11:47:03 +0530
Message-ID: <20230223061703.735524-4-b-kapoor@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223061703.735524-1-b-kapoor@ti.com>
References: <20230223061703.735524-1-b-kapoor@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15928

Add device tree overlay for extending support for mcu_uart0 as well as
wkup_uart0 for boards with J784S4 SoC. This overlay will mainly be used
for the purpose of testing uart instances.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
---
 conf/machine/j784s4-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
index 77805d49..47d05429 100644
--- a/conf/machine/j784s4-evm.conf
+++ b/conf/machine/j784s4-evm.conf
@@ -38,6 +38,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j784s4-evm.dtb \
     ti/k3-j784s4-evm-csi2-ov5640.dtbo \
     ti/k3-j784s4-fpdlink-fusion.dtbo \
+    ti/k3-j784s4-evm-uarts.dtbo \
 "
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
-- 
2.34.1


