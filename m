Return-Path: <b-kapoor@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDADFC61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 06:17:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.5034.1677133025773171398
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 22:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sPLpR9XO;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: b-kapoor@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31N6H5mW038740
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 00:17:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677133025;
	bh=G4Yew1N7TOMAR2cVUusccCgKwU+mcjUh/0s32A0ywyQ=;
	h=From:To:CC:Subject:Date;
	b=sPLpR9XOG8RpPzeATQRw7HqGRRaLannxX7hS98Ff8uOL0rjxfAIO7S989+Hl8jFuB
	 ALYnTYnUrmV9a78d2LuhMHX6EFAH0uxzXz35+b5dy9w7WjVmwUuI1/mL5som9Lw0PF
	 96+atFmW5dqsoKUPfFyJtl2MjyjB8kx3KeKtnlws=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31N6H5Ke020523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 00:17:05 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Feb 2023 00:17:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Feb 2023 00:17:04 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31N6H33i121415;
	Thu, 23 Feb 2023 00:17:04 -0600
From: Bhavya Kapoor <b-kapoor@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <b-kapoor@ti.com>, <reatmon@ti.com>
Subject: [meta-ti][dunfell][PATCH 1/4] conf: machine: j7200-evm: Add uarts overlay for J7200
Date: Thu, 23 Feb 2023 11:47:00 +0530
Message-ID: <20230223061703.735524-1-b-kapoor@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:17:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15925

Add device tree overlay for extending support for mcu_uart0 as well as
wkup_uart0 for boards with J7200 SoC. This overlay will mainly be used
for the purpose of testing uart instances.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
---
 conf/machine/j7200-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index 3fa9447b..1e9db37b 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -10,6 +10,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 KERNEL_DEVICETREE = " \
     ti/k3-j7200-common-proc-board.dtb \
     ti/k3-j7200-mcspi-loopback.dtbo \
+    ti/k3-j7200-common-proc-board-uarts.dtbo \
 "
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
-- 
2.34.1


