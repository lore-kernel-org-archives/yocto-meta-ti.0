Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.659.1641421899931948293
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 14:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nF1AlcPU;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 205MVZUd127089;
	Wed, 5 Jan 2022 16:31:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1641421895;
	bh=p+MaVMkAAhO9yg8y+Sl3XiBMLLF7hOl9Qcxp1TMuH24=;
	h=From:To:CC:Subject:Date;
	b=nF1AlcPUMb5U7qqEi6r2LyXHrFMR5Z9wWBB8yN9axOkIxwztnUGw2rlXsAOTWo5tO
	 Q+1AtVw5debhlkBRRdx67t7OqkbvfQeYBZlEy+3b0/Oisz8eZ86WOmpWu11CLiqAKt
	 8IMUu1dC6SuuuOPy/gn1ulmB9iOxlP2Z6GspDVt0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 205MVZoV067261
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jan 2022 16:31:35 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 5
 Jan 2022 16:31:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 5 Jan 2022 16:31:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 205MVZeQ016870;
	Wed, 5 Jan 2022 16:31:35 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <denis@denix.org>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
Date: Wed, 5 Jan 2022 16:31:35 -0600
Message-ID: <20220105223135.4571-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update to the latest commit of ti-u-boot-2021.01
picked the following K3 device fixes from upstream to ti-u-boot.

a63ade175d arm: mach-k3: common: Add a release_resources_for_core_shutdown() stub
74f85260c9 firmware: ti_sci: Include linux/err.h in ti_sci_protocol.h
4cfd609f8d spl: fit: Skip attempting to load 0 length image
816bdfe256 arm: mach-k3: common: Make sure firmware sections are loaded prior to armv8 startup

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index d304df87..164bf6c1 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r16"
+PR = "r17"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "15769936a559b1840f50b83f94ee0c636b245001"
+SRCREV = "a63ade175db712490633255f72aee8cbdb4845a0"
-- 
2.17.1

