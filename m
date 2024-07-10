Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4BFC41513
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 19:22:09 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3577.1720639326354583597
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jul 2024 12:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GlMLP57m;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46AJM3U2039201;
	Wed, 10 Jul 2024 14:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720639323;
	bh=u4iXLnkUTD22bVe5DHNv/RIvuB7bF2E1A9fluyqehVM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GlMLP57m99/fRasmPotuOKfGcmWh5Icpi7k5/y2qshGDXvSwlPeeIi0fRs0xKXeqh
	 LZL3FNZsW2km2a0gf+Xtwl+thuu0HyTuq2nvfTRDmQSQBbGcrY4oFMHuoIVwe9ftYy
	 3+I6j7gFfG+L+bAgJ9MUERIjmE5JGOkFUp4qB/aY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46AJM3EM061715
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jul 2024 14:22:03 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Jul 2024 14:22:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Jul 2024 14:22:02 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.34.7])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46AJM2XZ123078;
	Wed, 10 Jul 2024 14:22:02 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH 2/2] ti-img-rogue-umlibs_23: add ldflags to INSANE_SKIP
Date: Wed, 10 Jul 2024 14:21:54 -0500
Message-ID: <20240710192154.6847-3-rs@ti.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710192154.6847-1-rs@ti.com>
References: <20240710192154.6847-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jul 2024 19:22:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17853

From: Randolph Sapp <rs@ti.com>

Adding this sanity check here preemptively. Since these libraries were
compiled with an older version of GCC than what is currently in use on
scarthgap and master they won't trip the sanity check just yet, but if
someone attempts to update them and uses a newer compiler (for some
reason) it will trigger the sanity checks again.

This also keeps the DDK 23.3 and 24.1 recipe diff to a minimum.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
index 288eb52b..40835439 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
@@ -109,7 +109,7 @@ python __anonymous() {
         mlprefix = d.getVar("MLPREFIX")
         pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
         d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.setVar("INSANE_SKIP:" + fullp, "dev-so")
+        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
         d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umlibs" + suffix)
 }
 
@@ -129,10 +129,12 @@ RDEPENDS:libopencl-rogue += "opencl-icd-loader"
 RRECOMMENDS:libopencl-rogue += "libopencl-rogue-tools"
 FILES:libopencl-rogue-tools += "${bindir}/ocl*"
 DEBIAN_NOAUTONAME:libopencl-rogue-tools = "1"
+INSANE_SKIP:libopencl-rogue-tools = "ldflags"
 
 # optional tools and tests
 FILES:${PN}-tools = "${bindir}/"
 RDEPENDS:${PN}-tools = "python3-core ${PN}"
+INSANE_SKIP:${PN}-tools = "ldflags"
 
 # required firmware
 FILES:${PN}-firmware = "${base_libdir}/firmware/*"
@@ -142,4 +144,4 @@ RRECOMMENDS:${PN} += " \
     ${PN}-tools \
 "
 
-INSANE_SKIP:${PN} += "already-stripped dev-so"
+INSANE_SKIP:${PN} += "already-stripped dev-so ldflags"
-- 
2.45.2


