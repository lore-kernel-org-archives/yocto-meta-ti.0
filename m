Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC726EE6457
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 11:15:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.18085.1694776538947930259
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 04:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IBK/ARZW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38FBFYT9053712;
	Fri, 15 Sep 2023 06:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694776534;
	bh=kxAwtcTyF/0ZAyF1zuLBiYVwwwoJVv0AC2QhAbn9CkI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IBK/ARZW4qlJ5WgeFZAPaJXQGAbx1yOWkxwn5gyLFNzA5gkRjN/GqgqroO2MRlLj+
	 vUlAgJUfYUBiKG7ovI10Nr9YqqUmUuYevLFugbYiGEHBnUXHRH20H6PjGcEGibBltr
	 oq4Hzg2CHpKheSYFSqCaSDfZnwurNwyR6/T+KJAI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38FBFYuB052610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 15 Sep 2023 06:15:34 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 15
 Sep 2023 06:15:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 15 Sep 2023 06:15:33 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38FBFWP8051790;
	Fri, 15 Sep 2023 06:15:33 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v4 2/2] conf: machine: Add am62xxsip-evm configuration
Date: Fri, 15 Sep 2023 16:45:23 +0530
Message-ID: <20230915111523.2274146-2-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915111523.2274146-1-c-shilwant@ti.com>
References: <20230915111523.2274146-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 Sep 2023 11:15:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16985

- Add A53 and R5 machine configurations for am62xxsip-evm.
- Use UBOOT_CONFIG_FRAGMENTS as am62xsip_sk_r5.config in R5 machine configuration. This will ensure we
build u-boot-r5 with baseconfig as am62x_evm_r5_defconfig and config fragment as am62xsip_sk_r5.config.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>
---
v4:
  - Add comment description for UBOOT_CONFIG_FRAGMENTS
v3:
  - s/UBOOT_CONFIG_FRAGMENT/UBOOT_CONFIG_FRAGMENTS
  - Update commit message
v2:
  - Split a single patch into 2 patches 

 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 16 ++++++++++++++++
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 13 +++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62xxsip-evm.conf

diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
new file mode 100644
index 00000000..b7513996
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -0,0 +1,16 @@
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
+
+# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build 
+# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc 
+# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
+UBOOT_CONFIG_FRAGMENTS = "am62xsip_sk_r5.config"
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


