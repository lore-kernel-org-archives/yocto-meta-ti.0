Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E430C636D4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 18:21:19 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web11.24550.1675966876568326019
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 10:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=kXNmz0Bb;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200]) by mx-outbound16-204.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 09 Feb 2023 18:21:13 +0000
Received: by mail-pf1-f200.google.com with SMTP id x26-20020aa793ba000000b0059a7d7fee19so1404320pff.20
        for <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 10:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wh4sVX9MaAcX1wht35wcbT+xXltwMuYrdHxbcSDKgz4=;
        b=kXNmz0Bb5nd/UaKJNIvAMVeXrHQbEM+ElnUuwZFLg2rsejty4WhZlxdOS68+OoV9i1
         rNapq7E1KIrB+84g5e6liEtAXXChNxXgvYH/RQPPZ/X4dkgRUXB6ZoSWoXKryjNicUFd
         KZWwZdPif9HwxChfE1SeqxDkuFbPJfnKoXAPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wh4sVX9MaAcX1wht35wcbT+xXltwMuYrdHxbcSDKgz4=;
        b=IslgYXw/nkpFyDvLwH5zFZFrl0hV103qIySjp/9L4JEoXpGtGLnLQJF3rSvFNkh/Sx
         RTy40zFFbYie29EUlzjFF/vcIZCGv2dtTCnKUTjeMR5KJvMRfr0tSzl6iNF1KMbosR8F
         kLlh8yLRRSKQe26Zew1bSXQB+fo3VDrrgsSpS7YNhWfUumDn1RxxoILwzlDQOWGViHLT
         gT/kgGn2ocxnht3U4q4KM9jhiNTZeK51op9uLBF9r5x/WUxhimk/XWlLHRtT68EmL9SN
         bcqS5I6ixO4FaadC5DuKBKHtpgncGiuN0/SBAIB488anajbu+W5JoBsOFt7sRG+zuDUG
         etYg==
X-Gm-Message-State: AO0yUKUXrlBBlzKf8/ghR3W4W0kudupbH21FgIoPOTENtP57HKue/lmD
	h/wXWMgTn8DabWDAMBvCx1TLK1q0EtVdNmUNf1iOQ9HlPTpB7CR/r2+iLupzsczUQl2+m/PYVHX
	wJZrk3BkhuD6gWyX/jVjLj5uuVP12EJAmLyWW1z6kCD7l4X/dV3d6jgFok1uuJfM=
X-Received: by 2002:aa7:9509:0:b0:594:26a7:cbd2 with SMTP id b9-20020aa79509000000b0059426a7cbd2mr2571978pfp.8.1675966870613;
        Thu, 09 Feb 2023 10:21:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9NSK/vd36M+Avb+8MV62KSpofVZEOkS93h9KvYAWdeRXsSERhHvEKCJbwcs1MmH34DhhEgEA==
X-Received: by 2002:aa7:9509:0:b0:594:26a7:cbd2 with SMTP id b9-20020aa79509000000b0059426a7cbd2mr2571958pfp.8.1675966870258;
        Thu, 09 Feb 2023 10:21:10 -0800 (PST)
Received: from localhost.localdomain ([49.207.192.121])
        by smtp.gmail.com with ESMTPSA id n19-20020a62e513000000b005a852450b14sm1753144pff.183.2023.02.09.10.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:21:09 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][dunfell][PATCH V3] conf: machine: k3: Define RD, DTB and DTBO load address for FIT image
Date: Thu,  9 Feb 2023 23:51:04 +0530
Message-Id: <20230209182104.7896-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1675966872-304300-5381-24429-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.210.200
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246032 [from 
	cloudscan16-210.eu-central-1b.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 18:21:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15776

From: Sinthu Raja <sinthu.raja@ti.com>

K3 platforms include the fit image-based kernel by default. The bootloader
loads the kernel and DTB from the FIT image. The DTB/DTBOs are added to the
fit image but the load address is not included in the image section of
each DTB/DTBO. This load address is determined by the LOADADDRESS macros
in the kernel-fitmage class.

Hence, define the RD/DTB/DTBOs LOADADDRESS and OFFSET macros in the k3
common include, and remove those macros defined in the k3 board specific
conf.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

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


