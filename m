Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.4152.1645139631805161524
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 15:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BLn6RkRu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21HNDn5I076475;
	Thu, 17 Feb 2022 17:13:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645139629;
	bh=50N+eS/YhCDepwMaeeS+DsoMU9FkI3FNS8VTbrTNec0=;
	h=From:To:Subject:Date;
	b=BLn6RkRuMBckeNemhNPvvOeZWn1T/az8vKT5V5adnGBCBygkNWIpfodmcteweKJ8Y
	 7xHKw99Z9BNFxgG4ddAuWAKLBG1c2iBm9pAxE7GSmbseNuelWeG4PdeVw0cr4SFXmd
	 Z0HW+k7T6JGVjE/jKoYrCRd/UJH2rUM5Bw23ltY0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21HNDmAQ085506
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Feb 2022 17:13:49 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 17
 Feb 2022 17:13:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 17 Feb 2022 17:13:48 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21HNDm1G123647;
	Thu, 17 Feb 2022 17:13:48 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nKpy8-0006ni-C3; Thu, 17 Feb 2022 17:13:48 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to 08.02.00.003
Date: Thu, 17 Feb 2022 17:13:44 -0600
Message-ID: <20220217231348.26098-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update u-boot, integrated lts kernel and firmware to 08.02.00.003 tag.

Ryan Eatmon (4):
  ti-linux-fw: Bump to 08.02.00.003 release
  linux-ti-staging: Bump to 08.02.00.003 release
  linux-ti-staging-rt: Bump to 08.02.00.003 release
  u-boot-ti-staging: Bump to 08.02.00.003 release

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.17.1

