Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1C3E7718B
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:26:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.154241.1734708397171442761
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 07:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=g4A6nyg0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BKFQZrQ068367;
	Fri, 20 Dec 2024 09:26:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734708395;
	bh=7AJg/mMfuEFQss1pRSJ0xHXbhALJYHMbGYNcGo6tEeo=;
	h=From:To:CC:Subject:Date;
	b=g4A6nyg0/RWUnBTK3RbcEvShO4OGU+lsl4sIT2ErdTVDbK74li5dxrZCxehTKmz00
	 AgzUERE6oQOOB3egD9K3LdvT//KnKlhsrpzTXXsHWwL7N2f/r342gA2915Ya0Swl49
	 RmkNngotqSgeuzdoG4lHfuF7AWHNfebH7vlQAk9I=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKFQZun011590
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Dec 2024 09:26:35 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 09:26:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 09:26:35 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKFQZTt030160;
	Fri, 20 Dec 2024 09:26:35 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 1/2] meta-ti-extras: dsplib: Do not deploy packaged output
Date: Fri, 20 Dec 2024 09:26:33 -0600
Message-ID: <20241220152634.200954-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Dec 2024 15:26:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18163

This might have been useful for building development packages with
the pre-built binaries for deployment elsewhere, but there are
better ways to do this and these are no longer consumed. Remove
this packaging step.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-extras/recipes-ti/dsplib/dsplib.inc | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
index 6ebc3b34..3c24f196 100644
--- a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
+++ b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
@@ -11,7 +11,6 @@ DEPENDS = "ti-cgt6x-native \
            ti-xdctools-native \
            ti-sysbios \
            doxygen-native \
-           zip-native \
            swtools"
 
 S = "${WORKDIR}/git"
@@ -57,19 +56,6 @@ do_install() {
 	rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib
 }
 
-inherit deploy
-addtask deploy before do_build after do_install
-
-do_deploy() {
-	install -d ${DEPLOYDIR}
-	# zip up files in ${D}${DSPLIB_INSTALL_DIR_RECIPE}
-	# and place the zip file in ${DEPLOYDIR}
-	mkdir ./${DSPLIB_PACKAGE_NAME}
-	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/. ./${DSPLIB_PACKAGE_NAME}
-	zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip ./${DSPLIB_PACKAGE_NAME}
-	rm -r ./${DSPLIB_PACKAGE_NAME}
-}
-
 ALLOW_EMPTY:${PN} = "1"
 FILES:${PN}-dev += "${DSPLIB_INSTALL_DIR_RECIPE}"
 
-- 
2.39.2


