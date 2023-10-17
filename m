Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5CBCDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 11:41:38 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.211412.1697542893139405629
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 04:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Wvz42X0X;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39HBfW5m039380
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 06:41:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697542892;
	bh=r5blYhxpnerOJ8mHmKfZ5eFsnCxKUSqb16KhaA5FgME=;
	h=From:To:CC:Subject:Date;
	b=Wvz42X0XCfMj+SFtAD+dGmihEn54BrAQz1h1TnVoInofUTLhFzbCaqLN1HpeCzVup
	 Z4uo5EDaaaCaGO4VfUPfFyMmJ4Sg3QTbrx03o3lmTRlUVTjofeAbZ4yky27EHZneee
	 ncF32WEMDrwEuTNubxAeNqdhFVJh2tUTh2oPMx70=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39HBfW5K001253
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 06:41:32 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Oct 2023 06:41:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Oct 2023 06:41:32 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39HBfV2o045102;
	Tue, 17 Oct 2023 06:41:31 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] meta-ti-extras: recipes-ti: Update jailhouse SRC_URI to point to ti-jailhouse repo
Date: Tue, 17 Oct 2023 17:11:07 +0530
Message-ID: <20231017114107.3791996-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 11:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17132

The ti-jailhouse repo is synced with the Siemens/jailhouse
at https://github.com/siemens/jailhouse. Use this for
development and build for TI devices.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 1c63b400..a96a7831 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -19,7 +19,7 @@ SRCREV = "e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560"
 BRANCH = "master"
 
 SRC_URI = " \
-    git://github.com/siemens/jailhouse.git;protocol=https;branch=${BRANCH} \
+    git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
     file://0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch \
     file://0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch \
     file://0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch \
-- 
2.34.1


