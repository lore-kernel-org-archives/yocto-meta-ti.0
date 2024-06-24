Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF72C41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 18:17:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.149072.1719253045933229908
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 11:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dxrKsfxJ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45OIHMU7006847;
	Mon, 24 Jun 2024 13:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719253042;
	bh=QBoLLhk8VUG1z84Ac7KOLZK+6K5nC1wAERsMJCbqGhA=;
	h=From:To:CC:Subject:Date;
	b=dxrKsfxJUS10+h3ZbenzTC8/kCXO0ZsBT7YYcNkz1AeX3rFEoYDNoJ9mRYjt/pa85
	 KO3tFeYAUhRA0exGd5iJzfc7yPa8PmrJsxKQg4jaW03ztT+rLS35JEmuoRN3nCBY81
	 /p3ukgPe1tKqeDFzwczGs0xlcMVg/H+hH6xNxRFE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45OIHLeF012211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jun 2024 13:17:22 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jun 2024 13:17:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Jun 2024 13:17:21 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45OIHLrF025548;
	Mon, 24 Jun 2024 13:17:21 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <max.oss.09@gmail.com>, <meta-ti@lists.yoctoproject.org>,
        <detheridge@ti.com>
Subject: [meta-ti][master/scarthgap][PATCHv2 0/2] gcc 14 and bsp provider fixup
Date: Mon, 24 Jun 2024 13:17:12 -0500
Message-ID: <20240624181714.1293865-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Jun 2024 18:17:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17801

From: Randolph Sapp <rs@ti.com>

Resolve some issues afer the new bsp-provider selection logic was added and add
some patches to help with compilation flag checks in the KM.

This includes equivalent patches from the following post for GCC 14 compat:
https://lists.yoctoproject.org/g/meta-ti/topic/106806264

Randolph Sapp (2):
  ti-img-rogue-*_23.3: gcc 14 compat and branch sel
  ti-img-rogue-driver_24.1: gcc 14 compat

 .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb       | 4 ++--
 .../powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb       | 2 +-
 .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.45.1


