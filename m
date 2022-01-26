Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21290.1643238550221343529
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A1D8F40CCF;
	Wed, 26 Jan 2022 23:09:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osq16Jwkfyl0; Wed, 26 Jan 2022 23:09:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 91B2A40CC5;
	Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 035F717473B;
	Wed, 26 Jan 2022 18:09:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 19/19] trusted-firmware-a: adjust ${BUILD_DIR} for meta-arm/master
Date: Wed, 26 Jan 2022 18:08:59 -0500
Message-Id: <1643238539-20686-20-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

After 8b2c97b585ed3f4163fa29f0d9120c7cd3c9e173, new platforms were merged with
BUILD_DIR used as in early Dunfell days, correct those.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 42e867a..8fe7c08 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -18,7 +18,7 @@ do_compile:append:am65xx-hs-evm() {
 
 do_compile:append:am64xx-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-	( cd ${B}/${BUILD_DIR}/release/; \
+	( cd ${BUILD_DIR}; \
 		mv bl31.bin bl31.bin.unsigned; \
 		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
 	)
@@ -34,7 +34,7 @@ do_compile:append:j7-hs-evm() {
 
 do_compile:append:j7200-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-	( cd ${B}/${BUILD_DIR}/release/; \
+	( cd ${BUILD_DIR}; \
 		mv bl31.bin bl31.bin.unsigned; \
 		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
 	)
-- 
2.7.4

