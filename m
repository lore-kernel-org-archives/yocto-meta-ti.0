Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34BEC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.214.1667598060703529497
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 539DB40D89
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id llUxYQO2xTgy for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 480A940D96
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B597C1636A4
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 30/47] ti-rtos-firmware: j721s2-hs-evm: add secure firmware images
Date: Fri,  4 Nov 2022 21:40:38 +0000
Message-Id: <20221104214055.1221197-31-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15243

From: Manorit Chawdhry <m-chawdhry@ti.com>

Adds support for secure firmware images in J721S2 HS EVM.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index ea4737b9..219b86dc 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -108,6 +108,21 @@ do_install:prepend:j721s2-hs-evm() {
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM=
_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
         )
+        (
+          cd ${RTOS_IPC_FW_DIR}; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo=
_test_mcu2_0_release_strip.xer5f \
+                ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo=
_test_mcu2_1_release_strip.xer5f \
+                ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo=
_test_mcu3_0_release_strip.xer5f \
+                ipc_echo_test_mcu3_0_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo=
_test_mcu3_1_release_strip.xer5f \
+                ipc_echo_test_mcu3_1_release_strip.xer5f.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo=
_test_c7x_1_release_strip.xe71 \
+                ipc_echo_test_c7x_1_release_strip.xe71.signed; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo=
_test_c7x_2_release_strip.xe71 \
+                ipc_echo_test_c7x_2_release_strip.xe71.signed; \
+        )
 }
=20
 # Update the am64xx ipc binaries to be consistent with other platforms
@@ -216,6 +231,13 @@ do_install:j721s2-hs-evm() {
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip=
.xe71 ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip=
.xe71 ${LEGACY_IPC_FW_DIR}
+    # Signed firmware
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_stri=
p.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_stri=
p.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_stri=
p.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_stri=
p.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip=
.xe71.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip=
.xe71.signed ${LEGACY_IPC_FW_DIR}
     # DM Firmware
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_stri=
p.xer5f ${LEGACY_DM_FW_DIR}
     # ETH firmware
@@ -340,6 +362,12 @@ ALTERNATIVE:${PN}:j721s2-hs-evm =3D "\
                     j721s2-main-r5f1_1-fw \
                     j721s2-c71_0-fw \
                     j721s2-c71_1-fw \
+                    j721s2-main-r5f0_0-fw-sec \
+                    j721s2-main-r5f0_1-fw-sec \
+                    j721s2-main-r5f1_0-fw-sec \
+                    j721s2-main-r5f1_1-fw-sec \
+                    j721s2-c71_0-fw-sec \
+                    j721s2-c71_1-fw-sec \
                     "
=20
 # Set up link names for the firmwares
@@ -405,6 +433,13 @@ TARGET_MAIN_R5FSS1_1:j721s2-hs-evm =3D "j721s2-main-=
r5f1_1-fw"
 TARGET_C7X_0:j721s2-hs-evm =3D "j721s2-c71_0-fw"
 TARGET_C7X_1:j721s2-hs-evm =3D "j721s2-c71_1-fw"
=20
+TARGET_MAIN_R5FSS0_0_SIGNED:j721s2-hs-evm =3D "j721s2-main-r5f0_0-fw-sec=
"
+TARGET_MAIN_R5FSS0_1_SIGNED:j721s2-hs-evm =3D "j721s2-main-r5f0_1-fw-sec=
"
+TARGET_MAIN_R5FSS1_0_SIGNED:j721s2-hs-evm =3D "j721s2-main-r5f1_0-fw-sec=
"
+TARGET_MAIN_R5FSS1_1_SIGNED:j721s2-hs-evm =3D "j721s2-main-r5f1_1-fw-sec=
"
+TARGET_C7X_0_SIGNED:j721s2-hs-evm =3D "j721s2-c71_0-fw-sec"
+TARGET_C7X_1_SIGNED:j721s2-hs-evm =3D "j721s2-c71_1-fw-sec"
+
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_1}"
=20
@@ -452,6 +487,13 @@ ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] =3D "${=
nonarch_base_libdir}/firmware/
 ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/${TARGET_C7X_0}"
 ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/${TARGET_C7X_1}"
=20
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw-sec] =3D "${base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw-sec] =3D "${base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw-sec] =3D "${base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] =3D "${base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] =3D "${base_libdir}/firmware/=
${TARGET_C7X_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] =3D "${base_libdir}/firmware/=
${TARGET_C7X_1_SIGNED}"
+
 # Create the firmware alternatives
=20
 ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
@@ -501,6 +543,13 @@ ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] =3D "${non=
arch_base_libdir}/firmware/pdk
 ALTERNATIVE_TARGET[j721s2-c71_0-fw] =3D "${nonarch_base_libdir}/firmware=
/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
 ALTERNATIVE_TARGET[j721s2-c71_1-fw] =3D "${nonarch_base_libdir}/firmware=
/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71"
=20
+ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw-sec] =3D "${base_libdir}/firmwa=
re/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw-sec] =3D "${base_libdir}/firmwa=
re/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw-sec] =3D "${base_libdir}/firmwa=
re/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] =3D "${base_libdir}/firmwa=
re/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
+ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_c7x_2_release_strip.xe71.signed"
+
 ALTERNATIVE_PRIORITY =3D "10"
=20
 # make sure that lib/firmware, and all its contents are part of the pack=
age
--=20
2.25.1


