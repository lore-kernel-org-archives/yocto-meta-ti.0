Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA1DCAC5A9
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 22:09:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.36399.1758146970122556911
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 15:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dIYjWFpv;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HM9TpV1708661;
	Wed, 17 Sep 2025 17:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758146969;
	bh=RqiT/pICD++kWMjpO6UH8PRLZXHPmxqEwsbsAIVVG8o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dIYjWFpvJRls+qpEYlqAlSZ1qjwisD8y+/EyeIsyp84XipswgAQ5zVHdJOSLwVDzP
	 r/5Kz4ouc9wK/KjdhegKQpIW8JfLtpOPM6gikxC8H4LyEX82SuLOcz8/nGTA5INimr
	 FKMK9v4+5St58tD+8kayZxIVRnYrpoqduOrGRdLU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HM9TGp1076046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 17 Sep 2025 17:09:29 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 17:09:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 17:09:29 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HM9RZD4056077;
	Wed, 17 Sep 2025 17:09:28 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap][PATCH 5/5] mesa-pvr: Use PREFERRED_PROVIDER directly for GPU selection
Date: Wed, 17 Sep 2025 17:09:26 -0500
Message-ID: <20250917220926.1116988-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250917220926.1116988-1-afd@ti.com>
References: <20250917220926.1116988-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 22:09:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19028

Now that display controller aliases are not set using PACKAGECONFIG,
instead of using PREFERRED_PROVIDER to add either "sgx" or "pvr" to
PACKAGECONFIG, followed by reading it back out, simply use
PREFERRED_PROVIDER directly.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index 6a4b296f..40226f65 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -23,20 +23,15 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG:append = " \
-    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
-    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
-"
-
 SRCREV = "68af6a102c2298569e77d1aa8bccc1ff61438b3e"
 PV = "24.0.1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', ',sgx', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
 
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
 
 do_install:append () {
     # remove pvr custom pkgconfig
-- 
2.39.2


