Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1348.1626978895798637184
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 11:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=u6OIOuQR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16MIYs8h061056;
	Thu, 22 Jul 2021 13:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626978894;
	bh=neZVzOaKeCOeVZn7pc6oxxEXCeJkceMwhqQRi9/3PaM=;
	h=From:To:Subject:Date;
	b=u6OIOuQRLsJ2Ym1erlQmwxjU+EYHs/RhYAOhI2tBCPk0MkFD+pAxxGdg5Zk6Bv7tw
	 8OVQav3+2UNAaCDYiAGf7z1dRirO36ZaQC/FyQtMCneQpUDhXv2NGUDUwJEGKibJpw
	 ibexCTipqfPoaunwuWvIwbgvlA/lVmGN/LheByjw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16MIYsL7078005
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jul 2021 13:34:54 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Jul 2021 13:34:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Jul 2021 13:34:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16MIYr9w029918;
	Thu, 22 Jul 2021 13:34:53 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Suman Anna
	<s-anna@ti.com>
Subject: [meta-ti][dunfell/master][PATCH] ti-sci-fw: Update to fix ipc firmware load issue
Date: Thu, 22 Jul 2021 18:34:53 +0000
Message-ID: <20210722183453.36410-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

These are the complete changes in the patch
1) Updated the firmware to fix IPC load issue due to resource_table
placement
2) Added the INC_PR
3) Updated the RTOS version

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index f3b59222..9ce9f6c8 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -4,8 +4,11 @@ LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV = "2021.05"
+INC_PR = "r0"
+# RTOS firmware version
+CORESDK_RTOS_VERSION = "08.00.00.32"
 
-SRCREV = "b4a3051362f371c8b6f40a33eca258ef1832bec1"
+SRCREV = "793309716bce2e443f798dd5c5f0d8dd310970c0"
 BRANCH ?= "ti-linux-firmware"
 SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
 SRCREV_FORMAT = "imggen"
-- 
2.17.1

