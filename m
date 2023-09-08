Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B8EEE7FF0
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:03:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.38457.1694178185127925573
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 06:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vbdL+bUl;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388D2whJ121860;
	Fri, 8 Sep 2023 08:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694178178;
	bh=zSyivalLql8bIeQfmSWGjsJSjo5YUoEDJabw/EF/FN8=;
	h=From:To:CC:Subject:Date;
	b=vbdL+bUlGMA07+7FXNWMpbg/LeTr4hTNZGdEaOiCEoM9UlxPmyqvuW48kE9gN5D1L
	 rkY6jf73RV6ewFV5j2D0NqjTb2tHKQNgH20URI9OJDHiG6xh6Ru4j6jF3knvEN6UIS
	 HvXmW/n9igDyasnwQ9N9Zrdacuaz/BXXAgvTnCkA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388D2wnM107825
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Sep 2023 08:02:58 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 08:02:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 08:02:57 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388D2vtP058501;
	Fri, 8 Sep 2023 08:02:57 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] conf: machine: Add am62xx-sip-evm configuration
Date: Fri, 8 Sep 2023 18:32:34 +0530
Message-ID: <20230908130234.2227726-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 13:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16933

- Add A53 and R5 machine configurations for am62xx-sip-evm.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf | 11 +++++++++++
 meta-ti-bsp/conf/machine/am62xx-sip-evm.conf      | 13 +++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-sip-evm.conf

diff --git a/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
new file mode 100644
index 00000000..472da1cc
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
@@ -0,0 +1,11 @@
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
diff --git a/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf b/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf
new file mode 100644
index 00000000..dc4f3b77
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf
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


