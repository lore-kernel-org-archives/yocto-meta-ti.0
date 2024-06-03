Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1F6C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 12:56:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.82666.1717419377253221539
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Jun 2024 05:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cMS/s4LV;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 453CuGoc001019
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Jun 2024 07:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717419376;
	bh=r5+MCIDO+syEtYZ7LbFYOdvKrs48WlLTLx6RpLmioks=;
	h=From:To:CC:Subject:Date;
	b=cMS/s4LVjsHRSpiuuzzitMcRbowoP1SYLFICJLl8F+vI389nu9JDsnj6imJb2mIGj
	 6pjWGQkyn/wUGfO3cEEKWdKgM3HcShLkxXS5IT6GffOxiVpzGOGtc4ndKhIlMN3rVI
	 UmpwhFwonVftHNRW+ffA+hyBUkGzFlkapUOX6JBU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 453CuG64052165
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Jun 2024 07:56:16 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 07:56:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 07:56:16 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 453CuE8o025021;
	Mon, 3 Jun 2024 07:56:14 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <m-chawdhry@ti.com>, <u-kumar1@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: add AM68-SK machine configuration
Date: Mon, 3 Jun 2024 18:26:05 +0530
Message-ID: <20240603125605.3796069-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Jun 2024 12:56:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17690

As of commit [1] there will be a separate defconfig to build u-boot
for j721s2-evm and am68-sk.

Hence, introduce new yocto machine configs for am68-sk. This is done
through a new am68.inc file as the am68-sk platform does not support GP.
So j721s2-evm.inc is copied to am68.inc and updated accordingly.

[1]: https://source.denx.de/u-boot/u-boot/-/commit/a96be9b8c05ea835d27f7c9bae03279b8bd5dcf2

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/am68-sk-k3r5.conf | 11 +++++++++++
 meta-ti-bsp/conf/machine/am68-sk.conf      | 20 ++++++++++++++++++++
 meta-ti-bsp/conf/machine/include/am68.inc  | 19 +++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/am68-sk-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am68-sk.conf
 create mode 100644 meta-ti-bsp/conf/machine/include/am68.inc

diff --git a/meta-ti-bsp/conf/machine/am68-sk-k3r5.conf b/meta-ti-bsp/conf/machine/am68-sk-k3r5.conf
new file mode 100644
index 00000000..f8ce3688
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am68-sk-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM68 SK (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM68 SK (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j721s2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "am68_sk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am68-sk.conf b/meta-ti-bsp/conf/machine/am68-sk.conf
new file mode 100644
index 00000000..00b81b77
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am68-sk.conf
@@ -0,0 +1,20 @@
+#@TYPE: Machine
+#@NAME: AM68 SK
+#@DESCRIPTION: Machine configuration for the TI AM68 SK
+
+require conf/machine/include/am68.inc
+
+TFA_K3_USART = "0x8"
+OPTEE_K3_USART = "0x8"
+
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-am68-sk \
+    ti/k3-fpdlink \
+    ti/k3-v3link \
+"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-am68-sk-base-board.dtb \
+"
+
+UBOOT_MACHINE = "am68_sk_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am68.inc b/meta-ti-bsp/conf/machine/include/am68.inc
new file mode 100644
index 00000000..cb3d1026
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/am68.inc
@@ -0,0 +1,19 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY:append = ":j721s2"
+
+MACHINE_FEATURES += "screen gpu"
+
+require conf/machine/include/mesa-pvr.inc
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
+
+# Default tiboot3.bin on AM68 is for SR1.0 HS-FS
+IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
+
+# Since default tiboot3.bin on AM68 is for HS-FS, add a version for SR1.0 HS-SE
+IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-evm.bin"
+
+TFA_BOARD = "generic"
+
+OPTEEMACHINE = "k3-j784s4"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw"
-- 
2.34.1


