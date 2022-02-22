Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8791.1645503200178363113
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9ED6940A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6KDiyNTi8nr for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0AC9C40C8A
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:16 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BF0DC174773
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 19/19] trusted-firmware-a: adjust ${BUILD_DIR} for meta-arm/master
Date: Tue, 22 Feb 2022 04:13:14 +0000
Message-Id: <20220222041314.2840028-20-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

After 8b2c97b585ed3f4163fa29f0d9120c7cd3c9e173, new platforms were merged=
 with
BUILD_DIR used as in early Dunfell days, correct those.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend=
 b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 42e867a9..8fe7c08e 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -18,7 +18,7 @@ do_compile:append:am65xx-hs-evm() {
=20
 do_compile:append:am64xx-hs-evm() {
 	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
-	( cd ${B}/${BUILD_DIR}/release/; \
+	( cd ${BUILD_DIR}; \
 		mv bl31.bin bl31.bin.unsigned; \
 		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned =
bl31.bin; \
 	)
@@ -34,7 +34,7 @@ do_compile:append:j7-hs-evm() {
=20
 do_compile:append:j7200-hs-evm() {
 	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
-	( cd ${B}/${BUILD_DIR}/release/; \
+	( cd ${BUILD_DIR}; \
 		mv bl31.bin bl31.bin.unsigned; \
 		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned =
bl31.bin; \
 	)
--=20
2.25.1

