Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.3073.1619038408658096028
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 13:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kax9a/OR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13LKrRWT042590;
	Wed, 21 Apr 2021 15:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619038407;
	bh=ZNR9zYBSmC8Ohq1xBGEYbumvWM1PxGQjhVUwNcs1dyw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kax9a/ORHbMC0bNI4M4H00BGo4NRbjVpv4wlk3fWbBuUw2u6JJ52jXXONJuV+1G07
	 7dHiPn9fTJrzrAd9bHYOfXiMSdhJliedZ/QsnZTmTwSVLKgvht21KnWzxZoheJWfdX
	 IEV0rmB+fDxSAfT3dO2qmjHG8+7w0QfWwGBUQVo0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13LKrRHA112082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Apr 2021 15:53:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 21
 Apr 2021 15:53:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 21 Apr 2021 15:53:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13LKrRIY000376;
	Wed, 21 Apr 2021 15:53:27 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Suman Anna <s-anna@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Nishanth Menon
	<nm@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 1/4] cmem: Update to new version 4.20.00.00
Date: Wed, 21 Apr 2021 15:53:23 -0500
Message-ID: <20210421205326.22047-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421205326.22047-1-praneeth@ti.com>
References: <20210421205326.22047-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

The update brings the fix for 5.10.x linux kernel.
commit 8aba20e20bf7 ("cmemk: Fix build errors for 5.10+ kernels")

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/cmem/cmem.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index c2719403..385e1084 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=26be509e4bb413905bda8309e338e2b1"
 
 BRANCH = "master"
-# This corresponds to version 4.16.00.00
-SRCREV = "4f970f053b42e8d2a6f1a8cd4b14786196468fd3"
+# This corresponds to version 4.20.00.00
+SRCREV = "b0b57a4e810d27cbb23cb752ef437019f56a5506"
 
-PV = "4.16.00.00+git${SRCPV}"
+PV = "4.20.00.00+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
-- 
2.17.1

