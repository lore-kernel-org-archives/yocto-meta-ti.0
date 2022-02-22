Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.8883.1645503271911140552
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 59A9B40C79
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tuq7lG5uVVwE for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 500C240C5D
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 22F5717476F
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 04/29] recipes-bsp/ti-rtos: Use target_c7x_0 instead of just c7x
Date: Tue, 22 Feb 2022 04:14:05 +0000
Message-Id: <20220222041430.2840289-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Nishanth Menon <nm@ti.com>

Lets enumerate the C7x target instead of defaulting as a since C7x.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 7d286b20..77955880 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -196,7 +196,7 @@ TARGET_MAIN_R5FSS1_0:j7 =3D "j7-main-r5f1_0-fw"
 TARGET_MAIN_R5FSS1_1:j7 =3D "j7-main-r5f1_1-fw"
 TARGET_C66_0:j7 =3D "j7-c66_0-fw"
 TARGET_C66_1:j7 =3D "j7-c66_1-fw"
-TARGET_C7X:j7 =3D "j7-c71_0-fw"
+TARGET_C7X_0:j7 =3D "j7-c71_0-fw"
=20
 TARGET_MCU_R5FSS0_0:j7200-evm =3D "j7200-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1:j7200-evm =3D "j7200-mcu-r5f0_1-fw"
@@ -225,7 +225,7 @@ ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] =3D "${nonar=
ch_base_libdir}/firmware/${TA
 ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS1_1}"
 ALTERNATIVE_LINK_NAME[j7-c66_0-fw] =3D "${nonarch_base_libdir}/firmware/=
${TARGET_C66_0}"
 ALTERNATIVE_LINK_NAME[j7-c66_1-fw] =3D "${nonarch_base_libdir}/firmware/=
${TARGET_C66_1}"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw] =3D "${nonarch_base_libdir}/firmware/=
${TARGET_C7X}"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw] =3D "${nonarch_base_libdir}/firmware/=
${TARGET_C7X_0}"
=20
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_1}"
--=20
2.25.1

