Return-Path: <sabiya.d@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501BEC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 15:49:55 +0000 (UTC)
Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web11.10529.1676389789662014637
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 07:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=N9yqd2eJ;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sabiya.d@mistralsolutions.com)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198]) by mx-outbound21-231.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 14 Feb 2023 15:49:46 +0000
Received: by mail-pf1-f198.google.com with SMTP id y28-20020a056a001c9c00b005a8c5cd5ae9so2609863pfw.22
        for <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 07:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2i2WzorueDBP9FRR5BP96Pxr6NNiqkinLrlBDa/9cw=;
        b=N9yqd2eJx2tt0Rim1oqjuOIah8OcwqXPw9n40EnkE9YgC5wkBr0Mz1OuDF5OPmCr6s
         971i08X4hacX6qY41At/ggBdmWrOYJA7wA7ME5VpIF8fdR36zFPyYebkfh110VSYnB6P
         QPXyBf0Wiw2+xapI8QlZkCIPC+Sk6jyXxKeO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2i2WzorueDBP9FRR5BP96Pxr6NNiqkinLrlBDa/9cw=;
        b=QcbEPZI3Ebd/yPCA4kHUS25ucmctIudpghrL416EfKVuXfcHZlPozzvvO2WlSt1uQ8
         pAwKc19VwUOA7M7CveE6n9gnbAO/3gjpZWcYPtWV9VfUldBHWn9dKCzN/xoW+XWutYFE
         JImrPmNdbxpWXKEOoWFTWnBq8YFKftMtDvB9w047IzaoLvwNR6pnzhpjuqwcbermEC2Q
         wbNsWPFGm/zAZsgP2dBdJiiNWTbcg3zMccTWLvA5wAw8eHqtKC66QGtlXotZ6XlLyDs1
         gOIZbxLn4xs5fHrLxPr+XOPXeg3IEjmKoI8nGW7OXZWgUoZEzy396YAq5jCnZky4xRjv
         oujg==
X-Gm-Message-State: AO0yUKX4K1n+e17ZyDXvYCTsyXyR58PCvVTJqgqkiDfyoDOoyoOL0pj0
	+/lzS9/2y1wsAHTKh84WfT4znqtRkLfpE7spvhYHQyBxOHkwP2fWahhh65PhTNTY1wR7HYoGktv
	hdDh0zywCMkadFRTnd7I6vOFG3S1gasApXaXaQCVPLqmCxtBGKV6dgnT+LgLu6n6YrXZQ
X-Received: by 2002:a17:90b:4a08:b0:233:d870:f4c7 with SMTP id kk8-20020a17090b4a0800b00233d870f4c7mr3006204pjb.21.1676389784996;
        Tue, 14 Feb 2023 07:49:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+wwA4YkvypziSOXZPiILzdpgia2k13qVcX5Pqdrl2gAI4U0lm6jgNne+FJTuucaYcou9kB5Q==
X-Received: by 2002:a17:90b:4a08:b0:233:d870:f4c7 with SMTP id kk8-20020a17090b4a0800b00233d870f4c7mr3006180pjb.21.1676389784641;
        Tue, 14 Feb 2023 07:49:44 -0800 (PST)
Received: from localhost.localdomain ([106.51.69.35])
        by smtp.gmail.com with ESMTPSA id ei3-20020a17090ae54300b0020dc318a43esm5769239pjb.25.2023.02.14.07.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 07:49:44 -0800 (PST)
From: sabiya.d@mistralsolutions.com
X-Google-Original-From: sabiya.d@ti.com
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Dasnavis <sabiya.d@ti.com>
Subject: [dunfell,RFC PATCH-V2] conf: machine: j784s4-evm: Add support for J784S4 HS-FS
Date: Tue, 14 Feb 2023 21:19:39 +0530
Message-Id: <20230214154939.340754-1-sabiya.d@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1676389786-305607-5388-17238-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.210.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246146 [from 
	cloudscan20-183.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO, NO_REAL_NAME
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 15:49:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15840

From: Dasnavis <sabiya.d@ti.com>

Add the basic J784S4 HS-FS configuration.
* Add configurations to support both HS-FS and GP keeping GP as default.
* Add ti-sci-firmware overrides for HS-FS.
* Remove evm conf file inclusion in hs-evm conf.
* Add j784s4 hs-evm specific config to hs-evm conf.

Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
Signed-off-by: Dasnavis <sabiya.d@ti.com>
---
 conf/machine/j784s4-evm-k3r5-gp.conf        | 21 +++++++++++++++++++++
 conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
 conf/machine/j784s4-evm-k3r5.conf           |  1 +
 conf/machine/j784s4-evm.conf                | 13 ++++++++++---
 conf/machine/j784s4-hs-evm-k3r5.conf        |  1 +
 conf/machine/j784s4-hs-evm.conf             | 19 ++++++++++++++++++-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
 7 files changed, 68 insertions(+), 5 deletions(-)
 create mode 100644 conf/machine/j784s4-evm-k3r5-gp.conf
 create mode 100644 conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf

diff --git a/conf/machine/j784s4-evm-k3r5-gp.conf b/conf/machine/j784s4-evm-k3r5-gp.conf
new file mode 100644
index 00000000..b8693655
--- /dev/null
+++ b/conf/machine/j784s4-evm-k3r5-gp.conf
@@ -0,0 +1,21 @@
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
+SYSFW_SYMLINK = ""
+
+UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
+
+SPL_BINARY = ""
+UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf b/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
new file mode 100644
index 00000000..8c77c910
--- /dev/null
+++ b/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
@@ -0,0 +1,15 @@
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
+
+UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
diff --git a/conf/machine/j784s4-evm-k3r5.conf b/conf/machine/j784s4-evm-k3r5.conf
index 04feebc6..3f010797 100644
--- a/conf/machine/j784s4-evm-k3r5.conf
+++ b/conf/machine/j784s4-evm-k3r5.conf
@@ -7,5 +7,6 @@ require conf/machine/include/k3r5.inc
 SYSFW_SOC = "j784s4"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
+SYSFW_SYMLINK = ""
 
 UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
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
diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf b/conf/machine/j784s4-hs-evm-k3r5.conf
index 80a228a0..0f5e69e4 100644
--- a/conf/machine/j784s4-hs-evm-k3r5.conf
+++ b/conf/machine/j784s4-hs-evm-k3r5.conf
@@ -7,5 +7,6 @@ require conf/machine/include/k3r5.inc
 SYSFW_SOC = "j784s4"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
+SYSFW_SYMLINK = ""
 
 UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
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
index c5fff3f7..cafb24e6 100644
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


