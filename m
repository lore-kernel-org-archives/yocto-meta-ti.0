Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.11760.1616959783283220663
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 Mar 2021 12:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5829840BE8;
	Sun, 28 Mar 2021 19:29:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQQN3AxHnK0l; Sun, 28 Mar 2021 19:29:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 407D640AB7;
	Sun, 28 Mar 2021 19:29:41 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6E806174566;
	Sun, 28 Mar 2021 15:29:40 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] ti-rtos-firmware: depend on openssl-native for signing
Date: Sun, 28 Mar 2021 15:29:40 -0400
Message-Id: <1616959780-31861-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Fixes:
.../scripts/secure-binary-image.sh: line 69: openssl: command not found
.../scripts/secure-binary-image.sh: line 78: openssl: command not found

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 38e9adc..6c8495d 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -72,6 +72,8 @@ PV = "${CORESDK_RTOS_VERSION_DOT}"
 SRC_URI = "${CORESDK_RTOS_FIRMWARE_URL}${CORESDK_RTOS_FILE_SUFFIX}"
 SRC_URI[sha256sum] = "${CORESDK_RTOS_FIRMWARE_SHA256SUM}"
 
+DEPENDS += "openssl-native"
+
 FILES_${PN} += "${base_libdir}"
 
 TI_SECURE_DEV_PKG ?= ""
-- 
2.7.4

