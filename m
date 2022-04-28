Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8482CC4332F
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 00:24:21 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.4243.1651105459141679612
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 17:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oyA/NX2e;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23S0OH4f086588;
	Wed, 27 Apr 2022 19:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651105457;
	bh=vDcIyo2bvF2SoqRkeQHQuvmx3WLvX0Xj4/EwjGYvpck=;
	h=From:To:Subject:Date;
	b=oyA/NX2e1PSBkS0caPm6Nri70YYdKYyzcXcy2Xatzg3ot+5zXLM8ckFn9mTvO4Iz3
	 eQzjdl3vRtPy/8L8I2tuKQ+ZTGrVbULJQHx9S8xOSdQjNhJ2aGT/Fk8zmV+1PCE/6q
	 1Ys4jyUHKxxdFmiPelzGEF578pgATfGALNFd4lGE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23S0OHTF102676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Apr 2022 19:24:17 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 19:24:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 19:24:17 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23S0OHlQ031736;
	Wed, 27 Apr 2022 19:24:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1njrxA-0007rv-ON; Wed, 27 Apr 2022 19:24:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to 08.03.00.002
Date: Wed, 27 Apr 2022 19:24:12 -0500
Message-ID: <20220428002416.30029-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Apr 2022 00:24:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14623

Update u-boot, linux, linux rt and ti-linux-fw to 08.03.00.002 tag

Ryan Eatmon (4):
  u-boot-ti-staging: Bump to 08.03.00.002 release
  linux-ti-staging: Bump to 08.03.00.002 release
  linux-ti-staging-rt: Bump to 08.03.00.002 release
  ti-linux-fw: Bump to 08.03.00.002 release

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.17.1


