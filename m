Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64383C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 09:47:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.44046.1670320019747137482
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Dec 2022 01:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=H9Y2cHY+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B69ktNd064238;
	Tue, 6 Dec 2022 03:46:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670320015;
	bh=vNZFsVOxx7401qCC12bsnJrONE7qDRUmy7Fww1Ouq3U=;
	h=From:To:CC:Subject:Date;
	b=H9Y2cHY+HoQt+nqyx4Hqe/QGrnfKmH12I+R7/exU+JkS1zxNlPruGrtQiD0ii1adq
	 Yf9/tMpsadwQyes58EwE9i5vJtiwgK5ysx/SCWrq2S+KOf4Vo2pJFkKr26w153jMrZ
	 R+nIiiNe+YC5y48ytDCduGtnBf8N+SfG3DUv7V/M=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B69kt14074683
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Dec 2022 03:46:55 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 6
 Dec 2022 03:46:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 6 Dec 2022 03:46:55 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B69ksdW111329;
	Tue, 6 Dec 2022 03:46:54 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <g-gupta@ti.com>
CC: <s-adivi@ti.com>
Subject: [meta-ti][dunfell][PATCH] machine: Add am62axx evm configuration
Date: Tue, 6 Dec 2022 15:16:51 +0530
Message-ID: <20221206094651.11172-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 2B69ktNd064238
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Dec 2022 09:47:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15410

From: "Bhagat, Paresh" <p-bhagat@ti.com>

Lets add the basic AM62Axx-evm configuration.
- Add configurations.
- Add firmware overrides.
- Add u-boot overrides.
- Add tifs-lpm-stub.
- Add cnm-wave-fw.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 conf/machine/am62axx-evm-k3r5.conf            | 11 ++++++++
 conf/machine/am62axx-evm.conf                 | 11 ++++++++
 conf/machine/include/am62axx.inc              | 16 +++++++++++
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    |  5 +++-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  1 +
 .../tifs-lpm-stub/tifs-lpm-stub_git.bb        |  2 +-
 recipes-bsp/u-boot/u-boot-ti.inc              |  1 +
 recipes-kernel/linux/kernel-rdepends.inc      |  2 ++
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 27 +++++++++++++++++++
 9 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 conf/machine/am62axx-evm-k3r5.conf
 create mode 100644 conf/machine/am62axx-evm.conf
 create mode 100644 conf/machine/include/am62axx.inc

diff --git a/conf/machine/am62axx-evm-k3r5.conf b/conf/machine/am62axx-ev=
m-k3r5.conf
new file mode 100644
index 00000000..ca30537f
--- /dev/null
+++ b/conf/machine/am62axx-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62AXX EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62Axx EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC =3D "am62ax"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "gp"
+
+UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
diff --git a/conf/machine/am62axx-evm.conf b/conf/machine/am62axx-evm.con=
f
new file mode 100644
index 00000000..4eb179f3
--- /dev/null
+++ b/conf/machine/am62axx-evm.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62AXX EVM
+#@DESCRIPTION: Machine configuration for the TI AM62AXX EVM
+
+require conf/machine/include/am62axx.inc
+
+KERNEL_DEVICETREE =3D " \
+    ti/k3-am62a7-sk.dtb \
+"
+
+UBOOT_MACHINE =3D "am62ax_evm_a53_defconfig"
diff --git a/conf/machine/include/am62axx.inc b/conf/machine/include/am62=
axx.inc
new file mode 100644
index 00000000..a27ae8ae
--- /dev/null
+++ b/conf/machine/include/am62axx.inc
@@ -0,0 +1,16 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY_append =3D ":am62axx"
+
+MACHINE_FEATURES +=3D "screen touchscreen"
+
+SERIAL_CONSOLES =3D "115200;ttyS2"
+SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
+
+TFA_K3_SYSTEM_SUSPEND =3D "1"
+
+do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+
+TFA_BOARD =3D "lite"
+OPTEEMACHINE =3D "k3-am65x"
+OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm=
-wave-fw/cnm-wave-fw_git.bb
index c904ba62..7b42b1d3 100644
--- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -13,7 +13,7 @@ PR =3D "${INC_PR}.1"
=20
 CLEANBROKEN =3D "1"
