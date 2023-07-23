Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6212FC001B0
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 00:27:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.16988.1690072014025193383
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 22 Jul 2023 17:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NOJa0nhv;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36N0QqmM067417;
	Sat, 22 Jul 2023 19:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690072012;
	bh=NHU6o1s8UwxLq+Dzo3PzO7tjgmnbGk0IwJzHPHqGPcg=;
	h=From:To:Subject:Date;
	b=NOJa0nhvHyBklKI6mPuniw6gR0x1yxkaMxQ6rGVhz64qxY9ZNcJnpfaq3jI/MUG78
	 tH93xnNwUQm0mNweH34OB7EyU15IwAjJsh0mLXmHNuSpBvzKnee5U3vZqr8oKkv5EY
	 mKUuXw+ZACgwvtZR9fUTfHPj7zr2LxXR6RPKbMAM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36N0QqL0021406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 22 Jul 2023 19:26:52 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 22
 Jul 2023 19:26:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 22 Jul 2023 19:26:51 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36N0QpDk073719;
	Sat, 22 Jul 2023 19:26:51 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qNMvz-0004YG-GF; Sat, 22 Jul 2023 19:26:51 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] trusted-firmware-a: Remove rwx patch
Date: Sat, 22 Jul 2023 19:26:51 -0500
Message-ID: <20230723002651.17456-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 23 Jul 2023 00:27:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16856

Upstream meta-arm has picked up support for what this patch was doing,
it can be removed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../files/rwx-segments-ti.patch               | 45 -------------------
 .../trusted-firmware-a-ti.inc                 |  3 --
 2 files changed, 48 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch
deleted file mode 100644
index 826a4b32..00000000
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Binutils 2.39 now warns when a segment has RXW permissions[1]:
-
-aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX
-permissions
-
-However, TF-A passes --fatal-warnings to LD, so this is a build failure.
-
-There is a ticket filed upstream[2], so until that is resolved just
-remove --fatal-warnings.
-
-[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
-[2] https://developer.trustedfirmware.org/T996
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-
-Adapted from the above patch in meta-arm, but we cannot use that patch as
-we are on an older SRCREV and the Makefile has changed.
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
-
-
-diff --git a/Makefile b/Makefile
-index 3941f8698..13bbac348 100644
---- a/Makefile
-+++ b/Makefile
-@@ -421,7 +421,7 @@ TF_LDFLAGS		+=	$(TF_LDFLAGS_$(ARCH))
- # LD = gcc (used when GCC LTO is enabled)
- else ifneq ($(findstring gcc,$(notdir $(LD))),)
- # Pass ld options with Wl or Xlinker switches
--TF_LDFLAGS		+=	-Wl,--fatal-warnings -O1
-+TF_LDFLAGS		+=	-O1
- TF_LDFLAGS		+=	-Wl,--gc-sections
- ifeq ($(ENABLE_LTO),1)
- 	ifeq (${ARCH},aarch64)
-@@ -439,7 +439,7 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
- 
- # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
- else
--TF_LDFLAGS		+=	--fatal-warnings -O1
-+TF_LDFLAGS		+=	-O1
- TF_LDFLAGS		+=	--gc-sections
- # ld.lld doesn't recognize the errata flags,
- # therefore don't add those in that case
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index dc72fb1e..64bfec67 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -6,8 +6,5 @@ TFA_BUILD_TARGET:k3 = "all"
 TFA_INSTALL_TARGET:k3 = "bl31"
 TFA_SPD:k3 = "opteed"
 
-SRC_URI:append:k3 = " file://rwx-segments-ti.patch"
-FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
-
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
-- 
2.17.1


