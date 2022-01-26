Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.20674.1643238549465619988
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 56CAE40CCB;
	Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uiTElBfVL0U7; Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 370CB40CC2;
	Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3A21017472F;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 07/19] abefw: remove OMAP4 Audio Back-End (ABE) firmware
Date: Wed, 26 Jan 2022 18:08:47 -0500
Message-Id: <1643238539-20686-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Due to platform deprecation, remove Audio Back-End firmware.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/abefw/abefw_1.0.14.bb | 23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb

diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.0.14.bb
deleted file mode 100644
index a6cc624..0000000
--- a/recipes-bsp/abefw/abefw_1.0.14.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Firmware for OMAP4 and OMAP5 ABE"
-HOMEPAGE = "http://git.ti.com"
-LICENSE = "BSD | GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=923db086ed9463ab3215b24d87e05ec5"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-COMPATIBLE_MACHINE = "pandaboard|omap5-evm"
-
-SRC_URI = "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=git"
-
-S = "${WORKDIR}/git"
-
-SRCREV = "ceccc0332264e39bdc51e54f80ea7256a3886c58"
-
-PR = "r0"
-
-do_install() {
-        mkdir -p ${D}/lib/firmware
-        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/
-}
-
-FILES:${PN} += "/lib/firmware/omap4_abe_new"
-- 
2.7.4

