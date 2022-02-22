Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8957.1645503275755864634
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8CFCA40C5D
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4YnwCJsO9f-h for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 824EA40C06
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3E8CE174770
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:34 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 19/29] ti-linux-fw: Bump to 08.02.00.001 release
Date: Tue, 22 Feb 2022 04:14:20 +0000
Message-Id: <20220222041430.2840289-20-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ryan Eatmon <reatmon@ti.com>

Updated the ti-linux-fw version for 08.02.00.001
  - Changed CORESDK_RTOS_VERSION version to 08.02.00.04

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 014e89c8..5954cbd8 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -4,10 +4,10 @@ LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf95621259288c4=
a46d76"
=20
 PV =3D "2022.01"
-INC_PR =3D "r2"
+INC_PR =3D "r3"
=20
 # Firmware versions
-CORESDK_RTOS_VERSION =3D "08.01.00.02"
+CORESDK_RTOS_VERSION =3D "08.02.00.04"
 SERDES_FW_VERSION =3D "3.3.0.2c"
 NETCP_SA_FW_VERSION =3D "1.0.0"
 NETCP_PA_FW_VERSION =3D "3.0.2.3"
@@ -19,7 +19,7 @@ CADENCE_MHDP_FW_VERSION =3D "1.2.17"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.00"
=20
-TI_LINUX_FW_SRCREV ?=3D "6070de0ae4095d291e1f7679d1fe6e07253a2fc3"
+TI_LINUX_FW_SRCREV ?=3D "8810faf0c51a80554150e185122e43bee1553c37"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
--=20
2.25.1

