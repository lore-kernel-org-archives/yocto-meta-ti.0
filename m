Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C059C25B0E
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 02:49:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2828.1659667776960074181
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 19:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kbsZp3St;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2752naFJ090725;
	Thu, 4 Aug 2022 21:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659667776;
	bh=oG+7dh5gmbfZr4MUpLa8EMxNopp5xoalVHby/wqhSMI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kbsZp3StlQtjZFOT02C2UZ1bBLWSudj8TskmKHWJZpJAv0waTWXJKX/uCtQW+iQqU
	 XaEKMVIyH6fFhmGLQG5o3/Ao80i7BosuNE3hwF87VIKdArQOm6GQ+ebLmU2tQ6HKqy
	 u/hr3Q1KospeTD3kUm+istQbQguyjm9G59LggiWM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2752nZq5025981
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 21:49:35 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 21:49:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 21:49:35 -0500
Received: from ula0226330.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2752nYEP111537;
	Thu, 4 Aug 2022 21:49:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 3/8] trusted-firmware-a: Allow build to
 continue without TI_SECURE_DEV_PKG set
Date: Thu, 4 Aug 2022 21:49:29 -0500
Message-ID: <20220805024934.23349-3-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14928

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../trusted-firmware-a_%.bbappend             | 38 ++++++++-----------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 9645137e..965c99d4 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -9,42 +9,36 @@ TFA_SPD_k3 = "opteed"
 EXTRA_OEMAKE_append_k3 = "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE_append_k3 = "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
 
-do_compile_append_am65xx-hs-evm() {
+# Signing procedure for K3 HS devices
+tfa_sign_k3hs() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
 	( cd ${B}/${BUILD_DIR}/release/; \
 		mv bl31.bin bl31.bin.unsigned; \
-		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
+		if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
+			${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
+		else \
+			echo "Warning: TI_SECURE_DEV_PKG not set, TF-A not signed."; \
+			cp bl31.bin.unsigned bl31.bin; \
+		fi; \
 	)
 }
 
+do_compile_append_am65xx-hs-evm() {
+	tfa_sign_k3hs
+}
+
 do_compile_append_am64xx-hs-evm() {
-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-        ( cd ${B}/${BUILD_DIR}/release/; \
-                mv bl31.bin bl31.bin.unsigned; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
-        )
+	tfa_sign_k3hs
 }
 
 do_compile_append_j7-hs-evm() {
-	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-	( cd ${B}/${BUILD_DIR}/release/; \
-		mv bl31.bin bl31.bin.unsigned; \
-		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
-	)
+	tfa_sign_k3hs
 }
 
 do_compile_append_j7200-hs-evm() {
-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-        ( cd ${B}/${BUILD_DIR}/release/; \
-                mv bl31.bin bl31.bin.unsigned; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
-        )
+	tfa_sign_k3hs
 }
 
 do_compile_append_j721s2-hs-evm() {
-	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-	( cd ${B}/${BUILD_DIR}/release/; \
-		mv bl31.bin bl31.bin.unsigned; \
-		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
-	)
+	tfa_sign_k3hs
 }
-- 
2.36.1


