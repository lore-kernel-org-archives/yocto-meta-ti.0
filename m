Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9198CC6FD22
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.829.1663041348011003912
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 052D640D9F
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YzkDgwubSVtQ for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D4C2D40D88
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 698D81749DB
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 15/65] ti-rtos-firmware: Add j721s2 hs
 support
Date: Tue, 13 Sep 2022 03:54:51 +0000
Message-Id: <20220913035541.2364351-16-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15046

From: Jayesh Choudhary <j-choudhary@ti.com>

Sign the DM firmware for j721s2 similar to j7200 hs.
Duplicate all j721s2 entries for j721s2-hs as we cannot use same
keyword for match between j721s2-evm and j721s2-hs-evm.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 317ff4c4..072a7c3c 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,6 +17,7 @@ PLAT_SFX:j7 =3D "j721e"
 PLAT_SFX:j7200-evm =3D "j7200"
 PLAT_SFX:j7200-hs-evm =3D "j7200"
 PLAT_SFX:j721s2-evm =3D "j721s2"
+PLAT_SFX:j721s2-hs-evm =3D "j721s2"
 PLAT_SFX:am65xx =3D "am65xx"
 PLAT_SFX:am64xx =3D "am64xx"
 PLAT_SFX:am62xx =3D "am62xx"
@@ -65,6 +66,15 @@ do_install:prepend:j7200-hs-evm() {
         )
 }
=20
+# J7 HS support
+do_install:prepend:j721s2-hs-evm() {
+        export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
+        ( cd ${RTOS_DM_FW_DIR}; \
+                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM=
_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
+        )
+}
+
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install:prepend:am64xx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
@@ -145,6 +155,22 @@ do_install:j721s2-evm() {
     # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_stri=
p.xer5f ${LEGACY_ETH_FW_DIR}
 }
=20
+do_install:j721s2-hs-evm() {
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
@@ -232,6 +258,17 @@ ALTERNATIVE_${PN}:j721s2-evm =3D "\
                     j721s2-c71_1-fw \
                     "
=20
+ALTERNATIVE:${PN}:j721s2-hs-evm =3D "\
+                    j721s2-mcu-r5f0_0-fw \
+                    j721s2-mcu-r5f0_1-fw \
+                    j721s2-main-r5f0_0-fw \
+                    j721s2-main-r5f0_1-fw \
+                    j721s2-main-r5f1_0-fw \
+                    j721s2-main-r5f1_1-fw \
+                    j721s2-c71_0-fw \
+                    j721s2-c71_1-fw \
+                    "
+
 # Set up link names for the firmwares
=20
 TARGET_MCU_R5FSS0_0:am65xx =3D "am65x-mcu-r5f0_0-fw"
@@ -275,6 +312,15 @@ TARGET_MAIN_R5FSS1_1:j721s2-evm =3D "j721s2-main-r5f=
1_1-fw"
 TARGET_C7X_0:j721s2-evm =3D "j721s2-c71_0-fw"
 TARGET_C7X_1:j721s2-evm =3D "j721s2-c71_1-fw"
=20
+TARGET_MCU_R5FSS0_0:j721s2-hs-evm =3D "j721s2-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1:j721s2-hs-evm =3D "j721s2-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0:j721s2-hs-evm =3D "j721s2-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1:j721s2-hs-evm =3D "j721s2-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0:j721s2-hs-evm =3D "j721s2-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1:j721s2-hs-evm =3D "j721s2-main-r5f1_1-fw"
+TARGET_C7X_0:j721s2-hs-evm =3D "j721s2-c71_0-fw"
+TARGET_C7X_1:j721s2-hs-evm =3D "j721s2-c71_1-fw"
+
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_1}"
=20
--=20
2.25.1


