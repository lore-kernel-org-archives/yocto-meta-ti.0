Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCFBEE49A0
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 01:13:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7783.1692666816760506268
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 18:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bivJPers;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37M1DWkt080426;
	Mon, 21 Aug 2023 20:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692666812;
	bh=1YypGDpseOc5hFh13y+3jpiLdbifIzC+tkUs81yrPcQ=;
	h=From:To:CC:Subject:Date;
	b=bivJPerswPtk1KA48SJQ7Uzv2ER50b5HgYOaFHILDBzClAZdPWYFEqX1t7FbuEy9s
	 lRpzN/PYOw/GRPJLtWHvr8+5+ZN4QrPRO74x1nJPzTYgLw3lzOBC8K9u8RStSC61iW
	 lnk/HM5iP/aI51jURuY/J/iZXsbllxpwG0PNv/Ck=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37M1DWpY000309
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Aug 2023 20:13:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Aug 2023 20:13:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Aug 2023 20:13:32 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37M1DWpo065451;
	Mon, 21 Aug 2023 20:13:32 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <k-bhargav@ti.com>, <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone/master][PATCH] mesa-pvr: add dynamic-layer append for llvmpipe
Date: Mon, 21 Aug 2023 20:11:38 -0500
Message-ID: <20230822011137.3183727-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Aug 2023 01:13:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16884

From: Randolph Sapp <rs@ti.com>

Meta-clang provides a bbappend for mesa to use clang to accelerate it's
rasterization with runtime code generation through the use of llvmpipe.
With the addition of mesa-pvr we no longer get this for free with the
blanket mesa bbappend on the devices that explicitly request mesa-pvr so
lets add a dynamic layer to append the same args meta-clang does.

Though the number of devices that would select pvr-mesa and still want
to use software rendering is small, it's not zero due to debug and
testing purposes.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Please let me know if I'm overlooking some specification like some reason bsp
layers shouldn't have dynamic-layers or something like that. The
yocto-check-layer didn't seem to care.

 meta-ti-bsp/conf/layer.conf                        |  4 ++++
 .../recipes-graphics/mesa/mesa-pvr_%.bbappend      | 14 ++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 26cbb4b5..56ca392b 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -18,6 +18,10 @@ LAYERDEPENDS_meta-ti-bsp = " \
     meta-arm \
 "
 
+BBFILES_DYNAMIC += " \
+    clang-layer:${LAYERDIR}/dynamic-layers/clang-layer/recipes*/*/*.bbappend \
+"
+
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     mesa-pvr \
 "
diff --git a/meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend b/meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend
new file mode 100644
index 00000000..7e5c36fd
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend
@@ -0,0 +1,14 @@
+# This is a copy of meta-clang/recipes-graphics/mesa/mesa_%.bbappend required
+# for llvmpipe when using pvr-mesa since we aren't caught by that glob.
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+LDFLAGS:append:toolchain-clang = " -latomic -lm"
+DEPENDS:append:toolchain-clang = " libatomic-ops"
+
+EXTRA_OEMASON:append:toolchain-clang:x86 = " -Dasm=false"
+EXTRA_OEMASON:append:toolchain-clang:x86-64 = " -Dasm=false"
+
+export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-config"
+
+PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true -Ddraw-use-llvm=true,-Dllvm=false,clang clang-native elfutils"
-- 
2.41.0


