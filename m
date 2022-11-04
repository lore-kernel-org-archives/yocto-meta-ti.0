Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF40C63705
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.213.1667598060696518523
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4730B40D95
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itUBZL-ZbKgp for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3DA5A40D89
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B394E1636A3
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 29/47] ti-rtos-firmware: j7200-hs-evm: add secure firmware images
Date: Fri,  4 Nov 2022 21:40:37 +0000
Message-Id: <20221104214055.1221197-30-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15244

From: Manorit Chawdhry <m-chawdhry@ti.com>

Adds support for secure firmware images in J7200 HS EVM.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index d8f00ccd..ea4737b9 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -87,6 +87,18 @@ do_install:prepend:j7200-hs-evm() {
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM=
_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
         )
+        (
+          cd ${RTOS_IPC_FW_DIR}; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_=
echo_test_mcu2_0_release_strip.xer5f \
+                        ipc_echo_test_mcu2_0_release_strip.xer5f.signed;=
 \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_=
echo_test_mcu2_1_release_strip.xer5f \
+                        ipc_echo_test_mcu2_1_release_strip.xer5f.signed;=
 \
+        )
+        (
+          cd ${RTOS_ETH_FW_DIR}; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh app_=
remoteswitchcfg_server_strip.xer5f \
+                        app_remoteswitchcfg_server_strip.xer5f.signed;
+        )
 }
=20
 # J7 HS support
@@ -167,11 +179,16 @@ do_install:j7200-hs-evm() {
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    # Signed Firmwares
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_stri=
p.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_stri=
p.xer5f.signed ${LEGACY_IPC_FW_DIR}
     # DM Firmware
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_stri=
p.xer5f ${LEGACY_DM_FW_DIR}
     # ETH firmware
     install -d ${LEGACY_ETH_FW_DIR}
     install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.=
xer5f ${LEGACY_ETH_FW_DIR}
+    # ETH Signed firmware
+    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.=
xer5f.signed ${LEGACY_ETH_FW_DIR}
 }
=20
 do_install:j721s2-evm() {
@@ -299,6 +316,8 @@ ALTERNATIVE:${PN}:j7200-hs-evm =3D "\
                     j7200-mcu-r5f0_1-fw \
                     j7200-main-r5f0_0-fw \
                     j7200-main-r5f0_1-fw \
+                    j7200-main-r5f0_0-fw-sec \
+                    j7200-main-r5f0_1-fw-sec \
                     "
=20
 ALTERNATIVE_${PN}:j721s2-evm =3D "\
@@ -365,6 +384,9 @@ TARGET_MCU_R5FSS0_1:j7200-hs-evm =3D "j7200-mcu-r5f0_=
1-fw"
 TARGET_MAIN_R5FSS0_0:j7200-hs-evm =3D "j7200-main-r5f0_0-fw"
 TARGET_MAIN_R5FSS0_1:j7200-hs-evm =3D "j7200-main-r5f0_1-fw"
=20
+TARGET_MAIN_R5FSS0_0_SIGNED:j7200-hs-evm =3D "j7200-main-r5f0_0-fw-sec"
+TARGET_MAIN_R5FSS0_1_SIGNED:j7200-hs-evm =3D "j7200-main-r5f0_1-fw-sec"
+
 TARGET_MCU_R5FSS0_0:j721s2-evm =3D "j721s2-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1:j721s2-evm =3D "j721s2-mcu-r5f0_1-fw"
 TARGET_MAIN_R5FSS0_0:j721s2-evm =3D "j721s2-main-r5f0_0-fw"
@@ -418,6 +440,9 @@ ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] =3D "${non=
arch_base_libdir}/firmware/${
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/=
firmware/${TARGET_MAIN_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/=
firmware/${TARGET_MAIN_R5FSS0_1}"
=20
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] =3D "${base_libdir}/firm=
ware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] =3D "${base_libdir}/firm=
ware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
+
 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/=
firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/=
firmware/${TARGET_MCU_R5FSS0_1}"
 ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw] =3D "${nonarch_base_libdir}=
/firmware/${TARGET_MAIN_R5FSS0_0}"
@@ -464,6 +489,9 @@ ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] =3D "${nonarc=
h_base_libdir}/firmware/pdk-i
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
 ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
=20
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] =3D "${base_libdir}/firmwar=
e/ethfw/app_remoteswitchcfg_server_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] =3D "${base_libdir}/firmwar=
e/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
+
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fi=
rmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
--=20
2.25.1


