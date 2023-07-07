Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DFEEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 01:46:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3592.1688694357690292731
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 18:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rwZplMT9;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3671jrFZ087110;
	Thu, 6 Jul 2023 20:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688694354;
	bh=Zm1fjPA2gIr909yeIm84rFsPK+oJJs9ClPnVAw7D3QQ=;
	h=From:To:CC:Subject:Date;
	b=rwZplMT9Cfem5NvRy622CivGcqB9RX1KSSGLlIQPeplV5F1zAm/RxelG8KfJjLuiM
	 cvipwCNbsUlTB+2x49YjDgXtlpx27x0UL7LMuXF3ypGXVlR00WJSMsIIjwdRhVjCAW
	 NXTFhWz1jrFVW9fz71H34h3wDV7k5PDLIOevJaDE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3671jrFF060280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jul 2023 20:45:53 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jul 2023 20:45:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jul 2023 20:45:53 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3671jrkl112346;
	Thu, 6 Jul 2023 20:45:53 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-*: bump srcrev for jacinto fixes
Date: Thu, 6 Jul 2023 20:45:50 -0500
Message-ID: <20230707014550.3247657-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Jul 2023 01:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16823

From: Randolph Sapp <rs@ti.com>

Bump the SRCREV for the umlibs and driver package to include some fixes
for Jacinto devices. These patches do the following:
 - Fix virtual memory addressing
 - Resolve an issue with APM and debug requests
 - Attempt to resolve most of the cache coherency related issues on
   Jacinto devices
 - Introduce some extra cache maintenance operations in the kernel
   module

It also introduces the following known issues:
 - Visual artifacting on the second-to-last EGL/GLES context on BXS
   based devices (J721S2/J784S4)

We're still working on that last one, but the stability improvements
make this worth while for now.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb         | 2 +-
 .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
index 2342462e..10f3b727 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "815f7bc56567220af5af93e9ec8772ea4a866fe7"
+SRCREV = "c0adc3c36f4a0b2f590abfe0609b03096d58c648"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index 12acc695..aa1050d5 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -12,7 +12,7 @@ PR = "r2"
 
 BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "bfacba50b004d0e93ee1f8b42d2217131453f5fd"
+SRCREV = "6e460fee82d07513bb329b3022e5430c5ba73809"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
-- 
2.41.0


