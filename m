Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EF1C4829C
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 23:37:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4690.1707435444348947579
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 15:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZJ11G9MR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418NbM6c016816;
	Thu, 8 Feb 2024 17:37:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707435442;
	bh=sGLI2beCSsnY7RWGCBlXkqRdt1hSWdy6p5to9GkUqGU=;
	h=From:To:CC:Subject:Date;
	b=ZJ11G9MRTkIY/kRaMOXqwxH4e+yoju56XM3gTJUAPP8IAUEoabeB5YM1DcfBdPbo9
	 XEg+dpkJHOBYIU+ebhpvzSjsi8ibhwdfM/o6aawHFcVWvBR2xum6YuKvQ1aegOMGXN
	 A+CZDGS2cGvoLnOUTYQllu+ZVcfMTft3cP0UNaq8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418NbMWS004796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 17:37:22 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 17:37:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 17:37:22 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418NbMa8038936;
	Thu, 8 Feb 2024 17:37:22 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 0/2] Fix rogue driver compilation with lts prep
Date: Thu, 8 Feb 2024 17:37:20 -0600
Message-ID: <20240208233722.2565237-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Feb 2024 23:37:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17460

From: Randolph Sapp <rs@ti.com>

The kernel still doesn't have my device tree nodes yet, but we can go ahead and
fix this stuff now. Please do not pull this into kirkstone.

Randolph Sapp (2):
  ti-img-rogue-*: switch branches to new lts
  ti-img-rogue-driver: drop kbuild patch again

 ...uild-Makefile.template-use-SECONDARY.patch | 35 -------------------
 .../ti-img-rogue-driver_23.3.6512818.bb       |  6 ++--
 .../ti-img-rogue-umlibs_23.3.6512818.bb       |  2 +-
 3 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-build-kbuild-Makefile.template-use-SECONDARY.patch

-- 
2.43.0


