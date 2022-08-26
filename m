Return-Path: <gadiyar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB296ECAAD7
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 18:56:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.40835.1661540205872867874
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 11:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=f+9KJOzk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: gadiyar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27QIuiD9112491;
	Fri, 26 Aug 2022 13:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661540204;
	bh=m3Whgh+BQGuYCKAxzvbuwr4Ai7DyQQEufo2jUjOKj9U=;
	h=From:To:CC:Subject:Date;
	b=f+9KJOzkvu0BNIHA4RG/+/8MXrtAaRoE5OsqfxCXohGkzdhRLpmciu7O1SyyAVT67
	 7KlIXHIiUU87DnBEzBMG07niTrMBkm/bsCRgF+ixZVtE2DYra8KTBFH9aIukF5/M8o
	 zTWuEOj6SNmG0l6vaqHBBF8rfi47T53F5oh+uV0E=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27QIuitG074941
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Aug 2022 13:56:44 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 26
 Aug 2022 13:56:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 26 Aug 2022 13:56:40 -0500
Received: from uda0393673 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27QIueUG018940;
	Fri, 26 Aug 2022 13:56:40 -0500
Received: from a0393673 by uda0393673 with local (Exim 4.95)
	(envelope-from <gadiyar@ti.com>)
	id 1oReVU-004K7Q-Aw;
	Fri, 26 Aug 2022 13:56:40 -0500
From: Anand Gadiyar <gadiyar@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Anand Gadiyar <gadiyar@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>
Subject: [dunfell][PATCH] machine: add am62xx-lp-skevm configuration
Date: Fri, 26 Aug 2022 13:56:38 -0500
Message-ID: <20220826185638.1030640-1-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Aug 2022 18:56:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14968

This platform is similar to the currently supported am62xx-evm, except
that we currently need new defconfigs for u-boot and new dtbs in the
filesystem.

Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
Cc: Hari Nagalla <hnagalla@ti.com>
Cc: Andrew Davis <afd@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>
---
For yocto purposes, this machine is nearly identical to the AM62x SK,
and we will have more similar machines in the future.

Mainly, we just need to add more dtbs in the filesystem and to build
u-boot/spl/tiboot3.bin with different defconfigs than the AM62x SK.

If there's a better way to add support for this, let me know. Now's a
better time than later.

 conf/machine/am62xx-lp-skevm-k3r5.conf         | 11 +++++++++++
 conf/machine/am62xx-lp-skevm.conf              | 16 ++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb         |  1 +
 recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb |  2 +-
 recipes-kernel/linux/kernel-rdepends.inc       |  1 +
 recipes-security/optee/optee-os_%.bbappend     |  1 +
 6 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 conf/machine/am62xx-lp-skevm-k3r5.conf
 create mode 100644 conf/machine/am62xx-lp-skevm.conf

diff --git a/conf/machine/am62xx-lp-skevm-k3r5.conf b/conf/machine/am62xx-lp-skevm-k3r5.conf
new file mode 100644
index 00000000..8e3b04d0
--- /dev/null
+++ b/conf/machine/am62xx-lp-skevm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62XX EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
diff --git a/conf/machine/am62xx-lp-skevm.conf b/conf/machine/am62xx-lp-skevm.conf
new file mode 100644
index 00000000..1bed1ff0
--- /dev/null
+++ b/conf/machine/am62xx-lp-skevm.conf
@@ -0,0 +1,16 @@
+#@TYPE: Machine
+#@NAME: AM62XX EVM
+#@DESCRIPTION: Machine configuration for the TI AM62XX EVM
+
+require conf/machine/include/am62xx.inc
+
+MACHINE_FEATURES += "gpu"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-am62x-lp-sk.dtb \
+    ti/k3-am625-skeleton.dtb \
+    ti/k3-am625-sk-lpmdemo.dtb \
+    ti/k3-am625-sk-csi2-ov5640.dtbo \
+"
+
+UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 18652dd4..6ee6b09a 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -34,6 +34,7 @@ SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
 SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
+SYSFW_PREFIX_am62xx-lp-skevm-k3r5 = "fs"
 
 SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
 
diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
index 642a8d3a..cfd6e767 100644
--- a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
+++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "am62xx-evm"
+COMPATIBLE_MACHINE = "am62xx-evm|am62xx-lp-skevm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 143e6545..f78afaa0 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -50,4 +50,5 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cnm-wave-fw"
 
 # Add run-time dependency for TIFS Low Power Module stub
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-lp-skevm = " tifs-lpm-stub"
 
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 5a25bd99..196ef71e 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -7,6 +7,7 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
 EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
 EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y"
+EXTRA_OEMAKE_append_am62xx-lp-skevm = " CFG_WITH_SOFTWARE_PRNG=y"
 EXTRA_OEMAKE_append_j721s2-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 EXTRA_OEMAKE_append_j721s2-hs-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 
-- 
2.34.1


