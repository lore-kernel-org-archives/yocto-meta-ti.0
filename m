Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09430C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:38:17 +0000 (UTC)
Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web11.45089.1674653887673918495
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 05:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=VN6ox+Yy;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197]) by mx-outbound14-153.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 25 Jan 2023 13:38:03 +0000
Received: by mail-pf1-f197.google.com with SMTP id f15-20020a62380f000000b0058db55a8d7aso8299077pfa.21
        for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 05:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DQpcaEcS1I+cyiJ4uqWve73pRPrx7NlvcOMDCoUn48=;
        b=VN6ox+YyJiey/Vt0xtW+DWC+8DxuoLyHRTYnSbzCsLW9dkTjGYoMlfZwRnXr19f64+
         H2ftjv5OIs6UF080+E/P2sZaKNqR03gnVSfWI6d4LYTTQMqbjsBJWqKtwplff6AiRx/c
         onUhU8Ab2V9JHYx0BgdPxaTHKFgNiaBwSEqxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DQpcaEcS1I+cyiJ4uqWve73pRPrx7NlvcOMDCoUn48=;
        b=6R6ETRz+j/wW+s63UJg4IyYleR/nc6i+egmdjFhx5PAtYBr6OXNAnv32carNP0ZTJB
         xNOKBYmT0UAH9hqyZiXVWZxKNIVyH9JXJcK+FV9g6OGv0kPyw6loixO0eII+hQcteYJ+
         pH2hHTzaP4A0WtKi6P1tzJlQhr/Zx5Fiju5+pdOMes8adw9szpCzl288CewOwmtDDjd7
         vPVIrD/3Qc1ymU9WktzYvrjab9Esm5P6MPMbeQjFb/waHfY4mfPVQuV81Uow186eJTet
         LIiJUsVQZiRPLdUsuEcQGJ/OF6/1EbZK9RQp4ZsFnMAHoGZgGOnjQCqqmKGgmdjXBiRB
         Y+5g==
X-Gm-Message-State: AFqh2krOV61XJ2LX631rV9bGOrC3Gq+ylcdD72pKGo6eTV041iad02Tc
	2+1Fyy2msSf/1yzM7O9HV7Q+mhEslehKZzfxv6nQpj/RLGsGGYwzXZ+mCdwPkWOu81T1OwvYXdj
	WjJ8rQUEMMINJ63PRo8d+uAyjdxvfHR6Y6e0a6ix7yVG0giyfMKv4nnhMwfkAGjk=
X-Received: by 2002:a05:6a20:cf62:b0:b8:775b:2caa with SMTP id hz34-20020a056a20cf6200b000b8775b2caamr26840780pzb.42.1674653882174;
        Wed, 25 Jan 2023 05:38:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv1UT7wrRkSHGbQT8PrJCKxUm9F7KUHTCrgDUY4u7A68KZ0uanx4QTvMfFy7LaaC5zzJvEPZA==
X-Received: by 2002:a05:6a20:cf62:b0:b8:775b:2caa with SMTP id hz34-20020a056a20cf6200b000b8775b2caamr26840760pzb.42.1674653881802;
        Wed, 25 Jan 2023 05:38:01 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id r26-20020a639b1a000000b004da9143451dsm312672pgd.26.2023.01.25.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:38:00 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>,
	Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/dunfell][RFC PATCH] conf: machine: j721s2-evm: Add support for J721S2 HS-FS
Date: Wed, 25 Jan 2023 19:07:54 +0530
Message-Id: <20230125133754.692-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1674653882-303737-5388-2586-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.210.197
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245700 [from 
	cloudscan20-209.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 13:38:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15651

From: Sinthu Raja <sinthu.raja@ti.com>

Add the basic J721S2 HS-FS configuration.
    - Add configurations to support both HS-FS and GP.
    - Add ti-sci-firmware overrides.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 conf/machine/j721s2-evm-k3r5-gp.conf        | 20 ++++++++++++++++++++
 conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf | 15 +++++++++++++++
 conf/machine/j721s2-evm.conf                | 12 ++++++++++++
 conf/multiconfig/k3r5-sr1-hs-fs.conf        |  3 +++
 conf/multiconfig/k3r5-sr1.conf              |  3 +++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb      |  3 ++-
 6 files changed, 55 insertions(+), 1 deletion(-)
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
index 1ed693c5..bf1c82a1 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -25,3 +25,15 @@ UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
+BBMULTICONFIG = "k3r5-sr1-hs-fs"
+IMAGE_BOOT_FILES += " tiboot3-j721s2-hs-fs-evm.bin"
+do_image_wic[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
+BBMULTICONFIG += "k3r5-gp"
+IMAGE_BOOT_FILES += " tiboot3-j721s2-gp-evm.bin"
+do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
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
index 0fb3a832..39e5907f 100644
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


