Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8935.1645503202305670971
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BE14440A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nqjg4g9phDET for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 89CF440C8C
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3A376174772
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 07/19] abefw: remove OMAP4 Audio Back-End (ABE) firmware
Date: Tue, 22 Feb 2022 04:13:02 +0000
Message-Id: <20220222041314.2840028-8-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Due to platform deprecation, remove Audio Back-End firmware.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/abefw/abefw_1.0.14.bb | 23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb

diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_=
1.0.14.bb
deleted file mode 100644
index a6cc624a..00000000
--- a/recipes-bsp/abefw/abefw_1.0.14.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY =3D "Firmware for OMAP4 and OMAP5 ABE"
-HOMEPAGE =3D "http://git.ti.com"
-LICENSE =3D "BSD | GPLv2"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D923db086ed9463ab3215b24d87e05=
ec5"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-COMPATIBLE_MACHINE =3D "pandaboard|omap5-evm"
-
-SRC_URI =3D "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=3Dgit"
-
-S =3D "${WORKDIR}/git"
-
-SRCREV =3D "ceccc0332264e39bdc51e54f80ea7256a3886c58"
-
-PR =3D "r0"
-
-do_install() {
-        mkdir -p ${D}/lib/firmware
-        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/
-}
-
-FILES:${PN} +=3D "/lib/firmware/omap4_abe_new"
--=20
2.25.1

