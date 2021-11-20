Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3373.1637378776200126310
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 19:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C804940C8A
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfeqelt4uHxY for <meta-ti@lists.yoctoproject.org>;
	Sat, 20 Nov 2021 03:26:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B760840C56
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9C9BF1746E0
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 22:26:12 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH v2 22/26] j721e-sr1_1: Add j721e sr1.1 HS support
Date: Fri, 19 Nov 2021 22:26:07 -0500
Message-Id: <1637378771-24987-23-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637378771-24987-1-git-send-email-denis@denix.org>
References: <1637378771-24987-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

This patch adds support for J721e HS SR1.1
HS SR1.1 requires updated sysfw binary. Both SR1.0 and SR1.1 sysfw
binary will be generated. sysfw.itb will point to SR1.1

This patch requires J7 SR 1.1 support in K3 Image gen.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/j7-hs-evm-k3r5-sr1-1.conf  | 11 +++++++++++
 conf/machine/j7-hs-evm.conf             |  8 ++++++++
 conf/multiconfig/k3r5-sr1-1.conf        |  3 +++
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc |  2 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb  |  1 +
 5 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 conf/machine/j7-hs-evm-k3r5-sr1-1.conf
 create mode 100644 conf/multiconfig/k3r5-sr1-1.conf

diff --git a/conf/machine/j7-hs-evm-k3r5-sr1-1.conf b/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
new file mode 100644
index 0000000..73f5afd
--- /dev/null
+++ b/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J7 SR1.1 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J7 SR1.1 HS EVM (R5F core)
+
+# Booting SR1.1 requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/j7-hs-evm-k3r5.conf
+SOC_FAMILY:append = ":k3r5-sr1-1"
+
+SYSFW_SOC = "j721e_sr1_1"
+SYSFW_SYMLINK = "sysfw.itb"
diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
index 70e1475..ab0fa47 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -19,4 +19,12 @@ SPL_BINARYNAME = "tispl.bin"
 UBOOT_BINARY = "u-boot.img_HS"
 IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
 
+BBMULTICONFIG += "k3r5-sr1-1"
+
+# Use default IMAGE_BOOT_FILES_LEGACY files
+# Since default sysfw.itb on J7 is for SR1.1, add a version for SR1.0
+IMAGE_BOOT_FILES += "sysfw-j7-hs-evm.itb"
+do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
+
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/multiconfig/k3r5-sr1-1.conf b/conf/multiconfig/k3r5-sr1-1.conf
new file mode 100644
index 0000000..428f221
--- /dev/null
+++ b/conf/multiconfig/k3r5-sr1-1.conf
@@ -0,0 +1,3 @@
+require k3r5.conf
+
+MACHINE:append = "-sr1-1"
diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f6d5b8d..d224f35 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -23,7 +23,7 @@ SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "6baabef219aea0f667423f2cab2bc2d63a349488"
+K3_IMAGE_GEN_SRCREV ?= "489c767a153ff26e9230746e04dd4b1ad0809901"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index f70c3ae..59dd3ee 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -25,6 +25,7 @@ SYSFW_PREFIX = "ti-sci-firmware"
 SYSFW_PREFIX:j7-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX:j7200-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX:j7-hs-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX:j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
 SYSFW_PREFIX:j7200-hs-evm-k3r5 = "ti-fs-firmware"
 
 SYSFW_SUFFIX ?= "unknown"
-- 
2.7.4

