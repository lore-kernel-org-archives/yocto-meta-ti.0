Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AB2C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 23:37:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.4689.1707435444083350606
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 15:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pIrHZ70n;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418NbMxk109986;
	Thu, 8 Feb 2024 17:37:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707435442;
	bh=Wexoia4YDnN4b5eAFcUcSPhcwaIreLYDHUGHbmJUWEw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pIrHZ70nx76h7XwtB7DKlI+EQDZTSCEniPAV7O5XYbPqXI6j3cTr5hX3jzQeO+Mg9
	 YYtTSEVE40+AcE44TsK2f/ve9g3ApoafPRRl/yzCKpR5TU8gxxpxbO9JHreVNMMDRh
	 32/RUhh4qUbGHs28vKwNtcBEHbpXxWbDAkZEpRlo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418NbMsc061370
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 17:37:22 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 17:37:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 17:37:22 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418NbMaA038936;
	Thu, 8 Feb 2024 17:37:22 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/2] ti-img-rogue-driver: drop kbuild patch again
Date: Thu, 8 Feb 2024 17:37:22 -0600
Message-ID: <20240208233722.2565237-3-rs@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208233722.2565237-1-rs@ti.com>
References: <20240208233722.2565237-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Feb 2024 23:37:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17459

From: Randolph Sapp <rs@ti.com>

Drop the kbuild patch now that we have integrated an equivalent solution
into the upstream branch.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...uild-Makefile.template-use-SECONDARY.patch | 35 -------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-build-kbuild-Makefile.template-use-SECONDARY.patch

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-build-kbuild-Makefile.template-use-SECONDARY.patch b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-build-kbuild-Makefile.template-use-SECONDARY.patch
deleted file mode 100644
index 0989116e..00000000
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-build-kbuild-Makefile.template-use-SECONDARY.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 738dfc1b33a83e9995ed7f65ec41ebe2fc6a90ed Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Wed, 1 Nov 2023 10:04:29 -0500
-Subject: [PATCH] build: kbuild: Makefile.template: use SECONDARY
-
-For some reason on master we are seeing an error:
-
-| make[5]: *** .NOTINTERMEDIATE and .SECONDARY are mutually exclusive.  Stop.
-
-Flip this back to .SECONDARY to fix this build issue.
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
-
-Upstream-Status: Pending
-
----
- build/linux/kbuild/Makefile.template | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/linux/kbuild/Makefile.template b/build/linux/kbuild/Makefile.template
-index aa19d66..31e37fb 100644
---- a/build/linux/kbuild/Makefile.template
-+++ b/build/linux/kbuild/Makefile.template
-@@ -54,7 +54,7 @@
- 
- include $(OUT)/config_kernel.mk
- 
--.NOTINTERMEDIATE:
-+.SECONDARY:
- 
- define symlink-source-file
- @if [ ! -e $(dir $@) ]; then mkdir -p $(dir $@); fi
--- 
-2.17.1
-
-- 
2.43.0


