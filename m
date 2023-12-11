Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5E5C4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 21:07:06 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3038.1702328824028304639
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 13:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ti6UQpB3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BBL71q4077837;
	Mon, 11 Dec 2023 15:07:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702328821;
	bh=gCDSjr+g6UQnmZ/yqkpFnzoLUxnB9Kqx0fBZY3DHQuM=;
	h=From:To:Subject:Date;
	b=Ti6UQpB37yBTeeqOix1hrSQA3+1AGxjWjkBuft0MJkcRgsPYqfKbBXqPgWYoBTU2Q
	 r7ED+vG8zSngoNxYHsXs5jbOvh3N/b8ncPMNtSuErQO7uZimGeFYSJPKjgX8/FXPlE
	 0gd6k1MyBk5PY/oboN3kjyD3yZMSsTmsCoheGa5c=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BBL714O127756
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Dec 2023 15:07:01 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Dec 2023 15:07:01 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Dec 2023 15:07:01 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BBL71q8013899;
	Mon, 11 Dec 2023 15:07:01 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rCnUT-0008NV-Do; Mon, 11 Dec 2023 15:07:01 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-staging: Add 2024.01 uboot in prep for LTS migration
Date: Mon, 11 Dec 2023 15:07:01 -0600
Message-ID: <20231211210701.32165-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Dec 2023 21:07:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17347

We are preparing to migrate our uboot version to 2024.01.  As we are still
working on the migration, mark the default preference low for this
version.  We will enable building with this uboot in a meta-arago brand
in the near future.  Once the migration is complete, we will remove the
2023.04 uboot and make this the default.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../u-boot/u-boot-ti-staging_2024.01.bb       | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb
new file mode 100644
index 00000000..58900bee
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb
@@ -0,0 +1,21 @@
+require u-boot-ti.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
+
+PR = "r0"
+
+BRANCH = "ti-u-boot-2024.01"
+
+SRCREV = "2f0282922b2c458eea7f85c500a948a587437b63"
+
+do_install:append:am62xx() {
+	install -d ${D}/boot
+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
+}
+
+do_deploy:append:am62xx() {
+	install -d ${DEPLOYDIR}
+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
+}
-- 
2.17.1


