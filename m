Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65965C7EE2F
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 20:14:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3760.1685132058287665314
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 13:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Nr9qJNU4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QKEHU8103628;
	Fri, 26 May 2023 15:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685132057;
	bh=LL9fX+dcJwvhfWTfb2ZzCbTPqmtzkeEMEqwaUgeQtlU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Nr9qJNU4O2zoqsraSm2Fvu3nVR371XamsOpYEWmaFNMMLErcN9neuQAhqGF+tfOqr
	 VqklmNKypxu5cizV1wSYgIL46itZT5SPQSRBqudQOkkedIZSW0Jp0DwhvZVgPC0qPS
	 AKmBAQO9HlNpLCf4kn6HR2BcW2fixMTu5fTafEXA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QKEHwV114208
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 15:14:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 15:14:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 15:14:16 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QKEFNh058314;
	Fri, 26 May 2023 15:14:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/3] optee-os: Do not sign OPTEE OS image for K3
Date: Fri, 26 May 2023 15:14:13 -0500
Message-ID: <20230526201414.466752-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526201414.466752-1-afd@ti.com>
References: <20230526201414.466752-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 20:14:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16611

U-Boot with binman will do the signing as these images are packaged.
Remove signing steps here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-security/optee/optee-os-ti.inc    | 46 -------------------
 1 file changed, 46 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
index e57ce4c7..ff87f37a 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
@@ -11,7 +11,6 @@ EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
 
 do_compile:append:k3() {
     cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
-    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin.unsigned
     cp ${B}/core/tee.elf ${B}/bl32.elf
 }
 
@@ -42,53 +41,9 @@ do_compile:append:dra7xx() {
     optee_sign_legacyhs
 }
 
-# Signing procedure for K3 devices
-optee_sign_k3hs() {
-    ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
-    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin.unsigned
-    cp ${B}/core/tee.elf ${B}/bl32.elf
-}
-
-do_compile:append:am65xx-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:am64xx-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:am62xx-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:am62xx-lp-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:am62axx-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:j721e-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:j7200-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:j721s2-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:j784s4-hs-evm() {
-    optee_sign_k3hs
-}
-
 do_install:append() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
-    install -m 644 ${B}/bl32.bin.unsigned ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true
 }
 
@@ -109,7 +64,6 @@ do_deploy:append:dra7xx() {
 
 do_deploy:append:k3() {
     ln -sf optee/bl32.bin ${DEPLOYDIR}/
-    ln -sf optee/bl32.bin.unsigned ${DEPLOYDIR}/
     ln -sf optee/bl32.elf ${DEPLOYDIR}/
 }
 
-- 
2.39.2


