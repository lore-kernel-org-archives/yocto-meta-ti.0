Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A0DC77B7C
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6328.1679283568881732090
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A681E40CA2
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDziQobdOchg for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 993D540C50
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:26 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A89131637C8
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 12/53] hs: Deploy the unsigned versions of bl31 and bl32
Date: Mon, 20 Mar 2023 03:38:44 +0000
Message-Id: <20230320033925.1306823-13-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033925.1306823-1-denis@denix.org>
References: <20230320033925.1306823-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16082

From: Ryan Eatmon <reatmon@ti.com>

In addition to releasing the signed versions of the bl31.bin and
bl32.bin files, also release the unsigned original versions.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend | 12 ++++++++++++
 .../recipes-security/optee/optee-os_%.bbappend       | 10 +++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
index 01d3f7d5..13581358 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
@@ -20,3 +20,15 @@ do_compile:append:k3() {
 	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
 	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.b=
in.unsigned ${BUILD_DIR}/bl31.bin
 }
+
+do_install:append:k3() {
+    if [ -f ${BUILD_DIR}/bl31.bin.unsigned ]; then
+        echo "Install bl31.bin.unsigned"
+        install -m 0644 ${BUILD_DIR}/bl31.bin.unsigned \
+        ${D}/firmware/bl31.bin.unsigned
+    else
+        echo "Install bl31.bin.unsigned"
+        install -m 0644 ${BUILD_DIR}/bl31.bin \
+        ${D}/firmware/bl31.bin.unsigned
+    fi
+}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index 583f1c73..a06fe858 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -6,13 +6,6 @@ EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+ =
d.getVar('OPTEE_K3_USART') i
 EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
 EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
=20
-do_compile:append:k3() {
-    ( cd ${B}/core/; \
-        cp tee-pager_v2.bin ${B}/bl32.bin; \
-        cp tee.elf ${B}/bl32.elf; \
-    )
-}
-
 # Signing procedure for legacy HS devices
 optee_sign_legacyhs() {
     ( cd ${B}/core/; \
@@ -43,12 +36,14 @@ do_compile:append:dra7xx() {
 # Signing procedure for K3 devices
 do_compile:append:k3() {
     ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${B}/core/tee-pa=
ger_v2.bin ${B}/bl32.bin
+    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin.unsigned
     cp ${B}/core/tee.elf ${B}/bl32.elf
 }
=20
 do_install:append:ti-soc() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || =
true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ ||=
 true
+    install -m 644 ${B}/bl32.bin.unsigned ${D}${nonarch_base_libdir}/fir=
mware/ || true
     install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ ||=
 true
 }
=20
@@ -69,6 +64,7 @@ do_deploy:append:dra7xx() {
=20
 do_deploy:append:k3() {
     ln -sf optee/bl32.bin ${DEPLOYDIR}/
+    ln -sf optee/bl32.bin.unsigned ${DEPLOYDIR}/
     ln -sf optee/bl32.elf ${DEPLOYDIR}/
 }
=20
--=20
2.25.1


