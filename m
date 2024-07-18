Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DBCC3DA5D
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 00:31:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4826.1721262688353010592
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jul 2024 17:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MMIppGZe;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46I0VOXD049684;
	Wed, 17 Jul 2024 19:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721262684;
	bh=yeU79UrXV56E1hSU5OuXs0/GeVQIIPJw7TdVdijVgho=;
	h=From:To:Subject:Date;
	b=MMIppGZeHnfk311Oe2Wz3jPufqLuw3P6oqjeFEbwMXquj/a9BosT4lQ6bbLYBm6Uh
	 90eulWzzLn2vuIgIPtvgAOvjnCZcfcZt5ywFq7KWheneuo6ovHC/1lWozVbnX1Uc5F
	 Y2IJ5R8X0JmOmw32YqomqfTFND6FE17TW+lmHqQo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46I0VOrL039461
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jul 2024 19:31:24 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jul 2024 19:31:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jul 2024 19:31:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46I0VObY094105;
	Wed, 17 Jul 2024 19:31:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sUF3M-0004Vj-7d; Wed, 17 Jul 2024 19:31:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: j722s: Update IMAGE_BOOT_FILES for mainline builds
Date: Wed, 17 Jul 2024 19:31:24 -0500
Message-ID: <20240718003124.17300-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 00:31:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17881

As this is still a new platform, the bsp-mainline also does not have the
hs-fs boot files.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/j722s.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index 7d4c167f..ef35d83a 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -11,6 +11,7 @@ IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
 
 # Since default tiboot3.bin on J722S is for HS-FS, add a version for HS-SE
 IMAGE_SR1_HS_SE_FILES = "tiboot3-j722s-hs-evm.bin"
+IMAGE_SR1_HS_SE_FILES:bsp-mainline = ""
 IMAGE_SR1_HS_SE_FILES:bsp-next = ""
 IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_SE_FILES}"
 
-- 
2.17.1


