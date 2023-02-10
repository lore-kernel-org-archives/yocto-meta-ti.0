Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DBEC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 15:26:56 +0000 (UTC)
Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web10.18536.1676042815174314210
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 07:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=A91bIMi8;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72]) by mx-outbound11-190.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 10 Feb 2023 15:26:50 +0000
Received: by mail-pj1-f72.google.com with SMTP id t10-20020a17090a3b4a00b00232d008b007so2444880pjf.1
        for <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 07:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FfLoas6a1gWHpKBzIFvSvaCRcZYt+G6OnqRrusoq0sA=;
        b=A91bIMi8P4vxysyBpj3FNrXyKBb+u3bu+PALYZxs3+TP3h+65hpZHfkarhpvv0Uald
         nxkNcrSoNpHkTk9OoMSM+BobsMYwfTNMnyFhCDpfJZlc6FpzAUAg6fk7XRtXVpSAAes9
         O/oJAIAZMC6IY3JR7HRLQgPrOBCw9yPA/t71Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfLoas6a1gWHpKBzIFvSvaCRcZYt+G6OnqRrusoq0sA=;
        b=jXzYADSI9YBaPaRZdkY2Hb4dFItk0YbhDy4iaASyHWJ5Rp6co2NhUIFQNrNOvBofKD
         +2jC+NEwRaO9l2uNdy8p0Gk+DjvarDPKjPXIRyZ5PrK9h0rDkDXvW4GAW+UYCzjAGPrp
         OVpFF4N9RDL1zPw5tRKZdilt6C43dKVbXnITBRwpcSXFgenNFZCDIjibTH5f4bYAGO2n
         P0/oigKfD/XIgCMaWChMkmlyA5U0FmEnumiSeR35LgP2DIQlF+zMceI2bvhkyijvtKtG
         iYzrZthG9A/PalIA1Fj+lmsPLc5F08UahOLRYZKq0yAfd8skiigGxUZtuRVknkM5xVzh
         i1ww==
X-Gm-Message-State: AO0yUKW0LnmBxGESLTrQTUUxAvtn/hM2TIif+khVuHBPktKJ4zjaPQc6
	NsHdvFDtpt4x0hiBxkMdL17OAHA3WNjylhSQU+qUFsvF/dUh+jy6GVM3+eSKlmXM2MSgBnHTF/V
	khsJTFwHQdokyOfEeG70xLXbMfbxK9jEboqJMpDHpSG6r/Z4udGv8vWCC85pdGkw=
X-Received: by 2002:a17:903:32cc:b0:19a:5c52:6fb with SMTP id i12-20020a17090332cc00b0019a5c5206fbmr6779311plr.28.1676042809240;
        Fri, 10 Feb 2023 07:26:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+SZXtnBTpN+wML0jG+KRgYCuehJ6SScArM2F7DKnz/2Mv03YIlZOuOOpz4KZmf7qacu2wyLA==
X-Received: by 2002:a17:903:32cc:b0:19a:5c52:6fb with SMTP id i12-20020a17090332cc00b0019a5c5206fbmr6779268plr.28.1676042808715;
        Fri, 10 Feb 2023 07:26:48 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id jb14-20020a170903258e00b001964c8164aasm3533000plb.129.2023.02.10.07.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:26:48 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>,
	Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2-evm: Add support for J721S2 HS-FS
Date: Fri, 10 Feb 2023 20:56:41 +0530
Message-Id: <20230210152641.14513-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1676042809-303006-5398-25681-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.216.72
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246052 [from 
	cloudscan14-81.eu-central-1a.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 15:26:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15793

From: Sinthu Raja <sinthu.raja@ti.com>

Add the basic J721S2 HS-FS configuration.
    - Add configurations to support both HS-FS and GP and keep GP
      as the default.
    - Add ti-sci-firmware overrides for HS-FS.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Changes in V2:
=============
Address review comment:
- Keep GP as the default.

V1: https://lists.yoctoproject.org/g/meta-ti/message/15771

 conf/machine/j721s2-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
 conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
 conf/machine/j721s2-evm.conf                | 12 ++++++++++--
 conf/multiconfig/k3r5-sr1-hs-fs.conf        |  3 +++
 conf/multiconfig/k3r5-sr1.conf              |  3 +++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
 6 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 conf/machine/j721s2-evm-k3r5-gp.conf
 create mode 100644 conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
 create mode 100644 conf/multiconfig/k3r5-sr1-hs-fs.conf
 create mode 100644 conf/multiconfig/k3r5-sr1.conf

diff --git a/conf/machine/j721s2-evm-k3r5-gp.conf b/conf/machine/j721s2-evm-k3r5-gp.conf
new file mode 100644
index 00000000..51362b85
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
+SYSFW_TIBOOT3_SYMLINK = ""
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


