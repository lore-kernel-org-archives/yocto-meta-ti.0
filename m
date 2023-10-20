Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E06CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 14:29:09 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.55693.1697812142242983307
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 07:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gP1wu8C3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39KET1ur030577;
	Fri, 20 Oct 2023 09:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697812141;
	bh=3/q4G/UglSm/7bfSFbDPHhoHTH0/SfsXX4NR4vsI1N8=;
	h=From:To:CC:Subject:Date;
	b=gP1wu8C3DqSnCBa6OGF+vbZl+5eH935KISbeuWXlNEgkAn4NVBfWYw9G46Wz+uWkI
	 ulFXJZRS5f+9OUF7j2fCgGuRV5c211URUHMcOSqiPbgHmU9ykYw2IehldOzCiqe4Te
	 Zj9YHKKFwec71ypoTx6oUZU0WCxcE/6nwDURsU3A=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39KET1Kq092541
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Oct 2023 09:29:01 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Oct 2023 09:28:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Oct 2023 09:28:59 -0500
Received: from ula0226330.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39KESxka114681;
	Fri, 20 Oct 2023 09:28:59 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-pru-sw-edma-driver: Remove this recipe
Date: Fri, 20 Oct 2023 09:28:59 -0500
Message-ID: <20231020142859.147560-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Oct 2023 14:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17156

Not used and the source is gone anyway, remove.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../pru/ti-pru-sw-edma-driver_1.00.00.bb      | 31 -------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb

diff --git a/meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
deleted file mode 100644
index 449a9095..00000000
--- a/meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "Builds eDMA module used by eDMA libraries for PRU sw example applications"
-HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://edmautils.c;beginline=1;endline=23;md5=312e9cb8a37a044c617c98a9e980ad1b"
-
-COMPATIBLE_MACHINE = "omapl138"
-
-INHIBIT_PACKAGE_STRIP = "1"
-
-MACHINE_KERNEL_PR:append = "b"
-PR = "${MACHINE_KERNEL_PR}"
-PV:append = "+svn${SRCPV}"
-
-SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
-
-SRCREV = "33"
-
-S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/module"
-
-inherit module
-
-EXTRA_OEMAKE += "KERNEL_DIR='${STAGING_KERNEL_DIR}'"
-
-do_compile:prepend () {
-        export CCTOOL_PREFIX="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}"
-}
-
-do_install () {
-        install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru
-        install -m 0755 ${S}/edmautils.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/
-}
-- 
2.39.2


