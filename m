Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.60157.1638835865438870038
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 16:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qGMLL6Wf;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B70Axef078851;
	Mon, 6 Dec 2021 18:10:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638835859;
	bh=SlUF1OG/eFshicAc8dULSR2l5WVGmH7ikb1qXz457Yo=;
	h=From:To:CC:Subject:Date;
	b=qGMLL6Wfgy+aQxPxqiDHQSkPSn0Arl8vL3Mz4e/d0L5Kc2cOgMbn/e5Cvlp9rYgVJ
	 5iIue5eI4E4g+Up5jToye/BHQEh6s4sU917iBIrNzeQ/kXm5Kb1m/pi8Gm2WLP2ms8
	 Cq/MqXJISoRrGt/erou1atw1Lh1yCbjNyDfRHQ8o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B70AxwB015979
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Dec 2021 18:10:59 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Dec 2021 18:10:59 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Dec 2021 18:10:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B70Axxo003651;
	Mon, 6 Dec 2021 18:10:59 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 0/2] Update to 08.01.00.006
Date: Mon, 6 Dec 2021 18:10:57 -0600
Message-ID: <20211207001059.5572-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update u-boot and intergrated lts kernel to 08.01.00.006 tag.
This contains key updates
* am64 HS boot fix in Uboot
* j721e-sk r5f split-mode fix in Uboot
* j721e codec multinode build fix in kernel
* am57 display fixes in kernel

Praneeth Bajjuri (2):
  linux-ti-staging: Bump linux version for 08.01.00.006
  u-boot-ti-staging: Bump u-boot version for 08.01.00.006

 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

