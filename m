Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D391CC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 10:57:03 +0000 (UTC)
Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web10.3879.1676372220831807654
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 02:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=UvWO3InC;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198]) by mx-outbound19-144.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 14 Feb 2023 10:56:54 +0000
Received: by mail-pg1-f198.google.com with SMTP id c15-20020a63ea0f000000b004fb3ed8a500so5833264pgi.10
        for <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 02:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4ixe23Sv4x5bAZLGJdeBYV2gj9LbWClO+yKh5v7sJA=;
        b=UvWO3InCJA2mUkio2TqPuKVSLdzjYQaoWZS23TpjB3FKgV8YetiB8PPg7pqMsrDU3w
         oXqrimyHLmOO8YoQSx6VhEZNSacassCiVGfzbg4wagrOuDFbX1+/ELAEODw6BmaPmwSv
         INOxVLP+R9rRJwVAozT/Qi98r2mUk4jETNhZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4ixe23Sv4x5bAZLGJdeBYV2gj9LbWClO+yKh5v7sJA=;
        b=v7pE0uc2drdknGanCHvCZb+ySV/Wgd/drZ8tdU1E8tFd6MAUcA2pZDsg1uIIVnMaM5
         ChDBPBg/QcTMrV/fm/4qkXuO9Qudl5ay85atzd5LldyO1+ZM2KVI46O+m568CbdidVFg
         3kxrHjte/GvAhUq1cQhMPNVN/ppppEZ0jZOMfIazy7ReJjNJjuKIZrEWAfdKjKMGWS9B
         MGY/RMRwTpkVf+zoffFg4GNMkOtwOJA3Da7ibue1ghf5yey5CSEsvokETLh/X+m3dkSN
         sU0CYnigHoYBuBIFHEhkJ/Wp8aBuJ0ruK+QThqEekdkKexdtxECMaqP6UpKI/DTPkrwl
         nkrA==
X-Gm-Message-State: AO0yUKWuaNlj2mAHMyZwwKFHDmeIO9gmoG1W7fWQe3veIU4TlihMpqCZ
	WWw8/mEbV81ybam19XHLrrUSmbH2Kixm4LJO/UvjurqFvi1+GJDyA5baa/f3WPjHbBQfXWUWN6t
	5QHVr/aEEufuOdzIh2mMvScVf9bGbcsD1gj4aybrdTn24PmfTesAGDV2b7Vl39bk=
X-Received: by 2002:a05:6a20:a5a2:b0:bf:58d1:ce8b with SMTP id bc34-20020a056a20a5a200b000bf58d1ce8bmr18723874pzb.10.1676372213402;
        Tue, 14 Feb 2023 02:56:53 -0800 (PST)
X-Google-Smtp-Source: AK7set8qPwUflP1sXm60tJFPiAOVZZYtn6ecqwqpN9yrYJzvLhD0me25dfyfUYdKBnLC86cReBiXtQ==
X-Received: by 2002:a05:6a20:a5a2:b0:bf:58d1:ce8b with SMTP id bc34-20020a056a20a5a200b000bf58d1ce8bmr18723850pzb.10.1676372212972;
        Tue, 14 Feb 2023 02:56:52 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id v5-20020a63b645000000b004e4ea77badcsm8674587pgt.80.2023.02.14.02.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 02:56:52 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>,
	Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][dunfell][PATCH V4] conf: machine: j721s2-evm: Add support for J721S2 HS-FS
