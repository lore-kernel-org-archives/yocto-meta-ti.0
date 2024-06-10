Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6155EC27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 12:47:11 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.18552.1718023625443669612
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Jun 2024 05:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=p9Z3rtCV;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45ACl4Z0033424
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Jun 2024 07:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718023624;
	bh=HL8THBk6hKhob3T8azJnPmP7B70wTodwra3sLYCDH6I=;
	h=From:To:CC:Subject:Date;
	b=p9Z3rtCVgKKrKL2DLraY7iYScZE42b7YXGP1nvIKsVmyRk2zVspgHcb97EVeqvVnZ
	 gjha7kSR4bwTzaQvFegQkA3LdB1Gm7jOzlJVAWTbuv3+2XieWpGI6iPd1Nc+fVUHvZ
	 ITLt/hWLWMEdLsipG+J/DYHGgoqsClVh3cYBmuHg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45ACl4Gm038448
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Jun 2024 07:47:04 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 07:47:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 07:47:04 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45ACl1Cx012772;
	Mon, 10 Jun 2024 07:47:02 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <m-chawdhry@ti.com>, <n-francis@ti.com>,
        <u-kumar1@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: add j721e-sk machine-configuration
Date: Mon, 10 Jun 2024 18:16:57 +0530
Message-ID: <20240610124657.696268-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Jun 2024 12:47:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17717

As of commit [1] there will be a separate defconfig to build u-boot for
j721e-evm and j721e-sk.

Hence, introduce new yocto machine configs for j721e-sk.

[1]: https://source.denx.de/u-boot/u-boot/-/commit/c9507f07a1d6c92bd1f73fd64384f8c5994be9c2

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf | 11 +++++++++++
 meta-ti-bsp/conf/machine/j721e-sk.conf      | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/j721e-sk.conf

diff --git a/meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf
new file mode 100644
index 00000000..45eaabb6
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J721e SK (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721e SK (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j721e"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE = "j721e_sk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-sk.conf b/meta-ti-bsp/conf/machine/j721e-sk.conf
new file mode 100644
index 00000000..a7a9578d
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j721e-sk.conf
@@ -0,0 +1,16 @@
+#@TYPE: Machine
+#@NAME: J721e SK
+#@DESCRIPTION: Machine configuration for the TI J721e SK
+
+require conf/machine/include/j721e.inc
+
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-j721e-sk \
+    ti/k3-fpdlink \
+"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-j721e-sk.dtb \
+"
+
+UBOOT_MACHINE = "j721e_sk_a72_config"
-- 
2.34.1


