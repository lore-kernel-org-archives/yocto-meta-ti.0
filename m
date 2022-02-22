Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.8876.1645503204299963820
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AF2EC40C2E
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KyBCJXQWXmJa for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A6EB340C8F
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 93EC517476F
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 14/19] meta-ti: remove remaining Keystone1/2 overrides
Date: Tue, 22 Feb 2022 04:13:09 +0000
Message-Id: <20220222041314.2840028-15-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Cleanup remaining recipes that are used by other platforms from any machi=
ne
overrides that still refer to deprecated Keystone1/2 platforms.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/layer.conf                               |   9 -
 recipes-bsp/dsptop/debugss-module-drv_git.bb  |   4 +-
 recipes-bsp/dsptop/dsptop_git.bb              |   4 +-
 recipes-bsp/dsptop/libulm_git.bb              |   3 +-
 recipes-bsp/pru/pru-icss_git.bb               |  32 +-
 recipes-bsp/u-boot/u-boot-ti.inc              | 126 ------
 .../uio-module-drv/uio-module-drv-test_git.bb |  12 +-
 recipes-devtools/gdbc6x/gdbc6x_git.bb         |   2 +-
 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb  |   3 +-
 .../gdbc6x/gdbserverproxy-module-drv_git.bb   |   3 +-
 recipes-kernel/linux/files/k2e/cmem.dtsi      |  36 --
 recipes-kernel/linux/files/k2e/k2e-uio.dtsi   |  32 --
 recipes-kernel/linux/files/k2g/cmem.dtsi      |  37 --
 .../linux/files/k2g/keystone-k2g-pru-uio.dtsi | 391 ------------------
 recipes-kernel/linux/files/k2hk/cmem.dtsi     |  37 --
 recipes-kernel/linux/files/k2hk/k2hk-uio.dtsi |  58 ---
 recipes-kernel/linux/files/k2l/cmem.dtsi      |  37 --
 recipes-kernel/linux/files/k2l/k2l-uio.dtsi   |  10 -
 .../linux/files/keystone/keystone-uio.dtsi    | 186 ---------
 recipes-kernel/linux/kernel-rdepends.inc      |  17 -
 .../linux/linux-ti-mainline/k2g/defconfig     |   1 -
 .../linux-ti-mainline/keystone/defconfig      |   1 -
 .../linux/linux-ti-staging-5.10/k2g/defconfig |   1 -
 .../linux-ti-staging-5.10/keystone/defconfig  |   1 -
 .../linux/linux-ti-staging-5.4/k2g/defconfig  |   1 -
 .../linux-ti-staging-5.4/keystone/defconfig   |   1 -
 .../linux-ti-staging-rt-5.10/k2g/defconfig    |   1 -
 .../keystone/defconfig                        |   1 -
 .../linux-ti-staging-rt-5.4/k2g/defconfig     |   1 -
 .../keystone/defconfig                        |   1 -
 .../k2g/defconfig                             |   1 -
 .../keystone/defconfig                        |   1 -
 .../k2g/defconfig                             |   1 -
 .../keystone/defconfig                        |   1 -
 recipes-kernel/linux/ti-uio.inc               |  21 -
 recipes-ti/ctoolslib/libaet_git.bb            |   3 +-
 recipes-ti/imglib/imglib-c66x.inc             |   2 +-
 recipes-ti/ipc/ti-ipc-common.inc              |   7 -
 recipes-ti/ipc/ti-ipc-rtos.inc                |  15 -
 recipes-ti/ipc/ti-ipc-rtos_git.bb             |  23 --
 recipes-ti/ipc/ti-ipc_git.bb                  |   4 -
 recipes-ti/openmp-rtos/openmp-rtos_git.bb     |  13 +-
 .../uio-test-pruss/uio-test-pruss_git.bb      |   3 +-
 recipes-ti/vlib/vlib-c66x.inc                 |   2 +-
 44 files changed, 13 insertions(+), 1133 deletions(-)
 delete mode 100644 recipes-kernel/linux/files/k2e/cmem.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2e/k2e-uio.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2g/cmem.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.d=
tsi
 delete mode 100644 recipes-kernel/linux/files/k2hk/cmem.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2hk/k2hk-uio.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2l/cmem.dtsi
 delete mode 100644 recipes-kernel/linux/files/k2l/k2l-uio.dtsi
 delete mode 100644 recipes-kernel/linux/files/keystone/keystone-uio.dtsi
 delete mode 100644 recipes-kernel/linux/linux-ti-mainline/k2g/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-mainline/keystone/defco=
nfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-5.10/k2g/defcon=
fig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-5.10/keystone/d=
efconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-5.4/k2g/defconf=
ig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-5.4/keystone/de=
fconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-5.10/k2g/def=
config
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-5.10/keyston=
e/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-5.4/k2g/defc=
onfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-5.4/keystone=
/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-5.10/k2=
g/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-5.10/ke=
ystone/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-5.4/k2g=
/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-5.4/key=
stone/defconfig

diff --git a/conf/layer.conf b/conf/layer.conf
index f399ff03..f64ac5eb 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -21,15 +21,6 @@ LAYERDEPENDS_meta-ti =3D " \
 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
     ti-sgx-ddk-km \
     ti-sgx-ddk-um \
-    cmem-mod \
-    hplib-mod \
-    gdbserverproxy-module-drv \
-    debugss-module-drv \
-    uio-module-drv \
-    mpm-transport \
-    cppi-lld \
-    qmss-lld \
-    multiprocmgr \
 "
=20
 HOSTTOOLS_NONFATAL +=3D "truncate xxd comm"
diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/recipes-bsp/d=
sptop/debugss-module-drv_git.bb
index dc4cde52..a250b825 100644
--- a/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -13,12 +13,10 @@ inherit module
=20
 PLATFORM =3D ""
 PLATFORM:dra7xx =3D "DRA7xx_PLATFORM"
-PLATFORM:keystone =3D "KEYSTONE_PLATFORM"
-PLATFORM:k2e =3D "K2E_PLATFORM"
=20
 EXTRA_OEMAKE =3D "'PLATFORM=3D${PLATFORM}' KVERSION=3D${KERNEL_VERSION} =
KERNEL_SRC=3D${STAGING_KERNEL_DIR}"
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 include dsptop.inc
diff --git a/recipes-bsp/dsptop/dsptop_git.bb b/recipes-bsp/dsptop/dsptop=
_git.bb
index 9896eda1..20818443 100644
--- a/recipes-bsp/dsptop/dsptop_git.bb
+++ b/recipes-bsp/dsptop/dsptop_git.bb
@@ -10,7 +10,6 @@ S =3D "${WORKDIR}/git/dsptop"
=20
 DEVICE =3D ""
 DEVICE:dra7xx =3D "DRA7xx"
-DEVICE:keystone =3D "C66AK2Hxx"
=20
 EXTRA_OEMAKE =3D "release DEVICE=3D${DEVICE} CROSS_COMPILE=3D${TARGET_PR=
EFIX} CC=3D"${CC}""
=20
@@ -18,11 +17,10 @@ do_install() {
     oe_runmake install DESTDIR=3D${D}
 }
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 RDEPENDS:${PN} =3D "debugss-module-drv bash"
-RDEPENDS:${PN}:append:keystone =3D " temperature-module-drv"
=20
 include dsptop.inc
=20
diff --git a/recipes-bsp/dsptop/libulm_git.bb b/recipes-bsp/dsptop/libulm=
_git.bb
index acefef56..f3e7ec3c 100644
--- a/recipes-bsp/dsptop/libulm_git.bb
+++ b/recipes-bsp/dsptop/libulm_git.bb
@@ -13,7 +13,6 @@ S =3D "${WORKDIR}/git/dsptop/ulm"
=20
 DEVICE=3D""
 DEVICE:dra7xx =3D "DRA7xx"
-DEVICE:keystone =3D "C66AK2Hxx"
=20
 EXTRA_OEMAKE =3D "release DEVICE=3D${DEVICE} CROSS_COMPILE=3D${TARGET_PR=
EFIX}"
=20
@@ -32,7 +31,7 @@ do_install() {
     cp -f release/libtiulm.ae66 ${D}${datadir}/ti/ulm
 }
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 FILES:${PN}-dev +=3D "\
diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_g=
it.bb
index b690291d..779f96fd 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -15,7 +15,7 @@ PR =3D "r0"
=20
 require recipes-ti/includes/ti-paths.inc
=20
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|k3"
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k3"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 PACKAGES:prepend =3D " \
@@ -40,7 +40,6 @@ SUBDIRS =3D "examples pru_cape/pru_fw lib/src labs"
 PLATFORM:ti33x =3D "am335x"
 PLATFORM:ti43x =3D "am437x"
 PLATFORM:omap-a15 =3D "am572x"
-PLATFORM:k2g =3D "k2g"
 PLATFORM:am64xx =3D "am64x"
 PLATFORM:am65xx =3D "am65x"
 PLATFORM:j7 =3D "j721e"
@@ -100,19 +99,6 @@ do_install:append:omap-a15() {
     done
 }
