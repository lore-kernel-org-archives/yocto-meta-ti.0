Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EBDC7618E
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:38:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6409.1679283526995326936
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DA88E40C98
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIheJJmdEfLW for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:38:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B30C540CD8
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 8C88A1637FB
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 54/54] ti-rtos-firmware: numerous fixes and cleanups
Date: Mon, 20 Mar 2023 03:38:40 +0000
Message-Id: <20230320033840.1193963-55-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033840.1193963-1-denis@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16053

From: Denys Dmytriyenko <denys@konsulko.com>

Doing multiple do_install:prepend overrides does not guarantee the
order - it was observed that signing could fail as it was happening
prior to symlinking to the correct name. Move signing code inside the
main do_install, so the machine-specific do_install:prepend works
correctly.

Also, pass -f flag for symlinking, otherwise it could fail with "file
already exists" error when trying to re-build the recipe again.

Several IPC list/matrix fixes:
* j721e was missing MCU_1_1_FW entry
* j721s2 was also missing MCU_1_1_FW entry
* j721s2 had a second MCU_2_0_FW in place of MCU_3_0_FW
* j784s4 was missing MCU_4_0_FW and MCU_4_1_FW entries

Other minor cleanups and indentation fixes.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 63 +++++++++----------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 9b94a61e..ae7bdb81 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -64,105 +64,103 @@ C7X_4_FW   =3D "ipc_echo_test_c7x_4_release_strip.x=
e71"
 ETH_FW =3D "app_remoteswitchcfg_server_strip.xer5f"
=20
 DM_FW_LIST =3D ""
-DM_FW_LIST:am65xx =3D  ""
 DM_FW_LIST:j721e =3D   "${DM_FIRMWARE}"
 DM_FW_LIST:j7200 =3D   "${DM_FIRMWARE}"
 DM_FW_LIST:j721s2 =3D  "${DM_FIRMWARE}"
+DM_FW_LIST:j784s4 =3D  "${DM_FIRMWARE}"
+DM_FW_LIST:am65xx =3D  ""
 DM_FW_LIST:am64xx =3D  ""
 DM_FW_LIST:am62xx =3D  "${DM_FIRMWARE}"
 DM_FW_LIST:am62axx =3D "${DM_FIRMWARE}"
-DM_FW_LIST:j784s4 =3D  "${DM_FIRMWARE}"
=20
 IPC_FW_LIST =3D ""
-IPC_FW_LIST:am65xx =3D  "${MCU_1_0_FW} ${MCU_1_1_FW}"
-IPC_FW_LIST:j721e =3D   "                            ${MCU_2_0_FW} ${MCU=
_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
+IPC_FW_LIST:j721e =3D   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU=
_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_=
FW} ${C66_2_FW} ${C7X_1_FW}"
 IPC_FW_LIST:j7200 =3D   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU=
_2_1_FW}"
-IPC_FW_LIST:j721s2 =3D  "                            ${MCU_2_0_FW} ${MCU=
_2_1_FW} ${MCU_2_0_FW} ${MCU_3_1_FW}                         ${C7X_1_FW} =
${C7X_2_FW}"
+IPC_FW_LIST:j721s2 =3D  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU=
_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                                     =
                ${C7X_1_FW} ${C7X_2_FW}"
+IPC_FW_LIST:j784s4 =3D  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU=
_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${MCU_4_0_FW} ${MCU_4_1_FW}         =
                ${C7X_1_FW} ${C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"
+IPC_FW_LIST:am65xx =3D  "${MCU_1_0_FW} ${MCU_1_1_FW}"
 IPC_FW_LIST:am64xx =3D  "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU=
_2_1_FW} ${MCU_3_0_FW}"
 IPC_FW_LIST:am62xx =3D  "                            ${MCU_2_0_FW}"
-IPC_FW_LIST:am62axx =3D "                            ${MCU_2_0_FW}      =
                                                             ${C7X_1_FW}"
-IPC_FW_LIST:j784s4 =3D  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU=
_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                         ${C7X_1_FW} =
${C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"
+IPC_FW_LIST:am62axx =3D "                            ${MCU_2_0_FW}      =
                                                                         =
                ${C7X_1_FW}"
=20
 ETH_FW_LIST =3D ""
-ETH_FW_LIST:am65xx =3D  ""
 ETH_FW_LIST:j721e =3D   "${ETH_FW}"
 ETH_FW_LIST:j7200 =3D   "${ETH_FW}"
 ETH_FW_LIST:j721s2 =3D  ""
+ETH_FW_LIST:j784s4 =3D  "${ETH_FW}"
+ETH_FW_LIST:am65xx =3D  ""
 ETH_FW_LIST:am64xx =3D  ""
 ETH_FW_LIST:am62xx =3D  ""
 ETH_FW_LIST:am62axx =3D ""
-ETH_FW_LIST:j784s4 =3D  "${ETH_FW}"
=20
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install:prepend:am64xx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
-                ln -s am64-main-r5f0_0-fw ${MCU_1_0_FW}; \
-                ln -s am64-main-r5f0_1-fw ${MCU_1_1_FW}; \
-                ln -s am64-main-r5f1_0-fw ${MCU_2_0_FW}; \
-                ln -s am64-main-r5f1_1-fw ${MCU_2_1_FW}; \
-                ln -s am64-mcu-m4f0_0-fw ${MCU_3_0_FW}; \
+                ln -sf am64-main-r5f0_0-fw ${MCU_1_0_FW}; \
+                ln -sf am64-main-r5f0_1-fw ${MCU_1_1_FW}; \
+                ln -sf am64-main-r5f1_0-fw ${MCU_2_0_FW}; \
+                ln -sf am64-main-r5f1_1-fw ${MCU_2_1_FW}; \
+                ln -sf am64-mcu-m4f0_0-fw ${MCU_3_0_FW}; \
         )
 }
