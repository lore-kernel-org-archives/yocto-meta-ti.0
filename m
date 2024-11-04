Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB12D1BDF1
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 20:39:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.954.1730752779752553252
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 12:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=urj99JZt;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A4KdZrJ098982;
	Mon, 4 Nov 2024 14:39:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730752775;
	bh=eUfu4c5T29WOjpFZjxyRQsyKsPjd/WeB5E4V92DJMYc=;
	h=From:To:CC:Subject:Date;
	b=urj99JZty7SkSqbzMsaNTPy4oy7voC2sB17ZMSu48D1XoRne9dgFlJtLc0L8/5ohN
	 mVAgQKM5cUrvf9hkjnly5AfrdoPfdwkCH1MB6B7LxYW+awck35UwlvXiNretTpYo2e
	 hnQ57PpNGMbG+LArP0w2J0V64edVmx64HmfxZuZQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A4KdZwp063046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Nov 2024 14:39:35 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 14:39:34 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 14:39:34 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A4KdYQa043235;
	Mon, 4 Nov 2024 14:39:35 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] mesa-pvr: remove dynamic-layer append for llvmpipe
Date: Mon, 4 Nov 2024 14:39:08 -0600
Message-ID: <20241104203907.3365806-2-rs@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 Nov 2024 20:39:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18035

From: Randolph Sapp <rs@ti.com>

The mesa.inc that we inherit from oe-core now has the required
parameters. This conditional append is no longer required.

This reverts commit dbc6afc46e55b247606dfad5238137c8fa807843.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/layer.conf                        |  4 ----
 .../recipes-graphics/mesa/mesa-pvr_%.bbappend      | 14 --------------
 2 files changed, 18 deletions(-)
 delete mode 100644 meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 462bf763..251f1fa4 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -18,10 +18,6 @@ LAYERDEPENDS_meta-ti-bsp = " \
     meta-arm \
 "
 
-BBFILES_DYNAMIC += " \
-    clang-layer:${LAYERDIR}/dynamic-layers/clang-layer/recipes*/*/*.bbappend \
-"
-
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     mesa-pvr \
 "
diff --git a/meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend b/meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend
deleted file mode 100644
index 7e5c36fd..00000000
--- a/meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend
+++ /dev/null
@@ -1,14 +0,0 @@
-# This is a copy of meta-clang/recipes-graphics/mesa/mesa_%.bbappend required
-# for llvmpipe when using pvr-mesa since we aren't caught by that glob.
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-LDFLAGS:append:toolchain-clang = " -latomic -lm"
-DEPENDS:append:toolchain-clang = " libatomic-ops"
-
-EXTRA_OEMASON:append:toolchain-clang:x86 = " -Dasm=false"
-EXTRA_OEMASON:append:toolchain-clang:x86-64 = " -Dasm=false"
-
-export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-config"
-
-PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true -Ddraw-use-llvm=true,-Dllvm=false,clang clang-native elfutils"
-- 
2.47.0


