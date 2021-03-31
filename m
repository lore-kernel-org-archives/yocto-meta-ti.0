Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.523.1617235062573502423
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WG/oxt3i;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNverg110378;
	Wed, 31 Mar 2021 18:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617235060;
	bh=I2y6WCMyodttQIOmjC9yO/N66t9U0ovz7YFPTSZI/dA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WG/oxt3iLNAQVbAp4o3FuVzObkRATJoccqGmsuwX1KCarRNmTddLKRzKIM4JJRrTy
	 szMCNtRKDs43Wyg6Ho6MIFz1y1dYU2lTB6Fy3vB/Zh/2ZUldM/cqhKcQzOVOfyBTk9
	 WGYHdsfdaemvnfH4H9ZMKjZ5M59x0u+J7NRi6IdY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNve6d096220
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:57:40 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:57:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:57:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNveE0089340;
	Wed, 31 Mar 2021 18:57:40 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH V2 4/8] conf/machine: am64xx/j7200: Drop trusted-firmware deployment for tar wic
Date: Wed, 31 Mar 2021 18:57:32 -0500
Message-ID: <20210331235736.30481-5-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331235736.30481-1-nm@ti.com>
References: <20210331235736.30481-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

wic and tar dependency on trusted firmware is wrong. It is u-boot build
that depends on trusted firmware deployment and is correctly handled by
u-boot recipe. No point in duplicating that dependency, so just clean it
all up.

Reported-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
New patch
- triggered from https://lists.yoctoproject.org/g/meta-ti/message/13610

 conf/machine/am64xx-evm.conf | 3 ---
 conf/machine/am64xx-sk.conf  | 3 ---
 conf/machine/j7200-evm.conf  | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
index eda310a32b14..788b15abab21 100644
--- a/conf/machine/am64xx-evm.conf
+++ b/conf/machine/am64xx-evm.conf
@@ -8,8 +8,5 @@ IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
 
 UBOOT_MACHINE = "am64x_evm_a53_defconfig"
 
-do_image_wic[depends] += "trusted-firmware-a:do_deploy"
-do_image_tar[depends] += "trusted-firmware-a:do_deploy"
-
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/conf/machine/am64xx-sk.conf b/conf/machine/am64xx-sk.conf
index 4cad8adcf1df..70c9c4f6ae7c 100644
--- a/conf/machine/am64xx-sk.conf
+++ b/conf/machine/am64xx-sk.conf
@@ -8,9 +8,6 @@ IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
 
 UBOOT_MACHINE = "am64x_sk_a53_defconfig"
 
-do_image_wic[depends] += "trusted-firmware-a:do_deploy"
-do_image_tar[depends] += "trusted-firmware-a:do_deploy"
-
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index dab6d8cb0cd8..5a589f305c7c 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -16,8 +16,5 @@ UBOOT_MACHINE = "j7200_evm_a72_config"
 
 IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
 
-do_image_wic[depends] += "trusted-firmware-a:do_deploy"
-do_image_tar[depends] += "trusted-firmware-a:do_deploy"
-
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-- 
2.31.0

