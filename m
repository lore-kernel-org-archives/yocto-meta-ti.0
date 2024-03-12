Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7908C54E69
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 15:42:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13402.1710258167246785297
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 08:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BGky4X8g;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42CFgkYH042828;
	Tue, 12 Mar 2024 10:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710258166;
	bh=3nlX1KpSpFVvijcXNc419SM3HM4bohApzHYw4vL68CQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BGky4X8gfO4pqBKKasHJrBdgh0ngULQEhoAIbDppXwQG6IL9PY6avIgl1obLNGBGP
	 HyvxNa+sIC93LW9F/JweTJk+iroyX2c5MDpcrIa0JP8MctW+1xM+VKweOdCGSdz3Kf
	 gZTyAzaAt5htpG4al+uqPxg9JE0ypTmJDdebawNY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42CFgkGN114045
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Mar 2024 10:42:46 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Mar 2024 10:42:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Mar 2024 10:42:46 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42CFgixK010046;
	Tue, 12 Mar 2024 10:42:45 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 5/5] pruprp-fw: Do not make this firmware package machine specific
Date: Tue, 12 Mar 2024 10:42:43 -0500
Message-ID: <20240312154243.17627-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312154243.17627-1-afd@ti.com>
References: <20240312154243.17627-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Mar 2024 15:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17517

This firmware is named so that the correct firmware is chosen on each
machine. No need to split this package for each machine, combine them
into one non-machine-specific package.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb     | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
index 842621f6..9d5136c2 100644
--- a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
@@ -7,12 +7,14 @@ PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-TARGET = ""
-TARGET:ti33x = "am335x-pru0-pruprp-fw.elf am335x-pru1-pruprp-fw.elf"
-TARGET:ti43x = "am437x-pru0-pruprp-fw.elf am437x-pru1-pruprp-fw.elf"
-TARGET:am57xx = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
+TARGET = " \
+	am335x-pru0-pruprp-fw.elf \
+	am335x-pru1-pruprp-fw.elf \
+	am437x-pru0-pruprp-fw.elf \
+	am437x-pru1-pruprp-fw.elf \
+	am57xx-pru0-pruprp-fw.elf \
+	am57xx-pru1-pruprp-fw.elf \
+"
 
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
-- 
2.39.2


