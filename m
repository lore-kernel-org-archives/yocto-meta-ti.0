Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2063BC47074
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 04:13:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.42858.1704514419022204764
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 20:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hiiC0v8f;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4064Dcpf083078
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:13:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704514418;
	bh=3rd/yA/cyuIRWNa8mEsPjtuaqadbaSEKl0kuvXJU2mw=;
	h=From:To:CC:Subject:Date;
	b=hiiC0v8fHgFWBVZnquYk9auiky9AEUAb1NpwD1cQMNRPU8PZmXiz6byanKSz+4+2R
	 LOs1i2RKkeKRic7+suHImYhFdtPZaCnq9wcA2NntdMzZQL8HErFHbhm036KNgNvNNq
	 +Z1/VlIGctBFDW9sl8WNxRUTeGJHJiovfG104VkM=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4064Dce7024264
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:13:38 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 22:13:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 22:13:37 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4064DZEd091309;
	Fri, 5 Jan 2024 22:13:36 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master][PATCH v2 0/3] powervr: Add j722s support and update preferred provider
Date: Sat, 6 Jan 2024 09:43:30 +0530
Message-ID: <20240106041333.2494307-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 Jan 2024 04:13:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17391

Changes from v1:
  split the recipe update into 2 commits, one for srcrev another for build support

Darren Etheridge (3):
  meta-ti: powervr: Bump srcrev to include j722s support
  meta-ti: powervr: Enable building for j722s
  meta-ti-bsp: j722s: add Rogue GPU driver to machine defintion

 meta-ti-bsp/conf/machine/include/j722s.inc                   | 2 +-
 .../powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb      | 5 +++--
 .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb       | 5 +++--
 3 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.34.1


