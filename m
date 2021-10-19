Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.10919.1634655356207681898
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 07:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XRhuMYR4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19JEtsbn121328;
	Tue, 19 Oct 2021 09:55:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634655354;
	bh=+Bz6/D4pfmSnumYGuUuNwhwUznoTArZBBn9y/KoW8I0=;
	h=From:To:Subject:Date;
	b=XRhuMYR4lzOOW1owm7SmtwqeCPl9OQ8qIX2DsZGoMIThjEPRoMP4atde05g9NbCld
	 hEbGXFUEzLo2/oYAoG4MT9U967Paa3E52cexThWdB2LPnGqcgi4watUO5JMSqTywMp
	 WfFA2m4b8nYQj6d9Tfjmu4Jp3X41RmjjZw6vrpOQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19JEtsPf074496
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Oct 2021 09:55:54 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Oct 2021 09:55:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Oct 2021 09:55:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19JEtsJX031767;
	Tue, 19 Oct 2021 09:55:54 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH] ti-linux-fw: AUTOREV support for ti-linux-fw
Date: Tue, 19 Oct 2021 14:55:54 +0000
Message-ID: <20211019145554.48765-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Adds AUTOREV support for ti-linux-fw for nightly builds.
Requires corresponding change in meta-arago branding-bleeding.inc

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index a910af2c..032422ac 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -17,7 +17,9 @@ PRUETH_FW_AM65x_SR2_VERSION = "02.02.09.03"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "1.2.17"
 
-SRCREV = "793309716bce2e443f798dd5c5f0d8dd310970c0"
+TI_LINUX_FW_SRCREV ?= "793309716bce2e443f798dd5c5f0d8dd310970c0"
+SRCREV = "${TI_LINUX_FW_SRCREV}"
+
 BRANCH ?= "ti-linux-firmware"
 SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
 SRCREV_FORMAT = "imggen"
-- 
2.17.1

