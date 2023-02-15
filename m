Return-Path: <sabiya.d@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B832FC636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 09:26:45 +0000 (UTC)
Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web11.11305.1676453197024836113
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 01:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=MoN6Jjo1;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sabiya.d@mistralsolutions.com)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197]) by mx-outbound21-203.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 15 Feb 2023 09:26:32 +0000
Received: by mail-pf1-f197.google.com with SMTP id t13-20020a62d14d000000b005a89856900eso5881137pfl.14
        for <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 01:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWAE7Ly/ub7SXKvY8DJtnTcYE56F7mSce6MBy0gjF8g=;
        b=MoN6Jjo10F9r3MQp2+M/dlLF3WVFoElWuNZIV2oM0tTKKfWaYD+Ue8LEQ6b1OuYtI3
         Z2aG2BsR5gwwjEAZz0ypbDj0WwYJ06HzXkCD711CsqbL1sY68/M59JfTvo2BhMhOeBZZ
         IXvtkXWcMj3PJMDfbkhjzm7odlvlvO4QS4u4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWAE7Ly/ub7SXKvY8DJtnTcYE56F7mSce6MBy0gjF8g=;
        b=zKEan4wypEv56ganfcC/M+Cb+V6Z9QMZZVYcZtmMcyn0XKg2DajC7ttTBOkqc6LCcZ
         FcCZI/x8xAabpYiczICevlCvNZsGH0KDJUvm0Uzn1daSjXsnpkxoT7vvl5QD2AtQ1/Jl
         d/3jZcg5eKC0GOOQkNtHbYe0TaQJAlVG4o6jg6L7kjliH6CrcZQN3ikhzHPLiZ5md0tv
         o8aHd0+csvtGrakmNb+3/ZjhNg4l0taqsD088bbkw+IonBWEFfgqMy9qzmHtC+yr2Q2W
         TtlqW1A2PuLrzoHEN+8m6UHsWDMWK6ri4Z5675FOBxOXsF43yJaJXXrk4yOrNv7q5bUR
         hLTg==
X-Gm-Message-State: AO0yUKWR28aX5NK5Ul+A7b/lKLYLcTGV2c9JaE5+wOfaTQzqClDekR5u
	XynelyQdwzlAtxeuvTW/bjkRHFQVHC2Oqi3FCcZe5UGaUuGbxho7RfR6+3mQP6bVI1YBw05tcGX
	z9XOkTQ/j/TITpONgwCDTX2mcRH/naWDJRsUW/HaVROwIWRJgFOr4MDU81py9Ku8=
X-Received: by 2002:a17:90b:1d87:b0:229:4dcd:ff61 with SMTP id pf7-20020a17090b1d8700b002294dcdff61mr2018064pjb.28.1676453187605;
        Wed, 15 Feb 2023 01:26:27 -0800 (PST)
X-Google-Smtp-Source: AK7set/tl4/hNlqwYjujShd9epy9q7aes4Kk73u+rJ3TumQd4ja+kYEYCHVtNpAteDfPWU+OXcO3Bg==
X-Received: by 2002:a17:90b:1d87:b0:229:4dcd:ff61 with SMTP id pf7-20020a17090b1d8700b002294dcdff61mr2018043pjb.28.1676453187216;
        Wed, 15 Feb 2023 01:26:27 -0800 (PST)
Received: from localhost.localdomain ([106.51.69.35])
        by smtp.gmail.com with ESMTPSA id ez11-20020a17090ae14b00b0022bfcf5d297sm1036409pjb.9.2023.02.15.01.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 01:26:26 -0800 (PST)
