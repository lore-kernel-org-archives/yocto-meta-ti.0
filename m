Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A11C63709
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.194.1667598060658851722
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 470A940D8A
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqbzgYisi_ea for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 37EE340D93
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B152A1636A2
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 28/47] ti-rtos-firmware: j721e-hs-evm: add secure firmware images
Date: Fri,  4 Nov 2022 21:40:36 +0000
Message-Id: <20221104214055.1221197-29-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15241

From: Manorit Chawdhry <m-chawdhry@ti.com>

Adds support for secure firmware images in J721E HS EVM.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 072a7c3c..d8f00ccd 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -14,6 +14,7 @@ inherit update-alternatives
=20
 PLAT_SFX =3D ""
 PLAT_SFX:j7 =3D "j721e"
+PLAT_SFX:j721e-hs-evm =3D "j721e"
 PLAT_SFX:j7200-evm =3D "j7200"
 PLAT_SFX:j7200-hs-evm =3D "j7200"
 PLAT_SFX:j721s2-evm =3D "j721s2"
@@ -31,7 +32,7 @@ PV =3D "${CORESDK_RTOS_VERSION}"
 CLEANBROKEN =3D "1"
 PR =3D "${INC_PR}.0"
=20
-# Secure Build=20
+# Secure Build
 DEPENDS +=3D "openssl-native"
=20
 TI_SECURE_DEV_PKG ?=3D ""
