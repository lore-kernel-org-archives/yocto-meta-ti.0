Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E00C77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 17:17:21 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.21728.1750871832813299276
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 10:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AyohReM7;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: anshuld@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PHHCJM2170539
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750871832;
	bh=g0ddB0de7LXRqgxhORcTAPeP4mFOh06qCsRzzeTKP64=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AyohReM7bVlwphlRvlIGZiwNoqoxXqjIXf0KcH1T76CDXFrs7reeyOHFyrWp4SSuS
	 fWEmQQXet3JtZW1STtqp/7mEZSxqKjDxkf5+piaVhvbfOa8uH/POKqkA3eaEA7R/BB
	 sA5DIH1Ud2HgwqczoGl2NySaTZ9ZpPuUx76Xz7uw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PHHCTL2773685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:17:12 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 12:17:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 12:17:11 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PHHBXx3748858;
	Wed, 25 Jun 2025 12:17:11 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v1 1/4] conf: machine: am62xxsip: update u-boot defconfig to am6254xxl
Date: Wed, 25 Jun 2025 22:46:21 +0530
Message-ID: <20250625171626.2863841-2-anshuld@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18671

As of 35df864a0c26 ("configs: add defconfigs for am6254xxl") in
ti-u-boot, new SiP sepcific defconfigs have been added with updated
memory maps and OP-TEE load address. This requires changing the
UBOOT_MACHINE variables inside machine configs for am62xxsip-evm.

Note that AM6254xxl is the OPN for am62x SiP and expands as follows:

AM6254XXL
     ||||
     |||+-- Feature Lookup (L indicates 512MiB of integrated LPDDR4)
     ||+--- Clock Speed
     |+---- Silicon PG Revision
     +----- Core configuration (4 indicates A53's in Quad core config)

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 4 +++-
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
index 55bc530b..2fd0cb54 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -8,7 +8,9 @@ SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
-UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
+UBOOT_MACHINE = "am6254xxl_evm_r5_defconfig"
+
+UBOOT_MACHINE:bsp-ti-6_6 = "am62xsip_evm_r5_defconfig"
 
 UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
 
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index 2ca2cbdb..0a7ebec3 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -15,6 +15,8 @@ KERNEL_DEVICETREE = " \
 
 FIT_CONF_DEFAULT_DTB = "ti/k3-am625-sk.dtb"
 
-UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
+UBOOT_MACHINE = "am6254xxl_evm_a53_defconfig"
+
+UBOOT_MACHINE:bsp-ti-6_6 = "am62xsip_evm_a53_defconfig"
 
 UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
-- 
2.49.0


