Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616A4C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 19:13:25 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.22219.1672859595279214239
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 11:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=l4fLHXjA;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304JDEOi084572;
	Wed, 4 Jan 2023 13:13:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672859594;
	bh=3lt3OGiWZ8UUPKZMMiczb58zgNEiCLh08Xi0SqlaB/I=;
	h=From:To:CC:Subject:Date;
	b=l4fLHXjAax/UDDY6eYhpasgKLm9oSMtkC0fiuJVeoWOH8fFDjoHXFOUBqMBvHTQhw
	 BeoIF5seMw/2DI9K61Vd38FcUwVce9LAXZUNCia61bR6upKKR5FJu+ZNpKGfjPOccj
	 E2bnx7NHgdSAxurKsEU8WH4TBCm87PLFJj1f1M80=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304JDEAk088812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Jan 2023 13:13:14 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 13:12:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 13:12:59 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304JCwZD110984;
	Wed, 4 Jan 2023 13:12:59 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-sgx-ddk-um: Update SRCREV for Kirkstone support
Date: Wed, 4 Jan 2023 13:12:58 -0600
Message-ID: <20230104191258.27937-1-afd@ti.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 19:13:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15519

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb                | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index d0edf1fe..fb98eb68 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -10,16 +10,16 @@ REQUIRED_MACHINE_FEATURES = "gpu"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
 
-PR = "r37"
+PR = "r38"
 
-BRANCH = "ti-img-sgx/dunfell/${PV}"
+BRANCH = "ti-img-sgx/kirkstone/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
+SRCREV = "905809029b877fea42e91b9738825a6294ff1775"
 
-TARGET_PRODUCT:omap-a15 = "jacinto6evm"
 TARGET_PRODUCT:ti33x = "ti335x"
 TARGET_PRODUCT:ti43x = "ti437x"
+TARGET_PRODUCT:omap-a15 = "ti572x"
 TARGET_PRODUCT:am65xx = "ti654x"
 
 INITSCRIPT_NAME = "rc.pvr"
@@ -63,6 +63,7 @@ FILES:${PN} =  "${bindir}/*"
 FILES:${PN} += " ${libdir}/*"
 FILES:${PN} +=  "${includedir}/*"
 FILES:${PN} +=  "${sysconfdir}/*"
+FILES:${PN} +=  "${datadir}/*"
 
 INSANE_SKIP:${PN} += "dev-so ldflags useless-rpaths"
 INSANE_SKIP:${PN} += "already-stripped dev-deps"
-- 
2.38.1


