Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0C0E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:26:43 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.153895.1734708397636435588
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 07:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VMZ2/Tbc;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKFQZoW479270
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 09:26:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734708396;
	bh=e/E1uxQ8B36plbFy7ow+fnZfgrKdBjAiyprvjir+xPM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VMZ2/TbcvtZWhaApo9fsmjmtLBLDa4HEYIx62cRrYmLvYIokJ0zD8kIf095xhxeyZ
	 Fy+6rP0HM7kHGg0bcXLboCDgceYRJPVdvQJC53PUpbZeOSvnK9Yfy3VrC5FzsoXbvY
	 xwG34g5/S8o6Lo1XYFdtNCD4KTYl0ZW8n+7Dgkkg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKFQZKw011593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Dec 2024 09:26:35 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 09:26:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 09:26:35 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKFQZTu030160;
	Fri, 20 Dec 2024 09:26:35 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 2/2] meta-ti-extras: mathlib: Do not deploy packaged output
Date: Fri, 20 Dec 2024 09:26:34 -0600
Message-ID: <20241220152634.200954-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220152634.200954-1-afd@ti.com>
References: <20241220152634.200954-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Dec 2024 15:26:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18164

This might have been useful for building development packages with
the pre-built binaries for deployment elsewhere, but there are
better ways to do this and these are no longer consumed. Remove
this packaging step.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-extras/recipes-ti/mathlib/mathlib.inc | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
index 6ad073ec..34902ba1 100644
--- a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
+++ b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
@@ -11,7 +11,6 @@ DEPENDS = "ti-cgt6x-native \
            ti-xdctools-native \
            ti-sysbios \
            doxygen-native \
-           zip-native \
            swtools"
 
 S = "${WORKDIR}/git"
@@ -56,19 +55,6 @@ do_install() {
 	rm -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib
 }
 
-inherit deploy
-addtask deploy before do_build after do_install
-
-do_deploy() {
-	install -d ${DEPLOYDIR}
-	# zip up files in ${D}${MATHLIB_INSTALL_DIR_RECIPE}
-	# and place the zip file in ${DEPLOYDIR}
-	mkdir ./${MATHLIB_PACKAGE_NAME}
-	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/. ./${MATHLIB_PACKAGE_NAME}
-	zip -9 -y -r -q ${DEPLOYDIR}/${MATHLIB_PACKAGE_NAME}.zip ./${MATHLIB_PACKAGE_NAME}
-	rm -r ./${MATHLIB_PACKAGE_NAME}
-}
-
 ALLOW_EMPTY:${PN} = "1"
 FILES:${PN}-dev += "${MATHLIB_INSTALL_DIR_RECIPE}"
 
-- 
2.39.2


