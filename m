Return-Path: <sabiya.d@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04C1C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 16:04:18 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web10.18278.1676304253802901307
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 08:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=VO6reXVc;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sabiya.d@mistralsolutions.com)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198]) by mx-outbound20-142.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 13 Feb 2023 16:04:10 +0000
Received: by mail-pg1-f198.google.com with SMTP id c15-20020a63ea0f000000b004fb3ed8a500so4865094pgi.10
        for <meta-ti@lists.yoctoproject.org>; Mon, 13 Feb 2023 08:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/SBcK6dp59eqUoVAwRju8IUdv/VeGwavEeVx1jNOUsg=;
        b=VO6reXVcGJPjuycdzYMtEdDLTJFJyVA0xY0OVZlMPzqjOxCOoXJSUGZsNVyFYk/qYH
         w/ASe1g74EAe8NLxUynj9R9JaNBtJteaizoNKeKAnq4uJj5DB/90EZ7iX9UKdrdNQ2Hw
         MoncGy3LndqEpkDYEYLdKuxa70MCzBhu504Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SBcK6dp59eqUoVAwRju8IUdv/VeGwavEeVx1jNOUsg=;
        b=zVA/GBmIxfqwcoRgCWzfSeuWD5d/pVw1OXtHYq5VgeDq220H7/0LExjFqlMWQ+Rh3P
         KAw4MiDkuxbuKtKecgHpU29hbQkBQhlZD8tURnhyeEvIxLD3vGJqZ1DQfS6zapdXFOnA
         dHzkETtLlPdq3UTptVd6axXYqCogdonGQXPI2hKo2Z3515R9bgGYI4m+0JybfnSc81bq
         mJ9ZIoH/Xwfqp3rwGtwZZnrRJKAt30peA8K/eHLrTL5A7lj7PERESD+gXcYeebhC9IMf
         /a9DXGvjZV1qT1SacgMbiVxLy1TwNBukD7/p9kllbmxRZ6LLjEOmHupWE31V6v3+wXQf
         iBPw==
X-Gm-Message-State: AO0yUKXZ0cwzPF9vnS9dduERwtpu35GBls1gIt5LeyPvuT5rl6/XfbNP
	UNFxYX//q0SyCFPSeSMLsVMku9LCjQEDyyzYNhJsCzHdA9/9Ex/uxq8RRjtdIP8CUFrQUUoDL1h
	/K/Uo/X2RTPH36dBNIydhwPJZ8kwKZ/llgYKcOtP0hxZ2S+JvcbtnUfOADJyqRYg=
X-Received: by 2002:a05:6a20:4286:b0:bf:8866:f46d with SMTP id o6-20020a056a20428600b000bf8866f46dmr31550957pzj.34.1676304249532;
        Mon, 13 Feb 2023 08:04:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/s4/55Z6A5KqQqnSlzYtMfQLIV1SZpviPucn46TVVOPjCNrBIgGd90NpPw3sapRDM49s6iFg==
X-Received: by 2002:a05:6a20:4286:b0:bf:8866:f46d with SMTP id o6-20020a056a20428600b000bf8866f46dmr31550932pzj.34.1676304249206;
        Mon, 13 Feb 2023 08:04:09 -0800 (PST)
Received: from localhost.localdomain ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090add4200b00234250b48e3sm42599pjv.20.2023.02.13.08.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 08:04:08 -0800 (PST)
From: sabiya.d@mistralsolutions.com
X-Google-Original-From: sabiya.d@ti.com
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Dasnavis Sabiya <sabiya.d@ti.com>
Subject: [dunfell,RFC] conf: machine: j784s4-evm: Add support for J784S4 HS-FS
Date: Mon, 13 Feb 2023 21:33:44 +0530
Message-Id: <20230213160344.174110-1-sabiya.d@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1676304250-305262-5592-29751-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.215.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246123 [from 
	cloudscan11-42.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, NO_REAL_NAME, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Feb 2023 16:04:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15827

From: Dasnavis Sabiya <sabiya.d@ti.com>

Add the basic J784S4 HS-FS configuration.
* Add configurations to support both HS-FS and GP and keep GP as default.
* Add ti-sci-firmware overrides for HS-FS.

Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
---
 conf/machine/j784s4-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
 conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
 conf/machine/j784s4-evm.conf                | 13 ++++++++++---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
 4 files changed, 47 insertions(+), 4 deletions(-)
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
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index cb197954..1bc8fab7 100644
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
2.25.1