@@ -55,6 +56,28 @@ do_install:prepend:j721e-hs-evm() {
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
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_=
echo_test_mcu3_0_release_strip.xer5f \
+                        ipc_echo_test_mcu3_0_release_strip.xer5f.signed;=
 \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_=
echo_test_mcu3_1_release_strip.xer5f \
+                        ipc_echo_test_mcu3_1_release_strip.xer5f.signed;=
 \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_=
echo_test_c66xdsp_1_release_strip.xe66 \
+                        ipc_echo_test_c66xdsp_1_release_strip.xe66.signe=
d; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_=
echo_test_c66xdsp_2_release_strip.xe66 \
+                        ipc_echo_test_c66xdsp_2_release_strip.xe66.signe=
d; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_=
echo_test_c7x_1_release_strip.xe71 \
+                        ipc_echo_test_c7x_1_release_strip.xe71.signed; \
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
@@ -115,6 +138,18 @@ do_install:j7() {
     install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.=
xer5f ${LEGACY_ETH_FW_DIR}
 }
=20
+do_install:append:j721e-hs-evm() {
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_stri=
p.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_stri=
p.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_stri=
p.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_stri=
p.xer5f.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_1_release_s=
trip.xe66.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_2_release_s=
trip.xe66.signed ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip=
.xe71.signed ${LEGACY_IPC_FW_DIR}
+    # ETH firmware
+    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.=
xer5f.signed ${LEGACY_ETH_FW_DIR}
+}
+
 do_install:j7200-evm() {
     install -d ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
@@ -221,6 +256,25 @@ ALTERNATIVE:${PN}:am62xx =3D "\
                     am62-main-r5f0_0-fw \
                     "
=20
+ALTERNATIVE:${PN}:j721e-hs-evm =3D "\
+                    j7-mcu-r5f0_0-fw \
+                    j7-mcu-r5f0_1-fw \
+                    j7-main-r5f0_0-fw \
+                    j7-main-r5f0_1-fw \
+                    j7-main-r5f1_0-fw \
+                    j7-main-r5f1_1-fw \
+                    j7-c66_0-fw \
+                    j7-c66_1-fw \
+                    j7-c71_0-fw\
+                    j7-main-r5f0_0-fw-sec \
+                    j7-main-r5f0_1-fw-sec \
+                    j7-main-r5f1_0-fw-sec \
+                    j7-main-r5f1_1-fw-sec \
+                    j7-c66_0-fw-sec \
+                    j7-c66_1-fw-sec \
+                    j7-c71_0-fw-sec \
+                    "
+
 ALTERNATIVE:${PN}:j7 =3D "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
@@ -293,6 +347,14 @@ TARGET_C66_0:j7 =3D "j7-c66_0-fw"
 TARGET_C66_1:j7 =3D "j7-c66_1-fw"
 TARGET_C7X_0:j7 =3D "j7-c71_0-fw"
=20
+TARGET_MAIN_R5FSS0_0_SIGNED:j721e-hs-evm =3D "j7-main-r5f0_0-fw-sec"
+TARGET_MAIN_R5FSS0_1_SIGNED:j721e-hs-evm =3D "j7-main-r5f0_1-fw-sec"
+TARGET_MAIN_R5FSS1_0_SIGNED:j721e-hs-evm =3D "j7-main-r5f1_0-fw-sec"
+TARGET_MAIN_R5FSS1_1_SIGNED:j721e-hs-evm =3D "j7-main-r5f1_1-fw-sec"
+TARGET_C66_0_SIGNED:j721e-hs-evm =3D "j7-c66_0-fw-sec"
+TARGET_C66_1_SIGNED:j721e-hs-evm =3D "j7-c66_1-fw-sec"
+TARGET_C7X_0_SIGNED:j721e-hs-evm =3D "j7-c71_0-fw-sec"
+
 TARGET_MCU_R5FSS0_0:j7200-evm =3D "j7200-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1:j7200-evm =3D "j7200-mcu-r5f0_1-fw"
 TARGET_MAIN_R5FSS0_0:j7200-evm =3D "j7200-main-r5f0_0-fw"
@@ -343,6 +405,14 @@ ALTERNATIVE_LINK_NAME[j7-c66_0-fw] =3D "${nonarch_ba=
se_libdir}/firmware/${TARGET_C
 ALTERNATIVE_LINK_NAME[j7-c66_1-fw] =3D "${nonarch_base_libdir}/firmware/=
${TARGET_C66_1}"
 ALTERNATIVE_LINK_NAME[j7-c71_0-fw] =3D "${nonarch_base_libdir}/firmware/=
${TARGET_C7X_0}"
=20
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] =3D "${base_libdir}/firmwar=
e/${TARGET_MAIN_R5FSS0_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] =3D "${base_libdir}/firmwar=
e/${TARGET_MAIN_R5FSS0_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] =3D "${base_libdir}/firmwar=
e/${TARGET_MAIN_R5FSS1_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] =3D "${base_libdir}/firmwar=
e/${TARGET_MAIN_R5FSS1_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] =3D "${base_libdir}/firmware/${TA=
RGET_C66_0_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] =3D "${base_libdir}/firmware/${TA=
RGET_C66_1_SIGNED}"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] =3D "${base_libdir}/firmware/${TA=
RGET_C7X_0_SIGNED}"
+
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_1}"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/=
firmware/${TARGET_MAIN_R5FSS0_0}"
@@ -381,6 +451,14 @@ ALTERNATIVE_TARGET[j7-c66_0-fw] =3D "${nonarch_base_=
libdir}/firmware/pdk-ipc/ipc_e
 ALTERNATIVE_TARGET[j7-c66_1-fw] =3D "${nonarch_base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66"
 ALTERNATIVE_TARGET[j7-c71_0-fw] =3D "${nonarch_base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
=20
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] =3D "${base_libdir}/firmware/e=
thfw/app_remoteswitchcfg_server_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] =3D "${base_libdir}/firmware/p=
dk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] =3D "${base_libdir}/firmware/p=
dk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] =3D "${base_libdir}/firmware/p=
dk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f.signed"
+ALTERNATIVE_TARGET[j7-c66_0-fw-sec] =3D "${base_libdir}/firmware/pdk-ipc=
/ipc_echo_test_c66xdsp_1_release_strip.xe66.signed"
+ALTERNATIVE_TARGET[j7-c66_1-fw-sec] =3D "${base_libdir}/firmware/pdk-ipc=
/ipc_echo_test_c66xdsp_2_release_strip.xe66.signed"
+ALTERNATIVE_TARGET[j7-c71_0-fw-sec] =3D "${base_libdir}/firmware/pdk-ipc=
/ipc_echo_test_c7x_1_release_strip.xe71.signed"
+
 ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
--=20
2.25.1


