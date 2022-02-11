Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.6645.1644583411316080330
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 04:43:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KpyBSgLr;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21BChUKO086390;
	Fri, 11 Feb 2022 06:43:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644583410;
	bh=7HdNuVbAIAw393Zj7V0bppSCLYa/O1eaW63kSN8VhI8=;
	h=From:To:Subject:Date;
	b=KpyBSgLr+OVtWuTIeIJJbZRrw60jFvIREtp2jGH+Ncb1ndtk/bRqiQ5+jTdfG8U4Q
	 EctC2DvTNQzDVuXmm71Lu50jNWzQeCmPgLS2Yh9s/F2rm9nSNqsifIGzL+IfZnaAbz
	 IdtQd3e1dvlALP3nY7kv5voTooWnggYV/aPc5fr0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21BChTEC109427
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Feb 2022 06:43:29 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 11
 Feb 2022 06:43:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 11 Feb 2022 06:43:29 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21BChTmc033915;
	Fri, 11 Feb 2022 06:43:29 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nIVGr-0003JW-01; Fri, 11 Feb 2022 06:43:29 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to 08.02.00.002
Date: Fri, 11 Feb 2022 06:43:24 -0600
Message-ID: <20220211124328.12693-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update u-boot, integrated lts kernel and firmware to 08.02.00.002 tag.

Ryan Eatmon (4):
  linux-ti-staging: Bump to 08.02.00.002 release
  linux-ti-staging-rt: Bump to 08.02.00.002 release
  u-boot-ti-staging: Bump to 08.02.00.002 release
  ti-linux-fw: Bump to 08.02.00.002 release

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.17.1

