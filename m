Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6222C83000
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 20:38:21 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.867.1751056693732989069
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 13:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IO7cVtCd;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RKcBfn2507507;
	Fri, 27 Jun 2025 15:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751056691;
	bh=96eidTS2R183pUkMvwcVt1AboX3QZh4dGRE0XQc94h0=;
	h=From:To:CC:Subject:Date;
	b=IO7cVtCdqYudjVdAy4/S84DncpAdP1lGwkHoQ03KKCKL96fCSfUr2q7dnGd7A+Alc
	 siUl/Bf2wK6sN/jbvHvt1bbysI5lLt3E1lJcGVROwgsmZyEFs7d/KvSQfsEDfccukm
	 phluGuYfT6kelROsU9y9S6V4QLd1XpBZjOK69mpw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RKcBl2776877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 15:38:11 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 15:38:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 15:38:11 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RKcANc3409926;
	Fri, 27 Jun 2025 15:38:10 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 1/2] meta-ti-bsp: ti-rtos-fw: Remove unused ti-sci-fw file extra path
Date: Fri, 27 Jun 2025 15:38:08 -0500
Message-ID: <20250627203809.583945-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 20:38:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18720

Looks to be left over from long ago, now completely unneeded.
Remove it and fix some comments while here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
index 7fffc9de..20c6b531 100644
--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
@@ -23,7 +23,6 @@ PLAT_SFX:am62axx = "am62axx"
 PLAT_SFX:am62dxx = "am62dxx"
 PLAT_SFX:am62pxx = "am62pxx"
 
-FILESEXTRAPATHS:prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 PV = "${CORESDK_RTOS_VERSION}"
@@ -107,13 +106,13 @@ do_install:prepend:am62dxx() {
 }
 
 do_install() {
-    # IPC Firmware
+    # Sign Firmware
     for FW_NAME in ${IPC_FW_LIST}
     do
         ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${IPC_FW_DIR}/${FW_NAME} ${S}/${IPC_FW_DIR}/${FW_NAME}.signed
     done
 
-    # IPC Firmware
+    # Install Firmware
     install -d ${D}${INSTALL_IPC_FW_DIR}
     for FW_NAME in ${IPC_FW_LIST}
     do
-- 
2.39.2


