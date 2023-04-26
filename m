Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC884C77B7C
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:55:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.5896.1682546145169965142
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 14:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JZE3ji0n;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QLtflI029018;
	Wed, 26 Apr 2023 16:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682546141;
	bh=to6G4SZJNFkAynnHJ8EQ5pok1dh70dHxIjs/1zNBlVQ=;
	h=From:To:CC:Subject:Date;
	b=JZE3ji0ntnXypJJPR1XSZcMDOSxwOxVq6/37lSyICi2O03Jm8YTNQQLgIgbyyzU3D
	 JGdPMUXDuy2o7TB2QshXEhOTeGZA4JnDXf1rwoHoD7mlmzLLaEDEfTjBY0pNBTybf2
	 VRL3zgyRed2JdcSSe/LIeR2ab08s22F/rswwRGvs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QLtfZf069950
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 16:55:41 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Apr 2023 16:55:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 16:55:41 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QLtf49081011;
	Wed, 26 Apr 2023 16:55:41 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH 0/4] Enable vulkan proper
Date: Wed, 26 Apr 2023 16:55:34 -0500
Message-ID: <20230426215538.3502212-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Apr 2023 21:55:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16434

From: Randolph Sapp <rs@ti.com>

Properly enable Vulkan with all WSI extensions enabled. Attempt some
light packaging changes to the graphics umlibs recipe so we can decrease
the number of check we have to skip, and the checks become a little more
targeted.

Randolph Sapp (4):
  ti-img-rogue-umlibs: bump srcrev, add vulkan, update deps
  pvr-mesa: add new vulkan configuration options and wsi
  cairo: resolve opengl version
  ti-img-rogue-umlibs: package firmware separately

 .../recipes-graphics/cairo/cairo_%.bbappend   |  5 +++
 .../ti-img-rogue-umlibs_23.1.6404501.bb       | 33 +++++++++++++++----
 .../recipes-graphics/mesa/pvr-mesa.inc        |  6 +++-
 3 files changed, 36 insertions(+), 8 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend

-- 
2.40.0


