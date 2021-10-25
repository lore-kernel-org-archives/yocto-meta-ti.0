Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.3580.1635197502427820018
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 14:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KI11tzBP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19PLVfqG060828;
	Mon, 25 Oct 2021 16:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635197501;
	bh=RXdtvpPUgbp5HtFO1FOnATV5MB29n/y+FYH0Ov/rKWw=;
	h=From:To:Subject:Date;
	b=KI11tzBPZZFzF1XK6yTeNqvKGjGrPPl6iZI8+Mq9seSEpiu1Ah4bt7jfS6rBlet3d
	 QVu0vNF+IxFrvBa80Cg4Zm/YV3tpt1b7y8+waoCCYmocF3qDFNiWzBsncXFzTCf1kj
	 lyzaQ71R3jpbu/ggqolVSXE5oHGw+/CTwpsEzzrY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19PLVf9d042267
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Oct 2021 16:31:41 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Oct 2021 16:31:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Oct 2021 16:31:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19PLVehS073764;
	Mon, 25 Oct 2021 16:31:40 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/4] Core-sdk 08.01.00.001 release
Date: Mon, 25 Oct 2021 21:31:36 +0000
Message-ID: <20211025213140.17826-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the version for core-sdk 08.01.00.001 release

Yogesh Siraswar (4):
  ti-linux-fw: Bump to 08.01.00.001 release
  u-boot-ti-staging: Bump to 08.01.00.001 release
  linux-ti-staging-rt: Bump to 08.01.00.001 release
  linux-ti-staging: Bump to 08.01.00.001 release

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 10 +++++-----
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  |  4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb |  2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.17.1

