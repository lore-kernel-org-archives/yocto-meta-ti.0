Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD8CC433FE
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.591.1652119192619246847
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8BDD040C8C
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZWIOYggupvk for <meta-ti@lists.yoctoproject.org>;
	Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 740D140C85
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0CADD174926
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 13:59:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 05/10] conf/machine: am62xx: Update build flag for low
 power mode
Date: Mon,  9 May 2022 17:59:42 +0000
Message-Id: <20220509175947.1994132-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509175947.1994132-1-denis@denix.org>
References: <20220509175947.1994132-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 May 2022 17:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14727

From: Nishanth Menon <nm@ti.com>

Update build flag for arm-trusted-firmware to include low power mode
support

K3_PM_SYSTEM_SUSPEND is added in arm-trusted-firmware now which enables
low power mode support for am62xx.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/am62xx.inc                     | 2 ++
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend            | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index bcf435f5..fff1312f 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -19,5 +19,7 @@ do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_depl=
oy"
 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
=20
 TFA_BOARD =3D "lite"
+TFA_K3_SYSTEM_SUSPEND =3D "1"
+
 OPTEEMACHINE =3D "k3-am65x"
 OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
index 32f913ca..45d56451 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
@@ -9,6 +9,7 @@ TFA_INSTALL_TARGET:k3 =3D "bl31"
 TFA_SPD:k3 =3D "opteed"
=20
 EXTRA_OEMAKE:append:k3 =3D "${@ ' K3_USART=3D' + d.getVar('TFA_K3_USART'=
) if d.getVar('TFA_K3_USART') else ''}"
+EXTRA_OEMAKE:append:k3 =3D "${@ ' K3_PM_SYSTEM_SUSPEND=3D' + d.getVar('T=
FA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
=20
 do_compile:append:am65xx-hs-evm() {
 	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
--=20
2.25.1


