Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B70DC47074
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 04:05:21 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.42772.1704513920366091027
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 20:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=o90lYAEf;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40645JsT082055
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:05:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704513919;
	bh=3rd/yA/cyuIRWNa8mEsPjtuaqadbaSEKl0kuvXJU2mw=;
	h=From:To:CC:Subject:Date;
	b=o90lYAEfxs7Jp6i+V6Viwznh/PkVAMhWigu904wV6ReMC5XRadMzhOUF35B32U5wC
	 e+KpwFT18bsIGwoTR4bRBykvX4uBz/uHUYjL+e3cx6nmbR7ZCBckNzHuNr88qwyHqM
	 b8+GR2U0PU3V+k/YmudwhY1rAkPPu+1kvcX0rMuA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40645JiE072104
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:05:19 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 22:05:19 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 22:05:19 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40645HFm064807;
	Fri, 5 Jan 2024 22:05:18 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH v2 0/3] powervr: Add j722s support and update preferred provider
Date: Sat, 6 Jan 2024 09:35:09 +0530
Message-ID: <20240106040512.2493439-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 Jan 2024 04:05:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17387

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


