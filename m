Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB42C35FF9
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 02:38:40 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.2811.1742265517397845592
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 19:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TCGtazIn;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52I2cahp2483003
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742265516;
	bh=krsExf8UzxP8SsPJtfiEadmaZAs7r7ZyTHTP+/vjsdg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TCGtazInM1L8sG3qlc9cXlkAzhUfbsRE4YdAMEIU9vm/NVUfxDi+HAf2+Fl3edN/c
	 aqpt6LllQ9dk5rXVjX/Fhxhqpme/kbBBi+Aa6j1UvYmvYSJYo2vyHe7KhMrp70h9mY
	 AzKtwPwyuQZbx4/bBKnawtoQ3oOzMelFoWpCT6eg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52I2ca5F023721
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:38:36 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 21:38:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 21:38:36 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52I2cae2043577
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:38:36 -0500
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH v5 3/3] recipes-graphics: port gc320 libs to work on kernel 6.12
Date: Mon, 17 Mar 2025 21:38:36 -0500
Message-ID: <20250318023836.3507801-4-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318023836.3507801-1-a-christidis@ti.com>
References: <20250318023836.3507801-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Mar 2025 02:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18399

From: Antonios Christidis <a-christidis@ti.com>

The user mode libraries needed recompiling with the scarthgap revision of gcc to
remove all the warnings about 32bit API usage during the linking stage, new
SRCREV and branch includes this changes. Versions of the libraries remain the
same.

Signed-off-by: Antonios Christidis <a-christidis@ti>
---
v5:
- Move the symb link of libGAL.so within the ${PN} package. While making
  sure the header files are part of the ${PN}-dev package.

v3:
- Removed commented lines and extra lib directory that was being created
  in do_install()

v2:
- No longer include withing the PN package /usr/include file and symb
  link to library file. This is done by not chaning the FILES/PACKAGES
  variables, thus creating a -dev package.

 .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 807f421c..6b7226ab 100644
--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -11,10 +11,10 @@ COMPATIBLE_MACHINE = "omap-a15"
 
 CLEANBROKEN = "1"
 
-BRANCH = "ti-${PV}"
+BRANCH = "ti-${PV}-scarthgap"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
+SRCREV = "85c175e8425c33dda6e272aeb45afe0f69a79096"
 
 RRECOMMENDS:${PN} = "ti-gc320-driver"
 
@@ -43,4 +43,6 @@ do_install() {
     chown -R root:root ${D}
 }
 
-INSANE_SKIP:${PN} += "ldflags"
+FILES:${PN}:append = " ${libdir}"
+
+INSANE_SKIP:${PN} += "ldflags already-stripped dev-so"
-- 
2.34.1


