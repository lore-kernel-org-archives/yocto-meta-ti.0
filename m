Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E9EC4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 05:26:03 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.6380.1666243561428196459
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 22:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CS57deAI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29K5Q0xA106367
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 00:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666243560;
	bh=4sGxcUrjADaImEPib4DqGbBDOAb9LWXlZhxwvwDH8eo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CS57deAIzm0MMNw5Se6q2D3ndxZU/vLKw2XmTS3c3zQG2fDgqLRuf2bn0vJnt+GGh
	 9/xmmVWzggSogdW11XsqWKsdFFW2kyntfhuEQixYK98JGSeKwJWTUQi/UUPFbKAo9t
	 u8TkZFA4dDXl0wBZvS34IwdgToHgvQHGgoZMbJEo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29K5Q0h6056253
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 00:26:00 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 20
 Oct 2022 00:26:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 20 Oct 2022 00:26:00 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29K5PuEu120845;
	Thu, 20 Oct 2022 00:25:58 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][RFC dunfell][PATCH v3 1/6] conf: machine: Add J784S4 hs platform
Date: Thu, 20 Oct 2022 10:55:50 +0530
Message-ID: <20221020052555.1895586-2-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020052555.1895586-1-m-chawdhry@ti.com>
References: <20221020052555.1895586-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 05:26:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15185

Machine conf for J784S4 HS platform.
Used J721S2 hs as reference.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 conf/machine/j784s4-hs-evm-k3r5.conf | 11 +++++++++++
 conf/machine/j784s4-hs-evm.conf      | 11 +++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j784s4-hs-evm.conf

diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf b/conf/machine/j784s4-hs-evm-k3r5.conf
new file mode 100644
index 00000000..b6f2f6f9
--- /dev/null
+++ b/conf/machine/j784s4-hs-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J784S4 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j784s4"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+UBOOT_MACHINE = "j784s4_hs_evm_r5_defconfig"
diff --git a/conf/machine/j784s4-hs-evm.conf b/conf/machine/j784s4-hs-evm.conf
new file mode 100644
index 00000000..31666c78
--- /dev/null
+++ b/conf/machine/j784s4-hs-evm.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J784S4 HS EVM
+#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
+
+require conf/machine/j784s4-evm.conf
+
+UBOOT_MACHINE = "j784s4_hs_evm_a72_defconfig"
+
+SPL_BINARY = "tispl.bin_HS"
+UBOOT_BINARY = "u-boot.img_HS"
+UBOOT_SYMLINK = "u-boot.img"
-- 
2.34.1


