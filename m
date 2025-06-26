Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB84C7EE32
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 09:52:41 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.4561.1750931552872160684
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 02:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kHdeagxo;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: anshuld@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q9qWOU1708811
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 04:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750931552;
	bh=z9P8kyaYO6M7JyaA+h1D+aGGDQiSiVLRVk4PNXyduBo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kHdeagxoU8aTS/ZceQ2GRVqVeF3PPwOT5TmBL73jc5yHD+E86X3B/nzH92shxf5/C
	 9L/NfiyETkMUKD+ejeH6y136By+H7YjNFH5svrTOjsRElDw3xDSDwhe+b9l73edyuY
	 IXXGReVAqr5ZzxXVxtVHjhqhYcqhjwoZ9mMJeUXY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q9qWqE1870147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 04:52:32 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 04:52:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 04:52:31 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q9qVCp802182;
	Thu, 26 Jun 2025 04:52:31 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 3/4] meta-ti-bsp: optee: add build flags for am62xxsip-evm
Date: Thu, 26 Jun 2025 15:21:42 +0530
Message-ID: <20250626095144.952261-4-anshuld@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18690

CFG_TZDRAM_START in OPTEE defines it's load address and is used to
configure the page tables accordingly.

Due to 512MiB DDR limitation of am62x SiP, the memory map has been
modified with OP-TEE moved to bottom of DDR after atf to 0x80080000,
this requires modifications to the OPTEE's CFG_TZDRAM_START.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf                  | 4 ++++
 meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 1 +
 2 files changed, 5 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index fc525a9a..52121675 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -12,6 +12,10 @@ TFA_K3_PRELOADED_BL33 = "0x82000000"
 TFA_K3_PRELOADED_BL33:bsp-ti-6_6 = ""
 TFA_K3_PRELOADED_BL33:bsp-ti-6_1 = ""
 
+OPTEE_K3_TZDRAM_START = "0x80080000"
+OPTEE_K3_TZDRAM_START:bsp-ti-6_6 = ""
+OPTEE_K3_TZDRAM_START:bsp-ti-6_1 = ""
+
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am625 \
     ti/k3-am62x-sk \
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index d1de4368..61a74a06 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -4,6 +4,7 @@ inherit ti-secdev
 EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
 
 EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
+EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_TZDRAM_START='+ d.getVar('OPTEE_K3_TZDRAM_START') if d.getVar('OPTEE_K3_TZDRAM_START') else ''}"
 
 EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62lxx = " CFG_TEE_CORE_LOG_LEVEL=1"
-- 
2.49.0


