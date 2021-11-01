Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.168.1635799598250449055
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 13:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FKXBSafq;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1A1Kkb3W078926;
	Mon, 1 Nov 2021 15:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635799597;
	bh=pa+1wuSZ/b7N7hInqpdURHggIeRIKY7pAZ50GeLWJ0U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FKXBSafqW85k0Z4UyEBmMOMVHTVieIvbPJ1AwAMFb1SxqlZTZ4qll6buiD4t9xCow
	 T246DZtaL7wRmslYHCvMWQMwiCgYllWth5uK13uom9oDTdC+0eWF8LNIrKrAUso/AB
	 +Uhg9vBNBE3zahq27rVot9CvLq92zop+MSW0xrgU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1A1KkbMZ056908
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Nov 2021 15:46:37 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 1
 Nov 2021 15:45:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 1 Nov 2021 15:45:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1A1Kj5LG057060;
	Mon, 1 Nov 2021 15:45:05 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/4] ti-linux-fw: Bump ti linux firmware for 08.01.00.002
Date: Mon, 1 Nov 2021 20:45:03 +0000
Message-ID: <20211101204505.32309-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211101204505.32309-1-yogeshs@ti.com>
References: <20211101204505.32309-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Bump ti-linux-fw version for 08.01.00.002 release

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 56a16e80..47197212 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -7,7 +7,7 @@ PV = "2021.09"
 INC_PR = "r1"
 
 # Firmware versions
-CORESDK_RTOS_VERSION = "08.01.00.01"
+CORESDK_RTOS_VERSION = "08.01.00.02"
 SERDES_FW_VERSION = "3.3.0.2c"
 NETCP_SA_FW_VERSION = "1.0.0"
 NETCP_PA_FW_VERSION = "3.0.2.3"
@@ -17,7 +17,7 @@ PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.06"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "1.2.17"
 
-TI_LINUX_FW_SRCREV ?= "10bcf8564c6e9277e7f402fb02cf941956d0d3eb"
+TI_LINUX_FW_SRCREV ?= "0e93d4df760e5f0948b07c09b68f0b1ecd150d40"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-- 
2.17.1

