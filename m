Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.11299.1615392830908818775
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Mar 2021 08:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZqIAwoah;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8AE2738C046F
	for <meta-ti@yoctoproject.org>; Wed, 10 Mar 2021 16:13:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12AGDnv3080267
	for <meta-ti@yoctoproject.org>; Wed, 10 Mar 2021 10:13:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615392829;
	bh=Iwxc7gw3Sqq9iCU8Rg7gYRt9XtjqV1JvAWMoIMZjA6Y=;
	h=From:To:CC:Subject:Date;
	b=ZqIAwoahUOnnuU3+V/PmJsD+YhoOxVbtqJkGTwff1ghClDbOcA2OM+mL4TrVjcTUK
	 sL2EHPcn9K8tV2WxW7Hf1k0QSmGGNrqzonAlD1gPv2UqjoWYakb4CLAsC6Nn03DM6V
	 o6THayCjCGdzJO/WbpX5my1b7fkpHoZ9xk+IA5FQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12AGDn0n100819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 10 Mar 2021 10:13:49 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 10
 Mar 2021 10:13:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 10 Mar 2021 10:13:49 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12AGDkoo044824;
	Wed, 10 Mar 2021 10:13:46 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>, <praneeth@ti.com>
CC: <lokeshvutla@ti.com>, <kishon@ti.com>, <nsekhar@ti.com>, <hnagalla@ti.com>,
        <saurabhnarang@ti.com>, Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [meta-ti][dunfell PATCH v2] recipes-bsp: wl18xx-fw: update SRCREV to latest
Date: Wed, 10 Mar 2021 21:43:37 +0530
Message-ID: <20210310161337.31072-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the wl18xx firmware recipe to latest version 8.9.0.0.86

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v1:
    * Update the version in the recipe filename

 .../wl18xx-fw/{wl18xx-fw_8.7.3.bb => wl18xx-fw_8.9.0.0.86.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename recipes-bsp/wl18xx-fw/{wl18xx-fw_8.7.3.bb => wl18xx-fw_8.9.0.0.86.bb} (86%)

diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
similarity index 86%
rename from recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
rename to recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
index a52ec898..50b6c297 100644
--- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
+++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
@@ -7,8 +7,7 @@ SRC_URI = " \
 	file://0001-Add-Makefile-to-install-firmware-files.patch \
 "
 
-# Tag: R8.7-SP3 (8.7.3)
-SRCREV = "f659be25473e4bde8dc790bff703ecacde6e21da"
+SRCREV = "5ec05007f2662f460f881c5868311fd3ab7e6e71"
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
-- 
2.17.1

