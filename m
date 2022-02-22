Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8948.1645503249168864350
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D0B940AE9
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HpF-gSvDkAiT for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8C95A40A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 714B817476F
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 14/17] beaglebone: move kernel and dtb to packagegroup-core-boot
Date: Tue, 22 Feb 2022 04:13:58 +0000
Message-Id: <20220222041401.2840172-15-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Vivien Didelot <vivien.didelot@gmail.com>

Require kernel image and device tree as machine-specific packages with
MACHINE_ESSENTIAL_EXTRA_RDEPENDS instead of appending IMAGE_INSTALL.

This binds the packages to the packagegroup-core-boot package group,
allowing one to skip their installation, e.g. for container trees.

This patch reflects commit d4cbe0e43393 [1] from meta-yocto-bsp
("beaglebone-yocto: move kernel and dtb to packagegroup-core-boot").

[1] https://git.yoctoproject.org/meta-yocto/commit/?id=3Dd4cbe0e43393ec70=
e98caf006372b5311597d377

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beaglebone.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/=
machine/beaglebone.conf
index cce8fd09..bc66102b 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -13,4 +13,4 @@ MACHINE_GUI_CLASS =3D "bigscreen"
=20
 SERIAL_CONSOLES =3D "115200;ttyS0"
=20
-IMAGE_INSTALL:append =3D " kernel-devicetree kernel-image-zimage"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree kernel-image-zi=
mage"
--=20
2.25.1

