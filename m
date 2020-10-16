Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.24552.1602876645064698134
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Oct 2020 12:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xwXsO7s3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09GJUhuC083703
	for <meta-ti@lists.yoctoproject.org>; Fri, 16 Oct 2020 14:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602876643;
	bh=/JYoxHKs6ftmB2+bT8AgWaUvbGgIG+A6YzctZkfRP1k=;
	h=From:To:CC:Subject:Date;
	b=xwXsO7s3xE0wdOG+dfwO8LA09mYWWTUwWxBC3C0SHHGrLA/gzXrBuSvmkqGpeGQE5
	 F5eHVsmT3/bliVafINhUR4QSFviqiD1CusMfA4WkD1E+CaUaFwC12gmrZ5jH5S37+X
	 ssZ1+T8Kcng2M2gEdFHdCH6a+WAEAX1TV6b2V8Ok=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09GJUhuT024308
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 16 Oct 2020 14:30:43 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 16
 Oct 2020 14:30:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 16 Oct 2020 14:30:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09GJUfSo074842;
	Fri, 16 Oct 2020 14:30:42 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <s-anna@ti.com>, <d-gerlach@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] ti-sci-fw: Update to 2020.08-rc3 system firmware
Date: Fri, 16 Oct 2020 14:30:36 -0500
Message-ID: <20201016193036.3851-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 7d278815d32a..00e611876733 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -3,11 +3,11 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2020.07-rc3"
+PV = "2020.08-rc3"
 
-SRCREV = "f5438e998a7a8d23722fa4dcd1cdb62dec7a41d2"
+SRCREV = "8a22979dc944f6f4f867e2ac637c51a317efaacd"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "09256d5c21e6281d224646c1d4163d4dd0925238"
+SRCREV_imggen = "36fe2d183a734f65b9adbd3097e5d51a6f931521"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.28.0.585.ge1cfff676549

