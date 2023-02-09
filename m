Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AA8C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 15:19:58 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web11.18050.1675955987674381985
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 07:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=a3hs4r2b;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199]) by mx-outbound16-204.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 09 Feb 2023 15:19:43 +0000
Received: by mail-pf1-f199.google.com with SMTP id v23-20020aa78097000000b005748c087db1so1186465pff.2
        for <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 07:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1R9MJNzYz87EHL7llaZ9ewk2ObRn/IoJJQ5uRaDnOds=;
        b=a3hs4r2bo2ogVSkZTVkP7tZETsJY4hzFegJbByAQeaI8uA+zPDtS1I1Xq62e0Yzs4V
         00p9vpthpzjHjdTw5WIUN4DqGshfvD3+ZtVjpahknyeMmTAuaWsz/D3UxthlLyeS8Fk6
         zR4mKCWeO7sGKSftDfFRMeey26tDtfS7dQ8Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1R9MJNzYz87EHL7llaZ9ewk2ObRn/IoJJQ5uRaDnOds=;
        b=3oYU0MRWA8HPgdFCiJXOhFR+XbhzMhvbpDMnL1/DmPLAPWD0ksMuX+Vot9ehS/PEuF
         rhMd3O/699UENY/NxZORmzzdcCtqesmPkqXcAESlXQIvnujH5jARzFfQpjfreiNs7jQr
         OlrqwcWsI5V/sX5XyM7NtsjYkNo1yX/vkzsZCPAhwJi9ZqjTbP3pCKw1pp5LFHvt6p+J
         ArcKJ/5lVlvM7xhwSOE8B7mZbhXh+YfwFHX4eeU/jt0BGKuBVG5A/vcI9H9bxKwnCJo7
         Aq9eFUvDboDbI1ABssz43/cxzhY0BcKN+5ivlVS5L+ntENjq2I6Ko9QPmpsbJP1ju9tj
         NIJw==
X-Gm-Message-State: AO0yUKW2KaCGM3oXvHDvSStfJGvjP9slvRO2YWXmJ+FYUIIFyDRcJmvD
	TsTpskJdH2pijiLqo5i/OfKE05nwQjtBwrqy2nmgCBfeGCCQ8xX1xbQjn1UBYGzlJ1DTqrtqWbi
	F3J0fa8+kFp73vKwJoBVZc/DY6FKv4yUpSETZcog8263RUKk+xMUz/Gu+7baDhTc=
X-Received: by 2002:a17:90a:354:b0:22c:1e06:26ec with SMTP id 20-20020a17090a035400b0022c1e0626ecmr12812062pjf.44.1675955982146;
        Thu, 09 Feb 2023 07:19:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9kNWFLecLpMyQQTFDn60iFa+/leYRvxQMua51TVWO5miSIJXDuGJktALZLwaxwm52hVg5WGA==
X-Received: by 2002:a17:90a:354:b0:22c:1e06:26ec with SMTP id 20-20020a17090a035400b0022c1e0626ecmr12812038pjf.44.1675955981733;
        Thu, 09 Feb 2023 07:19:41 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b0045ff216a0casm1466917pgp.3.2023.02.09.07.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:19:41 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>,
	Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: j721s2-evm: Add support for J721S2 HS-FS
Date: Thu,  9 Feb 2023 20:49:33 +0530
Message-Id: <20230209151933.4735-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1675955982-304300-5388-15371-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.210.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246029 [from 
	cloudscan18-203.eu-central-1b.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 15:19:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15771

From: Sinthu Raja <sinthu.raja@ti.com>

Add the basic J721S2 HS-FS configuration.
    - Add configurations to support both HS-FS and GP.
    - Add ti-sci-firmware overrides for HS-FS.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Hi,
This patch is validated locally by Aniket.

RFC Link: https://lists.yoctoproject.org/g/meta-ti/message/15651

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
index 7c120dcc..9cec9631 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -42,3 +42,15 @@ UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+
+# Default tiboot3.bin on J721S2 is for SR1.0 HS-FS
+BBMULTICONFIG = "k3r5-sr1-hs-fs"
+IMAGE_BOOT_FILES += " tiboot3-j721s2-hs-fs-evm.bin"
+do_image_wic[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on J721S2 is for SR1.0 HS-FS, add a version for GP
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


