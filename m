Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC2BC27C51
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 19:45:51 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.22645.1717184742074743575
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 May 2024 12:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yCiiwOe/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjfrl079499;
	Fri, 31 May 2024 14:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717184741;
	bh=b9TplWbOJTK+nI4G/uFz9LUI0zzFGL01SR9IGvO1VBA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yCiiwOe/pZQTbS1vRC4xRZyrLGjumLv1jD2GBEk/1i7dmkAhLxtMDNioP/GO9waBe
	 Dxhfgiv7BGk2TCmFmDj/KPPS9yYJALqrYOKqeRImJIcuB9iqf73Olfvu5BBjAFWkhp
	 F+zpbAqxIKFORYmXzEb1OaLcCD2UN7Eq1yK+JZf8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VJjfpF079269
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 14:45:41 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 14:45:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 14:45:41 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjfE4055276;
	Fri, 31 May 2024 14:45:41 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sD8C4-0006GT-VJ; Fri, 31 May 2024 14:45:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 2/2] recipes: Switch away from S = WORKDIR
Date: Fri, 31 May 2024 14:45:40 -0500
Message-ID: <20240531194540.24017-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531194540.24017-1-reatmon@ti.com>
References: <20240531194540.24017-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 May 2024 19:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17684

Follow along with the corresponding patch in upstream. [1]

[1] https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=d9328e3b0b062f0621de3d114584b44f384a1c02

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index 4ec09a70..c0e2595a 100644
--- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -11,7 +11,8 @@ SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vis/01_50_07_15/exp
 SRC_URI[md5sum] = "fe8b00e398fb3b7ada0c15b601867acb"
 SRC_URI[sha256sum] = "6e2aa47ae892910616ebdc96646af778af9a59ca0657716ab4fa4b24a9afae69"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 DSPAPP = "dra7-dsp1-fw-radio.xe66"
 GPPAPP = "RadioApp"
-- 
2.17.1