=20
-do_install:append:k2g() {
-    install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
-                   ${D}${base_libdir}/firmware/pru
-    for i in 0 1
-    do
-        for j in 0 1
-        do
-            install -m 0644 ${S}/examples/k2g/PRU_RPMsg_Echo_Interrupt${=
i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}${base_libdir}/firmware/pru
-        done
-    done
-}
-
 do_install:append:am64xx(){
     for i in 0 1
     do
@@ -189,7 +175,6 @@ FILES:${PN}-rpmsg-echo =3D "${base_libdir}/firmware/p=
ru/PRU_RPMsg_Echo_Interrupt*
 PRU_ICSS_ALTERNATIVES:ti33x    =3D "am335x-pru0-fw am335x-pru1-fw"
 PRU_ICSS_ALTERNATIVES:ti43x    =3D "am437x-pru0_0-fw am437x-pru0_1-fw am=
437x-pru1_0-fw am437x-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES:omap-a15 =3D "am57xx-pru1_0-fw am57xx-pru1_1-fw am=
57xx-pru2_0-fw am57xx-pru2_1-fw"
-PRU_ICSS_ALTERNATIVES:k2g      =3D "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1=
_0-fw k2g-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES:am64xx   =3D "am64x-pru0_0-fw am64x-pru0_1-fw am64=
x-pru1_0-fw am64x-pru1_1-fw am64x-rtu0_0-fw am64x-rtu0_1-fw am64x-rtu1_0-=
fw am64x-rtu1_1-fw"
 PRU_ICSS_ALTERNATIVES:am65xx   =3D "am65x-pru0_0-fw am65x-pru0_1-fw am65=
x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-=
fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-=
rtu2_1-fw"
 PRU_ICSS_ALTERNATIVES:j7       =3D "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-=
fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
@@ -208,11 +193,6 @@ ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] =3D "${base_=
libdir}/firmware/am57xx-pru1_1
 ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] =3D "${base_libdir}/firmware/am5=
7xx-pru2_0-fw"
 ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] =3D "${base_libdir}/firmware/am5=
7xx-pru2_1-fw"
=20
-ALTERNATIVE_LINK_NAME[k2g-pru0_0-fw] =3D "${base_libdir}/firmware/k2g-pr=
u0_0-fw"
-ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] =3D "${base_libdir}/firmware/k2g-pr=
u0_1-fw"
-ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] =3D "${base_libdir}/firmware/k2g-pr=
u1_0-fw"
-ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] =3D "${base_libdir}/firmware/k2g-pr=
u1_1-fw"
-
 ALTERNATIVE_LINK_NAME[am64x-pru0_0-fw] =3D "${base_libdir}/firmware/am64=
x-pru0_0-fw"
 ALTERNATIVE_LINK_NAME[am64x-pru0_1-fw] =3D "${base_libdir}/firmware/am64=
x-pru0_1-fw"
 ALTERNATIVE_LINK_NAME[am64x-pru1_0-fw] =3D "${base_libdir}/firmware/am64=
x-pru1_0-fw"
@@ -279,11 +259,6 @@ ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] =3D=
 "${base_libdir}/firmware/pr
 ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] =3D "${base_libdir}/f=
irmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] =3D "${base_libdir}/f=
irmware/pru/PRU_Halt.out"
=20
-ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_0-fw] =3D "${base_libdir}/firm=
ware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] =3D "${base_libdir}/firm=
ware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] =3D "${base_libdir}/firm=
ware/pru/PRU_Halt.out"
-ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] =3D "${base_libdir}/firm=
ware/pru/PRU_Halt.out"
-
 ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_0-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_0.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_1-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_1.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_0-fw] =3D "${base_libdir}/fi=
rmware/pru/PRU_Halt_0.out"
@@ -348,11 +323,6 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1=
-fw] =3D "${base_libdir}/firmw
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] =3D "${base_lib=
dir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] =3D "${base_lib=
dir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
=20
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_0-fw] =3D "${base_libdir=
}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] =3D "${base_libdir=
}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] =3D "${base_libdir=
}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] =3D "${base_libdir=
}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
-
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_0-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_1-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_0-fw] =3D "${base_libd=
ir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot=
-ti.inc
index 8ded12c2..4b9f543c 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -61,7 +61,6 @@ SYSROOT_DIRS +=3D "/boot"
=20
 # SPL (Second Program Loader) to be loaded over UART
 SPL_UART_BINARY =3D "u-boot-spl.bin"
-SPL_UART_BINARY:keystone =3D ""
 SPL_UART_BINARY:k3r5 =3D ""
 SPL_UART_BINARY:lego-ev3 =3D ""
 SPL_UART_BINARY:j7200-evm-k3r5 =3D "u-boot-spl.bin"
@@ -74,20 +73,8 @@ SPL_UART_SYMLINK ?=3D "${SPL_UART_BINARY}-${MACHINE}"
=20
 # SPI NOR Flash binaries
 UBOOT_SPI_SPL_BINARY =3D "u-boot-spl.bin"
-UBOOT_SPI_SPL_BINARY:k2e-hs-evm =3D ""
-UBOOT_SPI_SPL_BINARY:k2hk-hs-evm =3D ""
-UBOOT_SPI_SPL_BINARY:k2g-hs-evm =3D ""
-UBOOT_SPI_SPL_BINARY:k2l-hs-evm =3D ""
 UBOOT_SPI_BINARY =3D "u-boot.img"
-UBOOT_SPI_BINARY:k2e-hs-evm =3D ""
-UBOOT_SPI_BINARY:k2hk-hs-evm =3D ""
-UBOOT_SPI_BINARY:k2g-hs-evm =3D ""
-UBOOT_SPI_BINARY:k2l-hs-evm =3D ""
 UBOOT_SPI_GPH_BINARY =3D "u-boot-spi.gph"
-UBOOT_SPI_GPH_BINARY:k2e-hs-evm =3D ""
-UBOOT_SPI_GPH_BINARY:k2hk-hs-evm =3D ""
-UBOOT_SPI_GPH_BINARY:k2g-hs-evm =3D ""
-UBOOT_SPI_GPH_BINARY:k2l-hs-evm =3D ""
=20
 # SPI NOR Flash deployed images
 UBOOT_SPI_SPL_IMAGE =3D "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
@@ -277,119 +264,6 @@ do_deploy:append () {
 	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
 }
=20
-do_install:append:keystone () {
-	if [ -n "${UBOOT_CONFIG}" ]
-	then
-		for config in ${UBOOT_MACHINE}; do
-			i=3D$(expr $i + 1);
-			for type in ${UBOOT_CONFIG}; do
-				j=3D$(expr $j + 1);
-				if [ $j -eq $i ]
-				then
-					if [ "x${UBOOT_SPI_SPL_BINARY}" !=3D "x" ]; then
-						install ${B}/${config}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBO=
OT_SPI_SPL_IMAGE}-${type}
-						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_SPL_BI=
NARY}-${type}
-						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_SPL_BI=
NARY}
-					fi
-
-					if [ "x${UBOOT_SPI_BINARY}" !=3D "x" ]; then
-						install ${B}/${config}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_I=
MAGE}-${type}
-						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_BINARY}-${=
type}
-						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_BINARY}
-					fi
-
-					if [ "x${UBOOT_SPI_GPH_BINARY}" !=3D "x" ]; then
-						install ${B}/${config}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_S=
PI_GPH_IMAGE}-${type}
-						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_GPH_BI=
NARY}-${type}
-						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_GPH_BI=
NARY}
-					fi
-				fi
-			done
-			unset  j
-		done
-		unset  i
-	else
-		if [ "x${UBOOT_SPI_SPL_BINARY}" !=3D "x" ]; then
-			install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IM=
AGE}
-			ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
-		fi
-
-		if [ "x${UBOOT_SPI_BINARY}" !=3D "x" ]; then
-			install ${B}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
-			ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
-		fi
-
-		if [ "x${UBOOT_SPI_GPH_BINARY}" !=3D "x" ]; then
-			install ${B}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
-			ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
-		fi
-	fi
-}
-
-do_deploy:append:keystone () {
-	if [ -n "${UBOOT_CONFIG}" ]
-	then
-		for config in ${UBOOT_MACHINE}; do
-			i=3D$(expr $i + 1);
-			for type in ${UBOOT_CONFIG}; do
-				j=3D$(expr $j + 1);
-				if [ $j -eq $i ]
-				then
-					if [ "x${UBOOT_SPI_SPL_BINARY}" !=3D "x" ]; then
-						install ${B}/${config}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${=
UBOOT_SPI_SPL_IMAGE}-${type}
-						rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
-						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${UBOOT_SPI_SPL_SYMLINK}-${t=
ype}
-						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${UBOOT_SPI_SPL_SYMLINK}
-						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${UBOOT_SPI_SPL_BINARY}-${ty=
pe}
-						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${UBOOT_SPI_SPL_BINARY}
-					fi
-
-					if [ "x${UBOOT_SPI_BINARY}" !=3D "x" ]; then
-						install ${B}/${config}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SP=
I_IMAGE}-${type}
-						rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
-						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_SYMLINK}-${type}
-						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_SYMLINK}
-						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_BINARY}-${type}
-						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_BINARY}
-					fi
-
-					if [ "x${UBOOT_SPI_GPH_BINARY}" !=3D "x" ]; then
-						install ${B}/${config}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOO=
T_SPI_GPH_IMAGE}-${type}
-						rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
-						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${UBOOT_SPI_GPH_SYMLINK}-${t=
ype}
-						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${UBOOT_SPI_GPH_SYMLINK}
-						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${UBOOT_SPI_GPH_BINARY}-${ty=
pe}
-						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${UBOOT_SPI_GPH_BINARY}
-					fi
-				fi
-			done
-			unset  j
-		done
-		unset  i
-	else
-		if [ "x${UBOOT_SPI_SPL_BINARY}" !=3D "x" ]; then
-			install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL=
_IMAGE}
-			rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
-			ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
-			ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
-		fi
-
-		if [ "x${UBOOT_SPI_BINARY}" !=3D "x" ]; then
-			install ${B}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
-			rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
-			ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
-			ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
-		fi
-
-		if [ "x${UBOOT_SPI_GPH_BINARY}" !=3D "x" ]; then
-			install ${B}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMA=
GE}
-			rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
-			ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
-			ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
-		fi
-	fi
-}
-
 # j7200 uses combined image for tiboot3.bin that includes u-boot-spl.bin=
 and sysfw
 # along with board PM/RM configs generated by k3-image-gen and comes fro=
