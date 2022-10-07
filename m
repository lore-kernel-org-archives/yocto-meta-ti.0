Return-Path: <j-humphreys@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DFEC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 20:46:44 +0000 (UTC)
Subject: Re: [master/dunfell][PATCH] machine: Add j784s4-evm configuration.
To: meta-ti@lists.yoctoproject.org
From: "Jonathan Humphreys" <j-humphreys@ti.com>
X-Originating-Location: Frisco, Texas, US (192.91.75.30)
X-Originating-Platform: Windows Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 07 Oct 2022 13:46:34 -0700
References: <30df60b5-7f20-5161-b645-96649a49aeab@ti.com>
In-Reply-To: <30df60b5-7f20-5161-b645-96649a49aeab@ti.com>
Message-ID: <22444.1665175594805210182@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Oct 2022 20:46:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15117

On Mon, Sep 26, 2022 at 01:50 PM, Ryan Eatmon wrote:

>
>=20
>=20
> On 9/26/2022 15:17, Andrew Davis wrote:
> > On 9/26/22 12:40 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >> Adding support for j784s4-evm:
> >> - Add configurations.
> >> - Add firmware.
> >> - Add u-boot.
> >> - Add gpu support.
> >>
> >> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> >> Signed-off-by: Randolph Sapp <rs@ti.com>
> >> ---
> >> =C2=A0 conf/machine/j784s4-evm-k3r5.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++
> >> =C2=A0 conf/machine/j784s4-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 27
> +++++++
> >> =C2=A0 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> >> =C2=A0 .../ti-img-rogue-driver_1.15.6133109.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 6 +-
> >> =C2=A0 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> >> =C2=A0 .../ti-img-rogue-umlibs_1.15.6133109.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 5 +-
> >> =C2=A0 recipes-kernel/linux/kernel-rdepends.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> >> =C2=A0 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb=C2=A0=C2=A0=C2=A0 | =
75
> +++++++++++++++++++
> >> =C2=A0 8 files changed, 124 insertions(+), 5 deletions(-)
> >> =C2=A0 create mode 100644 conf/machine/j784s4-evm-k3r5.conf
> >> =C2=A0 create mode 100644 conf/machine/j784s4-evm.conf
> >>
> >> diff --git a/conf/machine/j784s4-evm-k3r5.conf=20
> >> b/conf/machine/j784s4-evm-k3r5.conf
> >> new file mode 100644
> >> index 00000000..04feebc6
> >> --- /dev/null
> >> +++ b/conf/machine/j784s4-evm-k3r5.conf
> >> @@ -0,0 +1,11 @@
> >> +#@TYPE: Machine
> >> +#@NAME: J784S4 EVM (R5F)
> >> +#@DESCRIPTION: Machine configuration for the TI J784S4 EVM (R5F core)
> >> +
> >> +require conf/machine/include/k3r5.inc
> >> +
> >> +SYSFW_SOC =3D "j784s4"
> >> +SYSFW_CONFIG =3D "evm"
> >> +SYSFW_SUFFIX =3D "gp"
> >> +
> >> +UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
> >> diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.co=
nf
> >> new file mode 100644
> >> index 00000000..957e5766
> >> --- /dev/null
> >> +++ b/conf/machine/j784s4-evm.conf
> >> @@ -0,0 +1,27 @@
> >> +#@TYPE: Machine
> >> +#@NAME: J784S4 EVM
> >> +#@DESCRIPTION: Machine configuration for the TI J784S4 EVM
> >> +
> >> +require conf/machine/include/j7.inc
> >> +
> >> +MACHINE_FEATURES +=3D "gpu"
> >> +
> >> +SERIAL_CONSOLES =3D "115200;ttyS10"

Please change to ttyS2.

This is a bug fix similar to what I posted for J721S2 at https://lists.yoct=
oproject.org/g/meta-ti/message/15116.

