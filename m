Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C429FC433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 10:25:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.39152.1666002331915288151
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 03:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B0CUKUob;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id bk15so17697587wrb.13
        for <meta-ti@lists.yoctoproject.org>; Mon, 17 Oct 2022 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WxyyjySRiT3yhJ7oHCZAA+AKmMnt5RRWBa5QibuC1s=;
        b=B0CUKUobVwVJVRw+sfcRNZmvbe2pdwk4GrYG4UbxSksLximJSac9U710ahxBjwb3i8
         dxG+xUQiloiREHccafr0Fjv+dWke8nGICC/IzsFFtaGFx5m/9xl9Fai3hlVkyOUUlMJB
         lVdLZrXTfmi0bTgeLYhMF0dO2R6l1UgTtRUZZMRQqLnpsFc8O5zt3hbCp5JHXZCFpUP9
         8spdqGdis3RYalz5wNCMCxAPhCVimJ7TOQSy5slo1q6EvGfzwfzedKBH7N+XIScFksri
         LLCO/cVkeePsyt+9Cvnb/f3Y8A3CFVgRKsrg9MeJwOFB0JCGm5gynlTxbMX64+fyNe/9
         u1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WxyyjySRiT3yhJ7oHCZAA+AKmMnt5RRWBa5QibuC1s=;
        b=d7+RJYvRMU245PyjNBMfyXX2vjK7wvRuN9FTdXrPULZG2I0DbypYvQZ4hD1gMW3ko9
         uWpB20N80GDOhsg+ioHN50et2Nx7s6kSDcABr4Ovcr/bf5hiL2idfXZe2DY/nuh1XLBj
         QnUevNLe/LCrkxEq1A/wtCI8E4zx947ATPlfDrrAsD0ME9EVp4TCeBry5CjEOZ3cmyvR
         fxRj/tEnGS1+rBxGcDupdDhAhrtm5kizqRMNxqNNWR9DPMGS8aUH9D63g+jg99RMUf8S
         Wd8o7bfntT1J9czyXZ+ZBJVguBdMvksRuk9AHrsDxI5KGSzgsyKSdvMoeaG5vlRyG/Aa
         5qRQ==
X-Gm-Message-State: ACrzQf1SSKGiaK+u7LwJcISlPGujlCSQbp6rHxlB2bnJerQVYFhNbj9L
	W0JXUlYCKlNXcl7J0tSx2sMo8KV5WmnP2Q==
X-Google-Smtp-Source: AMsMyM45qbDys45mjgrftXcZGrngTLeK5AygjI251eeKER1GE8+UmgOwU9pH0sAJFx5XcUZ+EIZsbQ==
X-Received: by 2002:adf:dd04:0:b0:22e:4671:f092 with SMTP id a4-20020adfdd04000000b0022e4671f092mr5601512wrm.604.1666002329944;
        Mon, 17 Oct 2022 03:25:29 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id e26-20020a05600c4b9a00b003a5537bb2besm9672212wmp.25.2022.10.17.03.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 03:25:28 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 2/2] optee-os-tadevkit: fix binutils segment has RXW permissions
Date: Mon, 17 Oct 2022 10:25:08 +0000
Message-Id: <20221017102508.1999292-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017102508.1999292-1-jose.quaresma@foundries.io>
References: <20221017102508.1999292-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Oct 2022 10:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15177

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...w-warns-when-a-segment-has-RXW-permi.patch | 104 ++++++++++++++++++
 .../optee/optee-os-tadevkit_%.bbappend        |   2 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch
