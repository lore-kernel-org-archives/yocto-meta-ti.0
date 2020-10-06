Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1674.1602010782498470075
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Oct 2020 11:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iyW2eM2g;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096IxfRF070820
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 13:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602010781;
	bh=E5zhHYiaRYQld0zqrJEejofeY/hsbQp2pft6+hfjIJ8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iyW2eM2g8QRD/asYtiektYJ7XSo03aiBMkHx7aIZZkWsQL0xSs4IUVVK752LY3J3X
	 ZtuKto/2hk6tk1XtB1xgikmoh+uSF+KfCeVdgAvhkntgxp5rHp4lhzVMZT922O22ug
	 4RRVPfzp+/1DsKRlgDZjAxw+tKRzligADiWNz/gA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096Ixfmc001164
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 13:59:41 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 13:59:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 13:59:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096IxeJ0106413;
	Tue, 6 Oct 2020 13:59:40 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] u-boot-ti-staging: Update to tag 07.01.00.0003
Date: Tue, 6 Oct 2020 13:59:35 -0500
Message-ID: <20201006185935.15462-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006185935.15462-1-dmurphy@ti.com>
References: <20201006185935.15462-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 477d573d4fde..5b09cb579eff 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r17"
+PR = "r18"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "b9af85263e81f8c2d1441202522842156edaeb96"
+SRCREV = "eea73800730b3d9125f5c12a629db2f88e566b71"
-- 
2.17.1

