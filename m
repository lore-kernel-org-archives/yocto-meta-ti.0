Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.2681.1638909273543512808
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 12:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Zn0D2DdN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B7KYSLT042834;
	Tue, 7 Dec 2021 14:34:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638909268;
	bh=6ZyEJWWBVHAB7O096MusgZitXyI+37VoEWNJ9bFNV+4=;
	h=From:To:CC:Subject:Date;
	b=Zn0D2DdNReG1rMJKDjK8hWyIAT09w2ndgV7/sIyoYSOnTthmMSopDucIKcjQbwRcK
	 8bYEqGJLvRKz1HfouxW/KN1rp3EaFrW7VqpmFSLSFMyR3v3mGIfYMjUHuAyYO3U1re
	 1Adcol5d+S81T5fBg9A1ekjYfnUxpUJ+NNYsJhEE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B7KYSJO030238
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Dec 2021 14:34:28 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Dec 2021 14:34:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Dec 2021 14:34:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B7KYRAp005304;
	Tue, 7 Dec 2021 14:34:27 -0600
From: "Nishanth Menon" <nm@ti.com>
To: <denys@konsulko.com>, <yogeshs@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        <praneeth@ti.com>, <aouledameur@baylibre.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell][PATCH 0/2] linux-ti-mainline: Bump up the
Date: Tue, 7 Dec 2021 14:34:24 -0600
Message-ID: <20211207203426.19776-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When we pickedup the update for u-boot to 2021.10, we needed to drop the
hack we put in play for k3-image-gen for AM64x. While at it, we also
should have bumped our kernel rev from 5.13 to 5.15. Since this has been
long overdue, lets do that now.

Nishanth Menon (1):
  Revert "ti-sci-fw: k3-image-gen: Revert SPL address change for
    mainline"

Ryan Eatmon (1):
  linux-ti-mainline: Bump kernel version to v5.15

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc       | 11 ------
 ...-Makefile-Move-the-SPL-Load-address-.patch | 36 -------------------
 recipes-kernel/linux/linux-ti-mainline_git.bb |  8 ++---
 3 files changed, 4 insertions(+), 51 deletions(-)
 delete mode 100644 recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch

-- 
2.31.1

