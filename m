Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.60391.1643783682977875396
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Feb 2022 22:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XBxvQBAw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2126YcWj029233;
	Wed, 2 Feb 2022 00:34:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643783678;
	bh=0rg0pWYK0Ls9vn8+Jfs+7QkDFM75Cpg4zHk7Q9VJ9dI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XBxvQBAwEujCORdLNNNGKTvhEMFBK721E1DSnQ4bq/3PjkVfoB2lZcC7AGec4aXJb
	 +ywJAJbL/dxZyoJw/c5iaaPxcDhYliPnRkeTZb9jqYJzxDmdZoP3hEFMhCbpbJ5Tfi
	 iYjlC8/FYNkhSMbJg9OL/Fl2mUizjyDigd2WghSc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2126YcSL102362
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 00:34:38 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 00:34:37 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 00:34:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2126Ybhw023473;
	Wed, 2 Feb 2022 00:34:37 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Yogesh Siraswar <yogeshs@ti.com>,
        Ryan Eatmon <reatmon@ti.com>
Subject: [dunfell/master PATCH 1/2] ti-linux-fw: Bump up TIFS and DM to v2022.01
Date: Wed, 2 Feb 2022 00:34:36 -0600
Message-ID: <20220202063437.8036-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202063437.8036-1-praneeth@ti.com>
References: <20220202063437.8036-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update ti-linux-firmware and k3-image-gen to
pick latest TIFS and DM v2022.01

This version also adds support to j721s2

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f1607686..d3819ab9 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -3,8 +3,8 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2021.09a"
-INC_PR = "r1"
+PV = "2022.01"
+INC_PR = "r2"
 
 # Firmware versions
 CORESDK_RTOS_VERSION = "08.01.00.02"
@@ -18,12 +18,12 @@ GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "1.2.17"
 IMG_DEC_FW_VERSION = "1.0"
 
-TI_LINUX_FW_SRCREV ?= "c96a734a059889e571dcf30c0638157c690a6e6e"
+TI_LINUX_FW_SRCREV ?= "6070de0ae4095d291e1f7679d1fe6e07253a2fc3"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "489c767a153ff26e9230746e04dd4b1ad0809901"
+K3_IMAGE_GEN_SRCREV ?= "9abbe130d47a7fa6f8e02b740ad3ad27bc81d327"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
-- 
2.17.1

