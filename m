Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB84C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:56:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.804.1663041349643110402
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 06B2740D75
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pI-l-2ShPnXt for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF0A040D6E
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4384C1749CF
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 64/65] trusted-firmware-a: Allow build to
 continue without TI_SECURE_DEV_PKG set
Date: Tue, 13 Sep 2022 03:55:40 +0000
Message-Id: <20220913035541.2364351-65-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:56:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15081

From: Andrew Davis <afd@ti.com>

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../trusted-firmware-a_%.bbappend             | 38 ++++++++-----------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
index 41241a57..14463846 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
@@ -9,42 +9,36 @@ TFA_SPD:k3 =3D "opteed"
 EXTRA_OEMAKE:append:k3 =3D "${@ ' K3_USART=3D' + d.getVar('TFA_K3_USART'=
) if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 =3D "${@ ' K3_PM_SYSTEM_SUSPEND=3D' + d.getVar('T=
FA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
=20
-do_compile:append:am65xx-hs-evm() {
+# Signing procedure for K3 HS devices
+tfa_sign_k3hs() {
 	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
 	( cd ${BUILD_DIR}; \
 		mv bl31.bin bl31.bin.unsigned; \
-		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned =
bl31.bin; \
+		if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
+			${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned=
 bl31.bin; \
+		else \
+			echo "Warning: TI_SECURE_DEV_PKG not set, TF-A not signed."; \
+			cp bl31.bin.unsigned bl31.bin; \
+		fi; \
 	)
 }
=20
+do_compile:append:am65xx-hs-evm() {
+	tfa_sign_k3hs
+}
+
 do_compile:append:am64xx-hs-evm() {
-	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
-	( cd ${BUILD_DIR}; \
-		mv bl31.bin bl31.bin.unsigned; \
-		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned =
bl31.bin; \
-	)
+	tfa_sign_k3hs
 }
=20
 do_compile:append:j721e-hs-evm() {
-	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
-	( cd ${BUILD_DIR}; \
-		mv bl31.bin bl31.bin.unsigned; \
-		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned =
bl31.bin; \
-	)
+	tfa_sign_k3hs
 }
=20
 do_compile:append:j7200-hs-evm() {
-	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
-	( cd ${BUILD_DIR}; \
-		mv bl31.bin bl31.bin.unsigned; \
-		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned =
bl31.bin; \
-	)
+	tfa_sign_k3hs
 }
=20
 do_compile:append:j721s2-hs-evm() {
-	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
-	( cd ${B}/${BUILD_DIR}/release/; \
-		mv bl31.bin bl31.bin.unsigned; \
-		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned =
bl31.bin; \
-	)
+	tfa_sign_k3hs
 }
--=20
2.25.1


