Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C90ECAAA2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 18:55:31 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.62357.1661712926266411889
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 Aug 2022 11:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Z4Om5Rd8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27SItPJn125892;
	Sun, 28 Aug 2022 13:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661712925;
	bh=OaqoZVkPipordJ9ciWOPyRfjSYBGBcXvz/+Eb3qgris=;
	h=From:To:CC:Subject:Date;
	b=Z4Om5Rd87E734oVsp/ikjvnvzdm23RO7bu821GGA0ndS3uHC9aej3KuFZbs6v3Lzl
	 7S4Yi5/VK30ZaXz9MGyG39S2HzTL8uZDEYiP5iVzZHWfIlLwTKt4gTdNbEUVUHN4DA
	 4UPDQkBFhWduNKRo8fodKcS4XGXMCqWDVNH93u8g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27SItP8r117132
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 28 Aug 2022 13:55:25 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Sun, 28
 Aug 2022 13:55:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Sun, 28 Aug 2022 13:55:24 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27SItOB4086323;
	Sun, 28 Aug 2022 13:55:24 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: am64xx-evm: Update default
 HS names
Date: Sun, 28 Aug 2022 13:55:24 -0500
Message-ID: <20220828185524.15128-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 28 Aug 2022 18:55:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14975

In the latest U-Boot the HS images for AM64x have been renamed to the
default names, and the GP have been changed to *_unsigned. Remove
the overrides to pull the now default HS images.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/am64xx-evm.conf | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
index ce5898e1..a39bf740 100644
--- a/conf/machine/am64xx-evm.conf
+++ b/conf/machine/am64xx-evm.conf
@@ -6,10 +6,6 @@ require conf/machine/include/am64xx.inc
 
 UBOOT_MACHINE = "am64x_evm_a53_defconfig"
 
-SPL_BINARY = "tispl.bin_HS"
-UBOOT_BINARY = "u-boot.img_HS"
-UBOOT_SYMLINK = "u-boot.img"
-
 # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
 BBMULTICONFIG += "k3r5-gp"
 IMAGE_BOOT_FILES += " tiboot3-am64x-gp-evm.bin"
-- 
2.36.1


