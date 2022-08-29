Return-Path: <gadiyar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DBBECAAD5
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 16:38:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.391.1661791088974007378
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 09:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ihfpFuGH;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: gadiyar@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27TGc7wY100877;
	Mon, 29 Aug 2022 11:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661791087;
	bh=k6lwVyHYMQb7iEWipf2DZ0mqnz+NL6lcyar/sIbhxSo=;
	h=From:To:CC:Subject:Date;
	b=ihfpFuGHgU2bn2+PEF+EJijn4bv6og97AtH2pjUKNDRpWhUmbHrWt2rGB4UCAQFxr
	 +XSgTZ9dKSWT6VUQIkqIt8PYcawkLPf27Wz93PfqVYvR90Dnf/Y5WnEKRi0tSmDpVv
	 hb8+XHCJFASt/V5EVQaRExst1gX73BTAgbGWqCjg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27TGc7J4011458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Aug 2022 11:38:07 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 29
 Aug 2022 11:38:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 29 Aug 2022 11:38:06 -0500
Received: from uda0393673 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27TGc7B5007368;
	Mon, 29 Aug 2022 11:38:07 -0500
Received: from a0393673 by uda0393673 with local (Exim 4.95)
	(envelope-from <gadiyar@ti.com>)
	id 1oShm3-004S0L-1S;
	Mon, 29 Aug 2022 11:38:07 -0500
From: Anand Gadiyar <gadiyar@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Anand Gadiyar <gadiyar@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>
Subject: [PATCH v2] machine: add am62xx-lp-evm configuration
Date: Mon, 29 Aug 2022 11:38:05 -0500
Message-ID: <20220829163805.1060953-1-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Aug 2022 16:38:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14976

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

In v2: fixed filenames, changed *lp-skevm to *lp-evm everywhere
	and fixed the descriptions in the two new conf files
	Kernel and u-boot configs and DTB names have NOT been changed.

 conf/machine/am62xx-lp-evm-k3r5.conf           | 11 +++++++++++
 conf/machine/am62xx-lp-evm.conf                | 16 ++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb         |  1 +
 recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb |  2 +-
 recipes-kernel/linux/kernel-rdepends.inc       |  1 +
 recipes-security/optee/optee-os_%.bbappend     |  1 +
 6 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 conf/machine/am62xx-lp-evm-k3r5.conf
 create mode 100644 conf/machine/am62xx-lp-evm.conf

diff --git a/conf/machine/am62xx-lp-evm-k3r5.conf b/conf/machine/am62xx-lp-evm-k3r5.conf
new file mode 100644
index 00000000..ca4ced5a
--- /dev/null
+++ b/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62XX LP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx LP EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
diff --git a/conf/machine/am62xx-lp-evm.conf b/conf/machine/am62xx-lp-evm.conf
new file mode 100644
index 00000000..ef8e8692
--- /dev/null
+++ b/conf/machine/am62xx-lp-evm.conf
@@ -0,0 +1,16 @@
+#@TYPE: Machine
+#@NAME: AM62XX LP EVM
+#@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
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
index 18652dd4..4edd9b6e 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -34,6 +34,7 @@ SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
 SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
+SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
 
 SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
 
diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
index 642a8d3a..876036f2 100644
--- a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
+++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "am62xx-evm"
+COMPATIBLE_MACHINE = "am62xx-evm|am62xx-lp-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 143e6545..c181c893 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -50,4 +50,5 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cnm-wave-fw"
 
 # Add run-time dependency for TIFS Low Power Module stub
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-lp-evm = " tifs-lpm-stub"
 
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 5a25bd99..548628dd 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -7,6 +7,7 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
 EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
 EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y"
+EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 EXTRA_OEMAKE_append_j721s2-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 EXTRA_OEMAKE_append_j721s2-hs-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 
-- 
2.34.1