Date: Tue, 14 Feb 2023 16:26:42 +0530
Message-Id: <20230214105642.16320-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1676372214-305008-5383-1998-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.215.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246142 [from 
	cloudscan20-183.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 10:57:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15833

From: Sinthu Raja <sinthu.raja@ti.com>

Add the basic J721S2 HS-FS configuration.
    - Add configurations to support both HS-FS and GP keeping GP
      as default.
    - Add ti-sci-firmware overrides for HS-FS.
    - Remove evm conf file inclusion in hs-evm conf.
    - Add j721s2 hs-evm specific config to hs-evm conf.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Change in V4:
============
- Remove evm conf file inclusion in hs-evm conf.
- Add j721s2 hs-evm specific config to hs-evm conf.

Change in V3:
============
Fix build issue.

Changes in V2:
=============
Address review comment:
- Keep GP as the default.

V1: https://lists.yoctoproject.org/g/meta-ti/message/15771
V2: https://lists.yoctoproject.org/g/meta-ti/message/15793
V3: https://lists.yoctoproject.org/g/meta-ti/message/15818 

 conf/machine/j721s2-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
 conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
 conf/machine/j721s2-evm.conf                | 12 ++++++++++--
 conf/machine/j721s2-hs-evm.conf             | 18 +++++++++++++++++-
 conf/multiconfig/k3r5-sr1-hs-fs.conf        |  3 +++
 conf/multiconfig/k3r5-sr1.conf              |  3 +++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
 7 files changed, 70 insertions(+), 4 deletions(-)
 create mode 100644 conf/machine/j721s2-evm-k3r5-gp.conf
 create mode 100644 conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
 create mode 100644 conf/multiconfig/k3r5-sr1-hs-fs.conf
 create mode 100644 conf/multiconfig/k3r5-sr1.conf

diff --git a/conf/machine/j721s2-evm-k3r5-gp.conf b/conf/machine/j721s2-evm-k3r5-gp.conf
new file mode 100644
index 00000000..06456ef7
--- /dev/null
+++ b/conf/machine/j721s2-evm-k3r5-gp.conf
@@ -0,0 +1,20 @@
+#@TYPE: Machine
+#@NAME: J721S2 GP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721S2 GP EVM (R5F core)
+
+# Booting GP requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY_append = ":k3r5-gp"
+
+SYSFW_SOC = "j721s2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+SYSFW_TIBOOT3_SYMLINK = "tiboot3.bin"
+
+UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
+
+SPL_BINARY = ""
+UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf b/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
new file mode 100644
index 00000000..786338a9
--- /dev/null
+++ b/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
@@ -0,0 +1,15 @@
+#@TYPE: Machine
+#@NAME: J721S2 HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721S2 HS-FS EVM (R5F core)
+
+# Booting HS-FS requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY_append = ":k3r5-sr1-hs-fs"
+
+SYSFW_SOC = "j721s2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+SYSFW_TIBOOT3_SYMLINK = ""
+
+UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index 7c120dcc..7d2597b5 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -40,5 +40,13 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+# Default tiboot3.bin on J721S2 is for GP
+BBMULTICONFIG = "k3r5-gp"
+do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
+BBMULTICONFIG += "k3r5-sr1-hs-fs"
+IMAGE_BOOT_FILES += " tiboot3-j721s2-hs-fs-evm.bin"
+do_image_wic[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
diff --git a/conf/machine/j721s2-hs-evm.conf b/conf/machine/j721s2-hs-evm.conf
index 3d737f44..2895787b 100644
--- a/conf/machine/j721s2-hs-evm.conf
+++ b/conf/machine/j721s2-hs-evm.conf
@@ -2,10 +2,26 @@
 #@NAME: J721S2 HS EVM
 #@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
 
-require conf/machine/j721s2-evm.conf
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
+    ti/k3-j721s2-common-proc-board.dtb \
+    ti/k3-j721s2-gesi-exp-board.dtbo \
+"
 
 UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
 
+do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
diff --git a/conf/multiconfig/k3r5-sr1-hs-fs.conf b/conf/multiconfig/k3r5-sr1-hs-fs.conf
new file mode 100644
index 00000000..2fa28c95
--- /dev/null
+++ b/conf/multiconfig/k3r5-sr1-hs-fs.conf
@@ -0,0 +1,3 @@
+require k3r5-sr1.conf
+
+MACHINE_append = "-hs-fs"
diff --git a/conf/multiconfig/k3r5-sr1.conf b/conf/multiconfig/k3r5-sr1.conf
new file mode 100644
index 00000000..2b87de8a
--- /dev/null
+++ b/conf/multiconfig/k3r5-sr1.conf
@@ -0,0 +1,3 @@
+require k3r5.conf
+
+MACHINE_append = "-sr1"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 7896c366..cb197954 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -33,7 +33,8 @@ SYSFW_PREFIX_j7-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "fs"
 SYSFW_PREFIX_j7200-evm-k3r5 = "fs"
 SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
-SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
+SYSFW_PREFIX_j721s2-evm-k3r5-gp = "fs"
+SYSFW_PREFIX_j721s2-evm-k3r5-sr1-hs-fs = "fs"
 SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
 SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
-- 
2.36.1


