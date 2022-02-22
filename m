Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8804.1645503274870124184
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 54ABD40C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TY-VMxpmRthn for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 47FA940A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 35AD1174738
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 09/29] recipes-ti/ti-rtos-bin: Fix unavailable binary path
Date: Tue, 22 Feb 2022 04:14:10 +0000
Message-Id: <20220222041430.2840289-10-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Hari Nagalla <hnagalla@ti.com>

Lets fix the missing switch firmware binary to point to ping binary
instead. If we attempt to start alternate CPU, we get a very beserk
system.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index a1b851f2..8aa823cc 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -306,7 +306,7 @@ ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] =3D "${nonar=
ch_base_libdir}/firmware/pdk-
=20
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fi=
rmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fi=
rmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/fi=
rmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw] =3D "${nonarch_base_libdir}/fi=
rmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] =3D "${nonarch_base_libdir}/fi=
rmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
--=20
2.25.1

