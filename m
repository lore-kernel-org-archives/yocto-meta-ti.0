Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316E5C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 22:09:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1496.1706220582568965014
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jan 2024 14:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kkI+kcfi;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40PM9ZG7130789;
	Thu, 25 Jan 2024 16:09:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706220575;
	bh=k7hwnGq7UCsfquqyVH4l4PN5xsTr/olgqXrBVtsxNI8=;
	h=From:To:CC:Subject:Date;
	b=kkI+kcfiM7UZJ9Nfo+D8OF91LCJG70jKtmYzIaBz/Tkc01wz9NZlan6lNI3RA8muk
	 9tpIlkw/1DNQYSdQGdlzAoGFb7aDzmUNmraPexpAwHKc10a+OXnqoGYQsjiH0zMCAf
	 sT4DUg6G37mxLMXf4UkoxeEPKyNiXK/+IceC2u9k=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40PM9Zbf058514
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Jan 2024 16:09:35 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Jan 2024 16:09:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Jan 2024 16:09:35 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40PM9ZNO103738;
	Thu, 25 Jan 2024 16:09:35 -0600
From: <rs@ti.com>
To: <francesco@dolcini.it>, <denys@konsulko.com>, <reatmon@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-img-rogue-umlibs: remove the dev package
Date: Thu, 25 Jan 2024 16:09:35 -0600
Message-ID: <20240125220935.4118534-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jan 2024 22:09:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17418

From: Randolph Sapp <rs@ti.com>

If Yocto even sees a "-dev" package in the PACKAGES string it will
automatically forward all dev-so links to that package. Remove that
entry from the PACKAGES string so we get the required links again.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

This is a master only patch! In kirkstone this was not present in the
final version of the patch that was accepted. Unfortunately master
somehow got a variant with the "-dev" package still present.


 .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
index 7301c471..d2e21ceb 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
@@ -10,7 +10,7 @@ INHIBIT_DEFAULT_DEPS = ""
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
-PR = "r2"
+PR = "r3"
 
 BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
@@ -89,7 +89,6 @@ PACKAGES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opencl', d.getVar('OPENCL_PACKAGES'), '', d)} \
     ${PN}-tools \
     ${PN}-firmware \
-    ${PN}-dev \
     ${PN} \
 "
 
-- 
2.43.0


