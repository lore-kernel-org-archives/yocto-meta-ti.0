Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E38C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 21:48:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.35206.1740001685588466869
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2025 13:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D7F61411EB;
	Wed, 19 Feb 2025 21:48:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7Ohchm96imH; Wed, 19 Feb 2025 21:48:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BD3E940DCA;
	Wed, 19 Feb 2025 21:48:03 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E3031164265;
	Wed, 19 Feb 2025 16:48:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] trusted-firmware-a: simplify TI customizations
Date: Wed, 19 Feb 2025 16:48:01 -0500
Message-Id: <20250219214801.2239589-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2025 21:48:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18327

From: Denys Dmytriyenko <denys@konsulko.com>

The original .bbappend started with just a few customizations behind
a :k3 SoC override, but eventually grew in size. It got converted into
a .inc file, which is behind the same SoC override and hence it gets
included by .bbappend only for K3 platforms:
https://git.yoctoproject.org/meta-ti/commit/?id=3D389f9a8b726868768a8bed6=
cbe0b2a1f18c05410

It doesn't make sense to use the same :k3 override inside this .inc
file for every variable. Moreover, it makes it harder to change
those variables downstream for any derivative platform or even for
upstream testing.

This change drops redundant :k3 SoC overrides, w/o changing existing
behavior. It allows easier modifications of such customizations from
downstream layers or a local.conf, e.g. SRC_URI_TRUSTED_FIRMWARE_A

Note that SRC_URI is set exactly the same as in upstream base .inc
file, but version-specific recipes in meta-arm tend to add extra
patches directly to SRC_URI, which is undesirable here. Thus, reset
SRC_URI back to its default.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../trusted-firmware-a-ti.inc                 | 26 ++++++++++++-------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc
index 9971e960..21aef489 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.in=
c
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.in=
c
@@ -1,14 +1,20 @@
-PV:k3 =3D "2.12+git"
-SRCREV_tfa:k3 =3D "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
-LIC_FILES_CHKSUM:k3 =3D "file://docs/license.rst;md5=3D1118e32884721c0be=
33267bd7ae11130"
-SRC_URI:k3 =3D "git://github.com/TexasInstruments/arm-trusted-firmware.g=
it;protocol=3Dhttps;name=3Dtfa;branch=3Dti-master"
-COMPATIBLE_MACHINE:k3 =3D "k3"
-TFA_BUILD_TARGET:k3 =3D "all"
-TFA_INSTALL_TARGET:k3 =3D "bl31"
-TFA_SPD:k3 =3D "opteed"
+# NOTE: This .inc file with customizations only gets included for K3 pla=
tforms
+
+PV =3D "2.12+git"
+SRCREV_tfa =3D "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
+SRC_URI_TRUSTED_FIRMWARE_A =3D "git://github.com/TexasInstruments/arm-tr=
usted-firmware.git;protocol=3Dhttps"
+SRCBRANCH =3D "ti-master"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};name=3Dtfa;branch=3D${SRCBRAN=
CH}"
+
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D1118e32884721c0be332=
67bd7ae11130"
+COMPATIBLE_MACHINE =3D "k3"
+
+TFA_BUILD_TARGET =3D "all"
+TFA_INSTALL_TARGET =3D "bl31"
+TFA_SPD =3D "opteed"
=20
 # For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
 TFA_INSTALL_TARGET:am62lxx =3D "bl31 bl1"
=20
-EXTRA_OEMAKE:append:k3 =3D "${@ ' K3_USART=3D' + d.getVar('TFA_K3_USART'=
) if d.getVar('TFA_K3_USART') else ''}"
-EXTRA_OEMAKE:append:k3 =3D "${@ ' K3_PM_SYSTEM_SUSPEND=3D' + d.getVar('T=
FA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
+EXTRA_OEMAKE +=3D "${@ 'K3_USART=3D' + d.getVar('TFA_K3_USART') if d.get=
Var('TFA_K3_USART') else ''}"
+EXTRA_OEMAKE +=3D "${@ 'K3_PM_SYSTEM_SUSPEND=3D' + d.getVar('TFA_K3_SYST=
EM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
--=20
2.25.1


