Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90496C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 15:51:12 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.124288.1698076269598446662
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 08:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BlLrtRLs;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39NFp873013765;
	Mon, 23 Oct 2023 10:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698076268;
	bh=zUF0zY+TUocVe6FJsRNCccf3r/dCcCNrxygSeU5dMAs=;
	h=From:To:Subject:Date;
	b=BlLrtRLsr0y+SDJqzp2Di8FNyjQp7d4rOlwTjFMuJWJLQ2BpgrqmipBD+tNST92z6
	 mSvc5WmeNpuVIX+JGMqDczm6/QI8v04nBprslPqCk0pi7I1Rgd5jZW/crgW55SXppI
	 hoJVcJIcagu3BXoUgig4eXzm0rZ90bdiwjm1Ix1U=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39NFp8QO017180
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Oct 2023 10:51:08 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Oct 2023 10:51:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Oct 2023 10:51:08 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39NFp8Vp009256;
	Mon, 23 Oct 2023 10:51:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1quxCt-0003SM-Ux; Mon, 23 Oct 2023 10:51:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-bb.org: Remove unneeded patches
Date: Mon, 23 Oct 2023 10:51:07 -0500
Message-ID: <20231023155107.12518-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 15:51:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17167

With the move to the 6.1 kernel, we no longer need any of the 5.10 based
patches.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index a416adcb..4b921919 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -31,11 +31,6 @@ BRANCH:aarch64 = "v6.1.46-ti-arm64-r9"
 
 SRC_URI = "git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
            file://defconfig \
-           file://init_disassemble_info-signature-changes-causes-compile-failures.patch \
-           file://0001-gcc-plugins-Fix-build-for-upcoming-GCC-release.patch \
-           file://0001-ata-ahci-fix-enum-constants-for-gcc-13.patch \
-           file://0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch \
-           file://0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch \
 "
 
 FILES:${KERNEL_PACKAGE_NAME}-devicetree += " \
-- 
2.17.1


