Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web12.4796.1617866125269152646
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Apr 2021 00:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=Dly+8Ilj;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200]) by mx-outbound9-96.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 08 Apr 2021 07:15:22 +0000
Received: by mail-pf1-f200.google.com with SMTP id b21so800623pfo.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 08 Apr 2021 00:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/NYF9UL7gOtrib13chTDMGJvPULfQra2Mw3WkPe0RPY=;
        b=Dly+8IljL+p73GIrj1FX+/Ir/fil9I8eagG1EFoDV5fafBDR2cwm8cyiOew/Vic3bt
         B8upJKBczgEzwPSIM3mJu6eZSb4b2twU7RHILXD9sYibp2W5QerODwjHOp9DcL95o1gz
         05xan2iYbTA/LguOXejarB39DmDl7z62KZCYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/NYF9UL7gOtrib13chTDMGJvPULfQra2Mw3WkPe0RPY=;
        b=mUxu3/EyprU3bo+A4CSbfN6TAWRyRBQnudbM5WcQEUpSGF2wMcNKSL2aAYuXv8OGv8
         8AeUW4kcGD6J76/eY+t9ciPx7LfKy3vi50/kFEHkL9Ix6uydrRe1tRiuk2J2cLSHZ6vx
         WBpCUf7u30Py0tRP5VfS/Jwm8brJ/IquDGP0Wp681b4wNhOxbmuJ97Ww9Q79sIKTOF8n
         sG+ayUfEfrXbT9Lqm9lwA4E/bYJDeVWiMx3lUONvKq26oucZYdPdIZBywO5sE+kJhIJP
         1T1stBmVYvaLVHg1RkgJW/85MEkbiaGsNykUeydKvazaRSbum6tpi378qtnZncfMWgX2
         8DDQ==
X-Gm-Message-State: AOAM53395DW7pmZt/g0slm2TyPBGrOdRugQ07TAAxI+xNAPRXBF69qHl
	dKNc9CQBu4+yk07UHHSDCT3JtAgpiIJFXjeZCXTqpyqt6HR95R2BelCaypByqZAFR8imdmfK39U
	ovLP2pzTiviTclznucGfEJbDRKLnmyz8Fvz6/qGF7J8ycVag9fmbgP5UnV5AorjQ=
X-Received: by 2002:a62:db43:0:b029:244:3c4c:6b90 with SMTP id f64-20020a62db430000b02902443c4c6b90mr2021010pfg.59.1617866121076;
        Thu, 08 Apr 2021 00:15:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+pTqJitLco4tK988OR+pjS7q3+hdQzDq/FRX4vAGC5/5YAdDWNaTbyfKAHDh2VivV+PPfmw==
X-Received: by 2002:a62:db43:0:b029:244:3c4c:6b90 with SMTP id f64-20020a62db430000b02902443c4c6b90mr2020990pfg.59.1617866120753;
        Thu, 08 Apr 2021 00:15:20 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP000568.mistral.in ([106.51.69.35])
        by smtp.gmail.com with ESMTPSA id o9sm8640918pfh.217.2021.04.08.00.15.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Apr 2021 00:15:20 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja M <sinthu.raja@mistral.in>
To: meta-ti@lists.yoctoproject.org
Cc: Sinthu Raja <x0257345@ti.com>
Subject: [dunfell/master PATCH 1/3] Remove AM64xx-SK entries
Date: Thu,  8 Apr 2021 12:45:14 +0530
Message-Id: <20210408071514.76344-1-sinthu.raja@mistral.in>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1617866121-302400-5589-2654-1
X-BESS-VER: 2019.1_20210407.1623
X-BESS-Apparent-Source-IP: 209.85.210.200
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231405 [from 
	cloudscan22-19.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MAILTO_TO_SPAM_ADDR    META: Includes a link to a likely spammer email 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=MAILTO_TO_SPAM_ADDR, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <x0257345@ti.com>

 Remove the AM64x SK conf files
 Remove the AM64xx-SK entries from u-boot-ti and ti-sci-fw recipes

Signed-off-by: Sinthu Raja <x0257345@ti.com>
---
 conf/machine/am64xx-sk-k3r5.conf       | 14 --------------
 conf/machine/am64xx-sk.conf            | 19 -------------------
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 16 ----------------
 recipes-bsp/u-boot/u-boot-ti.inc       |  7 +------
 4 files changed, 1 insertion(+), 55 deletions(-)
 delete mode 100644 conf/machine/am64xx-sk-k3r5.conf
 delete mode 100644 conf/machine/am64xx-sk.conf

diff --git a/conf/machine/am64xx-sk-k3r5.conf b/conf/machine/am64xx-sk-k3r5.conf
deleted file mode 100644
index 1256db722..000000000
--- a/conf/machine/am64xx-sk-k3r5.conf
+++ /dev/null
@@ -1,14 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM64xx SK (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM64xx SK (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "am64x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-
-UBOOT_MACHINE = "am64x_sk_r5_defconfig"
-UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am64xx-sk.conf b/conf/machine/am64xx-sk.conf
deleted file mode 100644
index 4cad8adcf..000000000
--- a/conf/machine/am64xx-sk.conf
+++ /dev/null
@@ -1,19 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM64xx SK
-#@DESCRIPTION: Machine configuration for the TI AM64xx SK board
-
-require conf/machine/include/am64xx.inc
-
-IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
-
-UBOOT_MACHINE = "am64x_sk_a53_defconfig"
-
-do_image_wic[depends] += "trusted-firmware-a:do_deploy"
-do_image_tar[depends] += "trusted-firmware-a:do_deploy"
-
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-
-KERNEL_DEVICETREE = " \
-    ti/k3-am642-sk.dtb \
-"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index e7580a57a..d1d10a608 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -3,7 +3,6 @@ require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_am64xx-sk-k3r5 = " virtual/bootloader"
 
 CLEANBROKEN = "1"
 PR = "r1"
@@ -54,7 +53,6 @@ EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}
 
 EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_am64xx-sk-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
 do_compile() {
 	cd ${WORKDIR}/imggen/
@@ -115,18 +113,4 @@ do_deploy_am64xx-evm-k3r5() {
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
 }
 
-do_install_am64xx-sk-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy_am64xx-sk-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-}
-
 addtask deploy before do_build after do_compile
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index e5f92f4bd..ca0414c06 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -66,7 +66,7 @@ SPL_UART_BINARY_k3r5 = ""
 SPL_UART_BINARY_lego-ev3 = ""
 SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
-SPL_UART_BINARY_am64xx-sk-k3r5 = "u-boot-spl.bin"
+
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
@@ -402,9 +402,4 @@ do_deploy_append_am64xx-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
 
-do_deploy_append_am64xx-sk-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
-}
-
 TOOLCHAIN = "gcc"
-- 
2.17.0

