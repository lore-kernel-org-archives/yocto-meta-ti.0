Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64779ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 21:57:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4337.1662155860058660918
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Sep 2022 14:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=P3pvbrxl;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 282Lvd6R031673
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Sep 2022 16:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662155859;
	bh=J1gM27aJCvw+ZaIiPrZGWeIHl5VpaH9vu7ZcAjc+33M=;
	h=From:To:CC:Subject:Date;
	b=P3pvbrxlRXay89j8lDI76WrvfWHWMBkcfDr1RfDcouYJ6Z7SPNie+wgkqBCvVnLmu
	 f0rBu66tbuZ9JhX1efBXDconbbfxvhsyjr2vlsOVagVXwV1XYBZV53cvksAmmXl2l/
	 hXoj9IiO8kl50HX/XlTODtqQE/YmFTM6WH+vnd/U=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 282Lvdbj095426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Sep 2022 16:57:39 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 2 Sep
 2022 16:57:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 2 Sep 2022 16:57:39 -0500
Received: from res.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 282LvcVP032501;
	Fri, 2 Sep 2022 16:57:39 -0500
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [dunfell][PATCH] all: Fix new git://git.ti.com URLs
Date: Fri, 2 Sep 2022 16:57:37 -0500
Message-ID: <20220902215737.180610-1-rs@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Sep 2022 21:57:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14992

The regex originally to correct all URLs that were still using the old
git protocol didn't have a check in place to see if the URL was already
using the correct protocol.

This just fixes the two affected URLs.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 recipes-bsp/x-load/x-load_1.46-psp.bb | 2 +-
 recipes-ti/secdev/ti-k3-secdev_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/x-load/x-load_1.46-psp.bb b/recipes-bsp/x-load/x-load_1.46-psp.bb
index 413328e1..5713927b 100644
--- a/recipes-bsp/x-load/x-load_1.46-psp.bb
+++ b/recipes-bsp/x-load/x-load_1.46-psp.bb
@@ -12,7 +12,7 @@ PE = "1"
 
 # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
 SRCREV_pn-${PN} = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
-SRC_URI = "git://git.ti.com/git/git/arago-project-org/x-load-omap3.git;protocol=https"
+SRC_URI = "git://git.ti.com/git/arago-project-org/x-load-omap3.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-ti/secdev/ti-k3-secdev_git.bb b/recipes-ti/secdev/ti-k3-secdev_git.bb
index 3851d35a..28dbe9ee 100644
--- a/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "null"
 COMPATIBLE_MACHINE_class-native = "(.*)"
 COMPATIBLE_MACHINE_class-nativesdk = "(.*)"
 
-GIT_URI = "git://git.ti.com/git/git/security-development-tools/core-secdev-k3.git"
+GIT_URI = "git://git.ti.com/git/security-development-tools/core-secdev-k3.git"
 GIT_PROTOCOL = "https"
 GIT_BRANCH = "master"
 GIT_SRCREV = "eb2c4d734487e5095b94cef3fd7213ee71d9e016"
-- 
2.25.1


