Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE64C4321E
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.554.1652119191453653544
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5EB7140C2C
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eFD0cVTsoPHL for <meta-ti@lists.yoctoproject.org>;
	Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4141F40C60
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 020A7174925
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 13:59:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 04/10] trusted-firmware-a: upgrade to v2.6+
Date: Mon,  9 May 2022 17:59:41 +0000
Message-Id: <20220509175947.1994132-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509175947.1994132-1-denis@denix.org>
References: <20220509175947.1994132-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 May 2022 17:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14719

From: Praneeth Bajjuri <praneeth@ti.com>

upgrade arm-trusted-firmare to master which is currently v2.6+

This upgrade picks up am62x low power mode feature.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
index 5a2b4510..32f913ca 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
@@ -1,8 +1,8 @@
-PV:k3 =3D "2.5"
+PV:k3 =3D "2.6"
 LIC_FILES_CHKSUM:k3 =3D "file://license.rst;md5=3D1dd070c98a281d18d9eefd=
938729b031"
 BRANCH:k3 =3D "ti-atf"
 SRC_URI:k3 =3D "git://git.ti.com/atf/arm-trusted-firmware.git;branch=3D$=
{BRANCH};name=3Dtfa"
-SRCREV_tfa:k3 =3D "0693f356eb2a25adf8758d98058120bed082cc73"
+SRCREV_tfa:k3 =3D "6541aa24f834daa80da701e0054dfe3a16cda0ce"
 COMPATIBLE_MACHINE:k3 =3D "k3"
 TFA_BUILD_TARGET:k3 =3D "all"
 TFA_INSTALL_TARGET:k3 =3D "bl31"
--=20
2.25.1


