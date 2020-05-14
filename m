Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3294.1589415160854454911
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 May 2020 17:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3D83440C15;
	Thu, 14 May 2020 00:12:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Cz4wVU51rgH; Thu, 14 May 2020 00:12:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 23C0A40B53;
	Thu, 14 May 2020 00:12:39 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B8C22173134;
	Wed, 13 May 2020 20:12:38 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] atf, sciclient: add missing j7-hs-evm support
Date: Wed, 13 May 2020 20:12:38 -0400
Message-Id: <1589415158-6406-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb | 8 ++++++++
 recipes-bsp/sciclient/sciclient-rtos_git.bb                  | 1 +
 2 files changed, 9 insertions(+)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
index f15570c..ae957bf 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
@@ -54,6 +54,14 @@ do_compile_append_am65xx-hs-evm() {
 	)
 }
 
+do_compile_append_j7-hs-evm() {
+	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+	( cd ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/; \
+		mv bl31.bin bl31.bin.unsigned; \
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
+	)
+}
+
 do_install() {
 	install -d ${D}/boot
 	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31.bin ${D}/boot/
diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index 7fbeb1e..deaf0b1 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -27,6 +27,7 @@ export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/pac
 
 BUILD_HS = ""
 BUILD_HS_am65xx-hs-evm = "yes"
+BUILD_HS_j7-hs-evm = "yes"
 export BUILD_HS
 
 # Sciclient for am65x supports mcu1_1 in addition to the default cores in TI_PDK_LIMIT_CORES
-- 
2.7.4