m ti-sci-fw
 # hence move the legacy u-boot's tiboot3.bin and u-boot-spl.bin out of t=
he way
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/reci=
pes-bsp/uio-module-drv/uio-module-drv-test_git.bb
index b5f73b27..dc17a1e9 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -4,14 +4,12 @@ include uio-module-drv.inc
=20
 PR =3D "r1"
=20
-COMPATIBLE_MACHINE =3D "keystone|omap-a15|ti33x|ti43x"
+COMPATIBLE_MACHINE =3D "omap-a15|ti33x|ti43x"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 DEVICE_NAME:omap-a15 =3D "am57xx"
 DEVICE_NAME:ti33x =3D "am33xx"
 DEVICE_NAME:ti43x =3D "am43xx"
-DEVICE_NAME:keystone =3D "keystone"
-DEVICE_NAME:k2g =3D "k2g"
 RDEPENDS:${PN} =3D "uio-module-drv"
=20
 do_compile() {
@@ -24,14 +22,6 @@ do_install() {
 	install -c -m 755 ${S}/test/uio_int_test ${D}${bindir}/.
 }
=20
-do_install:append:keystone () {
-	install -c -m 755 ${S}/test/uio_cic2_int_multithread_test ${D}${bindir}=
/.
-}
-
-do_install:append:k2g () {
-        install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${=
D}${bindir}/.
-}
-
 do_install:append:omap-a15 () {
 	install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bin=
dir}/.
 }
diff --git a/recipes-devtools/gdbc6x/gdbc6x_git.bb b/recipes-devtools/gdb=
c6x/gdbc6x_git.bb
index 08f81970..df9aaee9 100644
--- a/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dbf0fe=
2872eb3dfeebb2cbe38206fe81f
=20
 DEPENDS =3D "ncurses bison-native texinfo flex-native gettext"
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
=20
 PR =3D "${INC_PR}.1"
=20
diff --git a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/recipes-devto=
ols/gdbc6x/gdbserver-c6x_git.bb
index 544a97f4..fab4fbd2 100644
--- a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
+++ b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -10,7 +10,6 @@ S =3D "${WORKDIR}/git/gdbserver-c6x/src"
=20
 PLATFORM =3D ""
 PLATFORM:dra7xx =3D "DRA7xx_PLATFORM"
-PLATFORM:keystone =3D "KEYSTONE_PLATFORM"
=20
 EXTRA_OEMAKE =3D "PLATFORM=3D${PLATFORM}"
