Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.6644.1607693534698648902
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 05:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ytr2cSnM;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDWDec058112
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Dec 2020 07:32:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607693533;
	bh=BEobsMILf9g2pgtYM8lJLpW/LDM1Mn/PMz/l2ZbC34o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ytr2cSnMQI9QS3dLtugsMPelVMiKmMfHQK5pP4TTRH37/oKdZQzR66DhXLUjLlTQx
	 TICJ3Ml5ZHVghMZCiruf+cyHNAZCm/lJDjY4TL7fIaDM2zSilelG9Y23Fzge3+jrrx
	 puzQ6Hew7WaIZHOZlLmFxhC8U8uMKxtht7nuVnv8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBDWDXX122722
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Dec 2020 07:32:13 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 07:32:13 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Dec 2020 07:32:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDWDrU034553;
	Fri, 11 Dec 2020 07:32:13 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 3/4] u-boot-ti: Update u-boot to pick up AM64 architecture
Date: Fri, 11 Dec 2020 07:32:00 -0600
Message-ID: <20201211133201.10923-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201211133201.10923-1-dmurphy@ti.com>
References: <20201211133201.10923-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 recipes-bsp/u-boot/u-boot-ti.inc                | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 4028a7a93668..15dd32da66f2 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r24"
+PR = "r25"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "4bd43879837910eaf0bf45af7ec5ddfaca203ff4"
+SRCREV = "10dad9df6a0eb00f45bed48c9df0c9effb4fbae5"
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index b7fd246aca6c..1770c3a1bda8 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -65,6 +65,7 @@ SPL_UART_BINARY_keystone = ""
 SPL_UART_BINARY_k3r5 = ""
 SPL_UART_BINARY_lego-ev3 = ""
 SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
+SPL_UART_BINARY_am64xx-evm = ""
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
-- 
2.17.1

