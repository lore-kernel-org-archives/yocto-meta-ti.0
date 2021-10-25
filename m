Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.3540.1635197502575857028
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 14:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oONsMdF7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19PLVfpU044150;
	Mon, 25 Oct 2021 16:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635197501;
	bh=h2WbTMKKicq8nDrpX8nyu9EMxeDlsnL7VNi/5DuzGig=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oONsMdF7YWsCnJJToPvx6b1RuGdFJwuOeL7UdEODfgfQYIBgyczKESJVmP1uy2Fdu
	 k0BnrQ/ufLlo/5rns9iGsra/0pwlYx0I3QqdG/Y3BH5v2A8qMbyiHYk9HN7H0r797g
	 X3KdHKSJrA8yUnxNjLsMR59HRHjx/NPekKDMmvws=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19PLVfT8067680
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Oct 2021 16:31:41 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Oct 2021 16:31:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Oct 2021 16:31:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19PLVeS7029824;
	Mon, 25 Oct 2021 16:31:40 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] ti-linux-fw: Bump to 08.01.00.001 release
Date: Mon, 25 Oct 2021 21:31:37 +0000
Message-ID: <20211025213140.17826-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025213140.17826-1-yogeshs@ti.com>
References: <20211025213140.17826-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the firmware version for 08.01.00.001

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 80177f06..56a16e80 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -3,25 +3,25 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2021.05"
+PV = "2021.09"
 INC_PR = "r1"
 
 # Firmware versions
-CORESDK_RTOS_VERSION = "08.00.00.32"
+CORESDK_RTOS_VERSION = "08.01.00.01"
 SERDES_FW_VERSION = "3.3.0.2c"
 NETCP_SA_FW_VERSION = "1.0.0"
 NETCP_PA_FW_VERSION = "3.0.2.3"
 QMSS_PDSP_FW_VERSION = "1.0.0.9"
 PRUETH_FW_AM65X_VERSION = "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.03"
+PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.06"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "1.2.17"
 
-TI_LINUX_FW_SRCREV ?= "793309716bce2e443f798dd5c5f0d8dd310970c0"
+TI_LINUX_FW_SRCREV ?= "10bcf8564c6e9277e7f402fb02cf941956d0d3eb"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
+SRCREV_imggen = "e182c3114f11eea3ec7ebb88cb1ef563a78d4eda"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

