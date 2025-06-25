Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E897DC77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:06:51 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.22879.1750874811383527744
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=b1q+Y15E;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PI6ovJ1524237;
	Wed, 25 Jun 2025 13:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750874810;
	bh=Ikmmy9fjetzuUnyqvSprF6lhpBXuYzeq5UDeI3NRfZc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=b1q+Y15EszbdvDs457K4U108jL491ZNPlKDbAM807HsIrQwg3XX8a3Bv77+G7GPvl
	 vWARxGXrzxwyiE7pTSnBNhuFf4FizQfT0jdaQaBEIrxT5e1ikPOVxC6jU2TlxB2R6G
	 7R0WQJVgq03ZrsDi3BURMHUSVy6+ooqZd+Fvc4Q0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PI6oe52890582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 13:06:50 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:06:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:06:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PI6oCK3811405;
	Wed, 25 Jun 2025 13:06:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uUUWI-0004eG-6O; Wed, 25 Jun 2025 13:06:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/7] meta-ti/all: set S from UNPACKDIR in recipes that fetch prebuilt files
Date: Wed, 25 Jun 2025 13:06:45 -0500
Message-ID: <20250625180650.17820-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250625180650.17820-1-reatmon@ti.com>
References: <20250625180650.17820-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:06:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18676

There is no need to have two assignments; also setting S from
UNPACKDIR (and not vice versa) is more logical as unpack
task comes first, and tasks that come after unpack use S to access
unpack results.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb      | 3 +--
 meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index c83b2145..ba320f5f 100644
--- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -11,8 +11,7 @@ SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vis/01_50_07_15/exp
 SRC_URI[md5sum] = "fe8b00e398fb3b7ada0c15b601867acb"
 SRC_URI[sha256sum] = "6e2aa47ae892910616ebdc96646af778af9a59ca0657716ab4fa4b24a9afae69"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 DSPAPP = "dra7-dsp1-fw-radio.xe66"
 GPPAPP = "RadioApp"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
index f2f368b1..7ef20b7a 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
@@ -24,8 +24,7 @@ SRC_URI[cgt-pru-x86.sha256sum] = "1f1405167214f2c0ef848591b17a7799fdcd9f55f11bc9
 SRC_URI[cgt-pru-arm.md5sum] = "648a6d7d8162fd6a89f381c7b974e6b0"
 SRC_URI[cgt-pru-arm.sha256sum] = "8390cb77b46b728ce2940595b81406f76d86dfed58c21258e3206a7c1232ccf2"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
     install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
-- 
2.17.1


