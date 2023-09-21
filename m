Return-Path: <anandb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1ECE71068
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 12:49:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.15864.1695300537239342363
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Sep 2023 05:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KCbRCK16;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: anandb@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38LCmpcm012485;
	Thu, 21 Sep 2023 07:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695300531;
	bh=AJmh//lVjArDZDsqvbaJ2Woxo6k8I8k1hZ0J5/M1TQI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KCbRCK16MThZ7IYu1rv1+DzoGWcEnPcUS1qfBUBxcXz8piXdvedUDkqMh8YcFKVw/
	 UMpIHqH+moDGSN/3gXZ9H1fbgPwAziV3edHCVtmsgqMG4Zj3+9aCY53sf6w2Wu9aqY
	 YHwKmvL6KgErVmqZSXeGtgZyS1HvYLmFReCbbnHE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38LCmpwd097084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Sep 2023 07:48:51 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Sep 2023 07:48:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Sep 2023 07:48:50 -0500
Received: from udta0871049.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38LCmoCe024143;
	Thu, 21 Sep 2023 07:48:50 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <s-adivi@ti.com>, <praneeth@ti.com>, <rs@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>, <denis@denix.org>,
        Anand Balagopalakrishnan
	<anandb@ti.com>
Subject: [master|kirkstone][PATCH 2/2] mesa-pvr: remove auto configurations for sgx driver
Date: Thu, 21 Sep 2023 07:48:48 -0500
Message-ID: <20230921124848.3663826-3-anandb@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921124848.3663826-1-anandb@ti.com>
References: <20230921124848.3663826-1-anandb@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Sep 2023 12:49:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17002

mesa-pvr should be dependent on user mode libraries and not the kernel mode
driver. Remove auto configurations in mesa-pvr when gpudriver is set to sgx
kernel mode driver.

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index 0de3cb94..d8c438ff 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -25,12 +25,10 @@ SRCREV = "54fd9d7dea098b6f11c2a244b0c6763dc8c5690c"
 
 PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
-    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
 "
 
 PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
 PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
-PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
 
 PACKAGECONFIG:remove = "video-codecs"
 PACKAGECONFIG[video-codecs] = ""
@@ -42,7 +40,6 @@ PACKAGECONFIG[xvmc] = ""
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', ',sgx', '', d)}"
 
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
 
-- 
2.34.1


