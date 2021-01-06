Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4903.1609918070969794513
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Jan 2021 23:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FScSO6p0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: lokeshvutla@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1067RoM6017234
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Jan 2021 01:27:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1609918070;
	bh=nrKXVrXRvjjMdzb2r29Bh2Rza8ga04hXg5gt+NuFM/0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FScSO6p0+ETJwyKJjnnSSbV5bUdfn7/O9g8RdiPd4k4cUbh/egIFC4aZfeBZvzGGy
	 H9YIIgxKfN6G/xygRnt8EoWo+n5MrkJn03p8QUhZTl3V1ZVbYaNNqo0POwwoUxy23k
	 Lb2vwxxa+xicHQin7uI2oRQKY3ym0eBHtS45UB40=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1067Ro2L086213
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Jan 2021 01:27:50 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 Jan
 2021 01:27:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 Jan 2021 01:27:50 -0600
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1067Rhnx037873;
	Wed, 6 Jan 2021 01:27:48 -0600
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Dan Murphy <dmurphy@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [dunfell/master] [PATCH 2/4] prusw-fw: Update switch firmwares to 3.2.7 version
Date: Wed, 6 Jan 2021 12:57:41 +0530
Message-ID: <20210106072743.23873-3-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106072743.23873-1-lokeshvutla@ti.com>
References: <20210106072743.23873-1-lokeshvutla@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update prueth switch firmwares to 3.2.7 version

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 recipes-bsp/prusw-fw/{prusw-fw_3.1.6.bb => prusw-fw_3.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/prusw-fw/{prusw-fw_3.1.6.bb => prusw-fw_3.2.7.bb} (94%)

diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb b/recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
similarity index 94%
rename from recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb
rename to recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
index 6a427f52..17de58c2 100644
--- a/recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb
+++ b/recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "f95d048c0a007a5acac706edea4a3ffbfa8ca933"
+SRCREV = "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.30.0

