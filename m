Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8951.1645503275876669973
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 394EE40C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1EAeV0Ay0Gf for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2CCD940C88
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3EF5A174778
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 14/29] u-boot-ti: Support binman image generation
Date: Tue, 22 Feb 2022 04:14:15 +0000
Message-Id: <20220222041430.2840289-15-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Roger Quadros <rogerq@kernel.org>

We are now using binman to generate the images for
K3 AM64 in u-boot.

tools/binman/binman needs python3-setuptools so add it to
DEPENDS.

Reported-by: Praneeth Bajjuri <praneeth@ti.com>
Suggested-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Roger Quadros <rogerq@kernel.org>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index e8d199f1..7ffc1f27 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -31,7 +31,7 @@ SRC_URI =3D "${UBOOT_GIT_URI};protocol=3D${UBOOT_GIT_PR=
OTOCOL};branch=3D${BRANCH}"
 PV:append =3D "+git${SRCPV}"
=20
 # u-boot needs devtree compiler to parse dts files
-DEPENDS +=3D "dtc-native bc-native lzop-native flex-native bison-native"
+DEPENDS +=3D "dtc-native bc-native lzop-native flex-native bison-native =
python3-setuptools-native"
=20
 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5f"
=20
--=20
2.25.1

