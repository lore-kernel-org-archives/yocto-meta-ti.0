Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB5AC25B4F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 15:13:36 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.14319.1715094809748178955
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 May 2024 08:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PazP5rG3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 447FDRbs020382;
	Tue, 7 May 2024 10:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715094807;
	bh=CuItJggWdqZHKI9C3Nxol6m43F/3uYyl/P/VytxGaK4=;
	h=From:To:Subject:Date;
	b=PazP5rG3ZP2DkHDGMbhNWCii68a3Iq6yGcN6L8ibWAVfzuoF1YxZx0vUP/XWzNMSn
	 iZy5SEcTqN6IoI+OlBTkO+O+gkirEOUTf5v3YoQ82+GvQhjENvJhhVgOpEbyWPiUhz
	 91q9qacqwkufR7r387N578c8wUQhFIXumHDrcVXs=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 447FDRf8024994
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 May 2024 10:13:27 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 May 2024 10:13:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 May 2024 10:13:27 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 447FDRK1005770;
	Tue, 7 May 2024 10:13:27 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s4MVT-0006YS-BH; Tue, 07 May 2024 10:13:27 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] recipes: Remove S = WORKDIR
Date: Tue, 7 May 2024 10:13:27 -0500
Message-ID: <20240507151327.25156-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 May 2024 15:13:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17644

Since S = "${WORKDIR}" is the default setting for S it is not needed to
override S in this way.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index 4ec09a70..b7d71c3d 100644
--- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -11,8 +11,6 @@ SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vis/01_50_07_15/exp
 SRC_URI[md5sum] = "fe8b00e398fb3b7ada0c15b601867acb"
 SRC_URI[sha256sum] = "6e2aa47ae892910616ebdc96646af778af9a59ca0657716ab4fa4b24a9afae69"
 
-S = "${WORKDIR}"
-
 DSPAPP = "dra7-dsp1-fw-radio.xe66"
 GPPAPP = "RadioApp"
 
-- 
2.17.1