From: sabiya.d@mistralsolutions.com
X-Google-Original-From: sabiya.d@ti.com
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Dasnavis <sabiya.d@ti.com>
Subject: [dunfell] conf: machine: j784s4-evm: Add support for J784S4 HS-FS
Date: Wed, 15 Feb 2023 14:56:18 +0530
Message-Id: <20230215092618.420821-1-sabiya.d@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1676453190-305579-5435-5196-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.210.197
X-BESS-Outbound-Spam-Score: 0.40
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246164 [from 
	cloudscan21-167.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.40 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_SC0_SA085b, BSF_BESS_OUTBOUND, NO_REAL_NAME
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 09:26:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15849

From: Dasnavis <sabiya.d@ti.com>

Add the basic J784S4 HS-FS configuration.
* Add configurations to support both HS-FS and GP keeping GP as default.
* Add ti-sci-firmware overrides for HS-FS.
* Remove evm conf file inclusion in hs-evm conf.
* Add j784s4 hs-evm specific config to hs-evm conf.

Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
---
Hi All,

Below is the RFC patch link for this patch
https://serenity.dal.design.ti.com/patchwork/project/meta-ti/patch/20230214154939.340754-1-sabiya.d@ti.com/

Re-submitting the patch removing RFC tag, with the build error fixed
and all the review comments addressed.

 conf/machine/j784s4-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
 conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf | 16 ++++++++++++++++
 conf/machine/j784s4-evm.conf                | 13 ++++++++++---
 conf/machine/j784s4-hs-evm.conf             | 19 ++++++++++++++++++-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
 5 files changed, 66 insertions(+), 5 deletions(-)
 create mode 100644 conf/machine/j784s4-evm-k3r5-gp.conf
 create mode 100644 conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf

diff --git a/conf/machine/j784s4-evm-k3r5-gp.conf b/conf/machine/j784s4-evm-k3r5-gp.conf
new file mode 100644
index 00000000..5fd47b70
--- /dev/null
+++ b/conf/machine/j784s4-evm-k3r5-gp.conf
@@ -0,0 +1,20 @@
+#@TYPE: Machine
+#@NAME: J784S4 GP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J784S4 GP EVM (R5F core)
+
+# Booting GP requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY_append = ":k3r5-gp"
+
+SYSFW_SOC = "j784s4"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+SYSFW_TIBOOT3_SYMLINK = "tiboot3.bin"
+
+UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
+
+SPL_BINARY = ""
+UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf b/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
new file mode 100644
index 00000000..a81063bc
--- /dev/null
+++ b/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
@@ -0,0 +1,16 @@
+#@TYPE: Machine
+#@NAME: J784S4 HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J784S4 HS-FS EVM (R5F core)
+
+# Booting HS-FS requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY_append = ":k3r5-sr1-hs-fs"
+
+SYSFW_SOC = "j784s4"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+SYSFW_TIBOOT3_SYMLINK = ""
+SYSFW_SYMLINK = ""
+
+UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
index e892f597..c4548520 100644
--- a/conf/machine/j784s4-evm.conf
+++ b/conf/machine/j784s4-evm.conf
@@ -39,8 +39,15 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+# Default tiboot3.bin on J784S4 is for GP
+BBMULTICONFIG = "k3r5-gp"
+do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
 
-TFA_BOARD = "j784s4"
+# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-FS
+BBMULTICONFIG += "k3r5-sr1-hs-fs"
+IMAGE_BOOT_FILES += " tiboot3-j784s4-hs-fs-evm.bin"
+do_image_wic[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
 
+TFA_BOARD = "j784s4"
diff --git a/conf/machine/j784s4-hs-evm.conf b/conf/machine/j784s4-hs-evm.conf
index 62357d62..91ef3d6f 100644
--- a/conf/machine/j784s4-hs-evm.conf
+++ b/conf/machine/j784s4-hs-evm.conf
@@ -2,10 +2,27 @@
 #@NAME: J784S4 HS EVM
 #@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
 
-require conf/machine/j784s4-evm.conf
+require conf/machine/include/j7.inc
+
+MACHINE_FEATURES += "gpu"
+
+SERIAL_CONSOLES = "115200;ttyS2"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+TFA_K3_USART = "0x8"
+OPTEEMACHINE = "k3-j784s4"
+OPTEE_K3_USART = "0x8"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-j784s4-evm.dtb \
+"
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
+do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+
+TFA_BOARD = "j784s4"
+
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index e3ffef37..f7dfcf1e 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -36,7 +36,8 @@ SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_j721s2-evm-k3r5-gp = "fs"
 SYSFW_PREFIX_j721s2-evm-k3r5-sr1-hs-fs = "fs"
 SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
-SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
+SYSFW_PREFIX_j784s4-evm-k3r5-gp = "fs"
+SYSFW_PREFIX_j784s4-evm-k3r5-sr1-hs-fs = "fs"
 SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-evm-k3r5-gp = "fs"
 SYSFW_PREFIX_am62xx-evm-k3r5-hs-se = "fs"
-- 
2.36.1.windows.1


