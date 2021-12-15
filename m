Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1455.1639602666564997859
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 13:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3F79340B13
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pvo1PBKlAb4W for <meta-ti@lists.yoctoproject.org>;
	Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1DAA440C5D
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id ADA1917471F
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 16:11:03 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 07/11] ti-sci-fw: Fix for k3-image-gen issue for combined boot images
Date: Wed, 15 Dec 2021 16:10:59 -0500
Message-Id: <1639602663-32787-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639602663-32787-1-git-send-email-denis@denix.org>
References: <1639602663-32787-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

This is temporary fix for combined boot images for KIG in meta-ti till
the patch is integrated.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...ip-signing-of-binaries-for-combined-boot-.patch | 64 ++++++++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb             |  5 ++
 2 files changed, 69 insertions(+)
 create mode 100644 recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch

diff --git a/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch b/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
new file mode 100644
index 0000000..196f3d3
--- /dev/null
+++ b/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
@@ -0,0 +1,64 @@
+From 2efc79702a47f9cbbeecbb2f604577f1ec8c95ba Mon Sep 17 00:00:00 2001
+From: Yogesh Siraswar <yogeshs@ti.com>
+Date: Wed, 8 Dec 2021 17:50:19 -0600
+Subject: [KIG PATCH] Makefile: Skip signing of binaries for combined boot hs
+ images
+
+Combined sysfw binaries used in tiboot.bin do not require signed images.
+This fixes issues with AM64x HS and J7200 HS boot images
+
+Upstream-Status: Submitted
+Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
+---
+ Makefile           | 8 +++++++-
+ soc/am64x/Makefile | 1 +
+ soc/j7200/Makefile | 1 +
+ 3 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 47b3b20..ab465df 100644
+--- a/Makefile
++++ b/Makefile
+@@ -215,8 +215,14 @@ $(soc_objroot)/%.o: %.c
+ 	$(CROSS_COMPILE)gcc $(CFLAGS) -c -o $@-pre-validated $<
+ 	python3 ./scripts/sysfw_boardcfg_validator.py -b $@-pre-validated -i -o $@ -s $(SOC) -l $@.log
+ 
+-# On HS board configuration binaries must be signed
++# On HS board configuration binaries must be signed unless it is combined boot image
+ ifdef HS
++ifndef COMBINED_BOOT_IMAGE
++SIGN_BINARY=1
++endif
++endif
++
++ifdef SIGN_BINARY
+ %.bin.unsigned: %.o
+ 	$(CROSS_COMPILE)objcopy -S -O binary $< $@
+ %.bin: %.bin.unsigned
+diff --git a/soc/am64x/Makefile b/soc/am64x/Makefile
+index bfbe3e5..33ebbd0 100644
+--- a/soc/am64x/Makefile
++++ b/soc/am64x/Makefile
+@@ -31,6 +31,7 @@
+ #
+ 
+ SBL_LOADADDDR ?= 0x70000000
++COMBINED_BOOT_IMAGE = 1
+ COMBINED_SYSFW_BRDCFG_LOADADDR ?= 0x7b000
+ LOADADDR  ?= 0x44000
+ SCIFS = sci
+diff --git a/soc/j7200/Makefile b/soc/j7200/Makefile
+index 3b754f7..0baef51 100644
+--- a/soc/j7200/Makefile
++++ b/soc/j7200/Makefile
+@@ -31,6 +31,7 @@
+ #
+ 
+ SBL_LOADADDDR ?= 0x41c00000
++COMBINED_BOOT_IMAGE = 1
+ COMBINED_TIFS_BRDCFG_LOADADDR ?= 0x7f000
+ COMBINED_DM_BRDCFG_LOADADDR ?= 0x41c80000
+ LOADADDR ?= 0x40000
+-- 
+2.17.1
+
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 59dd3ee..2dad0fe 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -47,6 +47,11 @@ LD[unexport] = "1"
 
 do_configure[noexec] = "1"
 
+SRC_URI:append:j7200-hs-evm-k3r5 = " \
+	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;patchdir=../imggen"
+SRC_URI:append:am64xx-hs-evm-k3r5 = " \
+	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;patchdir=../imggen"
+
 EXTRA_OEMAKE = "\
     CROSS_COMPILE=${TARGET_PREFIX} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL='' \
     SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
-- 
2.7.4

