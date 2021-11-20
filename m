Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3409.1637378776080062199
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 19:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BAD1E40C60
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Voo67q7idPvm for <meta-ti@lists.yoctoproject.org>;
	Sat, 20 Nov 2021 03:26:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4F59240CA5
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3857E1746D8
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 22:26:12 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH v2 13/26] conf: machine: add new am64x hs platform
Date: Fri, 19 Nov 2021 22:25:58 -0500
Message-Id: <1637378771-24987-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637378771-24987-1-git-send-email-denis@denix.org>
References: <1637378771-24987-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Add new am64x hs platform. This requires two files to be created.
Used am65x and j7  hs platform for reference.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/am64xx-hs-evm-k3r5.conf | 14 ++++++++++++++
 conf/machine/am64xx-hs-evm.conf      | 22 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 conf/machine/am64xx-hs-evm-k3r5.conf
 create mode 100644 conf/machine/am64xx-hs-evm.conf

diff --git a/conf/machine/am64xx-hs-evm-k3r5.conf b/conf/machine/am64xx-hs-evm-k3r5.conf
new file mode 100644
index 0000000..d12c030
--- /dev/null
+++ b/conf/machine/am64xx-hs-evm-k3r5.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM64xx HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM64xx HS EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am64x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+SYSFW_SYMLINK = ""
+
+UBOOT_MACHINE = "am64x_hs_evm_r5_defconfig"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
new file mode 100644
index 0000000..44e8146
--- /dev/null
+++ b/conf/machine/am64xx-hs-evm.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: AM64xx HS EVM
+#@DESCRIPTION: Machine configuration for the TI AM64xx HS EVM
+
+require conf/machine/include/am64xx.inc
+
+UBOOT_MACHINE = "am64x_hs_evm_a53_defconfig"
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

