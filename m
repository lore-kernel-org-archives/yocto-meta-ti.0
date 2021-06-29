Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2312.1624931440570198062
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 18:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=h9YKFSeg;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T1ocxu066736;
	Mon, 28 Jun 2021 20:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624931438;
	bh=2qMiFFK/czezQ3+OM6rTTg33InKyJ+xUlVQiakU72wY=;
	h=From:To:CC:Subject:Date;
	b=h9YKFSegYTUf3FNlRbPf/YmdLX0K8d9QMFxnpXxQ0BJvtFrg2cSY3q2zFSsi1xzM6
	 Ox2B/F7NR/YwOASQFm7/peKaEZYELZozPceirZsEcF7jDiJmd8k5ugSnP7Aqv4ugHM
	 XOqqGTBy3lMfZ3vRwJ0YYSYHM1Qv4cDUu1SAKC0Q=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T1ocOf053586
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Jun 2021 20:50:38 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 20:50:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 20:50:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T1oc8R058036;
	Mon, 28 Jun 2021 20:50:38 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Yogesh Siraswar <yogeshs@ti.com>
Subject: [meta-ti][dunfell/master][PATCH v2 0/4] 08.00.00.001 release updates
Date: Tue, 29 Jun 2021 01:50:34 +0000
Message-ID: <20210629015038.33544-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Changes from previous version:
1) Fixed empty patch subject.
2) Updated the imggen PV version to 2021.05



Yogesh Siraswar (4):
  ti-sci-fw: Update imggen to release 08.00.00.001 tag
  u-boot-ti-staging: Update to 08.00.00.001 release tag
  linux-ti-staging-rt: Update to 08.00.00.001 release tag
  linux-ti-staging: Update to 08.00.00.001 release tag

 recipes-bsp/ti-sci-fw/ti-sci-fw.inc              | 4 ++--
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.17.1

