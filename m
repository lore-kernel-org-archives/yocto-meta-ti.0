Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BF7EEB570
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 20:38:50 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4011.1694205525734723530
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 13:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c2U06rAe;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388KcfN0130175;
	Fri, 8 Sep 2023 15:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694205521;
	bh=msW4MF1KWipsiUaeOrEOxo/tHIs19/T73Qu4oN/KJI0=;
	h=From:To:CC:Subject:Date;
	b=c2U06rAe57YirKcNJ68qytmsy9ef3+GCc5Crpuy2Twb7G2WNHyIT0NjbfTRNe3TCm
	 jAse4Gr/F7ddkkxsZyjisdElm4vqgyXCvdbtx9h1mkupPmuHCtkOMZ6R17lJQ4AhZT
	 lsE+zKZBCAm1xe1yXLy1kcso+lIdSp7yCLXvCyFk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388KcfIO027770
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Sep 2023 15:38:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 15:38:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 15:38:40 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388Kce9N121968;
	Fri, 8 Sep 2023 15:38:40 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] conf: machine: Add am62xxsip-evm configuration
Date: Sat, 9 Sep 2023 02:08:20 +0530
Message-ID: <20230908203820.2771293-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 20:38:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16943

- Add A53 and R5 machine configurations for am62xxsip-evm.
- Use UBOOT_CONFIG_FRAGMENT as am62xsip_sk_r5.config for R5 machine configuration.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 12 ++++++++++++
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 13 +++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62xxsip-evm.conf

diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
new file mode 100644
index 00000000..a5be1130
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -0,0 +1,12 @@
+#@TYPE: Machine
+#@NAME: AM62XX SIP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx SIP EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "am62x_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENT = "am62xsip_sk_r5.config"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
new file mode 100644
index 00000000..dc4f3b77
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: AM62XX SIP EVM
+#@DESCRIPTION: Machine configuration for the TI AM62XX SIP EVM
+
+require conf/machine/include/am62xx.inc
+
+KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-am625-sk.dtb \
+"
+
+UBOOT_MACHINE = "am62x_evm_a53_defconfig"
-- 
2.34.1


