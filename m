Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D47E7F14F
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 22:03:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1335.1695852185745215668
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Sep 2023 15:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=S5k6UPDZ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38RM34JK071725;
	Wed, 27 Sep 2023 17:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695852184;
	bh=Vp1go43VmFAdAbKtBPfLT/3sG3nN2XQbMF79GHxDjnU=;
	h=From:To:CC:Subject:Date;
	b=S5k6UPDZ3psU/wlDmrNmP2xp4WzBpDQqOX2PLIRs1h6r3EzaaL+eOkncWMm2tAYzg
	 V1toSacN6EeQ0bJBu3Xkb63znMV6YVt0E2rZw+Dkg41LCYK2NrJBNhw1khxsdjqelG
	 84O3da7t9eUwVcsbx3dSiAuFW0PAzvjezg6Z8vDc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38RM34gu007688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Sep 2023 17:03:04 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 27
 Sep 2023 17:03:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 27 Sep 2023 17:03:03 -0500
Received: from fllv0040.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38RM33KQ025988;
	Wed, 27 Sep 2023 17:03:03 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] optee-os: Install OP-TEE OS provided TAs
Date: Wed, 27 Sep 2023 17:03:02 -0500
Message-ID: <20230927220302.2930236-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 27 Sep 2023 22:03:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17017

OP-TEE OS provides a handful of TAs itself. While these are often meant
to be built-in, when they are not we should deploy them as part of the
OP-TEE OS package so they can be loaded at runtime.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
index ff87f37a..19386295 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
@@ -45,6 +45,10 @@ do_install:append() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true
+
+    # Install embedded TAs
+    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
+    install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
 }
 
 optee_deploy_legacyhs() {
@@ -67,5 +71,7 @@ do_deploy:append:k3() {
     ln -sf optee/bl32.elf ${DEPLOYDIR}/
 }
 
+FILES:${PN} += "${nonarch_base_libdir}/optee_armtz/"
+
 # This is needed for bl32.elf
 INSANE_SKIP:${PN}:append:k3 = " textrel"
-- 
2.39.2


