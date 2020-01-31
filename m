Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.1396.1580498474074960022
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JUV7xoYk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJLDn4102650
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:21:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580498473;
	bh=vmT+ONu436KhRIwstEQ9KJbPDIQY1GmNeTuUQzl8qGY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JUV7xoYkkYocYa6Ku2YKmPheEK4YkB2ItchtGqvwiN1UlmbPjCqf+9gxV+EM57lAU
	 FvinFIuGtqk2U3SMTDenk7k42Um5+gJMKT8F7BVwCpCXBCPXgWgtPkvuL1uXgXda5+
	 QDdBmmWxsYno8QeymTe6kg1gilhyGt80FmS5Fpyg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VJLDS0033674
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:21:13 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:21:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:21:13 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJLCed002626;
	Fri, 31 Jan 2020 13:21:12 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][master][PATCH 2/3] Move Graphics and Multimedia drivers and apps out of recipes-bsp
Date: Fri, 31 Jan 2020 14:21:10 -0500
Message-ID: <20200131192111.29813-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131192111.29813-1-afd@ti.com>
References: <20200131192111.29813-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

recipes-bsp is looking a bit random at the moment, lets move graphics
recipies into recipes-graphics and some multimedia related ones into
recipes-multimedia.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../{ti-img-encode-decode => vxd-dec-fw}/vxd-dec-fw_git.bb        | 0
 .../ti-img-rogue-driver/0001-km-support-general-toolchain.patch   | 0
 .../ti-img-rogue}/ti-img-rogue-driver_1.10.5371573.bb             | 0
 .../{libgles => ti-img-rogue}/ti-img-rogue-umlibs_1.10.5371573.bb | 0
 ...001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 0
 .../ti-img-sgx}/ti-sgx-ddk-km_1.17.4948957.bb                     | 0
 .../{libgles => ti-img-sgx}/ti-sgx-ddk-um_1.17.4948957.bb         | 0
 .../ti-vivante-gc320}/ti-gc320-driver_5.0.11.p7.bb                | 0
 .../{libgal => ti-vivante-gc320}/ti-gc320-libs_5.0.11.p7.bb       | 0
 .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb            | 0
 .../ti-img-encode-decode/viddec-test-app_1.0.0.bb                 | 0
 .../ti-img-encode-decode/videnc-test-app_1.0.0.bb                 | 0
 12 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-bsp/{ti-img-encode-decode => vxd-dec-fw}/vxd-dec-fw_git.bb (100%)
 rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-rogue}/ti-img-rogue-driver/0001-km-support-general-toolchain.patch (100%)
 rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-rogue}/ti-img-rogue-driver_1.10.5371573.bb (100%)
 rename recipes-graphics/{libgles => ti-img-rogue}/ti-img-rogue-umlibs_1.10.5371573.bb (100%)
 rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-sgx}/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch (100%)
 rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-sgx}/ti-sgx-ddk-km_1.17.4948957.bb (100%)
 rename recipes-graphics/{libgles => ti-img-sgx}/ti-sgx-ddk-um_1.17.4948957.bb (100%)
 rename {recipes-bsp/gc320-drivers => recipes-graphics/ti-vivante-gc320}/ti-gc320-driver_5.0.11.p7.bb (100%)
 rename recipes-graphics/{libgal => ti-vivante-gc320}/ti-gc320-libs_5.0.11.p7.bb (100%)
 rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb (100%)
 rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/viddec-test-app_1.0.0.bb (100%)
 rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/videnc-test-app_1.0.0.bb (100%)

diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
similarity index 100%
rename from recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
rename to recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
similarity index 100%
rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
rename to recipes-graphics/ti-img-rogue/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
similarity index 100%
rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
rename to recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/ti-img-rogue/ti-img-rogue-umlibs_1.10.5371573.bb
similarity index 100%
rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
rename to recipes-graphics/ti-img-rogue/ti-img-rogue-umlibs_1.10.5371573.bb
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
similarity index 100%
rename from recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
similarity index 100%
rename from recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
similarity index 100%
rename from recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-graphics/ti-vivante-gc320/ti-gc320-driver_5.0.11.p7.bb
similarity index 100%
rename from recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
rename to recipes-graphics/ti-vivante-gc320/ti-gc320-driver_5.0.11.p7.bb
diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/ti-vivante-gc320/ti-gc320-libs_5.0.11.p7.bb
similarity index 100%
rename from recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
rename to recipes-graphics/ti-vivante-gc320/ti-gc320-libs_5.0.11.p7.bb
diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
similarity index 100%
rename from recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
rename to recipes-multimedia/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/viddec-test-app_1.0.0.bb
similarity index 100%
rename from recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
rename to recipes-multimedia/ti-img-encode-decode/viddec-test-app_1.0.0.bb
diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/videnc-test-app_1.0.0.bb
similarity index 100%
rename from recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
rename to recipes-multimedia/ti-img-encode-decode/videnc-test-app_1.0.0.bb
-- 
2.17.1

