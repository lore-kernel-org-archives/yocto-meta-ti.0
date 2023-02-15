Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5841FC677F1
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2561.1676489639223183459
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cWNj+8eS;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXvUI097990;
	Wed, 15 Feb 2023 13:33:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489637;
	bh=IpOEv23nNf1LzOUHj76w52kIDsvnF82sh9qmhuBvB4Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cWNj+8eSxM+u2ijcGc6+qSKy/EAVhi+vX27NMhA/OnsPCIugRkF9jcGT1JYWBx1aP
	 uL+wWafPHM22LnwrZ/j8iU4mXDkEsdSJmzo8tvnYs9CLRzId58B2he0ZNft5XCLBTJ
	 oHTz7+8Z8StFUrn9wn5b2lrfJDYLqqQnxEiIuPQk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJXv4B010981
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:33:57 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:33:57 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:33:57 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6h014221;
	Wed, 15 Feb 2023 13:33:56 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 04/15] u-boot-ti: Use new ti-secdev class to sign the images
Date: Wed, 15 Feb 2023 13:33:44 -0600
Message-ID: <20230215193355.9676-5-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215193355.9676-1-afd@ti.com>
References: <20230215193355.9676-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15859

Use the new ti-k3-secdev package to pull in the signing tools if they are
not provided by the environment. This allows us to use these tools
unconditionally. Remove the checks for the script and do the signing
for all K3 machines. The signature is automatically stripped from
the binaries on non-HS devices at boot time as needed so this change
is harmless for GP devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 6f5b6313..83c4af59 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -50,8 +50,7 @@ PKG:${PN}-dbg = "u-boot-dbg"
 S = "${WORKDIR}/git"
 
 # Support for secure devices - detailed info is in doc/README.ti-secure
-TI_SECURE_DEV_PKG ?= ""
-export TI_SECURE_DEV_PKG
+inherit ti-secdev
 
 SYSROOT_DIRS += "/boot"
 
-- 
2.39.1


