Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AF7C83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 20:22:15 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2047.1693254134021024490
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 13:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sutOrXEG;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37SKMClV004979;
	Mon, 28 Aug 2023 15:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693254132;
	bh=tmx0Pqyyd8Hf46aCmnkRSah2hOMN+c1z6Wn40sHIadU=;
	h=From:To:Subject:Date;
	b=sutOrXEGf5v5B/0WEBpAgZidSOkQf+KqlMK2P0v4/d1BMhSNoalmQzWAArBW72HKo
	 +6uDypAMws4gqh5HtDmdyKzT8f5a4U9E1ImGXADo4f0TwaH2Vd6pKY4gZv7jD0owY2
	 5UUm8cjbcbOusZiqsqieMCZNcwS8qVjTtZ4Bnt1k=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37SKMCFD058687
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Aug 2023 15:22:12 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Aug 2023 15:22:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Aug 2023 15:22:12 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37SKMCCB044586;
	Mon, 28 Aug 2023 15:22:12 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qaikV-0005rD-Sr; Mon, 28 Aug 2023 15:22:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-img-rogue-umlibs: Add DEPENDS on BASE_DEFAULT_DEPS
Date: Mon, 28 Aug 2023 15:22:11 -0500
Message-ID: <20230828202211.22475-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Aug 2023 20:22:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16895

A recent change to oe-core [1], has caused a pile of QA errors during
packaging for this binary package.  The effect of the change in oe-core
was to remove the dependency on the compiler and other compiler adjacent
libraries.  But the binary packages need some of the compiler tools as
part of the packaging flow (ie. objdump).

Until the above gets reverted, this patch will fix the issue and can be
reverted itself once oe-core is fixed.

[1] https://git.openembedded.org/openembedded-core/commit/?h=master&id=d1d09bd4d7be88f0e341d5fccbfbefeb98d4b727

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index f748bd0f..73de93e5 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -37,6 +37,8 @@ PACKAGECONFIG[opengl] = ",,,,${GLES_PACKAGES}"
 PACKAGECONFIG[vulkan] = ",,,,${VULKAN_PACKAGES}"
 PACKAGECONFIG[opencl] = ",,,,${OPENCL_PACKAGES}"
 
+DEPENDS:prepend = "${BASE_DEFAULT_DEPS} "
+
 def get_file_list(package_list_var, d):
     file_list = []
     package_list = d.getVar(package_list_var)
-- 
2.17.1


