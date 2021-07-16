Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.293.1626467522968865522
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 13:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cDpZGk9B;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16GKW2Gg106655;
	Fri, 16 Jul 2021 15:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626467522;
	bh=pQN8XC9lt26Tj58tRX9GJJKesBRMM1/zt3+CHUyeZ/U=;
	h=From:To:Subject:Date;
	b=cDpZGk9BsS/Zsl71xI/6yzmJV8NXo29E45hlBKZyP8GTdZxY0ZnTFhe7q+d+1qcWP
	 odg1RD7GlQbrMI8n4amTtLoKgPxqJqBGt3cVwRnW4e/+Fd8uf7V0TalsrvW8Cjd34c
	 G2Kgchd4LJ17xewDZbkbA499b8/AvmYS2cZaVHPA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16GKW1um020833
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Jul 2021 15:32:02 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Jul 2021 15:31:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Jul 2021 15:31:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16GKVpWl067757;
	Fri, 16 Jul 2021 15:31:51 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 0/4] core-sdk 08.00.00.003 release update
Date: Fri, 16 Jul 2021 20:31:47 +0000
Message-ID: <20210716203151.3989-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Changes to fix the release version for 08.00.00.003


Yogesh Siraswar (4):
  u-boot-ti-staging: Update the u-boot srcrev to 08.00.00.003
  linux-ti-staging: Update the linux srcrev to 08.00.00.003
  linux-ti-staging-rt: Update linux-rt srcrev to 08.00.00.003
  ti-sci-fw: Update ti-linux-firmware srcrev to 08.00.00.003

 recipes-bsp/ti-sci-fw/ti-sci-fw.inc              | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.17.1

