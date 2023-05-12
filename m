Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145BEC77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 06:19:21 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.17783.1683872358177093145
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 23:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hrZXeNyD;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-643990c5319so6859175b3a.2
        for <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 23:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683872357; x=1686464357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UxHTufzolZXVB3/Gok73qa/RoLOLV2nJqtVIfb5ubgQ=;
        b=hrZXeNyDKfZ5Lill1ct72HvuHW+2PmDIa70gU1e7HlWZnvGxtQdt+ea4wdV1RotWDS
         mCxwXeE9CCRprk2QGXhe0YskqHpU7MqfCOEi4Skb8qj+iqVPV6YIEiURiltV11cO61q2
         m6tRwq2IPd1KsgrAlkuVkR8cevli1Y/8hu6tcXtKvnEIz2Al4w57d+O+yo4Acm8GfPrK
         3w6Zc2n4vnnoxGxrbcodwo8hrPI/B1k3ApZr0uxU+qMnM2lZYfh5MNHeESs+7+P1oGYD
         JGvnQ2fqP4bIFUiPYXmLi3cTXy3zjgioqQ0TKq0WUD+OCiBFPkI9enIs1Yu/15Y5glV/
         k19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683872357; x=1686464357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxHTufzolZXVB3/Gok73qa/RoLOLV2nJqtVIfb5ubgQ=;
        b=CXgItmTUM1LVzHop778RsYg51HzcwnC3KrAmJkV6L1jE9e0FvGldruOsD4CGSuG2Jo
         /a4vGXcv8bjC5PaBmLqeHySKMatEpp6s5wS3HuLsEpHPmiq+RF1RbK0RJcdZF480Hb2v
         vYwcFlykONmMCTUJbrNtPK/VytCiQs0V5ZwLBFSQ9DI3l3f70qayO8Loo/gQkRtmsVMx
         emKpLaUR6/uSnorFVtPGyCy2nRIwJeD8i3svp+SUHLhDT5BzCim5wOVLKUevvFqqhMJY
         4xANXJVN8w+OU6h2VUfXaraAF5vh0HyoFMO+V9vuRhT4qULgSpfUJPf+jyVY4TgVhHbL
         SOKw==
X-Gm-Message-State: AC+VfDzY0/6/1WKH7eQhQXNuHtLRzwsU+lOHHdsaNqiIKz0KMHreL0sJ
	DL7vGH/rjef5CmaNZw6TSQPx+OLql1sbCg==
X-Google-Smtp-Source: ACHHUZ5Uc4yBPcmmdce7EKll9zue1LOsYx2ZNPazJ6b+289KxGh8EEWz6YNQv/hSwNRaiALmx6zwcQ==
X-Received: by 2002:a05:6a20:4411:b0:101:2ad0:1347 with SMTP id ce17-20020a056a20441100b001012ad01347mr14726757pzb.23.1683872357085;
        Thu, 11 May 2023 23:19:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id r19-20020a635d13000000b0052c3f0ae381sm5963680pgb.78.2023.05.11.23.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 23:19:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] linux-bb.org_git.bb: Fix build with gcc-13
