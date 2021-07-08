Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.7894.1625721154880156700
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 22:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=E84A86Jn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1685CXkW119069;
	Thu, 8 Jul 2021 00:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625721153;
	bh=Vc6EwbmicfBv1nfgwrO5hFbPK/ILgx9W46w8nDJQN6I=;
	h=From:To:CC:Subject:Date;
	b=E84A86Jnn17NjSKiQCALPpgKDvQ+MPw3Ait9mbr6rCuMtbSzH9a6zxD3tQxSI7P6T
	 +spmOvPpuiM/5M9V3z30HohIv2kp+2ZZlfbWC7ZTJGDth3/cfViLRRmT7YoXsqDaFk
	 sMqqUGpDq5Duax3J5RqFpZiKuGYcVuCVSfqBpZnU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1685CX5F103840
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jul 2021 00:12:33 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 00:12:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Jul 2021 00:12:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1685CWJL089129;
	Thu, 8 Jul 2021 00:12:32 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Yogesh Siraswar <yogeshs@ti.com>
Subject: [meta-ti][dunfell/master][PATCH 0/4] 08.00.00.002 release update
Date: Thu, 8 Jul 2021 05:12:28 +0000
Message-ID: <20210708051232.10077-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Changes to fix the kernel, u-boot and firmware to 08.00.00.002 release
tag. 

Yogesh Siraswar (4):
  linux-ti-staging: Update to 08.00.00.002 release tag
  linux-ti-staging-rt: Update to 08.00.00.002 release tag
  u-boot-ti-staging: Update to 08.00.00.002 release tag
  ti-sci-fw: Update linux firmware repo to 08.00.00.002

 recipes-bsp/ti-sci-fw/ti-sci-fw.inc              | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.17.1

