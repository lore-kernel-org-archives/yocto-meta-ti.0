Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BD8C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 19:25:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.1450.1651605938949929358
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 May 2022 12:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XTKi9s3z;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 243JPAR7086327;
	Tue, 3 May 2022 14:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651605910;
	bh=8MCg1Q8Z5TjE+apVmQiapX+lrTypg4StzfMK6a3L5q8=;
	h=From:To:CC:Subject:Date;
	b=XTKi9s3z/ZccXZwJN/JUIC8CBElHhDYxbxmM/KgS/KVH4GAeLCLHteo8H3vOKH6B1
	 cK//m4ukM0aQZeILFvgVOXJpnrln/XjnMsUZVXuidvpmx9u6XVlHGpsNoTSIETlj3z
	 zeQ0hjGPkmFWWY0868gHfSe1SbjuRK/HsMU9LArE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 243JPAB4103163
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 May 2022 14:25:10 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 3
 May 2022 14:25:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 3 May 2022 14:25:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 243JP9pk013911;
	Tue, 3 May 2022 14:25:09 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Dave
 Gerlach <d-gerlach@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell PATCH] conf/machine: am62xx: Update build flag for low power
 mode
Date: Tue, 3 May 2022 14:25:09 -0500
Message-ID: <20220503192509.24537-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 May 2022 19:25:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14687

Update build flag for arm-trusted-firmware to include low power mode
support

K3_PM_SYSTEM_SUSPEND is added in arm-trusted-firmware now which enables
low power mode support for am62xx.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/am62xx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
index e8823dd2..59cb7053 100644
--- a/conf/machine/include/am62xx.inc
+++ b/conf/machine/include/am62xx.inc
@@ -13,5 +13,6 @@ do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
+K3_PM_SYSTEM_SUSPEND = "1"
 OPTEEMACHINE = "k3-am65x"
 OPTEEOUTPUTMACHINE = "k3"
-- 
2.17.1


