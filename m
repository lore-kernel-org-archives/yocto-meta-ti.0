Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8142C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 19:22:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3581.1720639326301866919
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jul 2024 12:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JkeU3ece;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46AJM36R022028;
	Wed, 10 Jul 2024 14:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720639323;
	bh=aKeEfWQeDQkfJxtymPLlt/5Z+pzxG/ITkTz1Dc2WsQ4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JkeU3ece2R0syCX8O2pAp68Os5P1OV14SI/9wXhavoj7sUNNNNGzLxH7IlN7w5bE/
	 m4gSAhSr4S4oiDTJiIMYqxuNtUooaUYJVfTNWYTJufVFCtuyAgMGljIhs0C7Yc8l7N
	 WJQM56qvl8CXqBhl6KopCzSn/VJLLHPU3iRWBz8Y=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46AJM3hM069809
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jul 2024 14:22:03 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Jul 2024 14:22:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Jul 2024 14:22:02 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.34.7])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46AJM2XY123078;
	Wed, 10 Jul 2024 14:22:02 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH 1/2] ti-img-rogue-umlibs: fix libopencl-rogue-tools sanity
Date: Wed, 10 Jul 2024 14:21:53 -0500
Message-ID: <20240710192154.6847-2-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17851

From: Randolph Sapp <rs@ti.com>

Add ldflags to INSANE_SKIP for the libopencl-rogue-tools package. For
some reason I didn't catch this sooner, but this falls victim to the
same issues the parent package faced earlier this year.

Just enough options enabled that Yocto wants to do a ldflags check, but
the DDK will not be able to utilize all the build flags Yocto uses.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
index df781bea..57475cb4 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
@@ -129,6 +129,7 @@ RDEPENDS:libopencl-rogue += "opencl-icd-loader"
 RRECOMMENDS:libopencl-rogue += "libopencl-rogue-tools"
 FILES:libopencl-rogue-tools += "${bindir}/ocl*"
 DEBIAN_NOAUTONAME:libopencl-rogue-tools = "1"
+INSANE_SKIP:libopencl-rogue-tools = "ldflags"
 
 # optional tools and tests
 FILES:${PN}-tools = "${bindir}/"
-- 
2.45.2