=20
@@ -34,7 +33,7 @@ do_install() {
     cp -f ../lib/* ${D}${datadir}/ti/gdbc6x/lib
 }
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 FILES:${PN}-dev +=3D "\
diff --git a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/r=
ecipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
index 1b28c502..168e4be3 100644
--- a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
+++ b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -13,7 +13,6 @@ inherit module
=20
 PLATFORM =3D ""
 PLATFORM:dra7xx =3D "DRA7xx_PLATFORM"
-PLATFORM:keystone =3D "KEYSTONE_PLATFORM"
=20
 EXTRA_OEMAKE =3D "PLATFORM=3D${PLATFORM} KVERSION=3D${KERNEL_VERSION} KE=
RNEL_SRC=3D${STAGING_KERNEL_DIR}"
=20
@@ -24,7 +23,7 @@ do_configure() {
     :
 }
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 include gdbc6x.inc
diff --git a/recipes-kernel/linux/files/k2e/cmem.dtsi b/recipes-kernel/li=
nux/files/k2e/cmem.dtsi
deleted file mode 100644
index c233768d..00000000
--- a/recipes-kernel/linux/files/k2e/cmem.dtsi
+++ /dev/null
@@ -1,36 +0,0 @@
-/ {
-	reserved-memory {
-		cmem_block_mem_0: cmem_block_mem@830000000 {
-			reg =3D <0x00000008 0x30000000 0x00000000 0x18000000>;
-			no-map;
-			status =3D "okay";
-		};
-	};
-
-	cmem {
-		compatible =3D "ti,cmem";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-		status =3D "okay";
-
-		cmem_block_0: cmem_block@0 {
-			reg =3D <0>;
-			memory-region =3D <&cmem_block_mem_0>;
-			cmem-buf-pools =3D <1 0x00000000 0x18000000>;
-		};
-
-		cmem_block_1: cmem_block@1 {
-			reg =3D <1>;
-			sram =3D <&sram_cmem>;
-		};
-	};
-};
-
-&msm_ram {
-	sram_cmem: sram-cmem@80000 {
-		reg =3D <0x80000 0xc0000>;
-	};
-};
diff --git a/recipes-kernel/linux/files/k2e/k2e-uio.dtsi b/recipes-kernel=
/linux/files/k2e/k2e-uio.dtsi
deleted file mode 100644
index 052ae97c..00000000
--- a/recipes-kernel/linux/files/k2e/k2e-uio.dtsi
+++ /dev/null
@@ -1,32 +0,0 @@
-/ {
-	soc {
-		uio_hyperlink0: hyperlink0 {
-			compatible =3D "ti,uio-module-drv";
-			mem  =3D <0x21400000 0x00001000
-				0x40000000 0x10000000
-				0x0231a000 0x00002000>;
-			clocks =3D <&clkhyperlink0>;
-			interrupts	=3D <0 387 0x101>;
-			cfg-params
-			{
-				ti,serdes_refclk_khz =3D <312500>;
-				ti,serdes_maxserrate_khz =3D <6250000>;
-				ti,serdes_lanerate =3D "half";
-				ti,serdes_numlanes =3D <4>;
-				ti,serdes_c1 =3D <4 4 4 4>;
-				ti,serdes_c2 =3D <0 0 0 0>;
-				ti,serdes_cm =3D <0 0 0 0>;
-				ti,serdes_tx_att =3D <12 12 12 12>;
-				ti,serdes_tx_vreg =3D <4 4 4 4>;
-				ti,serdes_rx_att =3D <11 11 11 11>;
-				ti,serdes_rx_boost =3D <3 3 3 3>;
-			};
-		};
-		uio_srss: srss {
-			compatible =3D "ti,uio-module-drv";
-			mem  =3D <0x02330000 0x0000400>;
-			clocks=3D<&clksr>;
-			interrupts =3D <0 0x173 0xf01>;
-		};
-	};
-};
diff --git a/recipes-kernel/linux/files/k2g/cmem.dtsi b/recipes-kernel/li=
nux/files/k2g/cmem.dtsi
deleted file mode 100644
index 4c68d82d..00000000
--- a/recipes-kernel/linux/files/k2g/cmem.dtsi
+++ /dev/null
@@ -1,37 +0,0 @@
-/ {
-	reserved-memory {
-
-		cmem_block_mem_0: cmem_block_mem@818000000 {
-			reg =3D <0x00000008 0x18000000 0x00000000 0x5000000>;
-			no-map;
-			status =3D "okay";
-		};
-	};
-
-	cmem {
-		compatible =3D "ti,cmem";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-		status =3D "okay";
-
-		cmem_block_0: cmem_block@0 {
-			reg =3D <0>;
-			memory-region =3D <&cmem_block_mem_0>;
-			cmem-buf-pools =3D <1 0x00000000 0x5000000>;
-		};
-
-		cmem_block_1: cmem_block@1 {
-			reg =3D <1>;
-			sram =3D <&sram_cmem>;
-		};
-	};
-};
-
-&msm_ram {
-	sram_cmem: sram-cmem@a0000 {
-		reg =3D <0xa0000 0x57000>;
-	};
-};
diff --git a/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi b/r=
ecipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
deleted file mode 100644
index 49894e0d..00000000
--- a/recipes-kernel/linux/files/k2g/keystone-k2g-pru-uio.dtsi
+++ /dev/null
@@ -1,391 +0,0 @@
-&pruss_soc_bus0 {
-		uio_pruss1_mdio: uio_mdio@20ab2400 {
-			compatible =3D "ti,davinci_mdio";
-			reg =3D <0x20ab2400 0x90>;
-			clocks =3D <&k2g_clks 0x0014 1>;
-			clock-names =3D "fck";
-			#address-cells =3D <1>;
-			#size-cells =3D <0>;
-			bus_freq =3D <2500000>;
-			status =3D "disabled";
-		};
-
-		uio_pruss1_mem: uio_pruss1_mem {
-			compatible =3D "ti,uio-module-drv";
-			mem =3D <0x20a80000 0x2000>,
-			      <0x20a82000 0x2000>,
-			      <0x20a90000 0x10000>,
-			      <0x20aa0000 0x2000>,
-			      <0x20aa6000 0x2000>,
-			      <0x20aae000 0x31c>,
-			      <0x20ab2000 0x70>;
-			mem-names =3D "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "iep", "mii_rt";
-			status =3D "okay";
-		};
-		uio_pruss1_mem2: uio_pruss1_mem2 {
-			compatible =3D "ti,uio-module-drv";
-			mem =3D <0x20aa8000 0x38>,
-			      <0x20ab0000 0x60>,
-			      <0x20ab2400 0x90>,
-			      <0x0c080000 0xe000>;
-			mem-names =3D "uart", "ecap", "mdio", "ocmc";
-			status =3D "okay";
-		};
-		uio_pruss1_evt0: uio_pruss1_evt0 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 224 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss1_evt1: uio_pruss1_evt1 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 225 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss1_evt2: uio_pruss1_evt2 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 226 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss1_evt3: uio_pruss1_evt3 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 227 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss1_evt4: uio_pruss1_evt4 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 228 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss1_evt6: uio_pruss1_evt6 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 230 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss1_evt7: uio_pruss1_evt7 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 231 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-
-		uio_pruss1_0_mem: uio_pruss1_0_mem {
-			compatible =3D "ti,uio-module-drv";
-			mem =3D <0x20ab4000 0x3000>,
-			      <0x20aa2000 0x400>,
-			      <0x20aa2400 0x100>;
-			mem-names =3D "iram", "control", "debug";
-			status =3D "okay";
-		};
-
-		uio_pruss1_1_mem: uio_pruss1_1_mem {
-			compatible =3D "ti,uio-module-drv";
-			mem =3D <0x20ab8000 0x3000>,
-			      <0x20aa4000 0x400>,
-			      <0x20aa4400 0x100>;
-			mem-names =3D "iram", "control", "debug";
-			status =3D "okay";
-		};
-};
-
-&pruss_soc_bus1 {
-		uio_pruss2_mdio: uio_mdio@20af2400 {
-			compatible =3D "ti,davinci_mdio";
-		        reg =3D <0x20af2400 0x90>;
-			clocks =3D <&k2g_clks 0x0015 1>;
-			clock-names =3D "fck";
-			#address-cells =3D <1>;
-			#size-cells =3D <0>;
-			bus_freq =3D <2500000>;
-			status =3D "disabled";
-		};
-
-		uio_pruss2_mem: uio_pruss2_mem {
-			compatible =3D "ti,uio-module-drv";
-			mem =3D <0x20ac0000 0x2000>,
-			      <0x20ac2000 0x2000>,
-			      <0x20ad0000 0x10000>,
-			      <0x20ae0000 0x2000>,
-			      <0x20ae6000 0x2000>,
-			      <0x20aee000 0x31c>,
-			      <0x20af2000 0x70>;
-			mem-names =3D "dram0", "dram1", "shrdram2", "intc", "cfg",
-				    "iep", "mii_rt";
-			status =3D "okay";
-		};
-		uio_pruss2_mem2: uio_pruss2_mem2 {
-			compatible =3D "ti,uio-module-drv";
-			mem =3D <0x20ae8000 0x38>,
-			      <0x20af0000 0x60>,
-			      <0x20af2400 0x90>,
-			      <0x0c08e000 0xe000>;
-			mem-names =3D "uart", "ecap", "mdio", "ocmc";
-			status =3D "okay";
-		};
-		uio_pruss2_evt0: uio_pruss2_evt0 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 232 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss2_evt1: uio_pruss2_evt1 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 233 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss2_evt2: uio_pruss2_evt2 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 234 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss2_evt3: uio_pruss2_evt3 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 235 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss2_evt4: uio_pruss2_evt4 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 236 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss2_evt6: uio_pruss2_evt6 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 238 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-		uio_pruss2_evt7: uio_pruss2_evt7 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <GIC_SPI 239 0xf01>;
-			interrupt-mode =3D <0>;
-			status =3D "okay";
-		};
-
-		uio_pruss2_0_mem: uio_pruss2_0_mem {
-			compatible =3D "ti,uio-module-drv";
-			mem =3D <0x20af4000 0x3000>,
-			      <0x20ae2000 0x400>,
-			      <0x20ae2400 0x100>;
-			mem-names =3D "iram", "control", "debug";
-			status =3D "okay";
-		};
-		uio_pruss2_1_mem: uio_pruss2_1_mem {
-			compatible =3D "ti,uio-module-drv";
-			mem =3D <0x20af8000 0x3000>,
-			      <0x20ae4000 0x400>,
-			      <0x20ae4400 0x100>;
-			mem-names =3D "iram", "control", "debug";
-			status =3D "okay";
-		};
-};
-
-&k2g_pinctrl {
-	uio_pruss1_mdio_eth_default: uio_pruss1_mdio_eth_default {
-		pinctrl-single,pins =3D <
-                        K2G_CORE_IOPAD(0x12cc) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE0)      /* pr0_mdio_data.pr0_mdio_data */
-                        K2G_CORE_IOPAD(0x12d0) (BUFFER_CLASS_B | PIN_PUL=
LDOWN | MUX_MODE0)      /* pr0_mdio_mdclk.pr0_mdio_mdclk */
-                        K2G_CORE_IOPAD(0x105c) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE3)      /* gpmc_wait1.gpio0_23 (pr0_mii0_resetn) */
-                        K2G_CORE_IOPAD(0x1070) (BUFFER_CLASS_B | PIN_PUL=
LUP | MUX_MODE3)        /* gpmc_csn2.gpio0_28 (pr0_mii0_intn) */
-                        K2G_CORE_IOPAD(0x1054) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE3)      /* gpmc_be1n.gpio0_21 (pr0_mii1_resetn) */
-                        K2G_CORE_IOPAD(0x1074) (BUFFER_CLASS_B | PIN_PUL=
LUP | MUX_MODE3)        /* gpmc_csn3.gpio0_29 (pr0_mii1_intn) */
-
-                        /* PRUSS0 External Mux routing */
-                        K2G_CORE_IOPAD(0x11d4) (BUFFER_CLASS_B | MUX_MOD=
E3)                     /* uart0_ctsn.gpio0_106 */
-                        K2G_CORE_IOPAD(0x11d8) (BUFFER_CLASS_B | MUX_MOD=
E3)                     /* uart0_rtsn.gpio0_107 */
-                        K2G_CORE_IOPAD(0x11fc) (BUFFER_CLASS_B | MUX_MOD=
E3)                     /* dcan0_rx.gpio1_57 */
-                        K2G_CORE_IOPAD(0x1200) (BUFFER_CLASS_B | MUX_MOD=
E3)                     /* dcan0_tx.gpio1_56 */
-                        K2G_CORE_IOPAD(0x1224) (BUFFER_CLASS_B | MUX_MOD=
E3)                     /* qspi_csn2.gpio1_66 */
-                        K2G_CORE_IOPAD(0x1228) (BUFFER_CLASS_B | MUX_MOD=
E3)                     /* qspi_csn3.gpio1_67 */
-
-                        /* PRUSS0 PRU0 Ethernet */
-                        K2G_CORE_IOPAD(0x122c) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru0_gpo0.pr0_pru0_gpi0 (pr0_mii0_rxd0) */
-                        K2G_CORE_IOPAD(0x1230) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru0_gpo1.pr0_pru0_gpi1 (pr0_mii0_rxd1) */
-                        K2G_CORE_IOPAD(0x1234) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru0_gpo2.pr0_pru0_gpi2 (pr0_mii0_rxd2) */
-                        K2G_CORE_IOPAD(0x1238) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru0_gpo3.pr0_pru0_gpi3 (pr0_mii0_rxd3) */
-                        K2G_CORE_IOPAD(0x123c) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru0_gpo4.pr0_pru0_gpi4 (pr0_mii0_rxdv) */
-                        K2G_CORE_IOPAD(0x1240) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru0_gpo5.pr0_pru0_gpi5 (pr0_mii0_rxer) */
-                        K2G_CORE_IOPAD(0x1244) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr0_pru0_gpo6.pr0_pru0_gpi6 (pr0_mii_mr0_clk) =
*/
-
-                        K2G_CORE_IOPAD(0x124c) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr0_pru0_gpo8.pr0_pru0_gpi8 (pr0_mii0_rxlink) =
*/
-                        K2G_CORE_IOPAD(0x1250) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru0_gpo9.pr0_pru0_gpi9 (pr0_mii0_col) */
-                        K2G_CORE_IOPAD(0x1254) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru0_gpo10.pr0_pru0_gpi10 (pr0_mii0_crs) *=
/
-
-                        K2G_CORE_IOPAD(0x12a8) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr0_pru1_gpo11.pr0_pru1_gpo11 (pr0_mii0_txd0) =
*/
-                        K2G_CORE_IOPAD(0x12ac) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr0_pru1_gpo12.pr0_pru1_gpo12 (pr0_mii0_txd1) =
*/
-                        K2G_CORE_IOPAD(0x12b0) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr0_pru1_gpo13.pr0_pru1_gpo13 (pr0_mii0_txd2) =
*/
-                        K2G_CORE_IOPAD(0x12b4) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr0_pru1_gpo14.pr0_pru1_gpo14 (pr0_mii0_txd3) =
*/
-                        K2G_CORE_IOPAD(0x12b8) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr0_pru1_gpo15.pr0_pru1_gpo15 (pr0_mii0_txen) =
*/
-                        K2G_CORE_IOPAD(0x12bc) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr0_pru1_gpo16.pr0_pru1_gpo16 (pr0_mii_mt0_clk=
) */
-
-                        /* PRUSS0 PRU1 Ethernet */
-                        K2G_CORE_IOPAD(0x127c) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru1_gpo0.pr0_pru1_gpi0 (pr0_mii1_rxd0) */
-                        K2G_CORE_IOPAD(0x1280) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru1_gpo1.pr0_pru1_gpi1 (pr0_mii1_rxd1) */
-                        K2G_CORE_IOPAD(0x1284) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru1_gpo2.pr0_pru1_gpi2 (pr0_mii1_rxd2) */
-                        K2G_CORE_IOPAD(0x1288) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru1_gpo3.pr0_pru1_gpi3 (pr0_mii1_rxd3) */
-                        K2G_CORE_IOPAD(0x128c) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru1_gpo4.pr0_pru1_gpi4 (pr0_mii1_rxdv) */
-                        K2G_CORE_IOPAD(0x1290) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru1_gpo5.pr0_pru1_gpi5 (pr0_mii1_rxer) */
-                        K2G_CORE_IOPAD(0x1294) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr0_pru1_gpo6.pr0_pru1_gpi6 (pr0_mii_mr1_clk) =
*/
-
-                        K2G_CORE_IOPAD(0x129c) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr0_pru1_gpo8.pr0_pru1_gpi8 (pr0_mii1_rxlink) =
*/
-                        K2G_CORE_IOPAD(0x12a0) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru1_gpo9.pr0_pru1_gpi9 (pr0_mii1_col) */
-                        K2G_CORE_IOPAD(0x12a4) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr0_pru1_gpo10.pr0_pru1_gpi10 (pr0_mii1_crs) *=
/
-
-                        K2G_CORE_IOPAD(0x1258) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr0_pru0_gpo11.pr0_pru0_gpo11 (pr0_mii1_txd0) =
*/
-                        K2G_CORE_IOPAD(0x125c) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr0_pru0_gpo12.pr0_pru0_gpo12 (pr0_mii1_txd1) =
*/
-                        K2G_CORE_IOPAD(0x1260) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr0_pru0_gpo13.pr0_pru0_gpo13 (pr0_mii1_txd2) =
*/
-                        K2G_CORE_IOPAD(0x1264) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr0_pru0_gpo14.pr0_pru0_gpo14 (pr0_mii1_txd3) =
*/
-                        K2G_CORE_IOPAD(0x1268) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr0_pru0_gpo15.pr0_pru0_gpo15 (pr0_mii1_txen) =
*/
-                        K2G_CORE_IOPAD(0x126c) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr0_pru0_gpo16.pr0_pru0_gpo16 (pr0_mii_mt1_clk=
) */
-		>;
-	};
-
-	uio_pruss2_mdio_eth_default: uio_pruss2_mdio_eth_default {
-		pinctrl-single,pins =3D <
-                        K2G_CORE_IOPAD(0x1374) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE0)      /* pr1_mdio_data.pr1_mdio_data */
-                        K2G_CORE_IOPAD(0x1378) (BUFFER_CLASS_B | PIN_PUL=
LDOWN | MUX_MODE0)      /* pr1_mdio_mdclk.pr1_mdio_mdclk */
-                        K2G_CORE_IOPAD(0x1050) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE3)      /* gpmc_be0ncle.gpio0_20 (pr1_mii0_resetn) */
-                        K2G_CORE_IOPAD(0x1044) (BUFFER_CLASS_B | PIN_PUL=
LUP | MUX_MODE3)        /* gpmc_advnale.gpio0_17 (pr1_mii0_intn) */
-                        K2G_CORE_IOPAD(0x1060) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE3)      /* gpmc_wpn.gpio0_24 (pr1_mii1_resetn) */
-                        K2G_CORE_IOPAD(0x1088) (BUFFER_CLASS_B | PIN_PUL=
LUP | MUX_MODE3)        /* gpmc_wait0.gpio0_22 (pr1_mii1_intn) */
-
-                        /* PRUSS1 PRU0 Ethernet */
-                        K2G_CORE_IOPAD(0x12d4) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru0_gpo0.pr1_pru0_gpi0 (pr1_mii0_rxd0) */
-                        K2G_CORE_IOPAD(0x12d8) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru0_gpo1.pr1_pru0_gpi1 (pr1_mii0_rxd1) */
-                        K2G_CORE_IOPAD(0x12dc) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru0_gpo2.pr1_pru0_gpi2 (pr1_mii0_rxd2) */
-                        K2G_CORE_IOPAD(0x12e0) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru0_gpo3.pr1_pru0_gpi3 (pr1_mii0_rxd3) */
-                        K2G_CORE_IOPAD(0x12e4) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru0_gpo4.pr1_pru0_gpi4 (pr1_mii0_rxdv) */
-                        K2G_CORE_IOPAD(0x12e8) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru0_gpo5.pr1_pru0_gpi5 (pr1_mii0_rxer) */
-                        K2G_CORE_IOPAD(0x12ec) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr1_pru0_gpo6.pr1_pru0_gpi6 (pr1_mii_mr0_clk) =
*/
-
-                        K2G_CORE_IOPAD(0x12f4) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr1_pru0_gpo8.pr1_pru0_gpi8 (pr1_mii0_rxlink) =
*/
-                        K2G_CORE_IOPAD(0x12f8) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru0_gpo9.pr1_pru0_gpi9 (pr1_mii0_col) */
-                        K2G_CORE_IOPAD(0x12fc) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru0_gpo10.pr1_pru0_gpi10 (pr1_mii0_crs) *=
/
-
-                        K2G_CORE_IOPAD(0x1350) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr1_pru1_gpo11.pr1_pru1_gpo11 (pr1_mii0_txd0) =
*/
-                        K2G_CORE_IOPAD(0x1354) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr1_pru1_gpo12.pr1_pru1_gpo12 (pr1_mii0_txd1) =
*/
-                        K2G_CORE_IOPAD(0x1358) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr1_pru1_gpo13.pr1_pru1_gpo13 (pr1_mii0_txd2) =
*/
-                        K2G_CORE_IOPAD(0x135c) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr1_pru1_gpo14.pr1_pru1_gpo14 (pr1_mii0_txd3) =
*/
-                        K2G_CORE_IOPAD(0x1360) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr1_pru1_gpo15.pr1_pru1_gpo15 (pr1_mii0_txen) =
*/
-                        K2G_CORE_IOPAD(0x1364) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr1_pru1_gpo16.pr1_pru1_gpo16 (pr1_mii_mt0_clk=
) */
-
-                        /* PRUSS1 PRU1 Ethernet */
-                        K2G_CORE_IOPAD(0x1324) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru1_gpo0.pr1_pru1_gpi0 (pr1_mii1_rxd0) */
-                        K2G_CORE_IOPAD(0x132c) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru1_gpo2.pr1_pru1_gpi2 (pr1_mii1_rxd2) */
-                        K2G_CORE_IOPAD(0x1330) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru1_gpo3.pr1_pru1_gpi3 (pr1_mii1_rxd3) */
-                        K2G_CORE_IOPAD(0x1334) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru1_gpo4.pr1_pru1_gpi4 (pr1_mii1_rxdv) */
-                        K2G_CORE_IOPAD(0x1338) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru1_gpo5.pr1_pru1_gpi5 (pr1_mii1_rxer) */
-                        K2G_CORE_IOPAD(0x133c) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr1_pru1_gpo6.pr1_pru1_gpi6 (pr1_mii_mr1_clk) =
*/
-
-                        K2G_CORE_IOPAD(0x1344) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr1_pru1_gpo8.pr1_pru1_gpi8 (pr1_mii1_rxlink) =
*/
-                        K2G_CORE_IOPAD(0x1348) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru1_gpo9.pr1_pru1_gpi9 (pr1_mii1_col) */
-                        K2G_CORE_IOPAD(0x134c) (BUFFER_CLASS_B | PULL_DI=
SABLE | MUX_MODE1)      /* pr1_pru1_gpo10.pr1_pru1_gpi10 (pr1_mii1_crs) *=
/
-
-                        K2G_CORE_IOPAD(0x1300) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr1_pru0_gpo11.pr1_pru0_gpo11 (pr1_mii1_txd0) =
*/
-                        K2G_CORE_IOPAD(0x1304) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr1_pru0_gpo12.pr1_pru0_gpo12 (pr1_mii1_txd1) =
*/
-                        K2G_CORE_IOPAD(0x1308) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr1_pru0_gpo13.pr1_pru0_gpo13 (pr1_mii1_txd2) =
*/
-                        K2G_CORE_IOPAD(0x130c) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr1_pru0_gpo14.pr1_pru0_gpo14 (pr1_mii1_txd3) =
*/
-                        K2G_CORE_IOPAD(0x1310) (BUFFER_CLASS_B | MUX_MOD=
E0)                     /* pr1_pru0_gpo15.pr1_pru0_gpo15 (pr1_mii1_txen) =
*/
-                        K2G_CORE_IOPAD(0x1314) (BUFFER_CLASS_B | MUX_MOD=
E1)                     /* pr1_pru0_gpo16.pr1_pru0_gpo16 (pr1_mii_mt1_clk=
) */
-		>;
-	};
-};
-
-&uio_pruss1_mdio {
-        status =3D "okay";
-        pinctrl-0 =3D <&uio_pruss1_mdio_eth_default>;
-        pinctrl-names =3D "default";
-        reset-gpios =3D <&gpio0 23 GPIO_ACTIVE_LOW>,
-                      <&gpio0 21 GPIO_ACTIVE_LOW>;
-        reset-delay-us =3D <20>;
-
-        uio_pruss1_eth0_phy: uio-ethernet-phy@0 {
-                reg =3D <0>;
-        };
-
-        uio_pruss1_eth1_phy: uio-ethernet-phy@1 {
-                reg =3D <1>;
-        };
-};
-
-&uio_pruss2_mdio {
-        status =3D "okay";
-        pinctrl-0 =3D <&uio_pruss2_mdio_eth_default>;
-        pinctrl-names =3D "default";
-        reset-gpios =3D <&gpio0 20 GPIO_ACTIVE_LOW>,
-                      <&gpio0 24 GPIO_ACTIVE_LOW>;
-        reset-delay-us =3D <20>;
-
-        uio_pruss2_eth0_phy: uio-ethernet-phy@2 {
-                reg =3D <2>;
-        };
-
-        uio_pruss2_eth1_phy: uio-ethernet-phy@3 {
-                reg =3D <3>;
-        };
-};
-
-&pruss0 {
-	status =3D "disabled";
-};
-
-&pru0_0 {
-	status =3D "disabled";
-};
-
-&pru0_1 {
-	status =3D "disabled";
-};
-
-&pruss0_intc {
-	status =3D "disabled";
-};
-
-&pruss0_mdio {
-	status =3D "disabled";
-};
-
-&pruss1 {
-	status =3D "disabled";
-};
-
-&pru1_0 {
-	status =3D "disabled";
-};
-
-&pru1_1 {
-	status =3D "disabled";
-};
-
-&pruss1_intc {
-	status =3D "disabled";
-};
-
-&pruss1_mdio {
-	status =3D "disabled";
-};
-
-&pruss0_emac0 {
-	status =3D "disabled";
-};
-
-&pruss0_emac1 {
-	status =3D "disabled";
-};
-
-&pruss1_emac0 {
-	status =3D "disabled";
-};
-
-&pruss1_emac1 {
-	status =3D "disabled";
-};
diff --git a/recipes-kernel/linux/files/k2hk/cmem.dtsi b/recipes-kernel/l=
inux/files/k2hk/cmem.dtsi
deleted file mode 100644
index 400aa9dd..00000000
--- a/recipes-kernel/linux/files/k2hk/cmem.dtsi
+++ /dev/null
@@ -1,37 +0,0 @@
-/ {
-	reserved-memory {
-
-		cmem_block_mem_0: cmem_block_mem@830000000 {
-			reg =3D <0x00000008 0x30000000 0x00000000 0x18000000>;
-			no-map;
-			status =3D "okay";
-		};
-	};
-
-	cmem {
-		compatible =3D "ti,cmem";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-		status =3D "okay";
-
-		cmem_block_0: cmem_block@0 {
-			reg =3D <0>;
-			memory-region =3D <&cmem_block_mem_0>;
-			cmem-buf-pools =3D <1 0x00000000 0x18000000>;
-		};
-
-		cmem_block_1: cmem_block@1 {
-			reg =3D <1>;
-			sram =3D <&sram_cmem>;
-		};
-	};
-};
-
-&msm_ram {
-	sram_cmem: sram-cmem@100000 {
-		reg =3D <0x100000 0x480000>;
-	};
-};
diff --git a/recipes-kernel/linux/files/k2hk/k2hk-uio.dtsi b/recipes-kern=
el/linux/files/k2hk/k2hk-uio.dtsi
deleted file mode 100644
index cabe0b8d..00000000
--- a/recipes-kernel/linux/files/k2hk/k2hk-uio.dtsi
+++ /dev/null
@@ -1,58 +0,0 @@
-/ {
-	soc {
-		uio_hyperlink0: hyperlink0 {
-			compatible =3D "ti,uio-module-drv";
-			mem  =3D <0x21400000 0x00001000
-				0x40000000 0x10000000
-				0x0231a000 0x00002000>;
-			clocks =3D <&clkhyperlink0>;
-			interrupts	=3D <0 387 0x101>;
-			cfg-params
-			{
-				ti,serdes_refclk_khz =3D <312500>;
-				ti,serdes_maxserrate_khz =3D <6250000>;
-				ti,serdes_lanerate =3D "half";
-				ti,serdes_numlanes =3D <4>;
-				ti,serdes_c1 =3D <4 4 4 4>;
-				ti,serdes_c2 =3D <0 0 0 0>;
-				ti,serdes_cm =3D <0 0 0 0>;
-				ti,serdes_tx_att =3D <12 12 12 12>;
-				ti,serdes_tx_vreg =3D <4 4 4 4>;
-				ti,serdes_rx_att =3D <11 11 11 11>;
-				ti,serdes_rx_boost =3D <3 3 3 3>;
-			};
-		};
-
-		uio_hyperlink1: hyperlink1 {
-			compatible =3D "ti,uio-module-drv";
-			mem  =3D <0x21400000 0x00001000
-				0x28000000 0x08000000
-				0x0231c000 0x00002000>;
-			clocks =3D <&clkhyperlink1>;
-			interrupts	=3D <0 388 0x101>;
-			cfg-params
-			{
-				ti,serdes_refclk_khz =3D <312500>;
-				ti,serdes_maxserrate_khz =3D <6250000>;
-				ti,serdes_lanerate =3D "half";
-				ti,serdes_numlanes =3D <4>;
-				ti,serdes_c1 =3D <4 4 4 4>;
-				ti,serdes_c2 =3D <0 0 0 0>;
-				ti,serdes_cm =3D <0 0 0 0>;
-				ti,serdes_tx_att =3D <12 12 12 12>;
-				ti,serdes_tx_vreg =3D <4 4 4 4>;
-				ti,serdes_rx_att =3D <11 11 11 11>;
-				ti,serdes_rx_boost =3D <3 3 3 3>;
-			};
-		};
-
-		uio_srio: srio {
-			compatible =3D "ti,uio-module-drv";
-			mem  =3D <0x0232C000 0x00002000
-				0x02900000 0x00040000
-				0x0232C000 0x00002000>;
-			clocks=3D<&clksrio>;
-			interrupts =3D <0 154 0xf01>;
-		};
-	};
-};
diff --git a/recipes-kernel/linux/files/k2l/cmem.dtsi b/recipes-kernel/li=
nux/files/k2l/cmem.dtsi
deleted file mode 100644
index da389e5d..00000000
--- a/recipes-kernel/linux/files/k2l/cmem.dtsi
+++ /dev/null
@@ -1,37 +0,0 @@
-/ {
-	reserved-memory {
-
-		cmem_block_mem_0: cmem_block_mem@830000000 {
-			reg =3D <0x00000008 0x30000000 0x00000000 0x18000000>;
-			no-map;
-			status =3D "okay";
-		};
-	};
-
-	cmem {
-		compatible =3D "ti,cmem";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-		#pool-size-cells =3D <2>;
-
-		status =3D "okay";
-
-		cmem_block_0: cmem_block@0 {
-			reg =3D <0>;
-			memory-region =3D <&cmem_block_mem_0>;
-			cmem-buf-pools =3D <1 0x00000000 0x18000000>;
-		};
-
-		cmem_block_1: cmem_block@1 {
-			reg =3D <1>;
-			sram =3D <&sram_cmem>;
-		};
-	};
-};
-
-&msm_ram {
-	sram_cmem: sram-cmem@80000 {
-		reg =3D <0x80000 0xc0000>;
-	};
-};
diff --git a/recipes-kernel/linux/files/k2l/k2l-uio.dtsi b/recipes-kernel=
/linux/files/k2l/k2l-uio.dtsi
deleted file mode 100644
index a1b2e07e..00000000
--- a/recipes-kernel/linux/files/k2l/k2l-uio.dtsi
+++ /dev/null
@@ -1,10 +0,0 @@
-/ {
-	soc {
-		uio_srss: srss {
-			compatible =3D "ti,uio-module-drv";
-			mem  =3D <0x02330000 0x0000400>;
-			clocks=3D<&clksr>;
-			interrupts =3D <0 0x173 0xf01>;
-		};
-	};
-};
diff --git a/recipes-kernel/linux/files/keystone/keystone-uio.dtsi b/reci=
pes-kernel/linux/files/keystone/keystone-uio.dtsi
deleted file mode 100644
index 43b183db..00000000
--- a/recipes-kernel/linux/files/keystone/keystone-uio.dtsi
+++ /dev/null
@@ -1,186 +0,0 @@
-/ {
-	soc {
-		uio_mpax: mpax {
-			compatible =3D "ti,uio-module-drv";
-			mem  =3D <0x00bc00000 0x00000a00>;
-		};
-
-		uio_edma3: edma3 {
-			compatible =3D "ti,uio-module-drv";
-			mem =3D <0x02700000 0x000C0000>;
-		};
-		uio_secmgr: secmgr {
-			compatible =3D "ti,uio-module-drv";
-			mem  =3D <0x002500100 0x00000004>;
-		};
-		uio_qmss: qmss {
-			compatible =3D "ti,uio-module-drv";
-			mem  =3D <0x02a00000 0x00100000
-				0x23a00000 0x00200000>;
-		};
-
-		uio_qpend0: qpend0 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 44 0xf04>;
-			interrupt-mode =3D <1>; /* Interrupt mode oneshot */
-			cfg-params
-			{
-				ti,qm-queue =3D <662>;
-			};
-		};
-
-		uio_qpend1: qpend1 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 45 0xf04>;
-			interrupt-mode =3D <1>; /* Interrupt mode oneshot */
-			cfg-params
-			{
-				ti,qm-queue =3D <663>;
-			};
-		};
-
-		uio_qpend2: qpend2 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 46 0xf04>;
-			interrupt-mode =3D <1>; /* Interrupt mode oneshot */
-			cfg-params
-			{
-				ti,qm-queue =3D <664>;
-			};
-		};
-
-		uio_qpend3: qpend3 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 47 0xf04>;
-			interrupt-mode =3D <1>; /* Interrupt mode oneshot */
-			cfg-params
-			{
-				ti,qm-queue =3D <665>;
-			};
-		};
-
-		/* The following uio cic2 entries allow access to interupt output
-		 * by the cic2 controller: The actual input event triggering the
-		 * interrupt is assumed to be programmed other drivers
-		 */
-		uio_cic2_out32: cic2_out32 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 451 0xf01>;
-		};
-
-		uio_cic2_out33: cic2_out33 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 452 0xf01>;
-		};
-
-		uio_cic2_out34: cic2_out34 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 453 0xf01>;
-		};
-
-		uio_cic2_out35: cic2_out35 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 454 0xf01>;
-		};
-
-		uio_cic2_out36: cic2_out36 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 455 0xf01>;
-		};
-
-		uio_cic2_out37: cic2_out37 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 456 0xf01>;
-		};
-
-		uio_cic2_out38: cic2_out38 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 457 0xf01>;
-		};
-
-		uio_cic2_out39: cic2_out39 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 458 0xf01>;
-		};
-
-		uio_cic2_out40: cic2_out40 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 459 0xf01>;
-		};
-
-		uio_cic2_out41: cic2_out41 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 460 0xf01>;
-		};
-
-		uio_cic2_out42: cic2_out42 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 461 0xf01>;
-		};
-
-		uio_cic2_out43: cic2_out43 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 462 0xf01>;
-		};
-
-		uio_cic2_out44: cic2_out44 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 463 0xf01>;
-		};
-
-		uio_cic2_out45: cic2_out45 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 464 0xf01>;
-		};
-
-		uio_cic2_out46: cic2_out46 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 465 0xf01>;
-		};
-
-		uio_cic2_out47: cic2_out47 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 466 0xf01>;
-		};
-
-		uio_cic2_out18: cic2_out18 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 467 0xf01>;
-		};
-
-		uio_cic2_out19: cic2_out19 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 468 0xf01>;
-		};
-
-		uio_cic2_out22: cic2_out22 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 469 0xf01>;
-		};
-
-		uio_cic2_out23: cic2_out23 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 470 0xf01>;
-		};
-
-		uio_cic2_out50: cic2_out50 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 471 0xf01>;
-		};
-
-		uio_cic2_out51: cic2_out51 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 472 0xf01>;
-		};
-
-		uio_cic2_out66: cic2_out66 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 473 0xf01>;
-		};
-
-		uio_cic2_out67: cic2_out67 {
-			compatible =3D "ti,uio-module-drv";
-			interrupts =3D <0 474 0xf01>;
-		};
-	};
-};
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/li=
nux/kernel-rdepends.inc
index 41200c52..0425c789 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -11,23 +11,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D=
 " vpdma-fw"
 # Add run-time dependency for Goodix firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D " goodix-fw"
