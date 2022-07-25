Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D14CCCA48A
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 21:35:29 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1745.1658784919482842942
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Jul 2022 14:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=y9FlRf8X;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26PLZGVI028786;
	Mon, 25 Jul 2022 16:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658784916;
	bh=88V5DPiaUD1IatCTKJxEF12S4/HPiYVG1fCxOdH4jOs=;
	h=From:To:Subject:Date;
	b=y9FlRf8X53ibuxwWKPFLRuMd45iVpSwP7z9YHO6aKyPRmsOus8XpxE4WQ6KQQcPvy
	 2XahQgQEsvT+US4SzPMznjws1MnlX5UMagt0XHOZX2WIBJclQWB1mJ1C4tUZWt2L5I
	 FB22t5xxPMLmosundpxFtFQLB7KS2BBg1ibhDTk8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26PLZGqN103729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Jul 2022 16:35:16 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Jul 2022 16:35:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Jul 2022 16:35:15 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26PLZF7W027702;
	Mon, 25 Jul 2022 16:35:15 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oG5jP-0003FR-KB; Mon, 25 Jul 2022 16:35:15 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2] j7200-hs-evm-k3r5: Move J7200 HS evm
 support to PG2.0
Date: Mon, 25 Jul 2022 16:35:15 -0500
Message-ID: <20220725213515.12445-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Jul 2022 21:35:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14902

From: Jonathan Humphreys <j-humphreys@ti.com>

With J7200 PG1.0 being deprecated, use PG2.0 sysfw when building images for j7200-hs-evm.
Also update k3-image-gen version to support this change.

Signed-off-by: Jonathan Humphreys <j-humphreys@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add in the K3_IMAGE_GEN_SRCREV change since it is required to work.

 conf/machine/j7200-hs-evm-k3r5.conf     | 2 +-
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/j7200-hs-evm-k3r5.conf b/conf/machine/j7200-hs-evm-k3r5.conf
index 488f19ec..3f134877 100644
--- a/conf/machine/j7200-hs-evm-k3r5.conf
+++ b/conf/machine/j7200-hs-evm-k3r5.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/k3r5.inc
 
-SYSFW_SOC = "j7200"
+SYSFW_SOC = "j7200_sr2"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index d1a1f3a5..8aaf1559 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -25,7 +25,7 @@ SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "f67a3696bb8d9efd052f40b6c67b742d63f6545c"
+K3_IMAGE_GEN_SRCREV ?= "85a70059fc24242ea03653a5014b98100e4da2d6"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
-- 
2.17.1


