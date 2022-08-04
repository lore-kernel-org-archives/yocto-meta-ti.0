Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FA2C48BE4
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:30:05 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.404.1659652201443477768
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 15:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Df4tFUEh;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 274MTxjt034154;
	Thu, 4 Aug 2022 17:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659652199;
	bh=j+M++s+pj69jR/1av3aSFuPGqJO5WsQjcE6gDC/JoY0=;
	h=From:To:Subject:Date;
	b=Df4tFUEhKZjQc3eT1AKSOQIpJUj9tzKHYA9ODgIVvAhCXjF15hZr+6zHYi9z+v7we
	 p5sbRjvjJvdC7B9TKF32N7sIGDW2gelBajiDABjoMj8XqYoDDl8WSDBs9S8/VdNZgM
	 J5pXFKIx+eN2BxHYW5jSLzsUYQoPogffL9z5ZV8A=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 274MTx1R040156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 17:29:59 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 17:29:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 17:29:59 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 274MTxH3030035;
	Thu, 4 Aug 2022 17:29:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oJjLr-0004U8-Fs; Thu, 04 Aug 2022 17:29:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/3] Update to 08.04.01.001
Date: Thu, 4 Aug 2022 17:29:56 -0500
Message-ID: <20220804222959.17202-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Aug 2022 22:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14921

Update linux, linux rt and ti-linux-fw to 08.04.01.001 tag

Ryan Eatmon (3):
  linux-ti-staging: Bump to 08.04.01.001 release
  linux-ti-staging-rt: Bump to 08.04.01.001 release
  ti-linux-fw: Bump to 08.04.01.001 release

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1


