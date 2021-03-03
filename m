Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.981.1614794972064924533
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Mar 2021 10:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kdJX4v+i;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A11D738C0625
	for <meta-ti@yoctoproject.org>; Wed,  3 Mar 2021 18:09:31 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 123I9UOB124983
	for <meta-ti@yoctoproject.org>; Wed, 3 Mar 2021 12:09:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614794970;
	bh=vzDZ/BNg1t1buIcUp560OJiLso0TQ9vp9UNPs8N10J0=;
	h=From:To:CC:Subject:Date;
	b=kdJX4v+i1HttncbFRfcZFJRBl148Qbwl0q90YjM2QCbBpaGE5oV+GyMNG7eP2WiPN
	 /KJCrTKo9ICyiFe+KBd4ZtPl4OrTzFAuMopjC5GzpJpEcWLvk7PqTDevcl90NLtHqS
	 gRWMy0sss9RVCHq4oA7yqnQ24fhyDnY3QkiDLIv8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 123I9UJj079882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 3 Mar 2021 12:09:30 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Mar
 2021 12:09:30 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Mar 2021 12:09:30 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 123I9RLp092727;
	Wed, 3 Mar 2021 12:09:28 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>, <praneeth@ti.com>
CC: <lokeshvutla@ti.com>, <kishon@ti.com>, <nsekhar@ti.com>, <hnagalla@ti.com>,
        <saurabhnarang@ti.com>, Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [meta-ti][PATCH] recipes-bsp: wl18xx-fw: update SRCREV to latest
Date: Wed, 3 Mar 2021 23:39:17 +0530
Message-ID: <20210303180917.12872-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the wl18xx firmware recipe to latest version 8.9.0.0.86

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
index a52ec898..50b6c297 100644
--- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
+++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
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

