Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62C6C7EE32
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 09:52:31 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.4506.1750931549653274880
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 02:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jnjmFqw8;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: anshuld@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q9qTb62384020
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 04:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750931549;
	bh=UsY+3kyi/Fi+dcdfOTG7Fog+ZX3SCTldwhpvE3etIXk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jnjmFqw89uJBoaBjxcDxsm0sn9TXOrYxSSGwyzzjBrjLo9PRFtx6xtfk7119wAYkE
	 vadiAxnkKDKN6bvKqtCLreMC7qGtFfkZ/8xsmLbiHAbyWEnfY4zvbrMn9l6e/YjyAX
	 j+4cWkQM7YWGNPZAk0Thbw1K8TQlwPNmj1ykEsWY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q9qT4i3519458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 04:52:29 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 04:52:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 04:52:28 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q9qSON1063289;
	Thu, 26 Jun 2025 04:52:28 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 1/4] conf: machine: am62xxsip: update u-boot defconfig to am6254xxl
Date: Thu, 26 Jun 2025 15:21:40 +0530
Message-ID: <20250626095144.952261-2-anshuld@ti.com>
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
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 09:52:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18688

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
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

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
index 2ca2cbdb..38bd4407 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -15,6 +15,6 @@ KERNEL_DEVICETREE = " \
 
 FIT_CONF_DEFAULT_DTB = "ti/k3-am625-sk.dtb"
 
-UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
-
+UBOOT_MACHINE = "am6254xxl_evm_a53_defconfig"
+UBOOT_MACHINE:bsp-ti-6_6 = "am62xsip_evm_a53_defconfig"
 UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
-- 
2.49.0


