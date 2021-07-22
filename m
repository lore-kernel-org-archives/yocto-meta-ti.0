Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2992.1626986588622481975
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 13:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=A8e3WPt0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16MKh7sW067228;
	Thu, 22 Jul 2021 15:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626986587;
	bh=4xY98bie5dURam+kF/qY40RqXysXHuAzOCEiwIQBiZ4=;
	h=From:To:Subject:Date;
	b=A8e3WPt0spmPR140MaUOPURZHfwdLUVdQekUpzPdp6q7XlL38BjaGmOThmf7mXGXc
	 g7krZv7hgatOBfc4dUi/1qzujeBAWNOfULkdie5gQ6nzyLTEmeQvtlzJAlaDvC9xI3
	 89rTYZLYjqQj1NknIcUF/0UnEVeKljbLp9xBzJdw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16MKh7ET070322
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jul 2021 15:43:07 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Jul 2021 15:43:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Jul 2021 15:43:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16MKh6fX012369;
	Thu, 22 Jul 2021 15:43:06 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 0/3] 08.00.00.004 Release update
Date: Thu, 22 Jul 2021 20:43:03 +0000
Message-ID: <20210722204306.37166-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Changes to fix the commit-id for 08.00.00.004 release
The firmware update was provided as a seprate patch

Yogesh Siraswar (3):
  u-boot-ti-staging: Updated the u-boot to 08.00.00.004 release
  linux-ti-staging: Update linux to 08.00.00.004 release
  linux-ti-staging-rt: Update linux rt to 08.00.00.004 release

 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

