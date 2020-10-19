Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.9326.1603096585788714808
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 01:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aYTS5IZO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rogerq@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09J8aOun071505
	for <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2020 03:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603096584;
	bh=ww2rVp9KinrIEzsHDx/ovRd2a+Pt+VqVxYOduEjenOo=;
	h=From:To:CC:Subject:Date;
	b=aYTS5IZO0V70UG5A09Mb18DUt5hrzWCha/RrRsTC7a5HsEQpjxFs+KRp2xLJMWvM8
	 iicesc+W6AeXR3FZYACIxyzZADDfi8W9yRGXdIUkaHh5WRdNwEpIq0TT1hzVCkoveW
	 YQCViYp527wgWnkSeEKpvxG2lb+b6PdTp0//Z3BA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09J8aOp0033684
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2020 03:36:24 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 19
 Oct 2020 03:36:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 19 Oct 2020 03:36:24 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09J8aLZt096463;
	Mon, 19 Oct 2020 03:36:22 -0500
From: "Roger Quadros" <rogerq@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>, <dmurphy@ti.com>
CC: <nsekhar@ti.com>, <vigneshr@ti.com>, <lokeshvutla@ti.com>,
        Roger Quadros
	<rogerq@ti.com>
Subject: [dunfell/master PATCH] prusw-fw: Update the firmware to 3.1.6 version
Date: Mon, 19 Oct 2020 11:36:20 +0300
Message-ID: <20201019083620.6665-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the firmware to version 3.1.6

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 recipes-bsp/prusw-fw/{prusw-fw_3.1.4.bb => prusw-fw_3.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/prusw-fw/{prusw-fw_3.1.4.bb => prusw-fw_3.1.6.bb} (94%)

diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb b/recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb
similarity index 94%
rename from recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
rename to recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb
index b8897e4b..6a427f52 100644
--- a/recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
+++ b/recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "b19bf13a16d7f5c1260cf4d48cf967e5c7e15128"
+SRCREV = "f95d048c0a007a5acac706edea4a3ffbfa8ca933"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

