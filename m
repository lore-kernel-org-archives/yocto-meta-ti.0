Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.3098.1637288700749814061
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GPN4ZO3q;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ2OxdJ025217;
	Thu, 18 Nov 2021 20:24:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637288699;
	bh=rJvuXHhs4NvGhT1GTklNQ23bZfDajiMkULGPdmzt9Hk=;
	h=From:To:Subject:Date;
	b=GPN4ZO3qtdjfDM5fGapwldqR7lptehwkuTygtEjXLFJ4nwgbqNhxS0+6120EFv0ad
	 ijoeyp96ATOQevy/HLe/PiINiEtzA+6Gd9SwkcukpioSNktp4G+APzAtIF9rDWhYpn
	 WpFP90FGBKoWavqLOGH9oqqtje0LcdNEaCz/1v3s=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AJ2Oxqx106890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 20:24:59 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 20:24:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 20:24:59 -0600
Received: from chasm (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ2Oxoj104144;
	Thu, 18 Nov 2021 20:24:59 -0600
Received: from reatmon by chasm with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1mntaE-00059F-Io; Thu, 18 Nov 2021 20:24:58 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 0/4] Bump versions for 08.01.00.005
Date: Thu, 18 Nov 2021 20:24:58 -0600
Message-ID: <20211119022458.19749-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Bump versions for 08.01.00.005

Ryan Eatmon (4):
  u-boot-ti-staging: Bump u-boot version for 08.01.00.005
  linux-ti-staging: Bump linux version for 08.01.00.005
  linux-ti-staging-rt: Bump linux rt version for 08.01.00.005
  ti-linux-fw: Bump ti linux firmware for 08.01.00.005

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.17.1

