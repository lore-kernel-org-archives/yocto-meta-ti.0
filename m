Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2457.1598984231751173948
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Sep 2020 11:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Z106h9Z+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 081IHBVV101379
	for <meta-ti@lists.yoctoproject.org>; Tue, 1 Sep 2020 13:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598984231;
	bh=u1NBA+kjI1JiBaZyl6CJTkU+9Fv5CoSSmUIrk16yi+M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Z106h9Z+3xtNt2P0UuoaNLNf/Vl7N2hR/6O5llcV2S23VnO6HwfjAgYvxNah2FGdv
	 4dy1K3x2n27Pa4UNO9VFAMdcPcTBbKaY96Zd8KUAGS3/y7SfmVkD4G2NixWyQOr91g
	 YPEj0RJw1izw2is8ehkfaefIcpThD2pzYuPQyj0c=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 081IHBOh072239
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 1 Sep 2020 13:17:11 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Sep
 2020 13:17:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Sep 2020 13:17:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 081IHAsR129566;
	Tue, 1 Sep 2020 13:17:10 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 3/3] ti-sci-fw: upgrade 2020.07-rc2 -> 2020.07-rc3
Date: Tue, 1 Sep 2020 13:16:26 -0500
Message-ID: <20200901181626.23308-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901181626.23308-1-dmurphy@ti.com>
References: <20200901181626.23308-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 019ac9cfd8fc..183ac8a7523d 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -3,11 +3,11 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2020.07-rc2"
+PV = "2020.07-rc3"
 
-SRCREV = "8762ac51ba85781805d607a5df43f44e7d95e827"
+SRCREV = "f5438e998a7a8d23722fa4dcd1cdb62dec7a41d2"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "060498a9bf287260431139f69767f54eff3d159c"
+SRCREV_imggen = "5b4d37b9bf41d58ff8c2f8dc98e5dac25e69ec56"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.28.0

