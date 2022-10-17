Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C526CC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 10:25:32 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.39151.1666002330434966951
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 03:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J+SuuTTN;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id j16so17755414wrh.5
        for <meta-ti@lists.yoctoproject.org>; Mon, 17 Oct 2022 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zYBCQ5Jr0M/f84+rK1ooNwYo0eQLmC9931Qx49jutfY=;
        b=J+SuuTTNx3OSvQP1AAU80m5bpNoqXzYCuBqgaBQXOz79ZhYu2FyR+BvqTMQfcPLnFX
         19BYm/WE1iGjffmXaqUulYuSCGbMbszw1HvUq74N7x+g1uVW/J52L1KEGnDiA9m81uY6
         ifbM737hPVRjmK4Nti7GOLsWFq2FNvMaBLPysWqncNSFolGQykwhfDN+O12PGJcxMFHc
         3F4EMkwQbVz7zEj526wG0yO4/Nj5KqZA7CjdhgVqOizkfTKEoO/SwkEbVpTb7RpthN97
         9Sn2eb251Ix1Sy9xKkidY8bvaxc7ThTLTxRzmf3imUSqh4/aPtQd/V3jvyOhzhZ1KA1T
         PTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYBCQ5Jr0M/f84+rK1ooNwYo0eQLmC9931Qx49jutfY=;
        b=u2++ZP33Va4kYt6gkhM+ctIytCuUXoyOvC+a1vay3yOVg4mKRI4BzLZgZ9GhMWj2AH
         FMIHlwgHcmpoxsDgMTibnkISR9s95FE26yAzUSTnfEUBgokUK/Shi/DVHh0ZrpmNp8UB
         dysz9FQR9OXjAXouK0cAy9Cm8wY9bL0cwC4fNlefdL0rghkJx+ugAzQY3VLULFMJOF79
         iluDlKoMi/if5BpzP2Sdrqmy9uCjYCgfu1uyqlXl9gqE4NTFaBK8VxjJdq7bxCzU7MzS
         9+KwSb5P/7/uEVF7o3WW1+tfOpoTWxYlZvoiR5ObptLG65h5P43y5w35kL1nRtLlkyY/
         wohQ==
X-Gm-Message-State: ACrzQf0kzWhxw7JxoAUzAtXPTFYQuob3lE7+VwCFuYEcfnxT7XnI71cP
	RSjyZAFHwpA9f8fC7ZBfikC+fCUq8TP2/w==
X-Google-Smtp-Source: AMsMyM7xZVAXOGuDW/fZfgwJZ9JPSdJgu5LCaNKixATpup4qZ/RQPPqfKbmmdpDx+0tBMhkyt/+UeA==
X-Received: by 2002:adf:e442:0:b0:22e:2c5a:721d with SMTP id t2-20020adfe442000000b0022e2c5a721dmr5699696wrm.448.1666002328328;
        Mon, 17 Oct 2022 03:25:28 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id e26-20020a05600c4b9a00b003a5537bb2besm9672212wmp.25.2022.10.17.03.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 03:25:27 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 1/2] trusted-firmware-a: fix binutils segment has RXW permissions
Date: Mon, 17 Oct 2022 10:25:07 +0000
Message-Id: <20221017102508.1999292-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Oct 2022 10:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15176

Taken form: https://git.yoctoproject.org/meta-arm/commit/?id=977c5222d8c2f6f6c7e522e480a6e4cd40ba32d7

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../files/rwx-segments.patch                  | 38 +++++++++++++++++++
 .../trusted-firmware-a_%.bbappend             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments.patch

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments.patch b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments.patch
new file mode 100644
index 00000000..a4518ec6
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments.patch
@@ -0,0 +1,38 @@
+Binutils 2.39 now warns when a segment has RXW permissions[1]:
+
+aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX
+permissions
+
+However, TF-A passes --fatal-warnings to LD, so this is a build failure.
+
+There is a ticket filed upstream[2], so until that is resolved just
+remove --fatal-warnings.
+
+[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+[2] https://developer.trustedfirmware.org/T996
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/Makefile b/Makefile
+index 3941f8698..13bbac348 100644
+--- a/Makefile
++++ b/Makefile
+@@ -418,7 +418,7 @@ TF_LDFLAGS		+=	$(TF_LDFLAGS_$(ARCH))
+ # LD = gcc (used when GCC LTO is enabled)
+ else ifneq ($(findstring gcc,$(notdir $(LD))),)
+ # Pass ld options with Wl or Xlinker switches
+-TF_LDFLAGS		+=	-Wl,--fatal-warnings -O1
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	-Wl,--gc-sections
+ ifeq ($(ENABLE_LTO),1)
+ 	ifeq (${ARCH},aarch64)
+@@ -435,7 +435,7 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ 
+ # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 14463846..e42bbcb9 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,6 +1,7 @@
 PV:k3 = "2.6+2.7-rc0"
 SRCREV_tfa:k3 = "453abc80b2eacbf2816c838e47e40f063227d934"
 SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
+SRC_URI:append:k3 = " file://rwx-segments.patch"
 COMPATIBLE_MACHINE:k3 = "k3"
 TFA_BUILD_TARGET:k3 = "all"
 TFA_INSTALL_TARGET:k3 = "bl31"
-- 
2.34.1


