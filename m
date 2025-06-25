Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535C9C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 17:17:21 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.21660.1750871834921149136
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 10:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=US124tGk;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: anshuld@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PHHDoC2239266
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750871834;
	bh=QRiC2KhZiQ2c33gsrwB1i0SdMo8+SqE2r4qrFFC1nxc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=US124tGkUYUCyh8/5rdqPj19mVGmcSQxHi3OUB+h2O130U9rBG98Bk9tRTUprpog8
	 doLLuPzc27n5yzPpQGKYWPbk8n3TYU98arYmUYuyH1Zw9ZfOB61h+9sMaM/Qc+t/2Q
	 q4L9vUCLXfhRzQ5YT8qoA/H+g3+eO39t3jUi9J2Q=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PHHDKr2773704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:17:13 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 12:17:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 12:17:13 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PHHCR53748877;
	Wed, 25 Jun 2025 12:17:13 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v1 2/4] meta-ti-bsp: tfa: add build flags for am62xxsip-evm
Date: Wed, 25 Jun 2025 22:46:22 +0530
Message-ID: <20250625171626.2863841-3-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625171626.2863841-1-anshuld@ti.com>
References: <20250625171626.2863841-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 17:17:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18672

Due to 512MiB DDR limitation of am62x SiP, the memory map has been
modified with OP-TEE moved to bottom of DDR after atf to 0x80080000,
this requires modifications to ATF's BL32_BASE. PRELOADED_BL33_BASE has
also been updated to 0x81880000 to reflect the updated SPL_TEXT_BASE
from u-boot.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index cb956a00..805ded8e 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -19,4 +19,5 @@ TFA_SPD:am62lxx = ""
 
 EXTRA_OEMAKE += "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE += "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
+EXTRA_OEMAKE:append:am62xxsip-evm:bsp-ti-6_12 = " PRELOADED_BL33_BASE=0x81880000 BL32_BASE=0x80080000"
 EXTRA_OEMAKE:append:ti-falcon = " PRELOADED_BL33_BASE=0x82000000 K3_HW_CONFIG_BASE=0x88000000"
-- 
2.49.0


