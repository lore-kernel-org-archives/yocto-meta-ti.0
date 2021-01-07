Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.416.1610061281284996411
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 15:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SqVaH1pj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107NEemN031733
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 17:14:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610061280;
	bh=jOHtZ/m2KDkEj12DJZ93qxqOukVvhwBguB0ant26OQs=;
	h=From:To:CC:Subject:Date;
	b=SqVaH1pjJcdBYuCQClafWSreB0XmXg8wu4Ic7+qVRSLJ4MLt2HkgrVkyBu1LQrx08
	 qcPz/2Jw+hI+OZ276ykeVjheQQc6o8g+w8FacjIv3g3l1kD7DPwi7mcYHPAc2LPQ3K
	 BR982WPlKKmNCZPCBYkroTMRrXVBKCVhq3PumgKI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107NEeU0122074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 17:14:40 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 17:14:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 Jan 2021 17:14:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107NEcgP074001;
	Thu, 7 Jan 2021 17:14:38 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [master/dunfell PATCH V2] ti-sci-fw: am64x: Update image gen and sysfw to v2020.12
Date: Thu, 7 Jan 2021 17:14:38 -0600
Message-ID: <20210107231438.18812-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update the image gen and sysfw commit SHAs so that am64x picks
v2020.12 version.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
v2: update commit message

 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 174d9539..ae22b7a5 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -4,11 +4,11 @@ LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV = "2020.08b"
-PV_am64xx-evm-k3r5 = "2020.23"
+PV_am64xx-evm-k3r5 = "2020.12"
 
-SRCREV = "078c1bbf3d0a05b4045d4091c32e91ee1ae15ff8"
+SRCREV = "0c268f292f3b3a71d3bd0b367f492304b45e37b1"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "6d023674b0655f1a7bba192d2600c08be314e9ef"
+SRCREV_imggen = "a4796e5f1304fe8197cba54ccea3d18b9998ff02"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