> >> +SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
> >> +TFA_K3_USART =3D "0x8"
> >> +OPTEE_K3_USART =3D "0x8"
> >> +
> >> +KERNEL_DEVICETREE =3D " \
> >> +=C2=A0=C2=A0=C2=A0 ti/k3-j784s4-evm.dtb \
> >> +"
> >> +
> >> +UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
> >> +
> >> +# J721S2 supports multi-certificate images, use the same
> >> +IMAGE_BOOT_FILES =3D "${IMAGE_BOOT_FILES_MULTI_CERT}"
> >> +
> >> +do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
> >> +do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
> >> +
> >> +TFA_BOARD =3D "j784s4"
> >> +
> >> diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb=20
> >> b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> >> index 83619090..cca5704e 100644
> >> --- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> >> +++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> >> @@ -13,7 +13,7 @@ PR =3D "${INC_PR}.1"
> >> =C2=A0 CLEANBROKEN =3D "1"
> >> -COMPATIBLE_MACHINE =3D "j721s2-evm|j721s2-hs-evm"
> >> +COMPATIBLE_MACHINE =3D "j721s2-evm|j721s2-hs-evm|j784s4-evm"
> >> =C2=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> diff --git=20
> >> a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb=20
> >> b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> >> index 3dbc87b6..1127c5d1 100644
> >> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> >> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> >> @@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append =3D "b"
> >> =C2=A0 PR =3D "${MACHINE_KERNEL_PR}"
> >> =C2=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> -COMPATIBLE_MACHINE =3D "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|am6=
2xx"
> >> +COMPATIBLE_MACHINE =3D=20
> >> "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|am62xx"
> >=20
> >=20
> > j784s4-evm.conf should include a j784s4.inc family file, then here
> > you'll only need |j784s4|. Makes it easier when adding machines
> > based on the j784s4 SoC.
> >=20
> >=20
> >> =C2=A0 DEPENDS =3D "virtual/kernel"
> >> @@ -26,17 +26,19 @@ SRC_URI =3D " \
> >> =C2=A0 S =3D "${WORKDIR}/git"
> >=20
> > ...
> >=20
> >> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> >> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> >> @@ -19,6 +19,7 @@ PLAT_SFX_j7200-evm =3D "j7200"
> >> =C2=A0 PLAT_SFX_j7200-hs-evm =3D "j7200"
> >> =C2=A0 PLAT_SFX_j721s2-evm =3D "j721s2"
> >> =C2=A0 PLAT_SFX_j721s2-hs-evm =3D "j721s2"
> >> +PLAT_SFX_j784s4-evm =3D "j784s4"
> >> =C2=A0 PLAT_SFX_am65xx =3D "am65xx"
> >> =C2=A0 PLAT_SFX_am64xx =3D "am64xx"
> >> =C2=A0 PLAT_SFX_am62xx =3D "am62xx"
> >> @@ -247,6 +248,26 @@ do_install_j721s2-hs-evm() {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # install -m 0644=20
> >> ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f=20
> >> ${LEGACY_ETH_FW_DIR}
> >> =C2=A0 }
> >> +do_install_j784s4-evm() {
> >> +=C2=A0=C2=A0=C2=A0 install -d ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f=20
> >> ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f=20
> >> ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f=20
> >> ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f=20
> >> ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f=20
> >> ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_0_release_strip.xer5f=20
> >> ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_1_release_strip.xer5f=20
> >> ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71=20
> >> ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71=20
> >> ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_3_release_strip.xe71=20
> >> ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_4_release_strip.xe71=20
> >> ${LEGACY_IPC_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 # DM Firmware
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f=20
> >> ${LEGACY_DM_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 # ETH firmware
> >> +=C2=A0=C2=A0=C2=A0 install -d ${LEGACY_ETH_FW_DIR}
> >> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f=20
> >> ${LEGACY_ETH_FW_DIR}
> >> +}
> >> +
> >=20
> >=20
> > I wonder if there is a way to better add these than just long lists,
> > this file's size is getting out of hand :/
> >=20
> > Andrew
>=20
> Compeltely agree.  I like all of the clean up done so far.  We just need=
=20
> to figure out a better solution for the firmware as well.
>=20
>=20
> >=20
> >> =C2=A0 do_install_am65xx() {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${LEGACY_IPC_FW_DIR}
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644=20
> >> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f=20
> >> ${LEGACY_IPC_FW_DIR}
> >> @@ -372,6 +393,21 @@ ALTERNATIVE_${PN}_j721s2-hs-evm =3D "\
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j721s2-c71_1-fw-s=
ec \
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> >> +ALTERNATIVE_${PN}_j784s4-evm =3D "\
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-mcu-r5f0_0-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-mcu-r5f0_1-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-main-r5f0_0-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-main-r5f0_1-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-main-r5f1_0-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-main-r5f1_1-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-main-r5f2_0-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-main-r5f2_1-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-c71_0-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-c71_1-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-c71_2-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j784s4-c71_3-fw \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> >> +
> >> =C2=A0 # Set up link names for the firmwares
> >> =C2=A0 TARGET_MCU_R5FSS0_0_am65xx =3D "am65x-mcu-r5f0_0-fw"
> >> @@ -442,6 +478,19 @@ TARGET_MAIN_R5FSS1_1_SIGNED_j721s2-hs-evm =3D=20
> >> "j721s2-main-r5f1_1-fw-sec"
> >> =C2=A0 TARGET_C7X_0_SIGNED_j721s2-hs-evm =3D "j721s2-c71_0-fw-sec"
> >> =C2=A0 TARGET_C7X_1_SIGNED_j721s2-hs-evm =3D "j721s2-c71_1-fw-sec"
> >> +TARGET_MCU_R5FSS0_0_j784s4-evm =3D "j784s4-mcu-r5f0_0-fw"
> >> +TARGET_MCU_R5FSS0_1_j784s4-evm =3D "j784s4-mcu-r5f0_1-fw"
> >> +TARGET_MAIN_R5FSS0_0_j784s4-evm =3D "j784s4-main-r5f0_0-fw"
> >> +TARGET_MAIN_R5FSS0_1_j784s4-evm =3D "j784s4-main-r5f0_1-fw"
> >> +TARGET_MAIN_R5FSS1_0_j784s4-evm =3D "j784s4-main-r5f1_0-fw"
> >> +TARGET_MAIN_R5FSS1_1_j784s4-evm =3D "j784s4-main-r5f1_1-fw"
> >> +TARGET_MAIN_R5FSS2_0_j784s4-evm =3D "j784s4-main-r5f2_0-fw"
> >> +TARGET_MAIN_R5FSS2_1_j784s4-evm =3D "j784s4-main-r5f2_1-fw"
> >> +TARGET_C7X_0_j784s4-evm =3D "j784s4-c71_0-fw"
> >> +TARGET_C7X_1_j784s4-evm =3D "j784s4-c71_1-fw"
> >> +TARGET_C7X_2_j784s4-evm =3D "j784s4-c71_2-fw"
> >> +TARGET_C7X_3_j784s4-evm =3D "j784s4-c71_3-fw"
> >> +
> >> =C2=A0 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> >> =C2=A0 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> >> @@ -496,6 +545,19 @@ ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec]=
=20
> >> =3D "${base_libdir}/firmware/${TA
> >> =C2=A0 ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] =3D=20
> >> "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
> >> =C2=A0 ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] =3D=20
> >> "${base_libdir}/firmware/${TARGET_C7X_1_SIGNED}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_0}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_1}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_C7X_0}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_C7X_1}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_C7X_2}"
> >> +ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] =3D=20
> >> "${base_libdir}/firmware/${TARGET_C7X_3}"
> >> +
> >> =C2=A0 # Create the firmware alternatives
> >> =C2=A0 ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xe=
r5f"=20
> >>
> >> @@ -552,6 +614,19 @@ ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] =3D=
=20
> >> "${base_libdir}/firmware/pdk-ipc
> >> =C2=A0 ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] =3D=20
> >>
> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71.s=
igned"
>=20
> >>
> >> =C2=A0 ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] =3D=20
> >>
> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71.s=
igned"
>=20
> >>
> >> +ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.x=
er5f"
>=20
> >>
> >> +ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xe=
r5f"=20
> >>
> >> +ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xe=
r5f"=20
> >>
> >> +ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xe=
r5f"=20
> >>
> >> +ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xe=
r5f"=20
> >>
> >> +ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xe=
r5f"=20
> >>
> >> +ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_0_release_strip.xe=
r5f"=20
> >>
> >> +ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_1_release_strip.xe=
r5f"=20
> >>
> >> +ALTERNATIVE_TARGET[j784s4-c71_0-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe7=
1"
> >> +ALTERNATIVE_TARGET[j784s4-c71_1-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe7=
1"
> >> +ALTERNATIVE_TARGET[j784s4-c71_2-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_3_release_strip.xe7=
1"
> >> +ALTERNATIVE_TARGET[j784s4-c71_3-fw] =3D=20
> >> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_4_release_strip.xe7=
1"
> >> +
> >> =C2=A0 ALTERNATIVE_PRIORITY =3D "10"
> >> =C2=A0 # make sure that lib/firmware, and all its contents are part of=
 the=20
> >> package
> >>
> >>
>=20
> --=20
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>

