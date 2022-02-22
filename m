Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.8872.1645503198040890070
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7AB4640C85
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XyKU5eAp5QdJ for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 839F040C30
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2F43D174771
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 06/19] ti-ocf-crypto-module: remove OMAP3-specific OCF ctypto module
Date: Tue, 22 Feb 2022 04:13:01 +0000
Message-Id: <20220222041314.2840028-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

OMAP3 platforms used OCF-Linux, a Linux port of the OpenBSD/FreeBSD
Cryptographic Framework (OCF) for Crypto HW acceleration. Later, an
alternative Cryptodev-linux API standard became dominant for newer
platforms. Remove deprecated module.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-ocf-crypto-module_1.0.bb               | 35 -------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module=
_1.0.bb

diff --git a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb=
 b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
deleted file mode 100644
index 946f2ceb..00000000
--- a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION =3D "Builds Crypto module used by OCF-Linux driver in OpenSS=
L example applications"
-HOMEPAGE =3D "https://gforge.ti.com/gf/project/arm_crypto/"
-LICENSE =3D "BSD & GPLv2"
-LIC_FILES_CHKSUM =3D "file://Makefile;beginline=3D1;endline=3D16;md5=3Da=
cc0590f80e72fd64ad5c16cad8f4f76 \
-                    file://ocf_omap3_crypto.c;beginline=3D436;endline=3D=
438;md5=3Da52cad5c37c3aa3f27c6391552967304"
-
-COMPATIBLE_MACHINE =3D "am37x-evm|am3517-evm"
-
-DEPENDS +=3D "virtual/kernel"
-
-SRC_URI =3D "svn://gforge.ti.com/svn/arm_crypto/;module=3Dtrunk;protocol=
=3Dhttps;user=3Danonymous;pswd=3D''"
-
-#gforge source revision
-SRCREV =3D "17"
-
-INHIBIT_PACKAGE_STRIP =3D "1"
-
-S =3D "${WORKDIR}/trunk"
-
-inherit module
-
-MACHINE_KERNEL_PR:append =3D "b"
-PR =3D "${MACHINE_KERNEL_PR}"
-PV:append =3D "+svn${SRCPV}"
-
-EXTRA_OEMAKE +=3D "KERNEL_DIR=3D${STAGING_KERNEL_DIR}"
-
-do_compile:prepend () {
-    sed -i "s/arm-none-linux-gnueabi-/${TARGET_PREFIX}/g" ${S}/Makefile
-}
-
-do_install () {
-        install -d ${D}/lib/modules/${KERNEL_VERSION}/crypto/ocf/
-        install -m 0755 ${S}/ocf_omap3_cryptok.ko ${D}/lib/modules/${KER=
NEL_VERSION}/crypto/ocf/
-}
--=20
2.25.1

