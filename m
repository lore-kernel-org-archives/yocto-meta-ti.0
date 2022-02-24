Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.694.1645744161931107115
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 15:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Nvfnc/ok;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21ON9Kbg077914;
	Thu, 24 Feb 2022 17:09:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645744160;
	bh=WOpIYSK7DMCwPDb2NHfOw0LZf5v0jK9PcOUuvPovB64=;
	h=From:To:Subject:Date;
	b=Nvfnc/okLpN9y3sQDoisSMwTEcS4jQ5Mvt84EZRdeasJ7fb32CE0X0EBwYvaIo5vI
	 b/W6NcYcV6KFqahtRNtKBKaP/FGTXsz8mK+zsa8CBE2WSNip/2SyAw08pZJMSWZ2Xh
	 BxbOxn/hu5cgv5xe35TDw26aHfDKAE91hry1W2Ho=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21ON9KtZ105976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Feb 2022 17:09:20 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Feb 2022 17:09:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Feb 2022 17:09:19 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21ON9J3I122106;
	Thu, 24 Feb 2022 17:09:19 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nNNEd-0004kN-R8; Thu, 24 Feb 2022 17:09:19 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/3] Update to 08.02.00.004
Date: Thu, 24 Feb 2022 17:09:16 -0600
Message-ID: <20220224230919.18203-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update u-boot and integrated lts kernel to 08.02.00.004 tag.

Ryan Eatmon (3):
  linux-ti-staging: Bump to 08.02.00.004 release
  linux-ti-staging-rt: Bump to 08.02.00.004 release
  u-boot-ti-staging: Bump to 08.02.00.004 release

 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