=20
-# Install boot-monitor skern file into /boot dir of rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:keystone =3D " boot-monitor"
-
-# Install ti-sci-fw into /boot dir of rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:k2g =3D " ti-sci-fw"
-
-# Add run-time dependency for SerDes firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:keystone =3D " serdes-fw"
-
-# Add run-time dependency for QMSS PDSP firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:keystone =3D " qmss-pdsp-fw"
-
-# Add run-time dependency for NETCP PA firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:k2hk =3D " netcp-pa-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:k2e =3D " netcp-pa-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:k2l =3D " netcp-pa-fw"
-
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx-evm =3D " prueth-fw p=
rusw-fw pruhsr-fw pruprp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx-hs-evm =3D " prueth-f=
w prusw-fw pruhsr-fw pruprp-fw"
diff --git a/recipes-kernel/linux/linux-ti-mainline/k2g/defconfig b/recip=
es-kernel/linux/linux-ti-mainline/k2g/defconfig
deleted file mode 100644
index 316b04bb..00000000
--- a/recipes-kernel/linux/linux-ti-mainline/k2g/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_k2g_release
diff --git a/recipes-kernel/linux/linux-ti-mainline/keystone/defconfig b/=
recipes-kernel/linux/linux-ti-mainline/keystone/defconfig
deleted file mode 100644
index 5a40b93d..00000000
--- a/recipes-kernel/linux/linux-ti-mainline/keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_keystone_release
diff --git a/recipes-kernel/linux/linux-ti-staging-5.10/k2g/defconfig b/r=
ecipes-kernel/linux/linux-ti-staging-5.10/k2g/defconfig
deleted file mode 100644
index 316b04bb..00000000
--- a/recipes-kernel/linux/linux-ti-staging-5.10/k2g/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_k2g_release
diff --git a/recipes-kernel/linux/linux-ti-staging-5.10/keystone/defconfi=
g b/recipes-kernel/linux/linux-ti-staging-5.10/keystone/defconfig
deleted file mode 100644
index 5a40b93d..00000000
--- a/recipes-kernel/linux/linux-ti-staging-5.10/keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_keystone_release
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/k2g/defconfig b/re=
cipes-kernel/linux/linux-ti-staging-5.4/k2g/defconfig
deleted file mode 100644
index 316b04bb..00000000
--- a/recipes-kernel/linux/linux-ti-staging-5.4/k2g/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_k2g_release
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/keystone/defconfig=
 b/recipes-kernel/linux/linux-ti-staging-5.4/keystone/defconfig
