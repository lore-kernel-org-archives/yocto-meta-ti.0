Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673EAC3F6B0
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 02:49:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2797.1659667777032165576
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 19:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Tct3TO3f;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2752nZog090721;
	Thu, 4 Aug 2022 21:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659667775;
	bh=BCySKzb4zt6TupdfN2huC5TSooAdWdgmCys1ZUj3W0c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Tct3TO3f6P238Cl6kujqTPllt13d3ufqDdvY6tCKCzRorhmJMZTMzu1hbaGCj2lwW
	 WBmNk3r7FpxD08o2iFVTZfa/JO5St7FZ1ImOGkv/LQkb6dxSU9w4vJHtkHEzj0USzc
	 6nYq4Zz3zHMd+QQEZOO65dCbpibggD74Eslscagk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2752nZrO025972
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 21:49:35 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 21:49:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 21:49:35 -0500
Received: from ula0226330.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2752nYEO111537;
	Thu, 4 Aug 2022 21:49:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 2/8] optee-os: Allow build to continue
 without TI_SECURE_DEV_PKG set
Date: Thu, 4 Aug 2022 21:49:28 -0500
Message-ID: <20220805024934.23349-2-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805024934.23349-1-afd@ti.com>
References: <20220805024934.23349-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Aug 2022 02:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14927

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 7fe5f26e..5a25bd99 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -43,7 +43,12 @@ optee_sign_legacyhs() {
 # Signing procedure for K3 HS devices
 optee_sign_k3hs() {
     ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
+        if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
+        else \
+            echo "Warning: TI_SECURE_DEV_PKG not set, OP-TEE not signed."; \
+            cp tee-pager_v2.bin tee-pager.bin.signed; \
+        fi; \
         mv tee-pager.bin.signed ${B}/bl32.bin; \
         cp tee.elf ${B}/bl32.elf; \
     )
-- 
2.36.1


