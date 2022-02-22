Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8800.1645503251228734819
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A817640AE9
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KNJECawGlXrj for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9559A40C5D
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 87F6A174770
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 16/17] ti-rtos-firmware: use nonarch_base_libdir for deployment
Date: Tue, 22 Feb 2022 04:14:00 +0000
Message-Id: <20220222041401.2840172-17-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Awais Belal <Awais_Belal@mentor.com>

base_libdir is not configuration safe while firmware binaries
should always be deployed to /lib. In configurations where
base_libdir is not /lib the firmware gets deployed to wrong
paths.
This is fixed by using the nonarch_base_libdir which is
configuration agnostic.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 102 +++++++++---------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index c0beb550..7d286b20 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -31,7 +31,7 @@ PR =3D "${INC_PR}.0"
 # Secure Build=20
 DEPENDS +=3D "openssl-native"
=20
-FILES:${PN} +=3D "${base_libdir}"
+FILES:${PN} +=3D "${nonarch_base_libdir}"
=20
 TI_SECURE_DEV_PKG ?=3D ""
=20
@@ -41,9 +41,9 @@ RTOS_IPC_FW_DIR =3D "${S}/ti-ipc/${PLAT_SFX}"
=20
 # For back-ward compatability keeping legacy firmware folder name
 # TODO: fix this in next version
-LEGACY_ETH_FW_DIR =3D "${D}${base_libdir}/firmware/ethfw/"
-LEGACY_IPC_FW_DIR =3D "${D}${base_libdir}/firmware/pdk-ipc/"
-LEGACY_DM_FW_DIR  =3D "${D}${base_libdir}/firmware/pdk-ipc/"
+LEGACY_ETH_FW_DIR =3D "${D}${nonarch_base_libdir}/firmware/ethfw/"
+LEGACY_IPC_FW_DIR =3D "${D}${nonarch_base_libdir}/firmware/pdk-ipc/"
+LEGACY_DM_FW_DIR  =3D "${D}${nonarch_base_libdir}/firmware/pdk-ipc/"
=20
 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5f"
=20
@@ -208,60 +208,60 @@ TARGET_MCU_R5FSS0_1:j7200-hs-evm =3D "j7200-mcu-r5f=
0_1-fw"
 TARGET_MAIN_R5FSS0_0:j7200-hs-evm =3D "j7200-main-r5f0_0-fw"
 TARGET_MAIN_R5FSS0_1:j7200-hs-evm =3D "j7200-main-r5f0_1-fw"
=20
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/=
${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/=
${TARGET_MCU_R5FSS0_1}"
-
-ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] =3D "${base_libdir}/firmware/=
${TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] =3D "${base_libdir}/firmware/=
${TARGET_MAIN_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] =3D "${base_libdir}/firmware/=
${TARGET_MAIN_R5FSS1_0}"
-ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] =3D "${base_libdir}/firmware/=
${TARGET_MAIN_R5FSS1_1}"
-ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] =3D "${base_libdir}/firmware/$=
{TARGET_MCU_M4FSS0_0}"
-
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/${T=
ARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/${T=
ARGET_MCU_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS1_0}"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS1_1}"
-ALTERNATIVE_LINK_NAME[j7-c66_0-fw] =3D "${base_libdir}/firmware/${TARGET=
_C66_0}"
-ALTERNATIVE_LINK_NAME[j7-c66_1-fw] =3D "${base_libdir}/firmware/${TARGET=
_C66_1}"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw] =3D "${base_libdir}/firmware/${TARGET=
_C7X}"
-
-ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/=
${TARGET_MCU_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/=
${TARGET_MCU_R5FSS0_1}"
-ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] =3D "${base_libdir}/firmware=
/${TARGET_MAIN_R5FSS0_0}"
-ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] =3D "${base_libdir}/firmware=
/${TARGET_MAIN_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_1}"
+
+ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MAIN_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MAIN_R5FSS1_0}"
+ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MAIN_R5FSS1_1}"
+ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] =3D "${nonarch_base_libdir}/fi=
rmware/${TARGET_MCU_M4FSS0_0}"
+
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/${TARGET_MCU_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS1_0}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS1_1}"
+ALTERNATIVE_LINK_NAME[j7-c66_0-fw] =3D "${nonarch_base_libdir}/firmware/=
${TARGET_C66_0}"
+ALTERNATIVE_LINK_NAME[j7-c66_1-fw] =3D "${nonarch_base_libdir}/firmware/=
${TARGET_C66_1}"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw] =3D "${nonarch_base_libdir}/firmware/=
${TARGET_C7X}"
+
+ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/=
firmware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/=
firmware/${TARGET_MAIN_R5FSS0_1}"
=20
 # Create the firmware alternatives
=20
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
-
-ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] =3D "${base_libdir}/firmware/pdk-=
ipc/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f"
-
-ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk-ip=
c/ipc_echo_testb_mcu1_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk-ip=
c/ipc_echo_test_mcu1_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/ethfw=
/app_remoteswitchcfg_server_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk-i=
pc/ipc_echo_test_mcu2_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] =3D "${base_libdir}/firmware/pdk-i=
pc/ipc_echo_test_mcu3_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] =3D "${base_libdir}/firmware/pdk-i=
pc/ipc_echo_test_mcu3_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7-c66_0-fw] =3D "${base_libdir}/firmware/pdk-ipc/ipc=
_echo_test_c66xdsp_1_release_strip.xe66"
-ALTERNATIVE_TARGET[j7-c66_1-fw] =3D "${base_libdir}/firmware/pdk-ipc/ipc=
_echo_test_c66xdsp_2_release_strip.xe66"
-ALTERNATIVE_TARGET[j7-c71_0-fw] =3D "${base_libdir}/firmware/pdk-ipc/ipc=
_echo_test_c7x_1_release_strip.xe71"
-
-ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] =3D "${base_libdir}/firmware/et=
hfw/app_remoteswitchcfg_server_strip.xer5f"
-ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] =3D "${base_libdir}/firmware/pd=
k-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
+
+ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/pdk-ipc/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f"
+
+ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firmwar=
e/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/firmwar=
e/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/firmwa=
re/ethfw/app_remoteswitchcfg_server_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/firmwa=
re/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] =3D "${nonarch_base_libdir}/firmwa=
re/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] =3D "${nonarch_base_libdir}/firmwa=
re/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-c66_0-fw] =3D "${nonarch_base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_c66xdsp_1_release_strip.xe66"
+ALTERNATIVE_TARGET[j7-c66_1-fw] =3D "${nonarch_base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66"
+ALTERNATIVE_TARGET[j7-c71_0-fw] =3D "${nonarch_base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
+
+ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
+ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] =3D "${nonarch_base_libdir}/fir=
mware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
=20
 ALTERNATIVE_PRIORITY =3D "10"
=20
 # make sure that lib/firmware, and all its contents are part of the pack=
age
-FILES:${PN} +=3D "${base_libdir}/firmware"
+FILES:${PN} +=3D "${nonarch_base_libdir}/firmware"
=20
 # This is used to prevent the build system to_strip the executables
 INHIBIT_PACKAGE_STRIP =3D "1"
--=20
2.25.1

