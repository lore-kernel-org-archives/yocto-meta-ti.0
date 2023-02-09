Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E70C636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 18:55:29 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web11.25691.1675968927668822407
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 10:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=XhC1ubCo;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71]) by mx-outbound16-204.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 09 Feb 2023 18:55:24 +0000
Received: by mail-pj1-f71.google.com with SMTP id oo13-20020a17090b1c8d00b0022936a63a22so3391460pjb.8
        for <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJnZfWm8jqybJoQtdoPhUYUpS8hFmC/u28eQTz+7mxU=;
        b=XhC1ubCoc5/GbjHWXvhFagVw0oHtwvFD0BnlS34vfVSP6Y3K2nzywNZH/r5vS4Sm3N
         kAuaT+KBX2jVzFnhNj043XyrcXE7173h5x7Fk6W85v5hj4g5A11U9htrBtBHLlTrjeyf
         nFY7Bx8i1ZLFdlxZgURIzffi0l0uZQzb0yCFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJnZfWm8jqybJoQtdoPhUYUpS8hFmC/u28eQTz+7mxU=;
        b=lxdd6i6oK/SX0XB5+S/4VQYC2pQ0CRJEpigxsxgSP1PeTOejJOeznNDSzw8pe9BIXm
         LUAt/VfAjTUXJ9o/Wq+TXJO+jGFRZqrFzcX0rNGgc2bNZ7rMGkJ9VvAoDPhnUQh6BCj0
         0Snn1cTENHVm5rFLzGfhIM9udweHrFDHvYsf0xJAH4lB8qXY2WIkeDlGBORs1hTFKp/b
         GmIzpptc42pCb11z354Zwk0W3RrHR8adBZOQQjQvH67iSklSvFze4gdS9OXKVwr/9eu4
         RWmjI12nPjiVfeJ11Oe40aTVtabUNqaas7kTb5FQkZSwe00NxRkIHlzpJzVS8KV8fLNn
         tkKw==
X-Gm-Message-State: AO0yUKVqNaMo4eOACYbFM/ajyo1CrFm80fs2T3WSASBGeDwgNV5IP0Rz
	rJDiBfNQwhiWt1EReUM0Aq0kjjbJJe5kZuhrK7z0bspNLLu5BdioIIwf2+YcWOBzWLdKB2r6vc4
	wK1bn30jnIQuObCpLdb4HWpiz2HHYVAcwLaVbWP1KBQTEa9oXUQ/j+q4416IymwI=
X-Received: by 2002:a17:902:6b81:b0:199:bcb:3dae with SMTP id p1-20020a1709026b8100b001990bcb3daemr9538169plk.56.1675968921581;
        Thu, 09 Feb 2023 10:55:21 -0800 (PST)
X-Google-Smtp-Source: AK7set96qpBlQVqhMM25eNGRqSDoOOPz4H5q9e95XUGG6ALkzY4Z6Jq6Y/elx4WGvkBWg6sOB2MZNA==
X-Received: by 2002:a17:902:6b81:b0:199:bcb:3dae with SMTP id p1-20020a1709026b8100b001990bcb3daemr9538155plk.56.1675968921246;
        Thu, 09 Feb 2023 10:55:21 -0800 (PST)
Received: from localhost.localdomain ([49.207.192.121])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902d34500b0019655211783sm1820318plk.306.2023.02.09.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:55:20 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>,
	Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH V6] conf: machine: k3: Define RD, DTB and DTBO load address for FIT image
Date: Fri, 10 Feb 2023 00:25:14 +0530
Message-Id: <20230209185514.8901-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1675968923-304300-5386-25718-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.216.71
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246032 [from 
	cloudscan9-126.eu-central-1a.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 18:55:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15780

From: Sinthu Raja <sinthu.raja@ti.com>

K3 platforms include the FIT image-based kernel by default. The bootloader
loads the kernel and DTB from the FIT image. The DTB/DTBOs are added to the
FIT image but the load address is not included in the image section of
each DTB/DTBO. This load address is determined by the LOADADDRESS macros
in the kernel-fitmage class.

Hence, define the RD/DTB/DTBOs LOADADDRESS and OFFSET macros in the K3 common
include, and remove those macros defined in the K3 board specific config files.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---

Changes in V6:
=============
Address review comments:
- Update commit description, keep K3 capitalized.
- Remove space align for the macros.

Change in V4 & V5:
=================
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
- Move the change to k3.inc as the FIT image is included as default
  image across all platforms

V1: https://lists.yoctoproject.org/g/meta-ti/message/15754
V2: https://lists.yoctoproject.org/g/meta-ti/message/15768
V3: https://lists.yoctoproject.org/g/meta-ti/message/15776
V4: https://lists.yoctoproject.org/g/meta-ti/message/15777
V5: https://lists.yoctoproject.org/g/meta-ti/message/15778

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
index 81139571..2a74f71b 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -21,6 +21,11 @@ KERNEL_CLASSES += "kernel-fitimage"
 UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
+UBOOT_RD_LOADADDRESS = "0x84000000"
+UBOOT_RD_ENTRYPOINT = "0x84000000"
+UBOOT_DTB_LOADADDRESS = "0x83000000"
+UBOOT_DTBO_LOADADDRESS = "0x83080000"
+UBOOT_DTBO_OFFSET = "0x00010000"
 
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


