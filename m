Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6075EC35FF3
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 21:27:17 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1336.1741901230823742583
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 14:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tRdTdIzz;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DLR9ID1977575
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 16:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741901229;
	bh=1kMrmu9cRUr3ArOUGvSzJROyD1k6DqRaW3C0CuGuZrQ=;
	h=From:To:CC:Subject:Date;
	b=tRdTdIzz6/ZXsrfTj0pOvkAMR7kcXsJ8kqo8hzY6dLYOgpszcz8tjiAuXsh/Io02i
	 2RbqxP71W5Mva2Cso1DycyF+WjYxatjXN3MGt3pG97gkdkAMC30hUsmTA8BK/Co2P7
	 sAy8j7kYZkrp+iYU2nmOYvJbyWDKYE3QQF/V9bjU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DLR9Ip039681
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 16:27:09 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 16:27:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 16:27:09 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DLR96A122692;
	Thu, 13 Mar 2025 16:27:09 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] meta-ti-bsp: zephyr-fw: Update Zephyr to latest with AM64xx support
Date: Thu, 13 Mar 2025 16:27:08 -0500
Message-ID: <20250313212708.150304-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Mar 2025 21:27:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18381

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb b/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb
index 4efc99ac..3aa69700 100644
--- a/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb
@@ -6,6 +6,7 @@ FW_NAME = "zephyr_openamp_rsc_table.elf"
 # List of cores for which this demo has a build
 FW_CORES        = ""
 FW_CORES:am62xx = "mcu-m4f0_0"
+FW_CORES:am64xx = "mcu-m4f0_0"
 
 # Note: Everything below is common to all our Zephyr firmwares and can be
 #       factored out to a common include file once we have more than one demo
@@ -18,7 +19,7 @@ COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "git://github.com/glneo/zephyr-firmware.git;protocol=https;branch=main"
-SRCREV = "146d4f9b3930722d73685d600958f0b10ea97de2"
+SRCREV = "ef5aec48e589902839ebae7ad753c68cf498c15f"
 PV = "3.6.0"
 #PR = "r1"
 
@@ -26,6 +27,7 @@ S = "${WORKDIR}/git"
 
 FW_PLAT = ""
 FW_PLAT:am62xx = "am62"
+FW_PLAT:am64xx = "am64"
 
 FW_INSTALL_DIR = "${nonarch_base_libdir}/firmware/zephyr/${FW_PLAT}"
 
-- 
2.39.2


