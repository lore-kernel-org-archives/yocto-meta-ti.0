Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46122C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 17:33:45 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.27199.1718818416333355185
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 10:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WYgBc3Us;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57c75464e77so8546583a12.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 10:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718818414; x=1719423214; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aQtG/8LbRpeHl7BOiyWjgpz0c7qNBLPdHuMYkCRUQAg=;
        b=WYgBc3Usp4c5L5uKJBLOvU0YenZ4Zf+mbQxRVzu6OngUgNVu20cl9qRLXvjZVLz5aX
         DLlCo0AXM+0d583dSmIiCAHpX4oZkOcPzRAbU+mVeZWCJ/m0mlq3pcI2AkQPcqln4wgF
         xbFIPHdwPt2111GlqasLdvh4MXX4US85ReS0vSvOxDliFQflXzFBcvJ7bduYFsHuToNG
         D7vJBNFofYJEVQo8VHXgCkmJP708E3GsMzjffcdP+OCbVdKQyn1ROnrKNTgUnBQFFRig
         VMBBPpwr7dMroOSWXJdwRdhSSAEsP+Qd+z2HRx+l1DKIGjrkWqFfC3ZYqHDhu4GfHmGj
         88fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718818414; x=1719423214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQtG/8LbRpeHl7BOiyWjgpz0c7qNBLPdHuMYkCRUQAg=;
        b=E1WazNEv5iyi7vqtLJxAQVHshO7TQj2+anPuMYuQDSGA4AZVkGhaFSY0CbBxRc3ls3
         ueW8uRb/60cTP38gaSyIubcd1FOnKGFqyyIoy+d3oO5K0SLFNkzGk+v8CDjGb1wy1J4R
         S8IhHrCitd0NznGnL5C3PA4nQWsLRy1HtPxuLvViupJIZpuw999rxrzJ+ZseFHnTS5DQ
         yXLHb3K77BhEHW+v5Amnmty2fm+k/xUqZgNWm3bTpA0uAUWh3L2a8bfRXmpWWzqZAizJ
         owF4VYr7pn83caUf09C98FWJQfnKmpu2Wz+3owaJ4ohfYXs6ckjkDH7kbi2+a3yFLUAy
         QD/w==
X-Gm-Message-State: AOJu0Ywo+prkzrQqDeYYgSlYkOq4DVqrm+TgaKTgcTpIngMJA70pMMPQ
	IM/NuUjPbE2hakh1wBWgxotZpWnaMwIEFblwRhgHJrJzEx3c3/GNEboKNw==
X-Google-Smtp-Source: AGHT+IHqlD9/RwwYO+rNJhJmn4oLWyO07cYTNi1AUQnKoEc4XLQBP4AOU0TplEqNxY7NuJaXn+RRbw==
X-Received: by 2002:aa7:d055:0:b0:57d:10c7:aa4b with SMTP id 4fb4d7f45d1cf-57d10c7aa78mr1514031a12.30.1718818414334;
        Wed, 19 Jun 2024 10:33:34 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb741e5aesm8561228a12.60.2024.06.19.10.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 10:33:34 -0700 (PDT)
From: max.oss.09@gmail.com
To: meta-ti@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-ti][PATCH] ti-img-rogue-driver_23.3.6512818: fix compile time error
Date: Wed, 19 Jun 2024 19:32:53 +0200
Message-ID: <20240619173253.1484039-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 17:33:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17765

From: Max Krummenacher <max.krummenacher@toradex.com>

GCC-14 set more warnings to errors, demote the ones which trigger to a warning.
This is when building bsp-ti-6_1. I did not notice it when building bsp-ti-6_6

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...dvars.mk-demote-some-errors-to-warni.patch | 35 +++++++++++++++++++
 .../ti-img-rogue-driver_23.3.6512818.bb       |  5 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver-23.3.6512818/0001-build-linux-buildvars.mk-demote-some-errors-to-warni.patch

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver-23.3.6512818/0001-build-linux-buildvars.mk-demote-some-errors-to-warni.patch b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver-23.3.6512818/0001-build-linux-buildvars.mk-demote-some-errors-to-warni.patch
new file mode 100644
index 000000000000..deb6dfbe1c52
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver-23.3.6512818/0001-build-linux-buildvars.mk-demote-some-errors-to-warni.patch
@@ -0,0 +1,35 @@
+From 9800beec79d13690a80f1796d67be8346c31b27d Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Thu, 13 Jun 2024 14:46:52 +0000
+Subject: [PATCH] build/linux/buildvars.mk: demote some errors to warnings
+
+With GCC-14 I get compile time errors with the following patterns:
+
+.../work-shared/am62xx-evm/kernel-source/arch/arm64/include/asm/cpufeature.h:696:21: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
+  696 |         return (val >= ID_AA64MMFR0_EL1_TGRAN4_SUPPORTED_MIN) &&
+
+| .../work/am62xx_evm-oe-linux/ti-img-rogue-driver/23.3.6512818/git/binary_am62_linux_lws-generic_release/target_aarch64/kbuild/services/server/devices/rgxfwcmnctx.c:144:9: error: missing initializer for field 'psCCB' of 'RGXFWIF_FWCOMMONCONTEXT' {aka 'struct RGXFWIF_FWCOMMONCONTEXT_'} [-Werror=missing-field-initializers]
+|  144 |         RGXFWIF_FWCOMMONCONTEXT sFWCommonContext = { { 0 } };
+
+Upstream-Status: Pending
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ build/linux/buildvars.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/linux/buildvars.mk b/build/linux/buildvars.mk
+index ec5b14a01197..e387a56584b9 100644
+--- a/build/linux/buildvars.mk
++++ b/build/linux/buildvars.mk
+@@ -51,7 +51,7 @@
+ 
+ # These flags are used for kernel, User C and User C++
+ #
+-COMMON_FLAGS := -W -Wall
++COMMON_FLAGS := -W -Wall -Wno-error=missing-field-initializers -Wno-error=type-limits
+ 
+ # Enable 64-bit file & memory handling on 32-bit systems.
+ #
+-- 
+2.42.0
+
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
index 34c22cb2adf5..a7318fd6cf9c 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
@@ -15,7 +15,10 @@ DEPENDS = "virtual/kernel"
 
 BRANCH = "linuxws/scarthgap/k6.6/${PV}"
 
-SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
+SRC_URI = " \
+    git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH} \
+    file://0001-build-linux-buildvars.mk-demote-some-errors-to-warni.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


