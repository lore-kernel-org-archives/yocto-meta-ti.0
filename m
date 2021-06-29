Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1465.1624926380909794501
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 17:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VD80DQHw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T0QJnj027990;
	Mon, 28 Jun 2021 19:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624926379;
	bh=ixloUl/Pk5F8dngBGcdNrdFI4UeL7EEqDKjlrqMEmCk=;
	h=From:To:CC:Subject:Date;
	b=VD80DQHwJSBjJZs0sEnpUNERCI5GRDlIE+k8xMIw6z4406wsIhcFxuPfa+G2VSRBX
	 HxXDJcvb/xyRaFEi08NueTRc5f2Kd/bxzXtuB1beiArgZAHYSkhov8G7dbJH6MuiuM
	 vdnAr1DkOgrXHNcE4fN/GD2BrbsiDOJCp+X9hMkw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T0QJn8068720
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Jun 2021 19:26:19 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 19:26:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 19:26:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T0QIoM113426;
	Mon, 28 Jun 2021 19:26:18 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri <praneeth@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 0/4] Release 08.00.00.001 update
Date: Tue, 29 Jun 2021 00:26:14 +0000
Message-ID: <20210629002618.29822-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update for 08.00.00.001 release tag


Yogesh Siraswar (4):
  ti-sci-fw: Update imggen to release 08.00.00.001 tag
  u-boot-ti-staging: Update to 08.00.00.001 release tag
  linux-ti-staging-rt: Update to 08.00.00.001 release tag
  linux-ti-staging: Update to 08.00.00.001 release tag

 recipes-bsp/ti-sci-fw/ti-sci-fw.inc              | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.17.1

