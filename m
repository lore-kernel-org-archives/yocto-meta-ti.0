Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A8EC46467
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 01:54:04 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.44375.1673488435472154935
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 17:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jfxAazNV;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30C1rsBZ076903;
	Wed, 11 Jan 2023 19:53:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673488434;
	bh=fE+vkE5A7VY3Iy7b0O8LJgx3ZFY5uNyvL0wYLu5elAE=;
	h=From:To:Subject:Date;
	b=jfxAazNV7rQ+r0c/0OQ8/XouxzgDPTo5zoxeuP+tZ9YV1BL5wgq0uDzwq1a7thjgb
	 eaiJ0Vd8V78ScZSOAbIE+hQ1nwhZ8PGyPNox8zaOI7Unt//ghlJJRdnoD1Bpk7dfLp
	 baVyQ7uGq0O0TN1rmqJenchUu3BU9uprmvvRtPhQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30C1rslO017643
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Jan 2023 19:53:54 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 11
 Jan 2023 19:53:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 11 Jan 2023 19:53:53 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30C1rrfN028063;
	Wed, 11 Jan 2023 19:53:53 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pFmmv-0007aN-Lf; Wed, 11 Jan 2023 19:53:53 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] hs: Deploy the unsigned versions of bl31 and bl32
Date: Wed, 11 Jan 2023 19:53:53 -0600
Message-ID: <20230112015353.29119-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Jan 2023 01:54:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15555

In addition to releasing the signed versions of the bl31.bin and
bl32.bin files, also release the unsigned original versions.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../trusted-firmware-a_%.bbappend                   | 13 +++++++++++++
 recipes-security/optee/optee-os_%.bbappend          |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index bb969da2..a5eb9ff8 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -50,3 +50,16 @@ do_compile_append_j721s2-hs-evm() {
 do_compile_append_j784s4-hs-evm() {
 	tfa_sign_k3hs
 }
+
+do_install_append_k3() {
+    if [ -f $BUILD_PLAT/bl31.bin.unsigned ]; then
+        echo "Install bl31.bin.unsigned"
+        install -m 0644 $BUILD_PLAT/bl31.bin.unsigned \
+        ${D}/firmware/bl31.bin.unsigned
+    else
+        echo "Install bl31.bin.unsigned"
+        install -m 0644 $BUILD_PLAT/bl31.bin \
+        ${D}/firmware/bl31.bin.unsigned
+    fi
+}
+
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index ca2fd42e..db9064de 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -17,6 +17,7 @@ do_compile_prepend_ti-soc() {
 do_compile_append_k3() {
     ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
         cp tee-pager_v2.bin ${B}/bl32.bin; \
+        cp tee-pager_v2.bin ${B}/bl32.bin.unsigned; \
         cp tee.elf ${B}/bl32.elf; \
     )
 }
@@ -50,6 +51,7 @@ optee_sign_k3hs() {
             cp tee-pager_v2.bin tee-pager.bin.signed; \
         fi; \
         mv tee-pager.bin.signed ${B}/bl32.bin; \
+        cp tee-pager_v2.bin bl32.bin.unsigned; \
         cp tee.elf ${B}/bl32.elf; \
     )
 }
@@ -93,6 +95,7 @@ do_compile_append_j784s4-hs-evm() {
 do_install_append_ti-soc() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
+    install -m 644 ${B}/bl32.bin.unsigned ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true
 }
 
@@ -113,6 +116,7 @@ do_deploy_append_dra7xx() {
 
 do_deploy_append_k3() {
     ln -sf optee/bl32.bin ${DEPLOYDIR}/
+    ln -sf optee/bl32.bin.unsigned ${DEPLOYDIR}/
     ln -sf optee/bl32.elf ${DEPLOYDIR}/
 }
 
-- 
2.17.1


