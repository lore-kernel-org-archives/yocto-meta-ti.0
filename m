Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8949.1645503272712805865
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6A5F140C5D
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ueq3x7F8phJj for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 606D640A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 26E73174771
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 06/29] recipes-bsp/ti-rtos: Define the TARGET and ALTERNATE_TARGET as well.
Date: Tue, 22 Feb 2022 04:14:07 +0000
Message-Id: <20220222041430.2840289-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Nishanth Menon <nm@ti.com>

Dont forget the alternate-target as well.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 4b92e364..5d453676 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -225,7 +225,6 @@ TARGET_MAIN_R5FSS1_1:j7 =3D "j7-main-r5f1_1-fw"
 TARGET_C66_0:j7 =3D "j7-c66_0-fw"
 TARGET_C66_1:j7 =3D "j7-c66_1-fw"
 TARGET_C7X_0:j7 =3D "j7-c71_0-fw"
-TARGET_C7X_1:j7 =3D "j7-c71_1-fw"
=20
 TARGET_MCU_R5FSS0_0:j7200-evm =3D "j7200-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1:j7200-evm =3D "j7200-mcu-r5f0_1-fw"
@@ -237,6 +236,15 @@ TARGET_MCU_R5FSS0_1:j7200-hs-evm =3D "j7200-mcu-r5f0=
_1-fw"
 TARGET_MAIN_R5FSS0_0:j7200-hs-evm =3D "j7200-main-r5f0_0-fw"
 TARGET_MAIN_R5FSS0_1:j7200-hs-evm =3D "j7200-main-r5f0_1-fw"
=20
+TARGET_MCU_R5FSS0_0:j721s2-evm =3D "j721s2-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1:j721s2-evm =3D "j721s2-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0:j721s2-evm =3D "j721s2-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1:j721s2-evm =3D "j721s2-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0:j721s2-evm =3D "j721s2-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1:j721s2-evm =3D "j721s2-main-r5f1_1-fw"
+TARGET_C7X_0:j721s2-evm =3D "j721s2-c71_0-fw"
+TARGET_C7X_1:j721s2-evm =3D "j721s2-c71_1-fw"
+
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_1}"
=20
@@ -296,6 +304,15 @@ ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] =3D "${nonar=
ch_base_libdir}/firmware/pdk-i
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
 ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
=20
+ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fi=
rmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/fi=
rmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw] =3D "${nonarch_base_libdir}/fi=
rmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] =3D "${nonarch_base_libdir}/fi=
rmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-c71_0-fw] =3D "${nonarch_base_libdir}/firmware=
/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
+ALTERNATIVE_TARGET[j721s2-c71_1-fw] =3D "${nonarch_base_libdir}/firmware=
/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71"
+
 ALTERNATIVE_PRIORITY =3D "10"
=20
 # make sure that lib/firmware, and all its contents are part of the pack=
age
--=20
2.25.1