=20
 # Update the am62xx ipc binaries to be consistent with other platforms
 do_install:prepend:am62xx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
-                ln -s am62-mcu-m4f0_0-fw ${MCU_2_0_FW}; \
+                ln -sf am62-mcu-m4f0_0-fw ${MCU_2_0_FW}; \
         )
 }
=20
 # Update the am62axx ipc binaries to be consistent with other platforms
 do_install:prepend:am62axx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
-                ln -s am62a-mcu-r5f0_0-fw ${MCU_1_0_FW}; \
+                ln -sf am62a-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
         )
 }
=20
-# Sign the firmware
-do_install:prepend() {
+do_install() {
+    # Sign the firmware
     # DM Firmware
     for FW_NAME in ${DM_FW_LIST}
     do
-      ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_DM_FW_D=
IR}/${FW_NAME} ${RTOS_DM_FW_DIR}/${FW_NAME}.signed
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_DM_FW=
_DIR}/${FW_NAME} ${RTOS_DM_FW_DIR}/${FW_NAME}.signed
     done
=20
     # IPC Firmware
     for FW_NAME in ${IPC_FW_LIST}
     do
-      ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_IPC_FW_=
DIR}/${FW_NAME} ${RTOS_IPC_FW_DIR}/${FW_NAME}.signed
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_IPC_F=
W_DIR}/${FW_NAME} ${RTOS_IPC_FW_DIR}/${FW_NAME}.signed
     done
=20
     # ETH firmware
     for FW_NAME in ${ETH_FW_LIST}
     do
-        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_ETH_F=
W_DIR}/${FW_NAME} ${RTOS_ETH_FW_DIR}/${FW_NAME}.signed;
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${RTOS_ETH_F=
W_DIR}/${FW_NAME} ${RTOS_ETH_FW_DIR}/${FW_NAME}.signed
     done
-}
=20
-#Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, wi=
th softlinks up a level
-do_install() {
+    # Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ip=
c, with softlinks up a level
     # DM Firmware
     install -d ${LEGACY_DM_FW_DIR}
     for FW_NAME in ${DM_FW_LIST}
     do
-      install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}        ${LEGACY_DM_FW=
_DIR}/${FW_NAME}.unsigned
-      install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}.signed ${LEGACY_DM_FW=
_DIR}/${FW_NAME}
+        install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}        ${LEGACY_DM_=
FW_DIR}/${FW_NAME}.unsigned
+        install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}.signed ${LEGACY_DM_=
FW_DIR}/${FW_NAME}
     done
=20
     # IPC Firmware
     install -d ${LEGACY_IPC_FW_DIR}
     for FW_NAME in ${IPC_FW_LIST}
     do
-      install -m 0644 ${RTOS_IPC_FW_DIR}/${FW_NAME}        ${LEGACY_IPC_=
FW_DIR}
-      install -m 0644 ${RTOS_IPC_FW_DIR}/${FW_NAME}.signed ${LEGACY_IPC_=
FW_DIR}
+        install -m 0644 ${RTOS_IPC_FW_DIR}/${FW_NAME}        ${LEGACY_IP=
C_FW_DIR}
+        install -m 0644 ${RTOS_IPC_FW_DIR}/${FW_NAME}.signed ${LEGACY_IP=
C_FW_DIR}
     done
=20
     # ETH firmware
     install -d ${LEGACY_ETH_FW_DIR}
     for FW_NAME in ${ETH_FW_LIST}
     do
-      install -m 0644 ${RTOS_ETH_FW_DIR}/${FW_NAME}        ${LEGACY_ETH_=
FW_DIR}
-      install -m 0644 ${RTOS_ETH_FW_DIR}/${FW_NAME}.signed ${LEGACY_ETH_=
FW_DIR}
+        install -m 0644 ${RTOS_ETH_FW_DIR}/${FW_NAME}        ${LEGACY_ET=
H_FW_DIR}
+        install -m 0644 ${RTOS_ETH_FW_DIR}/${FW_NAME}.signed ${LEGACY_ET=
H_FW_DIR}
     done
 }
=20
@@ -171,8 +169,8 @@ do_deploy() {
     install -d ${DEPLOYDIR}
     for FW_NAME in ${DM_FW_LIST}
     do
-      install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}/$=
{FW_NAME}.unsigned
-      install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}.signed ${DEPLOYDIR}/$=
{FW_NAME}
+        install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}=
/${FW_NAME}.unsigned
+        install -m 0644 ${RTOS_DM_FW_DIR}/${FW_NAME}.signed ${DEPLOYDIR}=
/${FW_NAME}
     done
 }
=20
@@ -189,6 +187,7 @@ ALTERNATIVE:${PN}:am64xx =3D "\
                     am64-main-r5f1_1-fw \
                     am64-mcu-m4f0_0-fw \
                     "
+
 ALTERNATIVE:${PN}:am62xx =3D "\
                     am62-mcu-m4f0_0-fw \
                     am62-main-r5f0_0-fw \
--=20
2.25.1


