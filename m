Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4B8C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 21:07:53 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.4148.1682629671395542029
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 14:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sNDvF/5L;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RL7kjC031180;
	Thu, 27 Apr 2023 16:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682629666;
	bh=ayd6bJvuKyYebYfs8Q2N4Xrtu2vFcp3pzmWE8/UqdXU=;
	h=From:To:CC:Subject:Date;
	b=sNDvF/5LQ1wUZiIUu+g19QPcz/RqbrQrIYW3QEAjnHZ3SkE1CfN6GQE92jKGlGkL8
	 ti4Vl7c824cKDAQw1Dqm8p6Cdo4w2l5DNi/kXQqdSo5T+uabFIfGRKG72vP8xuR/l7
	 x3W9qJ7sqKc7eDrua2esrm7V5GbHt/K1SXu4nBWc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RL7k5X005117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 16:07:46 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 16:07:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 16:07:46 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RL7k8X002940;
	Thu, 27 Apr 2023 16:07:46 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCHv2 0/4] Enable vulkan proper
Date: Thu, 27 Apr 2023 16:07:42 -0500
Message-ID: <20230427210746.1915362-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 21:07:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16445

From: Randolph Sapp <rs@ti.com>

Properly enable Vulkan with all WSI extensions enabled. Attempt some
light packaging changes to the graphics umlibs recipe so we can decrease
the number of check we have to skip, and the checks become a little more
targeted.

This version uses a cairo append that conditionally tweaks PACKAGECONFIG
flags based on the GPU driver that is selected. We're using this driver
flag instead of a machine feature because the open source driver will
add a whole new set of preferred configs that will be optimized later.

Randolph Sapp (4):
  ti-img-rogue-umlibs: bump srcrev, add vulkan, update deps
  pvr-mesa: add new vulkan configuration options and wsi
  cairo: resolve opengl version
  ti-img-rogue-umlibs: package firmware separately

 .../recipes-graphics/cairo/cairo_%.bbappend   |  1 +
 .../recipes-graphics/cairo/pvr-cairo.inc      |  5 +++
 .../ti-img-rogue-umlibs_23.1.6404501.bb       | 33 +++++++++++++++----
 .../recipes-graphics/mesa/pvr-mesa.inc        |  6 +++-
 4 files changed, 37 insertions(+), 8 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc

-- 
2.40.0


