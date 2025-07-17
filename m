Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A107C83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 14:12:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.49809.1752761545068894639
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 07:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ks7mHZka;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HECN84027226;
	Thu, 17 Jul 2025 09:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752761543;
	bh=ESHQP6fzslFqudhrWFJYlW4ZWehMaYJ6Apfo5kuUt4g=;
	h=From:To:Subject:Date;
	b=Ks7mHZkaRLyVVZqYfwIZYHK7OjdoeP6whPoQeXOzNMCboBxEqIzuJPlwlmm3er6SW
	 g7fUso7asUEHN4CXfIg8L8KJgbDcF68S1vrofPMew+mdf0r93x5d2mf/rYlmQUQGih
	 3uwD+ypS/+eJIZIYvSy5NWpPydaZHFI6OwEnpWKE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HECN4G1692336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 09:12:23 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 09:12:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 09:12:22 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HECNhZ1976453;
	Thu, 17 Jul 2025 09:12:23 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ucPLS-0007jG-US; Thu, 17 Jul 2025 09:12:23 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] check_yocto_rules: Add new rules for recent changes
Date: Thu, 17 Jul 2025 09:12:22 -0500
Message-ID: <20250717141222.29671-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Jul 2025 14:12:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18793

- The S change needs to skip the APPEND-2 check since S should never
have a space in a path.
- The UBOOT_VERSION bbappend does not need a guard since we are
modifying our own layer.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 7e8eb211..237aa6a3 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -3,7 +3,7 @@
         "skip_vars" : [ "ALTERNATIVE", "FILES", "INSANE_SKIP", "RDEPENDS", "RRECOMMENDS" ]
     },
     "APPEND-2" : {
-        "skip_vars" : [ "KERNEL_LOCALVERSION", "PR", "PV" ],
+        "skip_vars" : [ "KERNEL_LOCALVERSION", "PR", "PV", "S" ],
         "file_regex" : {
             "meta-ti-bsp\\/recipes-graphics\\/mesa\\/mesa-pvr_\\S+\\.bb" : {
                 "skip_vars": [ "GALLIUMDRIVERS", "VULKAN_DRIVERS" ]
@@ -17,7 +17,8 @@
         "skip_files" : [
             "meta-ti-bsp/recipes-core/udev/eudev_%.bbappend",
             "meta-ti-bsp/recipes-devtools/binutils/binutils-cross-canadian_%.bbappend",
-            "meta-ti-bsp/recipes-security/optee/optee-%.bbappend"
+            "meta-ti-bsp/recipes-security/optee/optee-%.bbappend",
+            "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-boot/u-boot-ti-%.bbappend"
         ]
     },
     "GUARD-2" : {
-- 
2.17.1


