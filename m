Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8950.1645503274915550914
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5DE7840C79
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VsgYav5iNX99 for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 49B7240C06
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 37953174774
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 10/29] cnm-wave-fw: Fix name of firmware for j721s2
Date: Tue, 22 Feb 2022 04:14:11 +0000
Message-Id: <20220222041430.2840289-11-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ryan Eatmon <reatmon@ti.com>

Update the name of the firmware for j721s2 as the file
was renamed.  Also, fix a typo in the variable name.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb        | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/met=
a-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index af77b394..ce7be5e7 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -9,7 +9,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENCE.cnm;md5=3D93b67e6bac7f8fec22b96b8ad=
0a1a9d0"
=20
 PV =3D "${CNM_WAVE521_FW_VERSION}"
-PR =3D "${INC_PR}.0"
+PR =3D "${INC_PR}.1"
=20
 CLEANBROKEN =3D "1"
=20
@@ -18,10 +18,11 @@ COMPATIBLE_MACHINE =3D "j7"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git"
-TARGET_WAVE215C =3D "wave521c_codec_fw.bin"
+TARGET_WAVE521C =3D "wave521c_codec_fw.bin"
+TARGET_WAVE521C:j721s2-evm =3D "wave521c_j721s2_codec_fw.bin"
=20
-ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}=
/firmware/${TARGET_WAVE215C}"
-ALTERNATIVE_TARGET[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}/fi=
rmware/cnm/${TARGET_WAVE215C}"
+ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}=
/firmware/${TARGET_WAVE521C}"
+ALTERNATIVE_TARGET[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}/fi=
rmware/cnm/${TARGET_WAVE521C}"
 ALTERNATIVE_PRIORITY =3D "10"
=20
 # Set up names for the firmwares
@@ -30,7 +31,7 @@ ALTERNATIVE_${PN}:j7 =3D "\
=20
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/cnm
-	install -m 0644 ${S}/cnm/${TARGET_WAVE215C} ${D}${nonarch_base_libdir}/=
firmware/cnm/${TARGET_WAVE215C}
+	install -m 0644 ${S}/cnm/${TARGET_WAVE521C} ${D}${nonarch_base_libdir}/=
firmware/cnm/${TARGET_WAVE521C}
 }
=20
 # make sure that lib/firmware, and all its contents are part of the pack=
age
--=20
2.25.1

