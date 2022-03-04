Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.2418.1646431200725964397
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 14:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EaOV/uhC;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 224LxxA8118379;
	Fri, 4 Mar 2022 15:59:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646431199;
	bh=HkZEzyu15iRmZXDwRXOTODZ9J47KFUWpSm1YE579Qos=;
	h=From:To:Subject:Date;
	b=EaOV/uhCfBKhHEu83QAG8DbFkfLAPgzl0lQFVhLJ1pTnMcdniGS073UpmYl7+aDNg
	 yxbHaMf1PKmtIXJCSLYDcHfrppp/F8ffXHowgtSzvllOkwDed52igKPzKYQPaZ9ezg
	 DiGRJcjxF4o7Iz5kxttofyckQ25v7x8u79Oj7Tc0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 224LxxYh013886
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Mar 2022 15:59:59 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 15:59:58 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 15:59:58 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 224LxwQk076443;
	Fri, 4 Mar 2022 15:59:58 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nQFxu-00031I-ER; Fri, 04 Mar 2022 15:59:58 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Update to 08.02.00.005
Date: Fri, 4 Mar 2022 15:59:54 -0600
Message-ID: <20220304215958.11568-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update u-boot, integrated lts kernel and firmware to 08.02.00.005 tag.

Ryan Eatmon (4):
  linux-ti-staging: Bump to 08.02.00.005 release
  linux-ti-staging-rt: Bump to 08.02.00.005 release
  u-boot-ti-staging: Bump to 08.02.00.005 release
  ti-linux-fw: Bump to 08.02.00.005 release

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.17.1

