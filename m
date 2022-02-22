Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8959.1645503275918681338
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4009440C88
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dv1MToJhwU21 for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2CBAA40C06
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3941A174775
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 11/29] ti-linux-fw: Bump up TIFS and DM to v2022.01
Date: Tue, 22 Feb 2022 04:14:12 +0000
Message-Id: <20220222041430.2840289-12-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Praneeth Bajjuri <praneeth@ti.com>

Update ti-linux-firmware and k3-image-gen to
pick latest TIFS and DM v2022.01

This version also adds support to j721s2

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 9bd2d0a8..fea0c783 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -3,8 +3,8 @@ SUMMARY =3D "TI SCI firmware (SYSFW)"
 LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf95621259288c4=
a46d76"
=20
-PV =3D "2021.09a"
-INC_PR =3D "r1"
+PV =3D "2022.01"
+INC_PR =3D "r2"
=20
 # Firmware versions
 CORESDK_RTOS_VERSION =3D "08.01.00.02"
@@ -19,12 +19,12 @@ CADENCE_MHDP_FW_VERSION =3D "1.2.17"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.00"
=20
-TI_LINUX_FW_SRCREV ?=3D "c96a734a059889e571dcf30c0638157c690a6e6e"
+TI_LINUX_FW_SRCREV ?=3D "6070de0ae4095d291e1f7679d1fe6e07253a2fc3"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
=20
-K3_IMAGE_GEN_SRCREV ?=3D "489c767a153ff26e9230746e04dd4b1ad0809901"
+K3_IMAGE_GEN_SRCREV ?=3D "9abbe130d47a7fa6f8e02b740ad3ad27bc81d327"
 SRCREV_imggen =3D "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT =3D "imggen"
=20
--=20
2.25.1

