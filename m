Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B55CAC58C
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 15:10:41 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.837.1757430631090205380
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 08:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vqjwZowf;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589FASrf4051803;
	Tue, 9 Sep 2025 10:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757430628;
	bh=RqiT/pICD++kWMjpO6UH8PRLZXHPmxqEwsbsAIVVG8o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vqjwZowfnof/pzmGtQbeKbf/mLW3NXXDiv7vFRkzePIP3lGnMzZ97n/yGX6At2gOw
	 LZvj1ajub960Wv23Z8S5ZhUUmdqQpZWeGUnhTRUBbHa6GD8lnX8Ei0Nv1eS3pv+tBZ
	 smxCUWrRxG3Mv5bpzunAMt31I/TFKFTTi7jjCWJ0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589FASWA3864887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 10:10:28 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 10:10:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 10:10:28 -0500
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [10.247.30.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589FASUk2825029;
	Tue, 9 Sep 2025 10:10:28 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap][RFC 5/6] mesa-pvr: Use PREFERRED_PROVIDER directly for GPU selection
Date: Tue, 9 Sep 2025 10:10:27 -0500
Message-ID: <20250909151028.272925-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250909151028.272925-1-afd@ti.com>
References: <20250909151028.272925-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Sep 2025 15:10:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18987

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