deleted file mode 100644
index 5a40b93d..00000000
--- a/recipes-kernel/linux/linux-ti-staging-5.4/keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_keystone_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.10/k2g/defconfig =
b/recipes-kernel/linux/linux-ti-staging-rt-5.10/k2g/defconfig
deleted file mode 100644
index a9c24f2e..00000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-5.10/k2g/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_k2g_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.10/keystone/defco=
nfig b/recipes-kernel/linux/linux-ti-staging-rt-5.10/keystone/defconfig
deleted file mode 100644
index fc68085f..00000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-5.10/keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_keystone_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.4/k2g/defconfig b=
/recipes-kernel/linux/linux-ti-staging-rt-5.4/k2g/defconfig
deleted file mode 100644
index a9c24f2e..00000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-5.4/k2g/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_k2g_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-5.4/keystone/defcon=
fig b/recipes-kernel/linux/linux-ti-staging-rt-5.4/keystone/defconfig
deleted file mode 100644
index fc68085f..00000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-5.4/keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_keystone_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.10/k2g/defco=
nfig b/recipes-kernel/linux/linux-ti-staging-systest-5.10/k2g/defconfig
deleted file mode 100644
index abfb3309..00000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-5.10/k2g/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_k2g_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.10/keystone/=
defconfig b/recipes-kernel/linux/linux-ti-staging-systest-5.10/keystone/d=
efconfig
deleted file mode 100644
index e95bcf95..00000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-5.10/keystone/defconf=
ig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_keystone_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.4/k2g/defcon=
fig b/recipes-kernel/linux/linux-ti-staging-systest-5.4/k2g/defconfig
deleted file mode 100644
index abfb3309..00000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-5.4/k2g/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_k2g_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-5.4/keystone/d=
efconfig b/recipes-kernel/linux/linux-ti-staging-systest-5.4/keystone/def=
config
deleted file mode 100644
index e95bcf95..00000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-5.4/keystone/defconfi=
g
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_keystone_debug
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-ui=
o.inc
index 55d35972..eea7866a 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -1,8 +1,3 @@
-SRC_URI:append:keystone =3D " file://keystone-uio.dtsi"
-SRC_URI:append:k2hk =3D " file://k2hk-uio.dtsi"
-SRC_URI:append:k2l =3D " file://k2l-uio.dtsi"
-SRC_URI:append:k2e =3D " file://k2e-uio.dtsi"
-SRC_URI:append:k2g =3D " file://keystone-k2g-pru-uio.dtsi"
 SRC_URI:append:dra7xx =3D " file://am57xx-pru-uio.dtsi \
                           file://am571x-pru-uio.dtsi \
 "
