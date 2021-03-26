Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1348.1616782499381499817
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 11:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3FDBF40C56;
	Fri, 26 Mar 2021 18:14:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ouW9mU7rxn7z; Fri, 26 Mar 2021 18:14:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1ED2D40952;
	Fri, 26 Mar 2021 18:14:56 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 806F0174549;
	Fri, 26 Mar 2021 14:14:55 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] ti-rtos-firmware: sign DM firmware for J721e HS platform
Date: Fri, 26 Mar 2021 14:14:52 -0400
Message-Id: <1616782492-14151-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Praneeth Bajjuri <praneeth@ti.com>

U-boot build process requires DM firmware to be signed for J7 HS.
It's better for ti-rtos-firmware package (that delivers DM firmware) to sign
it once and provide signed version to other packages, instead of U-boot needing
to re-sign it during build in staging location.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index e85948b..38e9adc 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -74,6 +74,18 @@ SRC_URI[sha256sum] = "${CORESDK_RTOS_FIRMWARE_SHA256SUM}"
 
 FILES_${PN} += "${base_libdir}"
 
+TI_SECURE_DEV_PKG ?= ""
+
+DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
+
+do_install_prepend_j7-hs-evm() {
+	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+	( cd ${S}/firmware/pdk-ipc/; \
+		mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
+	)
+}
+
 do_install() {
 	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
 	install -d ${D}${base_libdir}
-- 
2.7.4

