Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.13167.1581440103951247137
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 08:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gdVek+pI;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BGt3o3009945
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Feb 2020 10:55:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581440103;
	bh=v5ZxPZ+a/FjoQbRLoNwV6rMFLk4VTlhsk4qCcoZ7P90=;
	h=From:To:CC:Subject:Date;
	b=gdVek+pI7jTVLqPEjhbb8qYEcyFNlbCuJ+pdKYptOxQ83Lg51Aa2ZUa+2mlgzObZB
	 215rzTxLvhMOsNOvb33GDRVkw17922s+RVXeuX/uqeDP+qXWrCS0DlDQp8vf8egqK2
	 VYmt1fCNIQLndKsEAiLmVEsSYsmhGGcjV3iplGOI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BGt2Qf064915
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Feb 2020 10:55:03 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 10:55:02 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 10:55:03 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BGt2CS083711;
	Tue, 11 Feb 2020 10:55:02 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][zeus/master][PATCH] ti-sgx-ddk-km: Update branch for k5.4 sources
Date: Tue, 11 Feb 2020 11:55:02 -0500
Message-ID: <20200211165502.16502-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the BRANCH and SRCREV to pick the sources for k5.4.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 751dfc74..47581f63 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -7,7 +7,7 @@ inherit module
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
 
-MACHINE_KERNEL_PR_append = "s"
+MACHINE_KERNEL_PR_append = "t"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -16,7 +16,7 @@ DEPENDS = "virtual/kernel"
 
 PROVIDES = "virtual/gpudriver"
 
-BRANCH = "ti-img-sgx/${PV}/k4.19"
+BRANCH = "ti-img-sgx/${PV}/k5.4"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
     file://0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch \
@@ -24,7 +24,7 @@ SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch
 
 S = "${WORKDIR}/git"
 
-SRCREV = "4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d"
+SRCREV = "1cc2eded30f83bfce58c8ccc8cd61005addf9c0b"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
-- 
2.17.1