=20
-COMPATIBLE_MACHINE =3D "j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-ev=
m"
+COMPATIBLE_MACHINE =3D "j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-ev=
m|am62axx-evm"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -30,6 +30,9 @@ ALTERNATIVE_PRIORITY =3D "10"
 ALTERNATIVE_${PN}_j7 =3D "\
                     wave521c_codec_fw.bin"
=20
+ALTERNATIVE_${PN}_am62axx-evm =3D "\
+                    wave521c_codec_fw.bin"
+
 do_install() {
 	install -d ${D}${base_libdir}/firmware/cnm
 	install -m 0644 ${S}/cnm/${SOURCE_WAVE521C} ${D}${base_libdir}/firmware=
/cnm/${TARGET_WAVE521C}
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-=
fw/ti-sci-fw_git.bb
index 79c39ee5..1b8530ec 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -39,6 +39,7 @@ SYSFW_PREFIX_j784s4-evm-k3r5 =3D "fs"
 SYSFW_PREFIX_j784s4-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX_am62xx-evm-k3r5 =3D "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5 =3D "fs"
+SYSFW_PREFIX_am62axx-evm-k3r5 =3D "fs"
=20
 SYSFW_TISCI =3D "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-=
*.bin"
=20
diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/recipes-bsp=
/tifs-lpm-stub/tifs-lpm-stub_git.bb
index 876036f2..17d08b91 100644
--- a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
+++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
@@ -7,7 +7,7 @@ PR =3D "${INC_PR}.0"
=20
 CLEANBROKEN =3D "1"
=20
-COMPATIBLE_MACHINE =3D "am62xx-evm|am62xx-lp-evm"
+COMPATIBLE_MACHINE =3D "am62xx-evm|am62xx-lp-evm|am62axx-evm"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot=
-ti.inc
index 97f9fa2b..90f60980 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -34,6 +34,7 @@ PACKAGECONFIG[dm] =3D "DM=3D${STAGING_DIR_HOST}${nonarc=
h_base_libdir}/firmware/pdk-i
 PACKAGECONFIG_append_aarch64 =3D " atf optee"
 PACKAGECONFIG_append_j7 =3D " dm"
 PACKAGECONFIG_append_am62xx =3D " dm"
+PACKAGECONFIG_append_am62axx =3D " dm"
=20
 COMPATIBLE_MACHINE =3D "(ti-soc)"
=20
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/li=
nux/kernel-rdepends.inc
index 08f3f462..a93d7e6c 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -53,8 +53,10 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm=
 =3D " cnm-wave-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm =3D " cnm-wave=
-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-evm =3D " cnm-wave-fw=
"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-hs-evm =3D " cnm-wave=
-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62axx-evm =3D " cnm-wave-f=
w"
=20
 # Add run-time dependency for TIFS Low Power Module stub
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm =3D " tifs-lpm-st=
ub"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-lp-evm =3D " tifs-lpm=
-stub"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62axx-evm =3D " tifs-lpm-s=
tub"
=20
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-r=
tos-bin/ti-rtos-firmware.bb
index 31212aae..24a904f0 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -24,6 +24,7 @@ PLAT_SFX_j784s4-hs-evm =3D "j784s4"
 PLAT_SFX_am65xx =3D "am65xx"
 PLAT_SFX_am64xx =3D "am64xx"
 PLAT_SFX_am62xx =3D "am62xx"
+PLAT_SFX_am62axx =3D "am62axx"
=20
 FILESEXTRAPATHS_prepend :=3D "${METATIBASE}/recipes-bsp/ti-sci-fw/files/=
