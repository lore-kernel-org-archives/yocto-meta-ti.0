Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F57C636D4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 18:25:19 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web10.24608.1675967109849569719
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 10:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=Io+gn7KM;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200]) by mx-outbound16-204.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 09 Feb 2023 18:25:06 +0000
Received: by mail-pg1-f200.google.com with SMTP id j28-20020a63551c000000b004fb3343142dso1429427pgb.5
        for <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 10:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zzvss6LXDWIlM4A+RjP2ZjWgY/lnEzYSOKOvaDNfpGY=;
        b=Io+gn7KMvw2ZQ76YpfZ7MPsLYVsVHV0v8anCaphrLt9FKP7kMW/kTgAuw1twUg0nMl
         JLoIBGSPOjAPIs2CoUr0FB5gWgxPPQE9Uveu/hFAs9rxmMz9nyZhpCtiJSRRTdZBwUs0
         9unldAg9exXiFIwo8qjBK3HAkIAJ9PqTZMvWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzvss6LXDWIlM4A+RjP2ZjWgY/lnEzYSOKOvaDNfpGY=;
        b=ZaIQ4zm1HBKha+6q16/6I6aOEPlTyUgQyPrNGrVn7FS/+fMIvThiOYXfzKh5M22L3S
         fHoiiPJClqVyff4rAcVvsEOtkbnVsltKOBWHc3uwiDpJv1iTeeC9DIgEoml7/upra6fd
         O7qN6D2o2j05PsVxrEySZejP+GJSDK+P3lVXKQovxRDf3nI5Uh8QrgqE9N1tLOGa9/xx
         wMibkG4pasnwcNAwsiFms9TalneXYs/aV6KQ+gtQOeP444MpO7sxUj9yUumd1zomghj2
         xnCb/orIipQLsfxaT8dZOQSSL8AzeF7B0OCxpm+UQrKF9kKpEaCfyHMSW8dXJxsIfBpf
         xHOg==
X-Gm-Message-State: AO0yUKVkFUHh9FbMtyaj1jXs1bAyH1bs30aUYp6aKI82ANTFQuDBTArY
	FN9x+mrW0+n5KAuacFKYuoSW+Ki7wb5L7HwoIIyzXXtiOJT19NeDesNDZaP/8lVI8BOlq6xuDsg
	zZR6P7MZ/ZyaRkQEPoqIRv3/AraHsgX0rVF8QINduThnf4ew/nGGh1xZeZQCTzSI=
X-Received: by 2002:a05:6a20:4298:b0:bf:8c0c:978b with SMTP id o24-20020a056a20429800b000bf8c0c978bmr15243004pzj.5.1675967104493;
        Thu, 09 Feb 2023 10:25:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/MvZStBrZPUdaBLv4vBlSU1eX01cq3a6rLqqTHTdgOBC3leNm8rtHVbbB7kRB8CSAIBHOVxQ==
X-Received: by 2002:a05:6a20:4298:b0:bf:8c0c:978b with SMTP id o24-20020a056a20429800b000bf8c0c978bmr15242982pzj.5.1675967104131;
        Thu, 09 Feb 2023 10:25:04 -0800 (PST)
Received: from localhost.localdomain ([49.207.192.121])
        by smtp.gmail.com with ESMTPSA id g8-20020aa78188000000b0056be1581126sm1807799pfi.143.2023.02.09.10.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:25:03 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][dunfell][PATCH V4] conf: machine: k3: Define RD, DTB and DTBO load address for FIT image
