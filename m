Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.4852.1609918069011389085
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Jan 2021 23:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rlboGs7Q;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: lokeshvutla@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1067RmRL017213
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Jan 2021 01:27:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1609918068;
	bh=NyqSTb4sHVljpu2Mkt6VnaHWVHDSh5+ZB7TrH7XoOJc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rlboGs7QJ3UkWURrKcqvcTov7Oj0l+QzvoacIFvjzF+1/u9INCi7Dlc8HUeb+EDLs
	 U2xiTHBS4jmQ6DNg9ZPdiBiJF4hgttXaV7vvpgWD5QClw4Boq5n7a+KzpNqj4jYhSa
	 z4HLS9doaG69h/3cvCRK1mYWWlDa3nuZuKtIB/vQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1067Rm6W086188
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Jan 2021 01:27:48 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 Jan
 2021 01:27:48 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 Jan 2021 01:27:48 -0600
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1067Rhnw037873;
	Wed, 6 Jan 2021 01:27:46 -0600
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Dan Murphy <dmurphy@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [dunfell/master] [PATCH 1/4] prueth-fw: Update prueth dual emac firmware to 5.5.13
Date: Wed, 6 Jan 2021 12:57:40 +0530
Message-ID: <20210106072743.23873-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106072743.23873-1-lokeshvutla@ti.com>
References: <20210106072743.23873-1-lokeshvutla@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update the prueth dual emac firmware to 5.5.13 version

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../prueth-fw/{prueth-fw_5.3.9.bb => prueth-fw_5.5.13.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/prueth-fw/{prueth-fw_5.3.9.bb => prueth-fw_5.5.13.bb} (94%)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.3.9.bb b/recipes-bsp/prueth-fw/prueth-fw_5.5.13.bb
similarity index 94%
rename from recipes-bsp/prueth-fw/prueth-fw_5.3.9.bb
rename to recipes-bsp/prueth-fw/prueth-fw_5.5.13.bb
index ec9d7ffc..9526abd4 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_5.3.9.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_5.5.13.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "b19bf13a16d7f5c1260cf4d48cf967e5c7e15128"
+SRCREV = "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.30.0

