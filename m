Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC44BC433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 13:20:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.28481.1652707238915194642
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 May 2022 06:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Jne40DuI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24GDKaSD093703;
	Mon, 16 May 2022 08:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652707236;
	bh=t8PMLT0MEBaz6s/YeiXiK3rgP59/uA+aTk4QRvNsaRU=;
	h=From:To:Subject:Date;
	b=Jne40DuIjSof8pCDZ/bL+DcpdKwDCnrQLlE8xd/JERcXCW/idVyq+Gnu80rAaFrtd
	 6P1jYcq/2784pyYymFykzfH4aoztifKRErQSYdQHTCKyKXbywCEmySCG0ymphh4u0f
	 3SgxJBpE4Zv8mBMTIMRzGUM8d5PqxsqPnq8NO+QY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24GDKaRt014256
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 May 2022 08:20:36 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 16
 May 2022 08:20:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 16 May 2022 08:20:36 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24GDKaxw099315;
	Mon, 16 May 2022 08:20:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nqaeK-0007ju-2M; Mon, 16 May 2022 08:20:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to 08.03.00.004
Date: Mon, 16 May 2022 08:20:32 -0500
Message-ID: <20220516132036.29708-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 May 2022 13:20:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14742

Update u-boot, linux, linux rt and ti-linux-fw to 08.03.00.004 tag

Ryan Eatmon (4):
  u-boot-ti-staging: Bump to 08.03.00.004 release
  linux-ti-staging: Bump to 08.03.00.004 release
  linux-ti-staging-rt: Bump to 08.03.00.004 release
  ti-linux-fw: Bump to 08.03.00.004 release

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.17.1


