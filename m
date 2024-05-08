Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E68DC04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 16:01:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.669.1715184077493264982
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 May 2024 09:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GTIJMFyO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 448G1FvH024191;
	Wed, 8 May 2024 11:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715184075;
	bh=2frGZJPFcWFbVTxcA2FHEOo6DV+AfKLeGUr9xwtaZmE=;
	h=From:To:Subject:Date;
	b=GTIJMFyOk9h+NhV6Le7cAb0ekmlGDB9h2BoAIqriMtmJwP3wW/Y1KIH1LqRiOPyOK
	 E5/fWWM49tS7ZGqmPilk/FHB2U++CDKdrO3ufGwElcFupQOGyZvMRJuVUzDxgkcEnw
	 ZlEmjwwBOKIaQjCST0HrO7Bmf69cool4tV+JVzko=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 448G1FoY002130
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 May 2024 11:01:15 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 May 2024 11:01:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 May 2024 11:01:14 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 448G1Ej1032691;
	Wed, 8 May 2024 11:01:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s4jjG-0004Uo-Np; Wed, 08 May 2024 11:01:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 1/2] recipes: Remove S = WORKDIR
Date: Wed, 8 May 2024 11:01:13 -0500
Message-ID: <20240508160114.17242-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 May 2024 16:01:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17646

Since S = "${WORKDIR}" is the default setting for S it is not needed to
override S in this way.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: After reviewing what all was being changed, I decided to make
smaller changes for this patch series while the whole UNPACKDIR
change is worked out upstream.

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