:"
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -354,6 +355,13 @@ do_install_am62xx() {
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_stri=
p.xer5f ${LEGACY_DM_FW_DIR}
 }
=20
+do_install_am62axx() {
+    install -d ${LEGACY_IPC_FW_DIR}
+    # DM+IPC Firmware
+    install -m 0644 ${RTOS_IPC_FW_DIR}/am62a-mcu-r5f0_0-fw ${LEGACY_IPC_=
FW_DIR}
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_stri=
p.xer5f ${LEGACY_DM_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip=
.xe71 ${LEGACY_IPC_FW_DIR}
+}
=20
 do_deploy() {
     install -d ${DEPLOYDIR}
@@ -364,6 +372,11 @@ do_deploy_am62xx() {
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_stri=
p.xer5f ${DEPLOYDIR}
 }
=20
+do_deploy_am62axx() {
+    install -d ${DEPLOYDIR}
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_stri=
p.xer5f ${DEPLOYDIR}
+}
+
 # Set up names for the firmwares
 ALTERNATIVE_${PN}_am65xx =3D "\
                     am65x-mcu-r5f0_0-fw \
@@ -382,6 +395,11 @@ ALTERNATIVE_${PN}_am62xx =3D "\
                     am62-main-r5f0_0-fw \
                     "
=20
+ALTERNATIVE_${PN}_am62axx =3D "\
+    =C2=A6   =C2=A6   =C2=A6   =C2=A6   am62a-mcu-r5f0_0-fw \
+    =C2=A6   =C2=A6   =C2=A6   =C2=A6   am62a-c71_0-fw \
+    =C2=A6   =C2=A6   =C2=A6   =C2=A6   "
+
 ALTERNATIVE_${PN}_j7-hs-evm =3D "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
@@ -514,6 +532,9 @@ TARGET_MCU_M4FSS0_0_am64xx =3D "am64-mcu-m4f0_0-fw"
 TARGET_MAIN_R5FSS0_0_am62xx =3D "am62-main-r5f0_0-fw"
 TARGET_MCU_M4FSS0_0_am62xx =3D "am62-mcu-m4f0_0-fw"
=20
+TARGET_C7X_0_am62axx-evm =3D "am62a-c71_0-fw"
+TARGET_MCU_R5F0_0_am62axx-evm =3D "am62a-mcu-r5f0_0-fw"
+
 TARGET_MCU_R5FSS0_0_j7 =3D "j7-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1_j7 =3D "j7-mcu-r5f0_1-fw"
 TARGET_MAIN_R5FSS0_0_j7 =3D "j7-main-r5f0_0-fw"
@@ -619,6 +640,9 @@ ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] =3D "${base=
_libdir}/firmware/${TARGET_MC
 ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] =3D "${base_libdir}/firmware/=
${TARGET_MAIN_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] =3D "${base_libdir}/firmware/$=
{TARGET_MCU_M4FSS0_0}"
=20
+ALTERNATIVE_LINK_NAME[am62a-c71_0-fw] =3D "${base_libdir}/firmware/${TAR=
GET_C7X_0}"
+ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/=
${TARGET_MCU_R5F0_0}"
+
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/${T=
ARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/${T=
ARGET_MCU_R5FSS0_1}"
 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/${=
TARGET_MAIN_R5FSS0_0}"
@@ -699,6 +723,9 @@ ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] =3D "${base_li=
bdir}/firmware/pdk-ipc/ipc_ec
 ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] =3D "${base_libdir}/firmware/pdk-=
ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
=20
+ALTERNATIVE_TARGET[am62a-c71_0-fw] =3D "${base_libdir}/firmware/pdk-ipc/=
ipc_echo_test_c7x_1_release_strip.xe71"
+ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk=
-ipc/am62a-mcu-r5f0_0-fw"
+
 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pdk-ip=
c/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/pdk-ip=
c/ipc_echo_test_mcu1_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D "${base_libdir}/firmware/ethfw=
/app_remoteswitchcfg_server_strip.xer5f"
--=20
2.17.1


