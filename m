Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C8BC7EE39
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 09:52:41 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.4562.1750931554275986212
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 02:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aPlXmWwQ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: anshuld@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q9qXRq2384030
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 04:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750931553;
	bh=R/IOx9VM9Z6dnDlKRhFe399L1QK+moxOzNIAllRk39M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aPlXmWwQDu06HFXYAu8TqyTJpi6ewwRjYfPemoVCrkAJOdAsyddakLAkCDdbfVJMf
	 5bVkdfSRHfcLvJWlndy/SqYsTnzlzclGshgytdlDceNnec8GfG+xD6HBayMj47+To4
	 3AYmcs/R96Vcuii/L4dWNZRZb7+fDV/PMQs8pamI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q9qXt51870156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 04:52:33 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 04:52:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 04:52:33 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q9qWo41063364;
	Thu, 26 Jun 2025 04:52:33 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 4/4] conf: machine: am62xxsip: update kernel dtbs
Date: Thu, 26 Jun 2025 15:21:43 +0530
Message-ID: <20250626095144.952261-5-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095144.952261-1-anshuld@ti.com>
References: <20250626095144.952261-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 09:52:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18691

The new kernel dtb for am62x SiP have been merged to ti-linux-kernel as
of f9579207b081 ("arm64: dts: ti: Add support for AM6254xxl SiP SK") on
ti-linux-6.12.y-cicd. This patch modifies FIT_CONF_DEFAULT_DTB to pick
the new dtb instead.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index 52121675..a506385e 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -25,7 +25,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
 "
 
-FIT_CONF_DEFAULT_DTB = "ti/k3-am625-sk.dtb"
+FIT_CONF_DEFAULT_DTB = "ti/k3-am6254xxl-sk.dtb"
+FIT_CONF_DEFAULT_DTB:bsp-ti-6_6 = "ti/k3-am625-sk.dtb"
+FIT_CONF_DEFAULT_DTB:bsp-ti-6_1 = "ti/k3-am625-sk.dtb"
 
 UBOOT_MACHINE = "am6254xxl_evm_a53_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 = "am62xsip_evm_a53_defconfig"
-- 
2.49.0


