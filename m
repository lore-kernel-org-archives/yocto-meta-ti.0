Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103A9C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 22:03:16 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4422.1693260194522686942
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KkllNLOw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37SM3D89007657;
	Mon, 28 Aug 2023 17:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693260193;
	bh=CEkukL88gbpYj62/qtlWumTAl9DkQRnZ2ojBofcEtrE=;
	h=From:To:Subject:Date;
	b=KkllNLOwVFOtz5g7lhmcLI3TvhpCijPOh24WxhHejuHU96Oa6O7nTln3ceTJDUYUj
	 nVEI2qctjsDEcMuLtn0H/B5aahv2EOsNIR7A9LQiL4wTFAIILqswrNm0MnkTpe1UlN
	 ReQrho0ShMDu45bdEUlihXodrWdBoDzxeHllIXok=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37SM3Dml008156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Aug 2023 17:03:13 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Aug 2023 17:03:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Aug 2023 17:03:12 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37SM3Csv131023;
	Mon, 28 Aug 2023 17:03:12 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qakKG-0006lN-M1; Mon, 28 Aug 2023 17:03:12 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] ti-img-rogue-umlibs: Reset INHIBIT_DEFAULT_DEPS
Date: Mon, 28 Aug 2023 17:03:12 -0500
Message-ID: <20230828220312.25958-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Aug 2023 22:03:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16901

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
v2: Change from settings DEPENDS to resetting INHIBIT_DEFAULT_DEPS

 .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index f748bd0f..9b45a91f 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de52
 
 inherit bin_package
 
+INHIBIT_DEFAULT_DEPS = ""
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
 
-- 
2.17.1


