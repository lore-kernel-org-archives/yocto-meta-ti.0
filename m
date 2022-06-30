Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D84C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 12:19:31 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.24464.1656591564021555397
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 05:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vVyVkaFh;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UCJMNx115389;
	Thu, 30 Jun 2022 07:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656591562;
	bh=D1Cj9+e0LWrcc7NS1uVKBKgTwPg7QPuA1aUbBaXvhMU=;
	h=From:To:Subject:Date;
	b=vVyVkaFh4IVZFyhAfhDpcgf1Pd767z7UnAJgtoWKC62FCQBVE1iGSPe2IMqbteHHc
	 //wQiY+nE5flBPUyXxXpji8yzdsHwNFfv3SAC4vp12Uyyed2EAt89c1vR+Grd8dKP1
	 yD/R8zWkLbQtsSbTkqrUNZkWxDWvIijbB0r+2Ysk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UCJMMQ048350
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 07:19:22 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 07:19:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 07:19:22 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UCJM17051513;
	Thu, 30 Jun 2022 07:19:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o6t8k-0006fz-7B; Thu, 30 Jun 2022 07:19:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to 08.04.00.003
Date: Thu, 30 Jun 2022 07:19:18 -0500
Message-ID: <20220630121922.25624-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jun 2022 12:19:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14851

Update u-boot, linux, linux rt and ti-linux-fw to 08.04.00.003 tag

Ryan Eatmon (4):
  u-boot-ti-staging: Bump to 08.04.00.003 release
  linux-ti-staging: Bump to 08.04.00.003 release
  linux-ti-staging-rt: Bump to 08.04.00.003 release
  ti-linux-fw: Bump to 08.04.00.003 release

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.17.1


