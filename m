Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8952.1645503272722616386
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 70AB140C7F
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvGnrvewpXhI for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 623F840C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 24CEA174770
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 05/29] ti-rtos-bin: Add j721s2
Date: Tue, 22 Feb 2022 04:14:06 +0000
Message-Id: <20220222041430.2840289-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Nishanth Menon <nm@ti.com>

Lets keep ethernet switch firmware disabled till we can actually
integrate it.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 77955880..4b92e364 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -16,6 +16,7 @@ PLAT_SFX =3D ""
 PLAT_SFX:j7 =3D "j721e"
 PLAT_SFX:j7200-evm =3D "j7200"
 PLAT_SFX:j7200-hs-evm =3D "j7200"
+PLAT_SFX:j721s2-evm =3D "j721s2"
 PLAT_SFX:am65xx =3D "am65xx"
 PLAT_SFX:am64xx =3D "am64xx"
=20
@@ -122,6 +123,22 @@ do_install:j7200-hs-evm() {
     install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.=
xer5f ${LEGACY_ETH_FW_DIR}
 }
=20
+do_install:j721s2-evm() {
+    install -d ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip=
.xe71 ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip=
.xe71 ${LEGACY_IPC_FW_DIR}
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_stri=
p.xer5f ${LEGACY_DM_FW_DIR}
+    # ETH firmware
+    # install -d ${LEGACY_ETH_FW_DIR}
+    # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_stri=
p.xer5f ${LEGACY_ETH_FW_DIR}
+}
+
 do_install:am65xx() {
     install -d ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
@@ -177,6 +194,17 @@ ALTERNATIVE:${PN}:j7200-hs-evm =3D "\
                     j7200-main-r5f0_1-fw \
                     "
=20
+ALTERNATIVE_${PN}:j721s2-evm =3D "\
+                    j7-mcu-r5f0_0-fw \
+                    j7-mcu-r5f0_1-fw \
+                    j7-main-r5f0_0-fw \
+                    j7-main-r5f0_1-fw \
+                    j7-main-r5f1_0-fw \
+                    j7-main-r5f1_1-fw \
+                    j7-c71_0-fw\
+                    j7-c71_1-fw\
+                    "
+
 # Set up link names for the firmwares
=20
 TARGET_MCU_R5FSS0_0:am65xx =3D "am65x-mcu-r5f0_0-fw"
@@ -197,6 +225,7 @@ TARGET_MAIN_R5FSS1_1:j7 =3D "j7-main-r5f1_1-fw"
 TARGET_C66_0:j7 =3D "j7-c66_0-fw"
 TARGET_C66_1:j7 =3D "j7-c66_1-fw"
 TARGET_C7X_0:j7 =3D "j7-c71_0-fw"
+TARGET_C7X_1:j7 =3D "j7-c71_1-fw"
=20
 TARGET_MCU_R5FSS0_0:j7200-evm =3D "j7200-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1:j7200-evm =3D "j7200-mcu-r5f0_1-fw"
@@ -232,6 +261,15 @@ ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] =3D "${no=
narch_base_libdir}/firmware/${
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/=
firmware/${TARGET_MAIN_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/=
firmware/${TARGET_MAIN_R5FSS0_1}"
=20
+ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/=
firmware/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/=
firmware/${TARGET_MCU_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw] =3D "${nonarch_base_libdir}=
/firmware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw] =3D "${nonarch_base_libdir}=
/firmware/${TARGET_MAIN_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw] =3D "${nonarch_base_libdir}=
/firmware/${TARGET_MAIN_R5FSS1_0}"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] =3D "${nonarch_base_libdir}=
/firmware/${TARGET_MAIN_R5FSS1_1}"
+ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/${TARGET_C7X_0}"
+ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/${TARGET_C7X_1}"
+
 # Create the firmware alternatives
=20
 ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
--=20
2.25.1