@@ -10,10 +5,6 @@ SRC_URI:append:ti33x =3D " file://am335x-pru-uio.dtsi"
 SRC_URI:append:ti43x =3D " file://am437x-pru-uio.dtsi"
=20
 DTSI_LIST =3D ""
-DTSI_LIST:append:keystone =3D " keystone-uio.dtsi"
-DTSI_LIST:append:k2hk =3D " k2hk-uio.dtsi"
-DTSI_LIST:append:k2l =3D " k2l-uio.dtsi"
-DTSI_LIST:append:k2e =3D " k2e-uio.dtsi"
=20
 do_setup_uio() {
     if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ]
@@ -77,16 +68,4 @@ do_setup_uio:append:ti43x() {
     fi
 }
=20
-do_setup_uio:append:k2g() {
-
-    if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ]
-    then
-        dts=3D"keystone-k2g-ice-pru-excl-uio.dts"
-        dtsi=3D"keystone-k2g-pru-uio.dtsi"
-        cp ${S}/arch/arm/boot/dts/keystone-k2g-ice.dts ${S}/arch/arm/boo=
t/dts/$dts
-        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
-        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
-    fi
-}
-
 do_patch[postfuncs] +=3D "do_setup_uio"
diff --git a/recipes-ti/ctoolslib/libaet_git.bb b/recipes-ti/ctoolslib/li=
baet_git.bb
index 6d6680f0..c15ab229 100644
--- a/recipes-ti/ctoolslib/libaet_git.bb
+++ b/recipes-ti/ctoolslib/libaet_git.bb
@@ -17,7 +17,6 @@ S =3D "${WORKDIR}/git/aet"
=20
 DEVICE=3D""
 DEVICE:dra7xx =3D "DRA7xx"
-DEVICE:keystone =3D "C66AK2Hxx"
=20
 EXTRA_OEMAKE =3D "C6X_C_DIR=3D${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x=
