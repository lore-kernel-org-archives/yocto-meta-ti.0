Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.6612.1634123673974065729
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Oct 2021 04:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kUZjgAnj;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19DBEWCN109253;
	Wed, 13 Oct 2021 06:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634123672;
	bh=lVUaXOXzu4+KUVBqL/ijlJOz2TW5AoY0Uhixm4BLTLg=;
	h=From:To:Subject:Date;
	b=kUZjgAnj+GmV3dxUbYu5tH2ldrr4iDeBA2jZoTANpBOBLDLz2q88Hj1FpWcUbyO78
	 qrMu5lexBGOSXFcvQGV8ytNXgfHuOGnFvR5xoZqLh8jUaGjlJCjmGpnK9tOZDT7OxM
	 u/T7Z0A89wIfwo8p2j4ohstIaXleLiMbkaYQEokA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19DBEWwm071908
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Oct 2021 06:14:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 13
 Oct 2021 06:14:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 13 Oct 2021 06:14:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19DBEWZK059215;
	Wed, 13 Oct 2021 06:14:32 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell PATCH v2 0/2] ReIntroduce missing dtb and dtbo
Date: Wed, 13 Oct 2021 11:14:30 +0000
Message-ID: <20211013111432.62301-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add missing dtb and dtbo for AM57xx and DRA7xx

Yogesh Siraswar (2):
  conf: dra7xx-evm: ReIntroduce existent dtb* for 5.10
  conf: am57xx-evm: ReIntroduce existent dtb* for 5.10

 conf/machine/am57xx-evm.conf | 6 +++++-
 conf/machine/dra7xx-evm.conf | 8 ++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.17.1

