Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.20672.1643238549296340442
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5799540CCE;
	Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rqNlcJRjEbqS; Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 352D740CB5;
	Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2DAFF17472E;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 06/19] ti-ocf-crypto-module: remove OMAP3-specific OCF ctypto module
Date: Wed, 26 Jan 2022 18:08:46 -0500
Message-Id: <1643238539-20686-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

OMAP3 platforms used OCF-Linux, a Linux port of the OpenBSD/FreeBSD
Cryptographic Framework (OCF) for Crypto HW acceleration. Later, an
alternative Cryptodev-linux API standard became dominant for newer
platforms. Remove deprecated module.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-ocf-crypto-module_1.0.bb                    | 35 ----------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb

diff --git a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
deleted file mode 100644
index 946f2ce..0000000
--- a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Builds Crypto module used by OCF-Linux driver in OpenSSL example applications"
-HOMEPAGE = "https://gforge.ti.com/gf/project/arm_crypto/"
-LICENSE = "BSD & GPLv2"
-LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=16;md5=acc0590f80e72fd64ad5c16cad8f4f76 \
-                    file://ocf_omap3_crypto.c;beginline=436;endline=438;md5=a52cad5c37c3aa3f27c6391552967304"
-
-COMPATIBLE_MACHINE = "am37x-evm|am3517-evm"
-
-DEPENDS += "virtual/kernel"
-
-SRC_URI = "svn://gforge.ti.com/svn/arm_crypto/;module=trunk;protocol=https;user=anonymous;pswd=''"
-
-#gforge source revision
-SRCREV = "17"
-
-INHIBIT_PACKAGE_STRIP = "1"
-
-S = "${WORKDIR}/trunk"
-
-inherit module
-
-MACHINE_KERNEL_PR:append = "b"
-PR = "${MACHINE_KERNEL_PR}"
-PV:append = "+svn${SRCPV}"
-
-EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR}"
-
-do_compile:prepend () {
-    sed -i "s/arm-none-linux-gnueabi-/${TARGET_PREFIX}/g" ${S}/Makefile
-}
-
-do_install () {
-        install -d ${D}/lib/modules/${KERNEL_VERSION}/crypto/ocf/
-        install -m 0755 ${S}/ocf_omap3_cryptok.ko ${D}/lib/modules/${KERNEL_VERSION}/crypto/ocf/
-}
-- 
2.7.4

