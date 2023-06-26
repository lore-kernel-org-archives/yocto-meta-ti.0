Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F61EB64DC
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 17:05:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1435.1687799130446389800
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 10:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fbBQSY96;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35QH5RHr101779;
	Mon, 26 Jun 2023 12:05:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687799127;
	bh=Baka6zaPgYHd/xd0yYF9lTsfb7XWdQOqcu7hrv19I8w=;
	h=From:To:CC:Subject:Date;
	b=fbBQSY96/Dw1l51wpgo+QD3cGSAPCfHy6X+z9mpeBaIN9KtrUJZk0EIihPaX1+1E7
	 25vaoFqD8f0OA8jY4IuXoIfAat2G1YssF3O8qgJxWdXZ0fLZFZmnCwmmcF99gyfX70
	 sKngweevQBZCObLQPehB6FBXgvFuSO1Rad9/V1Vo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35QH5QZw004966
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Jun 2023 12:05:27 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Jun 2023 12:05:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Jun 2023 12:05:26 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35QH5Qlb017825;
	Mon, 26 Jun 2023 12:05:26 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-driver: drop unused patch
Date: Mon, 26 Jun 2023 12:05:25 -0500
Message-ID: <20230626170525.3430833-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 26 Jun 2023 17:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16792

From: Randolph Sapp <rs@ti.com>

The following patch was dropped from the SRC_URI one of my previous
graphics overhaul patches:
0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch

Actually remove it from the source tree now that upstream is carrying
the equivalent to help enable other tools.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...-OpenEmbedded-nodistro-internal-aarc.patch | 28 -------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
deleted file mode 100644
index f59c00dc..00000000
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 80d32fee3d768abbd77cce77ea9a7574651460a9 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denis@denix.org>
-Date: Wed, 7 Jul 2021 13:11:56 -0400
-Subject: [PATCH] compiler: support OpenEmbedded "nodistro" internal aarch64
- toolchain
-
-Upstream-Status: Pending
-
-Signed-off-by: Denys Dmytriyenko <denis@denix.org>
----
- build/linux/config/compiler.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/linux/config/compiler.mk b/build/linux/config/compiler.mk
-index 53a0bef..d788579 100644
---- a/build/linux/config/compiler.mk
-+++ b/build/linux/config/compiler.mk
-@@ -65,7 +65,7 @@ define calculate-compiler-preferred-target
-    ifneq ($$(filter i386-% i486-% i586-% i686-%,$$($(1)_compiler_preferred_target)),)
-     $(1)_compiler_preferred_target := i386-linux-gnu
-    endif
--   ifneq ($$(filter aarch64-poky-linux,$$($(1)_compiler_preferred_target)),)
-+   ifneq ($$(filter aarch64-oe-linux aarch64-poky-linux,$$($(1)_compiler_preferred_target)),)
-     $(1)_compiler_preferred_target := aarch64-linux-gnu
-    endif
-    ifneq ($$(filter armv7a-cros-linux-gnueabi armv7l-tizen-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
---
-2.7.4
-- 
2.41.0


