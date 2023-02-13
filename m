Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A22C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 06:51:36 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web11.9119.1676271086515254995
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 12 Feb 2023 22:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=LJgFHT2i;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197]) by mx-outbound42-215.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 13 Feb 2023 06:51:23 +0000
Received: by mail-pl1-f197.google.com with SMTP id c3-20020a170903234300b0019a94475927so2450195plh.3
        for <meta-ti@lists.yoctoproject.org>; Sun, 12 Feb 2023 22:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0lYhl+ixYtFjq/iztw0xqXj449TvoJ199pENAyyiFA=;
        b=LJgFHT2i5tG6pAEUk0ynkrR1Eb0Vjig38mhO0WHSSnCZOQ6sc/rpyIFLOyshtJH1ME
         PDGwPtTkM4G2W0D/pSY8pHolSPAvpOWrSOe28SXrB5eb+jVZEj4TJcbvENnbMJxK7pjz
         D5x7bGvimhGSYDYwEU3ihr6IwhP/fyIc8FMGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0lYhl+ixYtFjq/iztw0xqXj449TvoJ199pENAyyiFA=;
        b=ZeqUKmydM5ZXxnADGeeO3yEZd4zma7L/r+aHif4B0jKqBCbsd0uRrL95xQsG6uvE3F
         ibbJ8ukFDuwzXO79NlV+sseGzCRNcTh64h7xghizV2vD3jhFwLlONitC4MlE8AauOV6y
         Q25tiv2yQkYiLKdgiS2WaOtegbQu/B/SdmGEbYwJB7fJnmEyej5UBWyUwQPZARchGDxV
         2TEhXFnRpMP7kMfG1aoRCShUViBPHh4qy1RQSB4us0nvOYySSom7oQ8EYoRt+/MwKEFU
         oFLZ5g4/h5vEB7vMGbN5vzMnjiYjjcj3iocwr198kOD/09zwUBdTSP76mpoikSmvIAnX
         ZflA==
X-Gm-Message-State: AO0yUKU0WivvWl0tGtjIoi35z+ll/xFJpardjRKBLDObFvCYbkRgGpVL
	EPGhkHg4UNCFee2lVlHWXfy2uW3vuwyilSH1Z9SlRqqPqt7NPpsFXBq/g2hAsPdHPdua5y+5Ze3
	V27nhNNJu76+DvKeK5MMZ+8dWI22YyqFjwxed2JGOq+5HnkWv2z8ojtzXs4ni4zk=
X-Received: by 2002:a05:6a20:8f0a:b0:bc:2d7f:786a with SMTP id b10-20020a056a208f0a00b000bc2d7f786amr30582006pzk.15.1676271082274;
        Sun, 12 Feb 2023 22:51:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+C9+ndTGPJ+M3mn+e52B5N1PxZFN90iwaGZ/BSOO9F1neRbVGf/T2q1UJlk97maGLFryCtcA==
X-Received: by 2002:a05:6a20:8f0a:b0:bc:2d7f:786a with SMTP id b10-20020a056a208f0a00b000bc2d7f786amr30581985pzk.15.1676271081853;
        Sun, 12 Feb 2023 22:51:21 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id t1-20020a63b701000000b004fb5704f19bsm5243307pgf.31.2023.02.12.22.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 22:51:21 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>,
	Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][dunfell][PATCH V3] conf: machine: j721s2-evm: Add support for J721S2 HS-FS
Date: Mon, 13 Feb 2023 12:20:41 +0530
Message-Id: <20230213065041.16002-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1676271082-310967-5639-87476-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.214.197
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246113 [from 
	cloudscan12-125.eu-central-1a.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Feb 2023 06:51:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15818

From: Sinthu Raja <sinthu.raja@ti.com>

Add the basic J721S2 HS-FS configuration.
    - Add configurations to support both HS-FS and GP and keep GP
      as default.
    - Add ti-sci-firmware overrides for HS-FS.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Change in V3:
============
Fix build issue.

Changes in V2:
=============
Address review comment:
- Keep GP as the default.

V1: https://lists.yoctoproject.org/g/meta-ti/message/15771
V2: https://lists.yoctoproject.org/g/meta-ti/message/15793

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


