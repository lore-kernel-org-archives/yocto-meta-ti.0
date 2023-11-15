Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D0CC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 10:58:59 +0000 (UTC)
Received: from egress-ip43b.ess.de.barracuda.com (egress-ip43b.ess.de.barracuda.com [18.185.115.247])
 by mx.groups.io with SMTP id smtpd.web11.10555.1700045934693649180
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 02:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=AkTycxGf;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.247, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198]) by mx-outbound22-47.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 15 Nov 2023 10:58:51 +0000
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5c1c48d7226so1928171a12.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 15 Nov 2023 02:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1700045930; x=1700650730; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XQDE2SBvrWHkyIiGbxJHejedfDxgWDQVUX2NQdiRyk=;
        b=AkTycxGfCmT0J2X3F2Vpid42UISzBrQQS0zeyU/IiXlZxlVdhoYIeZ6cr0yQaWwDqj
         EPDWUdDP+x2ew4z3U58fuEzR23Ia++4yclpJ3eQO8BkVGYOoUAMxxlQiiaINbPTM1hLT
         mLuoajvjD1HCKw93DGYsukcErslP9kUkkEe14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700045930; x=1700650730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XQDE2SBvrWHkyIiGbxJHejedfDxgWDQVUX2NQdiRyk=;
        b=MP92eKoKE13I7m0t9O8Wd1YPF1chDgk81JWThL0/+C3ow8VyOS6UjDdHOewqEFjjGL
         WhuGvLaa0OUbBB0TPXocqLfE6CeeIzDfqqtWfk/c/eJCT13xWT2D8BY18ZIbdbHuUVqu
         yCus3bBjiQXXecI0nsHuwZhxmB5+sZMK3Qmj3T4ZakaqSd1SXiNedCzro8L6C95vsDFF
         3IlI6p1SwGiRkok+BxsUOnqEe5yGvYsJ92ymFRuM+55gRTzQXtliHXLvKc+hedYvzbyh
         J/aNCUHBQ0a82SShSnrNbsKJ/77CFYR8m7r35XNAudKGXX4/gAk6kndHAUCVqQdEN3xR
         5Jjg==
X-Gm-Message-State: AOJu0YysVAPdC6Dvk2GgYdWF6omTn6n92AuhY8gQfcPLuz9ZvBqGG14A
	VFxYMpHl9rf9cEyiM5/FT2wIVpOAs8f8w9niK/0Yq+mHfQcXDUU3KA9DL8FXoEvOHnGwlFH84nA
	gT5olyQwDNlo1U68a0l0sE1gP2K+SjU4LCFId/mTSeNHdYcPYS+6T4vjMwHQwP/g=
X-Received: by 2002:a17:902:ab1b:b0:1cc:29ef:df7d with SMTP id ik27-20020a170902ab1b00b001cc29efdf7dmr4998840plb.65.1700045930415;
        Wed, 15 Nov 2023 02:58:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLCz23iD/g65nmMyNxf1OlbkHGBkHc+D3FwQKtZqw4n1imykDRaGUOPAt2+yNiStSDEanxLQ==
X-Received: by 2002:a17:902:ab1b:b0:1cc:29ef:df7d with SMTP id ik27-20020a170902ab1b00b001cc29efdf7dmr4998819plb.65.1700045930074;
        Wed, 15 Nov 2023 02:58:50 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902e9c600b001c9c8d761a3sm7082837plk.131.2023.11.15.02.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 02:58:49 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com,
	meta-ti@lists.yoctoproject.org
