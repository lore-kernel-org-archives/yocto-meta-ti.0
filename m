Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEFDC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 18:38:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.82227.1670956721607039662
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Dec 2022 10:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cY/BlbJD;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id v7so9209864wmn.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 13 Dec 2022 10:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HW0K10yr2EaFu+34X4dBVmrPn4kcfUde9PGRfhRrdJc=;
        b=cY/BlbJD69ul84E9WRjwncsMmVzX1cUFr8VQl3Sx+PJn4di64nYgJydH8zw7lKlwZ2
         jTC6DHFl/r7PrJyBq0VhzVs8LSnhxcadtm3gQ/8U300ERYXI7FIavJuSyd4Z7NeBkJOG
         yDcSgQTN4+aeVxaZg066ZzvOipYRW/L+ucPbjhm2bMnovLPHImm2iPZgLy1TxVWjl3Gc
         YC9hRGdyXHKEn1RnJzfwwgBm3TseQmQDicy3X3ykOnYI7HF1WOYd72X71HGlIOHv0/6w
         yrNZP31csX9nv7rLwJlYwausjxCs7uQ878YY88KYjQCOit/r/B7HdurNgoCuexb59BPw
         GFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HW0K10yr2EaFu+34X4dBVmrPn4kcfUde9PGRfhRrdJc=;
        b=jP4l5XYNi8G3Us5Kx2NJlYYb+RsLb1aNi1wzL+xbih1383T9Dh+XE5ma2ONcIqPTK2
         nEPm7j2201dSnbxzkIZuyA8dqVFxFVhHsHjd6ExHkjnk4bUCK1CHiUvA+6UGcjZlrt+f
         HA+XzhR2DOyNWbI5Y0s3aJ/OfnOhebDH+SDU9qpwHRehnjd7X6mRx6BD5WXKFEGuf+LM
         CYlO/JtBJMQm8MIuHDvndQlYS/6ydBfrdvaq81EBiK6OTax8MFDw+UthteADQQSRDfRt
         tZ4YTwX2OSYrPWvSYx2XoIg+uu+eDfYWKRfFtIka9uTafgZOs4aV9C5P+7jT6hAFscmi
         X8/A==
X-Gm-Message-State: ANoB5pnkNjgGFuTRcoPFrSsMKtNQSVrGuRWCsU9ZYInVGq3NFfgxtgt+
	kxGJWDhdHL1ZRwLxWzCCSkFPI/caTY8=
X-Google-Smtp-Source: AA0mqf4/AJEjG/KnKVezPThxwVGbDpT6AXNibdDUtCdXHQj1yjxIdDUF2AGCtnVi9q30hsNo47L1LA==
X-Received: by 2002:a05:600c:a15:b0:3c6:f0b8:74e6 with SMTP id z21-20020a05600c0a1500b003c6f0b874e6mr16027834wmp.4.1670956719802;
        Tue, 13 Dec 2022 10:38:39 -0800 (PST)
Received: from fio.lan (11.77.115.89.rev.vodafone.pt. [89.115.77.11])
        by smtp.gmail.com with ESMTPSA id p25-20020a05600c1d9900b003d237d60318sm1291233wms.2.2022.12.13.10.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 10:38:39 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-ti][dunfell][PATCH 2/2] optee-os: add back allow-setting-sysroot-for-libgcc-lookup.patch
Date: Tue, 13 Dec 2022 18:38:18 +0000
Message-Id: <20221213183818.206660-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20221213183818.206660-1-jose.quaresma@foundries.io>
References: <20221213183818.206660-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Dec 2022 18:38:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15466

f8182afd optee: Upgrade to upstream 3.17.0
removes this patch but this is still required

Currently building with am62xx-evm/am64xx-evm machine fails with:

| aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory
| make: *** [ldelf/link.mk:60: out/arm-plat-k3/ldelf/ldelf.elf] Error 1
| make: *** Waiting for unfinished jobs....

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 +++++++++++++++++++
 recipes-security/optee/optee-os_%.bbappend    |  6 +++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch

diff --git a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
new file mode 100644
index 00000000..17005396
--- /dev/null
+++ b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
@@ -0,0 +1,34 @@
+From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 26 May 2020 14:38:02 -0500
+Subject: [PATCH] allow setting sysroot for libgcc lookup
+
+Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
+for the compiler libraries as there's no easy way to reliably pass --sysroot
+otherwise.
+
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ mk/gcc.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mk/gcc.mk b/mk/gcc.mk
+index adc77a24..81bfa78a 100644
+--- a/mk/gcc.mk
++++ b/mk/gcc.mk
+@@ -13,11 +13,11 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
+ 			-print-file-name=include 2> /dev/null)
+ 
+ # Get location of libgcc from gcc
+-libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
+ 			-print-libgcc-file-name 2> /dev/null)
+-libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
++libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=libstdc++.a 2> /dev/null)
+-libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
++libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=libgcc_eh.a 2> /dev/null)
+ 
+ # Define these to something to discover accidental use
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 751dc3d0..e8af0124 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,6 +1,10 @@
+FILESEXTRAPATHS_prepend_ti-soc := "${THISDIR}/${PN}:"
+
 PV_ti-soc = "3.19.0+git${SRCPV}"
 SRCREV_ti-soc = "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
-SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
+SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https \
+    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
+"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
 
-- 
2.38.2