new file mode 100644
index 00000000..ed3d1973
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit/0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch
@@ -0,0 +1,104 @@
+From 8efd62bd8aec2a45ae0e3505d2bb1d3b05d1be50 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <jose.quaresma@foundries.io>
+Date: Mon, 17 Oct 2022 08:56:59 +0000
+Subject: [PATCH] Binutils 2.39 now warns when a segment has RXW
+ permissions[1].
+
+As we use the --fatal-warnings the build is falling:
+
+| aarch64-lmp-linux-ld.bfd: warning: /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/all_objs.o has a LOAD segment with RWX permissions
+| aarch64-lmp-linux-ld.bfd: warning: /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/unpaged.o has a LOAD segment with RWX permissions
+| aarch64-lmp-linux-ld.bfd: warning: /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/init.o has a LOAD segment with RWX permissions
+| aarch64-lmp-linux-ld.bfd: warning: /oe/build/tmp-lmp/work/am62xx_evm-lmp-linux/optee-os-tadevkit/3.17.0+gitAUTOINC+15a746d28d-r0/build/core/tee.elf has a LOAD segment with RWX permissions
+
+So as temporary solution, remove --fatal-warnings from the source code:
+
+| sed -e "s:--fatal-warnings::g" -i core/arch/arm/kernel/link.mk mk/lib.mk ldelf/link.mk ta/arch/arm/link.mk ta/arch/arm/link_shlib.mk
+
+[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ core/arch/arm/kernel/link.mk | 6 +++---
+ ldelf/link.mk                | 2 +-
+ mk/lib.mk                    | 2 +-
+ ta/arch/arm/link.mk          | 2 +-
+ ta/arch/arm/link_shlib.mk    | 2 +-
+ 5 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index 610b22cc7..1cad09f3e 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -23,13 +23,13 @@ ifeq ($(CFG_CORE_BTI),y)
+ # force-bti tells the linker to warn if some object files lack the .note.gnu.property
+ # section with the BTI flag, and to turn on the BTI flag in the output anyway. The
+ # resulting executable would likely fail at runtime so we use this flag along
+-# with the --fatal-warnings below to check and prevent this situation (with useful
++# with the  below to check and prevent this situation (with useful
+ # diagnostics).
+-link-ldflags += $(call ld-option,-z force-bti) --fatal-warnings
++link-ldflags += $(call ld-option,-z force-bti) 
+ endif
+ link-ldflags += -T $(link-script-pp) -Map=$(link-out-dir)/tee.map
+ link-ldflags += --sort-section=alignment
+-link-ldflags += --fatal-warnings
++link-ldflags += 
+ link-ldflags += --gc-sections
+ 
+ link-ldadd  = $(LDADD)
+diff --git a/ldelf/link.mk b/ldelf/link.mk
+index 64c8212a0..dee806428 100644
+--- a/ldelf/link.mk
++++ b/ldelf/link.mk
+@@ -18,7 +18,7 @@ link-ldflags += -Map=$(link-out-dir$(sm))/ldelf.map
+ link-ldflags += --sort-section=alignment
+ link-ldflags += -z max-page-size=4096 # OP-TEE always uses 4K alignment
+ ifeq ($(CFG_CORE_BTI),y)
+-link-ldflags += $(call ld-option,-z force-bti) --fatal-warnings
++link-ldflags += $(call ld-option,-z force-bti) 
+ endif
+ link-ldflags += $(link-ldflags$(sm))
+ 
+diff --git a/mk/lib.mk b/mk/lib.mk
+index 30f2040a3..82ede2954 100644
+--- a/mk/lib.mk
++++ b/mk/lib.mk
+@@ -60,7 +60,7 @@ $(lib-libfile): $(objs)
+ endif
+ ifeq ($(CFG_ULIBS_SHARED),y)
+ ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)
+-lib-ldflags$(libuuid) += $$(call ld-option,-z force-bti) --fatal-warnings
++lib-ldflags$(libuuid) += $$(call ld-option,-z force-bti) 
+ endif
+ $(lib-shlibfile): $(objs) $(lib-needed-so-files)
+ 	@$(cmd-echo-silent) '  LD      $$@'
+diff --git a/ta/arch/arm/link.mk b/ta/arch/arm/link.mk
+index ec5c8db67..f02f7ad5b 100644
+--- a/ta/arch/arm/link.mk
++++ b/ta/arch/arm/link.mk
+@@ -32,7 +32,7 @@ link-ldflags += -Map=$(link-out-dir$(sm))/$(user-ta-uuid).map
+ link-ldflags += --sort-section=alignment
+ link-ldflags += -z max-page-size=4096 # OP-TEE always uses 4K alignment
+ ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)
+-link-ldflags += $(call ld-option,-z force-bti) --fatal-warnings
++link-ldflags += $(call ld-option,-z force-bti) 
+ endif
+ link-ldflags += --as-needed # Do not add dependency on unused shlib
+ link-ldflags += $(link-ldflags$(sm))
+diff --git a/ta/arch/arm/link_shlib.mk b/ta/arch/arm/link_shlib.mk
+index 0cdf3bfa6..3b696b6a9 100644
+--- a/ta/arch/arm/link_shlib.mk
++++ b/ta/arch/arm/link_shlib.mk
+@@ -21,7 +21,7 @@ shlink-ldflags  = $(LDFLAGS)
+ shlink-ldflags += -shared -z max-page-size=4096
+ shlink-ldflags += $(call ld-option,-z separate-loadable-segments)
+ ifeq ($(sm)-$(CFG_TA_BTI),ta_arm64-y)
+-shlink-ldflags += $(call ld-option,-z force-bti) --fatal-warnings
++shlink-ldflags += $(call ld-option,-z force-bti) 
+ endif
+ shlink-ldflags += --as-needed # Do not add dependency on unused shlib
+ 
+-- 
+2.34.1
+
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
index 4300c1a9..30ba6d35 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
@@ -1,2 +1,4 @@
+FILESEXTRAPATHS:prepend:ti-soc := "${THISDIR}/${PN}:"
 PV:ti-soc = "3.17.0+git${SRCPV}"
 SRCREV:ti-soc = "15a746d28d10df3d79d72bc9fe4a5a654b88bcca"
+SRC_URI:append:ti-soc = " file://0001-Binutils-2.39-now-warns-when-a-segment-has-RXW-permi.patch"
-- 
2.34.1