Date: Thu,  9 Feb 2023 23:54:56 +0530
Message-Id: <20230209182456.8005-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1675967106-304300-5392-24566-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.215.200
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246032 [from 
	cloudscan9-186.eu-central-1a.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 18:25:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15777

From: Sinthu Raja <sinthu.raja@ti.com>

K3 platforms include the FIT image-based kernel by default. The bootloader
loads the kernel and DTB from the FIT image. The DTB/DTBOs are added to the
fit image but the load address is not included in the image section of
each DTB/DTBO. This load address is determined by the LOADADDRESS macros
in the kernel-fitmage class.

Hence, define the RD/DTB/DTBOs LOADADDRESS and OFFSET macros in the k3
common include, and remove those macros defined in the k3 board specific
conf.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Change in V4:
============
- Update commit description, keep FIT as capitalized.

Changes in V3:
=============
Address review comments:
- Update commit description.
- Define UBOOT_RD_* in k3 common include.
- Remove the UBOOT* defines from k3 board specific files.

Changes in V2:
=============
Address review comment:
- Move the change to k3.inc as the fit image is included as default
  image across all platforms

V1: https://lists.yoctoproject.org/g/meta-ti/message/15754
V2: https://lists.yoctoproject.org/g/meta-ti/message/15768
V3: https://lists.yoctoproject.org/g/meta-ti/message/15776

 conf/machine/am65xx-hs-evm.conf | 8 --------
 conf/machine/include/k3.inc     | 5 +++++
 conf/machine/j7-hs-evm.conf     | 8 --------
 conf/machine/j7200-hs-evm.conf  | 8 --------
 conf/machine/j721s2-hs-evm.conf | 8 --------
 5 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
index ea1f8ff1..2c1256d0 100644
--- a/conf/machine/am65xx-hs-evm.conf
+++ b/conf/machine/am65xx-hs-evm.conf
@@ -6,14 +6,6 @@ require conf/machine/include/am65xx.inc
 
 UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
 
-UBOOT_ENTRYPOINT =       "0x80080000"
-UBOOT_LOADADDRESS =      "0x80080000"
-UBOOT_RD_LOADADDRESS =   "0x84000000"
-UBOOT_RD_ENTRYPOINT =    "0x84000000"
-UBOOT_DTB_LOADADDRESS =  "0x83000000"
-UBOOT_DTBO_LOADADDRESS = "0x83080000"
-UBOOT_DTBO_OFFSET =      "0x00010000"
-
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 81139571..611d5cce 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -21,6 +21,11 @@ KERNEL_CLASSES += "kernel-fitimage"
 UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
+UBOOT_RD_LOADADDRESS =   "0x84000000"
+UBOOT_RD_ENTRYPOINT =    "0x84000000"
+UBOOT_DTB_LOADADDRESS =  "0x83000000"
+UBOOT_DTBO_LOADADDRESS = "0x83080000"
+UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin"
 SPL_BINARYNAME = "tispl.bin"
diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
index bbfe6fcb..68d36d5f 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -6,14 +6,6 @@ require conf/machine/j7-evm.conf
 
 UBOOT_MACHINE = "j721e_hs_evm_a72_defconfig"
 
-UBOOT_ENTRYPOINT =       "0x80080000"
-UBOOT_LOADADDRESS =      "0x80080000"
-UBOOT_RD_LOADADDRESS =   "0x84000000"
-UBOOT_RD_ENTRYPOINT =    "0x84000000"
-UBOOT_DTB_LOADADDRESS =  "0x83000000"
-UBOOT_DTBO_LOADADDRESS = "0x83080000"
-UBOOT_DTBO_OFFSET =      "0x00010000"
-
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
index ef7268b1..dc928974 100644
--- a/conf/machine/j7200-hs-evm.conf
+++ b/conf/machine/j7200-hs-evm.conf
@@ -6,14 +6,6 @@ require conf/machine/j7200-evm.conf
 
 UBOOT_MACHINE = "j7200_hs_evm_a72_defconfig"
 
-UBOOT_ENTRYPOINT =       "0x80080000"
-UBOOT_LOADADDRESS =      "0x80080000"
-UBOOT_RD_LOADADDRESS =   "0x84000000"
-UBOOT_RD_ENTRYPOINT =    "0x84000000"
-UBOOT_DTB_LOADADDRESS =  "0x83000000"
-UBOOT_DTBO_LOADADDRESS = "0x83080000"
-UBOOT_DTBO_OFFSET =      "0x00010000"
-
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
diff --git a/conf/machine/j721s2-hs-evm.conf b/conf/machine/j721s2-hs-evm.conf
index 84db90bb..3d737f44 100644
--- a/conf/machine/j721s2-hs-evm.conf
+++ b/conf/machine/j721s2-hs-evm.conf
@@ -6,14 +6,6 @@ require conf/machine/j721s2-evm.conf
 
 UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
 
-UBOOT_ENTRYPOINT =       "0x80080000"
-UBOOT_LOADADDRESS =      "0x80080000"
-UBOOT_RD_LOADADDRESS =   "0x84000000"
-UBOOT_RD_ENTRYPOINT =    "0x84000000"
-UBOOT_DTB_LOADADDRESS =  "0x83000000"
-UBOOT_DTBO_LOADADDRESS = "0x83080000"
-UBOOT_DTBO_OFFSET =      "0x00010000"
-
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
-- 
2.36.1


