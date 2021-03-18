Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.2469.1616026950049450452
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 17:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Wq2OB6Wj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12I0MS6w122864;
	Wed, 17 Mar 2021 19:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616026948;
	bh=Sd862ouQRuBc8jWp/8XKaGHjQiDn6YH/Eo0mRs/2I98=;
	h=From:To:CC:Subject:Date;
	b=Wq2OB6Wjyz6tZNkH/17/xDvKKpZ3Nv2toGXn5VbxbTQpANiYYwSBGV5+bU5ii0uLO
	 ueZCd11nZVAgk+g6dt9TkrUZIfjbZhE9voRKRZvejl+P+zm7VkNTfM5qhPo2ogeEGG
	 xt/m3epEqI41J93oTKAfmzFjjY2CzfP2nO8zYFMQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12I0MS0v006117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Mar 2021 19:22:28 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 17
 Mar 2021 19:22:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 17 Mar 2021 19:22:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12I0MSfZ117617;
	Wed, 17 Mar 2021 19:22:28 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
Subject: [dunfell/master PATCH] ti-sci-fw: Update image gen and sysfw to v2021.01a
Date: Wed, 17 Mar 2021 19:22:28 -0500
Message-ID: <20210318002228.31109-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update the image gen and linux-firmware commit SHAs so that
we pick v2021.01a sysfw and the applicable
DM update with following version
* 07.03.00.21 for J721E and J7200

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 108f7133..50eb1f7e 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -3,11 +3,11 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2021.01"
+PV = "2021.01a"
 
-SRCREV = "b7e5d159fd4a5b03a02c8f4b8eb32bad2addf4f5"
+SRCREV = "306e8b92bcce0fe88b494732c0a614079f8ff73a"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "3cd998ff043adf70a50f63115ca1888c62802511"
+SRCREV_imggen = "c376cd495b9821b6e3cb296b1bbae10d0f010817"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