Date: Thu, 11 May 2023 23:19:12 -0700
Message-Id: <20230512061912.2977072-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 May 2023 06:19:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16528

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-Fix-build-for-upcoming-GCC-release.patch | 46 +++++++++++++++
 ...void-64-bit-division-in-ioc_timer_fn.patch | 57 +++++++++++++++++++
 ...-gcc13-keep-large-values-in-a-new-en.patch | 55 ++++++++++++++++++
 .../recipes-kernel/linux/linux-bb.org_git.bb  |  4 ++
 4 files changed, 162 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-gcc-plugins-Fix-build-for-upcoming-GCC-release.patch
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-gcc-plugins-Fix-build-for-upcoming-GCC-release.patch b/meta-ti-bsp/recipes-kernel/linux/files/0001-gcc-plugins-Fix-build-for-upcoming-GCC-release.patch
new file mode 100644
index 00000000..e08574da
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0001-gcc-plugins-Fix-build-for-upcoming-GCC-release.patch
@@ -0,0 +1,46 @@
+From 3cd29a3d7c25cca9989e7d8966141f725fa99c68 Mon Sep 17 00:00:00 2001
+From: Palmer Dabbelt <palmer@rivosinc.com>
+Date: Fri, 13 Jan 2023 09:30:33 -0800
+Subject: [PATCH] gcc-plugins: Fix build for upcoming GCC release
+
+The upcoming GCC release has refactored the gimple plugin interface a
+bit and unless gimple-iterator.h is included before gimple-fold.h I end
+up with a bunch of missing declarations when building the stack
+protector plugin.
+
+Upstream-Status: Backport [https://lore.kernel.org/all/20230113173033.4380-1-palmer@rivosinc.com/]
+Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
+Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
+Link: https://lore.kernel.org/all/20230113173033.4380-1-palmer@rivosinc.com/
+Cc: linux-hardening@vger.kernel.org
+Signed-off-by: Kees Cook <keescook@chromium.org>
+---
+ scripts/gcc-plugins/gcc-common.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/scripts/gcc-plugins/gcc-common.h
++++ b/scripts/gcc-plugins/gcc-common.h
+@@ -108,7 +108,9 @@
+ #include "varasm.h"
+ #include "stor-layout.h"
+ #include "internal-fn.h"
++#include "gimple.h"
+ #include "gimple-expr.h"
++#include "gimple-iterator.h"
+ #include "gimple-fold.h"
+ #include "context.h"
+ #include "tree-ssa-alias.h"
+@@ -124,13 +126,10 @@
+ #include "gimplify.h"
+ #endif
+ 
+-#include "gimple.h"
+-
+ #if BUILDING_GCC_VERSION >= 4009
+ #include "tree-ssa-operands.h"
+ #include "tree-phinodes.h"
+ #include "tree-cfg.h"
+-#include "gimple-iterator.h"
+ #include "gimple-ssa.h"
+ #include "ssa-iterators.h"
+ #endif
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch
new file mode 100644
index 00000000..19afd7fc
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch
@@ -0,0 +1,57 @@
+From 5f2779dfa7b8cc7dfd4a1b6586d86e0d193266f3 Mon Sep 17 00:00:00 2001
+From: Arnd Bergmann <arnd@arndb.de>
+Date: Wed, 18 Jan 2023 09:07:01 +0100
+Subject: [PATCH] blk-iocost: avoid 64-bit division in ioc_timer_fn
+
+The behavior of 'enum' types has changed in gcc-13, so now the
+UNBUSY_THR_PCT constant is interpreted as a 64-bit number because
+it is defined as part of the same enum definition as some other
+constants that do not fit within a 32-bit integer. This in turn
+leads to some inefficient code on 32-bit architectures as well
+as a link error:
+
+arm-linux-gnueabi/bin/arm-linux-gnueabi-ld: block/blk-iocost.o: in function `ioc_timer_fn':
+blk-iocost.c:(.text+0x68e8): undefined reference to `__aeabi_uldivmod'
+arm-linux-gnueabi-ld: blk-iocost.c:(.text+0x6908): undefined reference to `__aeabi_uldivmod'
+
+Split the enum definition to keep the 64-bit timing constants in
+a separate enum type from those constants that can clearly fit
+within a smaller type.
+
+Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+Acked-by: Tejun Heo <tj@kernel.org>
+Link: https://lore.kernel.org/r/20230118080706.3303186-1-arnd@kernel.org
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+---
+ block/blk-iocost.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/block/blk-iocost.c b/block/blk-iocost.c
+index 6955605629e4..b691b6bb498f 100644
+--- a/block/blk-iocost.c
++++ b/block/blk-iocost.c
+@@ -258,6 +258,11 @@ enum {
+ 	VRATE_MIN		= VTIME_PER_USEC * VRATE_MIN_PPM / MILLION,
+ 	VRATE_CLAMP_ADJ_PCT	= 4,
+ 
++	/* switch iff the conditions are met for longer than this */
++	AUTOP_CYCLE_NSEC	= 10LLU * NSEC_PER_SEC,
++};
++
++enum {
+ 	/* if IOs end up waiting for requests, issue less */
+ 	RQ_WAIT_BUSY_PCT	= 5,
+ 
+@@ -296,9 +301,6 @@ enum {
+ 	/* don't let cmds which take a very long time pin lagging for too long */
+ 	MAX_LAGGING_PERIODS	= 10,
+ 
+-	/* switch iff the conditions are met for longer than this */
+-	AUTOP_CYCLE_NSEC	= 10LLU * NSEC_PER_SEC,
+-
+ 	/*
+ 	 * Count IO size in 4k pages.  The 12bit shift helps keeping
+ 	 * size-proportional components of cost calculation in closer
+-- 
+2.40.1
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch
new file mode 100644
index 00000000..20af798b
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch
@@ -0,0 +1,55 @@
+From ff1cc97b1f4c10db224f276d9615b22835b8c424 Mon Sep 17 00:00:00 2001
+From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
+Date: Tue, 13 Dec 2022 13:08:26 +0100
+Subject: [PATCH] block/blk-iocost (gcc13): keep large values in a new enum
+
+Since gcc13, each member of an enum has the same type as the enum [1]. And
+that is inherited from its members. Provided:
+  VTIME_PER_SEC_SHIFT     = 37,
+  VTIME_PER_SEC           = 1LLU << VTIME_PER_SEC_SHIFT,
+  ...
+  AUTOP_CYCLE_NSEC        = 10LLU * NSEC_PER_SEC,
+the named type is unsigned long.
+
+This generates warnings with gcc-13:
+  block/blk-iocost.c: In function 'ioc_weight_prfill':
+  block/blk-iocost.c:3037:37: error: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'long unsigned int'
+
+  block/blk-iocost.c: In function 'ioc_weight_show':
+  block/blk-iocost.c:3047:34: error: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int'
+
+So split the anonymous enum with large values to a separate enum, so
+that they don't affect other members.
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=36113
+
+Cc: Martin Liska <mliska@suse.cz>
+Cc: Tejun Heo <tj@kernel.org>
+Cc: Josef Bacik <josef@toxicpanda.com>
+Cc: Jens Axboe <axboe@kernel.dk>
+Cc: cgroups@vger.kernel.org
+Cc: linux-block@vger.kernel.org
+Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
+Link: https://lore.kernel.org/r/20221213120826.17446-1-jirislaby@kernel.org
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+---
+ block/blk-iocost.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/block/blk-iocost.c b/block/blk-iocost.c
+index d1bdc12deaa7..549ddc9e0c6f 100644
+--- a/block/blk-iocost.c
++++ b/block/blk-iocost.c
+@@ -232,7 +232,9 @@ enum {
+ 
+ 	/* 1/64k is granular enough and can easily be handled w/ u32 */
+ 	WEIGHT_ONE		= 1 << 16,
++};
+ 
++enum {
+ 	/*
+ 	 * As vtime is used to calculate the cost of each IO, it needs to
+ 	 * be fairly high precision.  For example, it should be able to
+-- 
+2.40.1
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index ca137c71..886aaef5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -29,6 +29,10 @@ BRANCH:aarch64 = "v5.10.162-ti-arm64-r99"
 SRC_URI = "git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
            file://defconfig \
            file://init_disassemble_info-signature-changes-causes-compile-failures.patch \
+           file://0001-gcc-plugins-Fix-build-for-upcoming-GCC-release.patch \
+           file://0001-ata-ahci-fix-enum-constants-for-gcc-13.patch \
+           file://0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch \
+           file://0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch \
 "
 
 SRC_URI:append:armv7a = " file://0001-defconfig-switch-default-kernel-compression-to-LZMA.patch"
-- 
2.40.1