/include"
=20
@@ -29,7 +28,7 @@ do_install() {
     install -m 0644 ${S}/build/c66/libaet.ae66 ${D}${datadir}/ti/ctoolsl=
ib/aet/lib/
 }
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 FILES:${PN}-dev +=3D "\
diff --git a/recipes-ti/imglib/imglib-c66x.inc b/recipes-ti/imglib/imglib=
-c66x.inc
index 82fea284..ab5cbdb6 100644
--- a/recipes-ti/imglib/imglib-c66x.inc
+++ b/recipes-ti/imglib/imglib-c66x.inc
@@ -7,7 +7,7 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-unpack.inc
=20
-COMPATIBLE_MACHINE =3D "omap-a15|keystone"
+COMPATIBLE_MACHINE =3D "omap-a15"
=20
 SRC_URI =3D "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/imglib/${=
PV}/exports/${BINFILE};name=3Dimglib"
=20
diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-com=
mon.inc
index 1879a3f2..4962a3ec 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -7,13 +7,6 @@ COMPATIBLE_HOST:ti-soc =3D "(.*)"
=20
 PLATFORM =3D "UNKNOWN"
 PLATFORM:dra7xx =3D "DRA7XX"
-PLATFORM:k2hk =3D "TCI6638"
-PLATFORM:k2l =3D "TCI6630"
-PLATFORM:k2e =3D "66AK2E"
-PLATFORM:k2g =3D "66AK2G"
 PLATFORM:omapl138 =3D "OMAPL138"
-PLATFORM_c667x-evm =3D "C6678"
-PLATFORM_c665x-evm =3D "C6678"
=20
-ALT_PLATFORM:k2hk =3D "TCI6636"
 ALT_PLATFORM:am57xx-evm =3D "AM572X AM571X"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.=
inc
index a43d6935..56667ad1 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -41,17 +41,12 @@ RELEASE_SUFFIX =3D ""
=20
 PR =3D "${INC_PR}.r0"
=20
-DEPENDS:append:keystone =3D " ti-cgt6x-native \
-                            gcc-arm-baremetal-native \
-"
 DEPENDS:append:omap-a15 =3D " ti-cgt6x-native \
                             ti-cgt-arm-native \
                             gcc-arm-baremetal-native \
 "
 DEPENDS:append:omapl138 =3D " ti-cgt6x-native \
 "
-DEPENDS:append:c66x =3D " ti-cgt6x-native \
-"
=20
 IPC_TARGETS =3D ""
=20
@@ -66,16 +61,6 @@ IPC_TARGETS:omapl138 =3D "\
     ti.targets.elf.C674=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
 "
=20
-IPC_TARGETS:keystone =3D " \
-    gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
-    ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-    ti.targets.elf.C66_big_endian=3D"${STAGING_DIR_NATIVE}/usr/share/ti/=
cgt-c6x" \
-"
-IPC_TARGETS:c66x =3D " \
-    ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-    ti.targets.elf.C66_big_endian=3D"${STAGING_DIR_NATIVE}/usr/share/ti/=
cgt-c6x" \
-"
-
 PARALLEL_XDC =3D "${@oe.utils.parallel_make_argument(d, '--jobs=3D%d')}"
 EXTRA_OEMAKE =3D "\
     PLATFORM=3D${PLATFORM} \
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rt=
os_git.bb
index 3439cab1..abef3195 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -73,34 +73,11 @@ do_install() {
 }
=20
 KFDSPNUM =3D "0"
-KFDSPNUM:k2hk =3D "8"
-KFDSPNUM:k2l =3D "4"
-KFDSPNUM:keystone =3D "1"
=20
 KFPLAT =3D ""
-KFPLAT:k2hk =3D "TCI6638K2K"
-KFPLAT:k2l =3D "TCI6630K2L"
-KFPLAT:k2e =3D "C66AK2E"
-KFPLAT:k2g =3D "TCI66AK2G02"
=20
 ALTERNATIVE_PRIORITY =3D "5"
=20
-pkg_postinst:${PN}-fw:keystone () {
-  i=3D0
-  while [ $i -lt ${KFDSPNUM} ]; do
-    update-alternatives --install /lib/firmware/keystone-dsp$i-fw keysto=
ne-dsp$i-fw ipc/ti_platforms_evm${KFPLAT}_core0/messageq_single.xe66 ${AL=
TERNATIVE_PRIORITY}
-    i=3D$(($i + 1))
-  done
-}
-
-pkg_postrm:${PN}-fw:keystone () {
-  i=3D0
-  while [ $i -lt ${KFDSPNUM} ]; do
-    update-alternatives --remove keystone-dsp$i-fw ipc/ti_platforms_evm$=
{KFPLAT}_core0/messageq_single.xe66
-    i=3D$(($i + 1))
-  done
-}
-
 pkg_postinst:${PN}-fw:omap-a15 () {
   update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 dra7-dsp=
1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66 ${ALTER=
NATIVE_PRIORITY}
   update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 dra7-dsp=
2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66 ${ALTER=
NATIVE_PRIORITY}
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index ed712bab..01b857c2 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -16,10 +16,6 @@ SRC_URI +=3D "file://tiipclad-daemon.sh \
=20
 DAEMON =3D "UNKNOWN"
 DAEMON:dra7xx =3D "lad_dra7xx"
-DAEMON:k2hk =3D "lad_tci6638"
-DAEMON:k2l =3D "lad_tci6630"
-DAEMON:k2e =3D "lad_66ak2e"
-DAEMON:k2g =3D "lad_66ak2g"
 DAEMON:omapl138 =3D "lad_omapl138"
=20
 inherit autotools-brokensep pkgconfig update-rc.d systemd
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openm=
p-rtos/openmp-rtos_git.bb
index 119c070a..59a9635d 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -24,11 +24,8 @@ SRCREV =3D "c090eb664d9815a36ead0e14f31e102590680fb8"
 LIC_FILES_CHKSUM =3D "file://docs/license/omp_manifest_template.html;md5=
=3D61a6972303c0447b7c056195d7ebafee"
=20
 DEPENDS =3D "common-csl-ip-rtos doxygen-native libulm ti-xdctools-native=
 ti-ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
-DEPENDS:append:k2hk =3D " qmss-lld-rtos cppi-lld-rtos"
-DEPENDS:append:k2e =3D " qmss-lld-rtos cppi-lld-rtos"
-DEPENDS:append:k2l =3D " qmss-lld-rtos cppi-lld-rtos"
=20
-COMPATIBLE_MACHINE =3D "keystone|omap-a15"
+COMPATIBLE_MACHINE =3D "omap-a15"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git"
@@ -38,22 +35,14 @@ export BIOS_DIR =3D "${SYSBIOS_INSTALL_DIR}"
 export ULM_DIR =3D"${STAGING_DIR_TARGET}/usr/share/ti/ulm"
 export C6636_PDK_DIR =3D"${PDK_INSTALL_DIR}"
 export AM572_PDK_DIR =3D"${PDK_INSTALL_DIR}"
-export K2G_PDK_DIR =3D"${PDK_INSTALL_DIR}"
 export XDCCGROOT =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
=20
-export BUILD_K2H =3D "0"
 export BUILD_AM572 =3D "0"
-export BUILD_K2G =3D "0"
=20
-BUILD_K2H:keystone =3D "1"
 BUILD_AM572:omap-a15 =3D "1"
-BUILD_K2H:k2g =3D "0"
-BUILD_K2G:k2g =3D "1"
=20
 RELEASE_TARGET =3D ""
-RELEASE_TARGET:keystone =3D "k2x"
 RELEASE_TARGET:omap-a15 =3D "am57xx"
-RELEASE_TARGET:k2g =3D "k2g"
=20
 do_compile() {
     make -f utils/product/Makefile .zipfile
diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti=
/uio-test-pruss/uio-test-pruss_git.bb
index b5186e0c..59576daa 100644
--- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
+++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
@@ -21,7 +21,7 @@ SRCREV =3D "${UIO_TEST_PRUSS_SRCREV}"
=20
 PR =3D "r0"
=20
-COMPATIBLE_MACHINE =3D "omap-a15|ti33x|ti43x|k2g"
+COMPATIBLE_MACHINE =3D "omap-a15|ti33x|ti43x"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -29,7 +29,6 @@ DEVICE_NAME =3D ""
 DEVICE_NAME:append:am57xx-evm =3D "am57xx"
 DEVICE_NAME:append:ti33x =3D "am33xx"
 DEVICE_NAME:append:ti43x =3D "am43xx"
-DEVICE_NAME:append:k2g =3D "k2g"
=20
 EXTRA_OEMAKE =3D "CGT_PRU=3D${TI_CGT_PRU_INSTALL_DIR} DEVICE=3D${DEVICE_=
NAME}"
=20
diff --git a/recipes-ti/vlib/vlib-c66x.inc b/recipes-ti/vlib/vlib-c66x.in=
c
index 9ab9c506..460964b3 100644
--- a/recipes-ti/vlib/vlib-c66x.inc
+++ b/recipes-ti/vlib/vlib-c66x.inc
@@ -7,7 +7,7 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-eula-unpack.inc
=20
-COMPATIBLE_MACHINE =3D "omap-a15|keystone"
+COMPATIBLE_MACHINE =3D "omap-a15"
=20
 SRC_URI =3D "http://software-dl.ti.com/libs/vlib/${PV}//exports/vlib_c66=
x_obj_${PV}_Linux.bin;name=3Dvlibbin"
=20
--=20
2.25.1

