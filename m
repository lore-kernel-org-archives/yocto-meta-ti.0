Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.366.1644248392658688480
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 07:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ukjWbPdW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 217FdppW085041;
	Mon, 7 Feb 2022 09:39:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644248391;
	bh=mL12lfV3r8xfy/eNgHrgnM6RqzFWwocicJCMXTJKzfQ=;
	h=From:To:Subject:Date;
	b=ukjWbPdWxJ+F4yVQvQdNMvGsBtw68x44QmJk4eyy8K4KqYBZ9KtyPquu8KElKs/xA
	 JHvVAnN2YtEieIvWva3+WBCLHalWVV+jCAob0+nc1VdlGEwd0Bs7mkC1oBGmMPxlbL
	 wkAHzpc7eCJkTjNFirIOhViwlYdZvlCLS0TPO+tQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 217Fdo9K007423
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Feb 2022 09:39:50 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 7
 Feb 2022 09:39:50 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 7 Feb 2022 09:39:50 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 217FdoSQ041379;
	Mon, 7 Feb 2022 09:39:50 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nH67K-0005nv-84; Mon, 07 Feb 2022 09:39:50 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 0/3] Update to 08.02.00.001
Date: Mon, 7 Feb 2022 09:39:47 -0600
Message-ID: <20220207153950.22274-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update u-boot and integrated lts kernel to 08.02.00.001 tag.
This contains updates for:
* j721s2

Ryan Eatmon (3):
  linux-ti-staging: Bump to 08.02.00.001 release
  linux-ti-staging-rt: Bump to 08.02.00.001 release
  u-boot-ti-staging: Bump to 08.02.00.001 release

 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

