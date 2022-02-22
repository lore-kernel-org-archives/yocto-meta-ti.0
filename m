Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8951.1645503271897260623
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5B8A540C85
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ve3ewarcJqNv for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4F16540C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1844617476E
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 03/29] trusted-firmware-a: Add support for alternate console
Date: Tue, 22 Feb 2022 04:14:04 +0000
Message-Id: <20220222041430.2840289-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Nishanth Menon <nm@ti.com>

Actual systems may choose to use a different console from the default
Allow the machine configurations to describe the same. Since the
option provided is custom to TI K3, make this a k3 product override
capability.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
index 8fe7c08e..581f7454 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
@@ -8,6 +8,8 @@ TFA_BUILD_TARGET:k3 =3D "all"
 TFA_INSTALL_TARGET:k3 =3D "bl31"
 TFA_SPD:k3 =3D "opteed"
=20
+EXTRA_OEMAKE:append:k3 =3D "${@ 'K3_USART=3D' + d.getVar('TFA_K3_USART')=
 if d.getVar('TFA_K3_USART') else ''}"
+
 do_compile:append:am65xx-hs-evm() {
 	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
 	( cd ${BUILD_DIR}; \
--=20
2.25.1

