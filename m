Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1289.1603317323032621966
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 14:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1EC0A40C35;
	Wed, 21 Oct 2020 21:55:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_9p2qVT6aYW; Wed, 21 Oct 2020 21:55:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 04A4740BD0;
	Wed, 21 Oct 2020 21:55:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B180B1744AA;
	Wed, 21 Oct 2020 17:55:20 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 1/3] trusted-firmware-a: adjust ${BUILD_DIR} for meta-arm/master
Date: Wed, 21 Oct 2020 17:55:07 -0400
Message-Id: <1603317309-52625-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

As meta-arm/master now sets ${BUILD_DIR} to also include ${B} and release/debug.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 2dc715c..c3e3c74 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -8,7 +8,7 @@ TFA_SPD_k3 = "opteed"
 
 do_compile_append_am65xx-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-	( cd ${B}/${BUILD_DIR}/release/; \
+	( cd ${BUILD_DIR}; \
 		mv bl31.bin bl31.bin.unsigned; \
 		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
 	)
@@ -16,7 +16,7 @@ do_compile_append_am65xx-hs-evm() {
 
 do_compile_append_j7-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-	( cd ${B}/${BUILD_DIR}/release/; \
+	( cd ${BUILD_DIR}; \
 		mv bl31.bin bl31.bin.unsigned; \
 		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
 	)
-- 
2.7.4

