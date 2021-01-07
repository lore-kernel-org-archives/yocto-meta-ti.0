Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.3180.1609987047789992637
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Jan 2021 18:37:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=moncG8+2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1072bQea028029
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Jan 2021 20:37:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1609987046;
	bh=w60E4Z24r9OjlYHhcpqArrQIEdbtUE07vbGlHctHvLY=;
	h=From:To:CC:Subject:Date;
	b=moncG8+2OMIWS8rsKmiB31D7ysDf+hbic0GgOzdB8EdH1JAkpNbPcJhN3Et4GXPHT
	 Kl1RHn0pm+sqjv+yQphr3d0/6is0TFCKwxA6MB+tG+F6W1Sek9CvPwYzObX0CRK6D6
	 fGdMogPVRJVLPpW0IZBHcTqev0uzVUWQ3XnOSpuc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1072bQEX093055
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Jan 2021 20:37:26 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 Jan
 2021 20:37:26 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 Jan 2021 20:37:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1072bQcU041147;
	Wed, 6 Jan 2021 20:37:26 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-sci-fw: Update image gen and sysfw commit SHA
Date: Wed, 6 Jan 2021 20:37:26 -0600
Message-ID: <20210107023726.5867-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update the image gen and sysfw commit SHAs

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
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

