Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2419C27C54
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 00:46:03 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3766.1717548360522603780
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 17:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aVDXiVre;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4550jxbD077094;
	Tue, 4 Jun 2024 19:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717548359;
	bh=oIoT/7vfUA2FqkDM3ynj2TfwZqs2kgb0fNyAX18dSV0=;
	h=From:To:Subject:Date;
	b=aVDXiVreXCqgV5dDax2/YG8V9Q6OFmfOJ0me27QSvMu5OCo00FT6386ZsGeIsTrXE
	 XaBR4ON3AQKQKYkPQxnk8ocMdEyW9Az6MLJ3EAGY+ty5qJpSMcUYgaarIK6hECzUW7
	 vhNwuvGq/9xhIfOIUOqSfePJ6FJ90nkiDE5Ptrn0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4550jxo2006511
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 19:45:59 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 19:45:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 19:45:59 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4550jw3O090039;
	Tue, 4 Jun 2024 19:45:58 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sEems-0002O4-L1; Tue, 04 Jun 2024 19:45:58 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] gcc-arm-baremetal: Add arch to INSANE_SKIP
Date: Tue, 4 Jun 2024 19:45:58 -0500
Message-ID: <20240605004558.9137-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jun 2024 00:46:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17696

A newly enabled check in master is causing errors with this package:

ERROR: QA Issue: Architecture did not match (ARM, expected x86-64)

Adding arch to the INSANE_SKIP variable disables that check for this
recipe.

Suggested-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
index 64bac240..1d557252 100644
--- a/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
+++ b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
@@ -23,7 +23,7 @@ do_install() {
 
 FILES:${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
 
-INSANE_SKIP:${PN} = "already-stripped libdir staticdev build-deps file-rdeps"
+INSANE_SKIP:${PN} = "already-stripped libdir staticdev build-deps file-rdeps arch"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


