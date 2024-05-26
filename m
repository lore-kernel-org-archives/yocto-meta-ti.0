Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4BAC25B75
	for <webhook@archiver.kernel.org>; Sun, 26 May 2024 13:16:16 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.6221.1716729368009072879
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 26 May 2024 06:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RTOR6dB1;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: twoerner@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-24fd96c5490so417816fac.3
        for <meta-ti@lists.yoctoproject.org>; Sun, 26 May 2024 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716729366; x=1717334166; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ng2fKuGw6+g+b/mZ2lIukW/e5nEcjV+xt/hh3S2g0tQ=;
        b=RTOR6dB1qe4ywBP6S7JA7JY6VsNeW0jib19BHyeLrtuqFmJW3ZoD86fSJTMkTttD6N
         jejAHDEQk/mf9JPrz2g4nwui2tt17ihg/u/NBQR3rmAUXgTDWZryH7mDitcOYOw/5Ixa
         fsdzIOLCB9MBi5F1jMGLFLwmHaV5ySVRasIxIdCOGAI/4jCkj7HZSZTy4yRLLAP78A1s
         jdj8c/YbK9mgg5+YkvUWrE9nRdC9R6sgCCkwOa8DQzqccg/7hUsaQq3QBUceCQY5+aXJ
         gOzsi24D8OZu9E0w5N+HwPl/GjoI1twV2VPuUFh+05nGD0SRR6jxTkAgWIM4dJ+JBYkX
         eU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716729366; x=1717334166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ng2fKuGw6+g+b/mZ2lIukW/e5nEcjV+xt/hh3S2g0tQ=;
        b=T1+aoLewFoe7JOVR2OWMsqMGDuiPF1BwRMbLvzU7g68IqNZd7LgmWJKdUTLMkWLVtv
         YYKtCm1nolcwzzKQPaKkdVykJrF4buZ6auXNXV8I2PSjAlqmCKykOo0+OpVmqRUF6r4c
         5QvXPQP09+RSL+nsUFl5CZKneGwnTuMR9jgrIdoy4S0qLy0gCiO3UY6JUNmLQYZ79ERV
         xi27UNiDwb/B75JdILKb0cEJdKFiATSkHWr4uVowXPH0ANS3NcCZeht0NpwoIk22ddv6
         p3yh5bPt2Ax4uVv0xn0CpZ28UfCBT0XwO0DMEududIGbpHZv3p7YzY9qyp1jmE5Ztd4v
         6HPw==
X-Gm-Message-State: AOJu0YwjKbEn7MjQEgjuYwYeqUsrx/8GSfsDEjxAUlZuKFUGjrhO5Y+V
	O9H+lgwEjBBR8syCUDmwpCGrYzkYEgHTKZ3ViMGCPgO6XlD8YtmLRfSWdg==
X-Google-Smtp-Source: AGHT+IHiSa0dM8ohFh8WwJxICW+XwwHbDzms0Uw+mckjRtaCqnF7fDL43vy+GuFTHwTmfq8SW1h+Hg==
X-Received: by 2002:a05:6870:a109:b0:24f:de6e:3049 with SMTP id 586e51a60fabf-24fde6e384cmr2995266fac.37.1716729366233;
        Sun, 26 May 2024 06:16:06 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad776f9571sm8505276d6.130.2024.05.26.06.16.05
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 06:16:05 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH] ti-cgt-pru: WORKDIR/UNPACKDIR cleanup
Date: Sun, 26 May 2024 09:15:57 -0400
Message-ID: <20240526131557.10134-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 26 May 2024 13:16:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17682

This patch allows the ti-cgt-pru recipe to build after oe-core's
WORKDIR/UNPACKDIR cleanup.

link: https://lists.openembedded.org/g/openembedded-architecture/topic/cleanup_of_workdir_by/105739556
oe-core: e022d62ba917 ("base/bitbake.conf: Introduce UNPACKDIR")
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb | 8 ++++----
 meta-ti-extras/recipes-ti/includes/ti-unpack.inc       | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
index c96113fec7db..47bd6a51ef8f 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "TI PRU Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
 LIC_FILES_CHKSUM:class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
 
 require recipes-ti/includes/ti-paths.inc
@@ -10,7 +10,7 @@ require recipes-ti/includes/ti-unpack.inc
 
 BINFILE = "ti_cgt_pru_${PV}_linux_installer_x86.bin"
 BINFILE_NAME = "cgt-pru-x86"
-TI_BIN_UNPK_ARGS = "--prefix ${S}"
+TI_BIN_UNPK_ARGS = "--prefix ${UNPACKDIR}"
 TI_BIN_UNPK_CMDS = ""
 
 BINFILE:class-target = "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
@@ -26,12 +26,12 @@ SRC_URI[cgt-pru-arm.sha256sum] = "8390cb77b46b728ce2940595b81406f76d86dfed58c212
 
 do_install() {
     install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
-    cp -r ${S}/ti-cgt-pru_${PV}/. \
+    cp -r ${UNPACKDIR}/ti-cgt-pru_${PV}/. \
           ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
 }
 
 do_install:class-target() {
-    ${WORKDIR}/${BINFILE} --prefix ${D}
+    ${UNPACKDIR}/${BINFILE} --prefix ${D}
 }
 
 FILES:${PN} += "${datadir}/ti/*"
diff --git a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
index 13068843e60a..4cefefbfdbc8 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
@@ -5,7 +5,7 @@
 #  TI_BIN_UNPK_ARGS   - contains the arguments to be passed to the bin file.
 #  TI_BIN_UNPK_CMDS   - contains list of commands separated with colon to be 
 #                       passed while unpacking the bin file. The keyword 
-#                       workdir expands to WORKDIR and commands are appendded
+#                       workdir expands to UNPACKDIR and commands are appendded
 #                       with '\n'. Eg. TI_BIN_UNPK_CMDS="Y:Y: qY:workdir"
 #  TI_BIN_UNPK_WDEXT  - This variable extends workdir path, if user wants to put
 #                       the output in some internal directory
@@ -30,7 +30,7 @@ python ti_bin_do_unpack() {
 
     # Change to the working directory
     save_cwd = os.getcwd()
-    workdir  = localdata.getVar('WORKDIR')
+    workdir  = localdata.getVar('UNPACKDIR')
     workdir  = bb.data.expand(workdir, localdata)
     os.chdir(workdir)
 
-- 
2.44.0.501.g19981daefd7c