Cc: Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][kirkstone][PATCH] ti-gc320-driver: fix stdarg header file compilation issues
Date: Wed, 15 Nov 2023 16:28:42 +0530
Message-Id: <20231115105842.4629-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1700045931-305679-12397-3729-1
X-BESS-VER: 2019.1_20231114.2339
X-BESS-Apparent-Source-IP: 209.85.215.198
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyMbc0ArIygILJaaZJpmmGSQ
	ZpaUmmFuZmFuaWqUZmxpbmlgZpJgbmJkq1sQCh0xJcQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.252154 [from 
	cloudscan14-194.eu-central-1a.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Nov 2023 10:58:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17299

From: Sinthu Raja <sinthu.raja@ti.com>

The stdarg header file location is changed to linux/stdarg.h. Add patch
to fix the compilation issue and also add fix to import DMA_BUF namspace
to load the dma_buf modules

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 ...tdarg-header-file-compilation-issues.patch | 43 +++++++++++++++++++
 ...F-namespace-to-load-the-dma_buf-modu.patch | 28 ++++++++++++
 .../ti-gc320-driver_5.0.11.p7.bb              |  4 +-
 3 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-header-file-compilation-issues.patch
 create mode 100644 meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch

diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-header-file-compilation-issues.patch b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-header-file-compilation-issues.patch
new file mode 100644
index 00000000..9262fe6a
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-header-file-compilation-issues.patch
@@ -0,0 +1,43 @@
+From 466a0f62d4ca9fd8eeea3fc060f4f1a9584f4af5 Mon Sep 17 00:00:00 2001
+From: Sinthu Raja <sinthu.raja@ti.com>
+Date: Tue, 14 Nov 2023 12:45:29 +0530
+Subject: [PATCH 1/2] km: Fix stdarg header file compilation issues
+
+The location of the stdarg.h is changed to linux/stdarg.h. Fix the same
+by updating the stdarg header location.
+
+Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
+---
+ hal/os/linux/kernel/gc_hal_kernel_debug.h   | 2 +-
+ hal/os/linux/kernel/gc_hal_kernel_debugfs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hal/os/linux/kernel/gc_hal_kernel_debug.h b/hal/os/linux/kernel/gc_hal_kernel_debug.h
+index 54782fd..cac5528 100755
+--- a/hal/os/linux/kernel/gc_hal_kernel_debug.h
++++ b/hal/os/linux/kernel/gc_hal_kernel_debug.h
+@@ -59,7 +59,7 @@
+ #include <gc_hal_kernel_linux.h>
+ #include <linux/spinlock.h>
+ #include <linux/time.h>
+-#include <stdarg.h>
++#include <linux/stdarg.h>
+ 
+ #ifdef __cplusplus
+ extern "C" {
+diff --git a/hal/os/linux/kernel/gc_hal_kernel_debugfs.h b/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
+index 9a15d77..a960272 100755
+--- a/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
++++ b/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
+@@ -53,7 +53,7 @@
+ *****************************************************************************/
+ 
+ 
+-#include <stdarg.h>
++#include <linux/stdarg.h>
+ 
+ #ifndef __gc_hal_kernel_debugfs_h_
+ #define __gc_hal_kernel_debugfs_h_
+-- 
+2.36.1
+
diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch
new file mode 100644
index 00000000..f95599ef
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch
@@ -0,0 +1,28 @@
+From e7d20324dcfed1b57e09d9e1498fad666e91665e Mon Sep 17 00:00:00 2001
+From: Sinthu Raja <sinthu.raja@ti.com>
+Date: Tue, 14 Nov 2023 12:53:00 +0530
+Subject: [PATCH 2/2] km: import DMA_BUF namespace to load the dma_buf modules
+
+The DMA BUF module is added to the namespace. To load the graphics
+driver with dma_buf module import the DAM_BUF namespace
+
+Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
+---
+ hal/os/linux/kernel/gc_hal_kernel_probe.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hal/os/linux/kernel/gc_hal_kernel_probe.c b/hal/os/linux/kernel/gc_hal_kernel_probe.c
+index 877b5a2..430c67e 100755
+--- a/hal/os/linux/kernel/gc_hal_kernel_probe.c
++++ b/hal/os/linux/kernel/gc_hal_kernel_probe.c
+@@ -73,6 +73,7 @@
+ #define _GC_OBJ_ZONE    gcvZONE_DRIVER
+ 
+ MODULE_DESCRIPTION("Vivante Graphics Driver");
++MODULE_IMPORT_NS(DMA_BUF);
+ MODULE_LICENSE("GPL");
+ 
+ static struct class* gpuClass;
+-- 
+2.36.1
+
diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index a56810d4..e38d9f49 100644
--- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -15,7 +15,9 @@ BRANCH = "ti-${PV}-k5.10"
 
 SRCREV = "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
 
-SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=https;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=https;branch=${BRANCH} \
+	   file://0001-km-Fix-stdarg-header-file-compilation-issues.patch \
+	   file://0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch"
 
 S = "${WORKDIR}/git/src"
 
-- 
2.36.1


