Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3299.1637290751604721766
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EC75340C47
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpxIIfThj5fi for <meta-ti@lists.yoctoproject.org>;
	Fri, 19 Nov 2021 02:59:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8C17640CA8
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7422A1746D9
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Nov 2021 21:59:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 18/20] conf: machine: Add j7200 hs platform
Date: Thu, 18 Nov 2021 21:58:59 -0500
Message-Id: <1637290741-8603-19-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637290741-8603-1-git-send-email-denis@denix.org>
References: <1637290741-8603-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Machine conf for J7200 HS platform.
Used am64xx hs and j721e hs as reference.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/j7200-hs-evm-k3r5.conf | 13 +++++++++++++
 conf/machine/j7200-hs-evm.conf      | 22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 conf/machine/j7200-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j7200-hs-evm.conf

diff --git a/conf/machine/j7200-hs-evm-k3r5.conf b/conf/machine/j7200-hs-evm-k3r5.conf
new file mode 100644
index 0000000..488f19e
--- /dev/null
+++ b/conf/machine/j7200-hs-evm-k3r5.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: J7200 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j7200"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+UBOOT_MACHINE = "j7200_hs_evm_r5_defconfig"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
new file mode 100644
index 0000000..c55be00
--- /dev/null
+++ b/conf/machine/j7200-hs-evm.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: J7200 HS EVM
+#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM
+
+require conf/machine/j7-evm.conf
+
+UBOOT_MACHINE = "j7200_hs_evm_a72_defconfig"
+
+UBOOT_ENTRYPOINT =       "0x80080000"
+UBOOT_LOADADDRESS =      "0x80080000"
+UBOOT_RD_LOADADDRESS =   "0x84000000"
+UBOOT_RD_ENTRYPOINT =    "0x84000000"
+UBOOT_DTB_LOADADDRESS =  "0x83000000"
+UBOOT_DTBO_LOADADDRESS = "0x83080000"
+UBOOT_DTBO_OFFSET =      "0x00010000"
+
+SPL_BINARY = "tispl.bin_HS"
+SPL_BINARYNAME = "tispl.bin"
+UBOOT_BINARY = "u-boot.img_HS"
+IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-- 
2.7.4

