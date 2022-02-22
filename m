Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8967.1645503199149114505
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9FA0E40C79
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blHXcntO-IIs for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A00AC40C8E
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 86F5C17476E
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 13/19] classes,recipes: remove K1/2 PDK RTOS support, FWs and IPC transports
Date: Tue, 22 Feb 2022 04:13:08 +0000
Message-Id: <20220222041314.2840028-14-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Remove deprecated support for compiling Keystone1/2 RTOS components and
Linux firmwares using PDK, CSL, etc.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 classes/ti-pdk-fetch.bbclass                  |  47 ------
 classes/ti-pdk.bbclass                        | 144 -----------------
 conf/machine/am57xx-evm.conf                  |   4 -
 conf/machine/beaglebone.conf                  |   3 -
 conf/machine/dra7xx-evm.conf                  |   4 -
 conf/machine/include/am64xx.inc               |   5 -
 conf/machine/include/am65xx.inc               |   5 -
 conf/machine/include/j7.inc                   |   5 -
 conf/machine/include/omapl138.inc             |   3 -
 conf/machine/include/ti33x.inc                |   4 -
 conf/machine/include/ti43x.inc                |   4 -
 conf/machine/omapl138-lcdk.conf               |   3 -
 .../audk2g-addon/audk2g-addon-rtos_git.bb     |  38 -----
 recipes-bsp/board-rtos/board-rtos_git.bb      |  76 ---------
 recipes-bsp/boot-monitor/boot-monitor_git.bb  |  47 ------
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb   |  41 -----
 .../common-csl-ip/common-csl-ip-rtos_git.bb   |  23 ---
 recipes-bsp/common-csl-ip/common-csl-ip.inc   |  23 ---
 .../common-csl-ip/common-csl-ip_git.bb        |  17 --
 .../common-csl-ip/csl-rti-dwwdtest-fw_git.bb  |  77 ----------
 .../dsptop/temperature-module-drv_git.bb      |  18 ---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb      |  28 ----
 .../faultmanagement-rtos_git.bb               |  36 -----
 recipes-bsp/fvid2/fvid2-rtos_git.bb           |  67 --------
 recipes-bsp/hplib/hplib-mod_git.bb            |  22 ---
 recipes-bsp/hplib/hplib-test_git.bb           |  32 ----
 recipes-bsp/hplib/hplib.inc                   |  20 ---
 recipes-bsp/hplib/hplib_git.bb                |  33 ----
 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb     |  75 ---------
 recipes-bsp/mad-utils/mad-utils-rtos_git.bb   |  57 -------
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb    |  50 ------
 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb    |  23 ---
 recipes-bsp/osal/osal-rtos_git.bb             |  18 ---
 recipes-bsp/osal/osal-test_git.bb             |  20 ---
 recipes-bsp/osal/osal.inc                     |  15 --
 recipes-bsp/osal/osal_git.bb                  |  21 ---
 recipes-bsp/pktlib/pktlib-rtos_git.bb         |  10 --
 recipes-bsp/pktlib/pktlib.inc                 |  24 ---
 recipes-bsp/pktlib/pktlib_git.bb              |  19 ---
 recipes-bsp/pru/pru-pwm-fw_git.bb             |  39 -----
 ...t-add-Makefile-for-building-firmware.patch | 145 ------------------
 ...ss_uart-remove-dependency-on-PDK-CSL.patch |  54 -------
 recipes-bsp/pru/pru-swuart-fw_git.bb          |  40 -----
 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb  |  26 ----
 recipes-bsp/sciclient/sciclient-rtos_git.bb   | 125 ---------------
 .../serdes-diag/serdes-diag-rtos_git.bb       |  35 -----
 recipes-bsp/serdes-fw/serdes-fw_git.bb        |  27 ----
 recipes-bsp/srss-tc/srss-tc_git.bb            |  33 ----
 .../starterware/starterware-rtos_git.bb       |  33 ----
 recipes-bsp/starterware/starterware.inc       |  21 ---
 recipes-bsp/starterware/starterware_git.bb    |  16 --
 .../ti-pdk-source/ti-pdk-source_git.bb        |  33 ----
 recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb   |  37 -----
 .../traceframework/traceframework-rtos_git.bb |  10 --
 recipes-bsp/traceframework/traceframework.inc |  27 ----
 .../traceframework/traceframework_git.bb      |  40 -----
 .../transport-rtos/bmet-eth-rtos_git.bb       |  19 ---
 .../transport-rtos/nimu-icss-rtos_git.bb      |  29 ----
 recipes-bsp/transport-rtos/nimu-rtos_git.bb   |  35 -----
 .../transport-rtos/timesync-rtos_git.bb       |  31 ----
 recipes-bsp/transport-rtos/transport.inc      |  11 --
 recipes-bsp/utils-rtos/profiling-rtos_git.bb  |  26 ----
 recipes-bsp/utils-rtos/trace-rtos_git.bb      |  28 ----
 recipes-bsp/wdtimer/wdtimer-rtos_git.bb       |  29 ----
 recipes-ti/includes/ti-paths.inc              |   4 -
 .../ipc/ipc-transport-common-rtos_git.bb      |  23 ---
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb |  23 ---
 recipes-ti/ipc/ipc-transport-qmss-test_git.bb |  37 -----
 recipes-ti/ipc/ipc-transport-qmss.inc         |  14 --
 recipes-ti/ipc/ipc-transport-qmss_git.bb      |  19 ---
 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb |  22 ---
 recipes-ti/ipc/ipc-transport-srio-test_git.bb |  32 ----
 recipes-ti/ipc/ipc-transport-srio.inc         |  14 --
 recipes-ti/ipc/ipc-transport-srio_git.bb      |  19 ---
 recipes-ti/ipc/ipc-transport.inc              |  15 --
 recipes-ti/mpm-transport/mpm-transport_git.bb |  50 ------
 .../multiprocmgr/multiprocmgr-rtos_git.bb     |  44 ------
 .../multiprocmgr/multiprocmgr-test_git.bb     |  31 ----
 recipes-ti/multiprocmgr/multiprocmgr.inc      |  21 ---
 .../multiprocmgr/mpmsrv-daemon.service        |  14 --
 recipes-ti/multiprocmgr/multiprocmgr_git.bb   |  44 ------
 recipes-ti/ndk/ti-ndk.inc                     |  20 ---
 recipes-ti/ndk/ti-ndk_3.61.01.01.bb           |  17 --
 recipes-ti/ns/ti-ns.inc                       |  21 ---
 recipes-ti/ns/ti-ns_2.60.01.06.bb             |  15 --
 .../ti-pdk-build/ti-pdk-build-rtos_git.bb     |  32 ----
 recipes-ti/udma/udma_git.bb                   |  32 ----
 87 files changed, 2673 deletions(-)
 delete mode 100644 classes/ti-pdk-fetch.bbclass
 delete mode 100644 classes/ti-pdk.bbclass
 delete mode 100644 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
 delete mode 100644 recipes-bsp/board-rtos/board-rtos_git.bb
 delete mode 100644 recipes-bsp/boot-monitor/boot-monitor_git.bb
 delete mode 100644 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip.inc
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bb
 delete mode 100644 recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
 delete mode 100644 recipes-bsp/dsptop/temperature-module-drv_git.bb
 delete mode 100644 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
 delete mode 100644 recipes-bsp/faultmanagement/faultmanagement-rtos_git.=
bb
 delete mode 100644 recipes-bsp/fvid2/fvid2-rtos_git.bb
 delete mode 100644 recipes-bsp/hplib/hplib-mod_git.bb
 delete mode 100644 recipes-bsp/hplib/hplib-test_git.bb
 delete mode 100644 recipes-bsp/hplib/hplib.inc
 delete mode 100644 recipes-bsp/hplib/hplib_git.bb
 delete mode 100644 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
 delete mode 100644 recipes-bsp/mad-utils/mad-utils-rtos_git.bb
 delete mode 100644 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
 delete mode 100644 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
 delete mode 100644 recipes-bsp/osal/osal-rtos_git.bb
 delete mode 100644 recipes-bsp/osal/osal-test_git.bb
 delete mode 100644 recipes-bsp/osal/osal.inc
 delete mode 100644 recipes-bsp/osal/osal_git.bb
 delete mode 100644 recipes-bsp/pktlib/pktlib-rtos_git.bb
 delete mode 100644 recipes-bsp/pktlib/pktlib.inc
 delete mode 100644 recipes-bsp/pktlib/pktlib_git.bb
 delete mode 100644 recipes-bsp/pru/pru-pwm-fw_git.bb
 delete mode 100644 recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Make=
file-for-building-firmware.patch
 delete mode 100644 recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-d=
ependency-on-PDK-CSL.patch
 delete mode 100644 recipes-bsp/pru/pru-swuart-fw_git.bb
 delete mode 100644 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
 delete mode 100644 recipes-bsp/sciclient/sciclient-rtos_git.bb
 delete mode 100644 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
 delete mode 100644 recipes-bsp/serdes-fw/serdes-fw_git.bb
 delete mode 100644 recipes-bsp/srss-tc/srss-tc_git.bb
 delete mode 100644 recipes-bsp/starterware/starterware-rtos_git.bb
 delete mode 100644 recipes-bsp/starterware/starterware.inc
 delete mode 100644 recipes-bsp/starterware/starterware_git.bb
 delete mode 100644 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
 delete mode 100644 recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
 delete mode 100644 recipes-bsp/traceframework/traceframework-rtos_git.bb
 delete mode 100644 recipes-bsp/traceframework/traceframework.inc
 delete mode 100644 recipes-bsp/traceframework/traceframework_git.bb
 delete mode 100644 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
 delete mode 100644 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
 delete mode 100644 recipes-bsp/transport-rtos/nimu-rtos_git.bb
 delete mode 100644 recipes-bsp/transport-rtos/timesync-rtos_git.bb
 delete mode 100644 recipes-bsp/transport-rtos/transport.inc
 delete mode 100644 recipes-bsp/utils-rtos/profiling-rtos_git.bb
 delete mode 100644 recipes-bsp/utils-rtos/trace-rtos_git.bb
 delete mode 100644 recipes-bsp/wdtimer/wdtimer-rtos_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-common-rtos_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-qmss-test_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-qmss.inc
 delete mode 100644 recipes-ti/ipc/ipc-transport-qmss_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-srio-test_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport-srio.inc
 delete mode 100644 recipes-ti/ipc/ipc-transport-srio_git.bb
 delete mode 100644 recipes-ti/ipc/ipc-transport.inc
 delete mode 100644 recipes-ti/mpm-transport/mpm-transport_git.bb
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr.inc
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.se=
rvice
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr_git.bb
 delete mode 100644 recipes-ti/ndk/ti-ndk.inc
 delete mode 100644 recipes-ti/ndk/ti-ndk_3.61.01.01.bb
 delete mode 100644 recipes-ti/ns/ti-ns.inc
 delete mode 100644 recipes-ti/ns/ti-ns_2.60.01.06.bb
 delete mode 100644 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
 delete mode 100644 recipes-ti/udma/udma_git.bb

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
deleted file mode 100644
index e4c55e33..00000000
--- a/classes/ti-pdk-fetch.bbclass
+++ /dev/null
@@ -1,47 +0,0 @@
-TI_PDK_GIT_URI ?=3D "git://git.ti.com/processor-sdk/pdk.git"
-TI_PDK_GIT_BRANCH ?=3D "master"
-TI_PDK_GIT_PROTOCOL ?=3D "git"
-TI_PDK_SRCREV ?=3D "a1ace885998e9adbcbbd0abf8b9ded6ba9ec54ff"
-
-TI_PDK_VERSION ?=3D "2020.5.6"
-
-PV =3D "${TI_PDK_VERSION}"
-PE =3D "2"
-
-TI_PDK_COMP ?=3D ""
-TI_PDK_COMP_PATH =3D "${@'${TI_PDK_COMP}'.replace('.','/')}"
-
-TI_PDK_SOURCE_PN =3D "ti-pdk-source"
-TI_PDK_SOURCE_WORKDIR =3D "${TMPDIR}/work-shared/ti-pdk-${PV}"
-TI_PDK_SOURCE =3D "${TI_PDK_SOURCE_WORKDIR}/git"
-
-S =3D "${@'${WORKDIR}/git/${TI_PDK_COMP_PATH}'.rstrip('/')}"
-
-# Hard-link only required sources from PDK
-python do_unpack:append() {
-    if len(d.getVar('TI_PDK_COMP') or '') > 0:
-        import shutil
-
-        # Get src/dst paths
-        src =3D os.path.join(d.getVar('TI_PDK_SOURCE'),'packages',d.getV=
ar('TI_PDK_COMP_PATH'))
-        s =3D d.getVar('S')
-
-        # Set up the directory structure, except for the root of the sou=
rces
-        # hard-linked.
-        bb.utils.mkdirhier(s)
-        os.rmdir(s)
-
-        # Recursively hard-link the sources
-        shutil.copytree(src, s, copy_function=3Dos.link)
-
-        # Recursively hard-link the git directory
-        shutil.copytree(os.path.join(d.getVar('TI_PDK_SOURCE'),'.git'), =
os.path.join(s,'.git'), copy_function=3Dos.link)
-}
-
-# Make sure that ti-pdk-source is unpacked before we set up the hardlink=
s.
-python __anonymous () {
-    pn =3D d.getVar('PN')
-    pdk_src_pn =3D d.getVar('TI_PDK_SOURCE_PN')
-    if pn !=3D pdk_src_pn:
-        d.appendVarFlag('do_unpack', 'depends', ' ${TI_PDK_SOURCE_PN}:do=
_unpack')
-}
diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
deleted file mode 100644
index aa0568e9..00000000
--- a/classes/ti-pdk.bbclass
+++ /dev/null
@@ -1,144 +0,0 @@
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-inherit perlnative
-
-DEPENDS =3D "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-i=
p-rtos libxml-simple-perl-native gcc-arm-baremetal-native ti-cgt6x-native=
 ti-cgt-pru-native ti-pdk-build-rtos doxygen-native"
-
-DEPENDS:append:omap-a15 =3D " ti-cgt-arm-native"
-DEPENDS:remove:ti33x =3D "ti-cgt6x-native"
-DEPENDS:remove:ti43x =3D "ti-cgt6x-native"
-DEPENDS:append:omapl1 =3D " ti-cgt-arm-native"
-DEPENDS:remove:am65xx =3D "gcc-arm-baremetal-native ti-cgt6x-native"
-DEPENDS:append:am65xx =3D " ti-cgt-arm-native gcc-linaro-baremetal-aarch=
64-native"
-DEPENDS:remove:j7 =3D "gcc-arm-baremetal-native"
-DEPENDS:append:j7 =3D " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-n=
ative ti-cgt7x-native"
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-# HTML hyperlink text
-PDK_COMP_LINK_TEXT ?=3D ""
-
-DOC_FILE =3D "API_Documentation_${PN}.html"
-
-create_doc_link () {
-    PDK_COMP_DIR=3D`get_build_dir_bash`
-
-    echo "<a href=3D\"${PDK_COMP_DIR}/docs/doxygen/html/index.html\">${P=
DK_COMP_LINK_TEXT}</a>" >> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras=
/doc/${DOC_FILE}
-}
-
-get_build_dir_bash() {
-  if [ -f ${S}/package.xdc ]
-  then
-    grep '^package' ${S}/package.xdc | sed -e 's|\[.*$||' | awk '{ print=
 $2 }' | sed -e 's|\.|/|g'
-  else
-    echo ${S}
-    return 1
-  fi
-}
-
-export CROSS_TOOL_PRFX=3D"arm-none-eabi-"
-export TOOLCHAIN_PATH_A8 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
-export TOOLCHAIN_PATH_A9 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
-export TOOLCHAIN_PATH_A15 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
-export TOOLCHAIN_PATH_M4 =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
-export TOOLCHAIN_PATH_Arm9 =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
-export C6X_GEN_INSTALL_PATH =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-=
c6x"
-export C7X_GEN_INSTALL_PATH =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-=
c7x"
-export TOOLCHAIN_PATH_EVE =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-ar=
p32"
-export CL_PRU_INSTALL_PATH =3D "${TI_CGT_PRU_INSTALL_DIR}"
-export TOOLCHAIN_PATH_GCC_ARCH64 =3D "${GCC_LINARO_BAREMETAL_AARCH64_TOO=
LCHAIN}"
-export TOOLCHAIN_PATH_R5 =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
-
-export ROOTDIR =3D "${B}"
-export BIOS_INSTALL_PATH =3D "${SYSBIOS_INSTALL_DIR}"
-export XDC_INSTALL_PATH =3D "${XDC_INSTALL_DIR}"
-export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
-
-export XDCPATH =3D "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/p=
ackages;${PDK_INSTALL_DIR}/packages"
-export SECTTI=3D"perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
-
-TI_PDK_XDCMAKE ?=3D "1"
-
-# By default, only build the cores with available toolchains
-TI_PDK_LIMIT_CORES ?=3D "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 mpu1_0 mcu1_0=
 mcu1_1 mcu2_0 mcu2_1 mcu3_0 mcu3_1 c66x c66xdsp_1 c66xdsp_2 c7x_1 arm9_0=
 c674x a9host a8host pru_0 pru_1"
-TI_PDK_LIMIT_SOCS ?=3D ""
-TI_PDK_LIMIT_BOARDS ?=3D ""
-TI_PDK_MAKE_TARGET ?=3D "release"
-TI_PDK_EXTRA_MAKE ?=3D ""
-TI_PDK_DOXYGEN_SUPPORT ?=3D "1"
-
-TI_PDK_XDC_ARGS ?=3D "${TI_PDK_LIMIT_SOCS}"
-
-PARALLEL_XDC =3D "${@oe.utils.parallel_make_argument(d, '--jobs=3D%d')}"
-PARALLEL_MAKE =3D ""
-
-def get_doxygen_support(d):
-    if d.getVar('TI_PDK_DOXYGEN_SUPPORT') =3D=3D '1':
-        return ''
-    return 'DOXYGEN_SUPPORT=3Dno'
-
-EXTRA_OEMAKE =3D " \
-    LIMIT_SOCS=3D"${TI_PDK_LIMIT_SOCS}" \
-    LIMIT_BOARDS=3D"${TI_PDK_LIMIT_BOARDS}" \
-    LIMIT_CORES=3D"${TI_PDK_LIMIT_CORES}" \
-    ${TI_PDK_EXTRA_MAKE} \
-    ${@get_doxygen_support(d)} \
-"
-
-do_configure() {
-    BUILD_DIR=3D${B}/`get_build_dir_bash`
-
-    mkdir -p ${BUILD_DIR}
-    cp -r ${S}/* ${BUILD_DIR}
-
-    if [ "${TI_PDK_XDCMAKE}" =3D=3D "1" ]
-    then
-        cd ${BUILD_DIR}
-
-        sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
-        find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
-        find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
-        find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
-        find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
-
-        cd ${B}
-        ${XDC_INSTALL_DIR}/xdc clean ${PARALLEL_XDC} -PR .
-    else
-        if [ "${CLEANBROKEN}" !=3D "1" ]
-        then
-            cd ${BUILD_DIR}
-            oe_runmake clean
-            cd "${B}"
-        fi
-    fi
-
-}
-
-do_compile() {
-
-    if [ "${TI_PDK_XDCMAKE}" =3D=3D "1" ]
-    then
-        ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS=3D"${TI_PDK_X=
DC_ARGS}" ROOTDIR=3D"${ROOTDIR}" -PR .
-        ${XDC_INSTALL_DIR}/xdc release XDCARGS=3D"${TI_PDK_XDC_ARGS}" -P=
R .
-    else
-        BUILD_DIR=3D${B}/`get_build_dir_bash`
-        cd ${BUILD_DIR}
-
-        oe_runmake ${TI_PDK_MAKE_TARGET}
-    fi
-}
-
-do_install () {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INST=
ALL_DIR_RECIPE}/packages \;
-   =20
-    if [ "${PDK_COMP_LINK_TEXT}" !=3D "" ]
-    then
-        install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras/doc
-        create_doc_link
-    fi
-}
-
-FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index f977c5c6..eb0082ee 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -51,7 +51,3 @@ MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 8192"
 # UBI: sub-page size:              512
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS =3D "am571x am572x am574x"
-TI_PDK_LIMIT_BOARDS =3D "evmAM571x evmAM572x idkAM571x idkAM572x idkAM57=
4x"
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index dcb14cc9..cce8fd09 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -14,6 +14,3 @@ MACHINE_GUI_CLASS =3D "bigscreen"
 SERIAL_CONSOLES =3D "115200;ttyS0"
=20
 IMAGE_INSTALL:append =3D " kernel-devicetree kernel-image-zimage"
-
-# Refine the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_BOARDS =3D "bbbAM335x"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index db4a5e1c..5fa1dfa5 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -46,7 +46,3 @@ MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 8192"
 # UBI: sub-page size:              512
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_BOARDS =3D "evmDRA72x evmDRA75x evmDRA78x"
-TI_PDK_LIMIT_SOCS =3D "dra72x dra75x dra78x"
diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64x=
x.inc
index 1d53c7a1..afb96a22 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -22,8 +22,3 @@ do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_depl=
oy"
 TFA_BOARD =3D "lite"
 OPTEEMACHINE =3D "k3-am65x"
 OPTEEOUTPUTMACHINE =3D "k3"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS =3D "am64x"
-TI_PDK_LIMIT_BOARDS =3D "am64x_evm"
-TI_PDK_LIMIT_CORES =3D "mcu1_0 mpu1_0 mcu1_1 mcu2_0 mcu2_1"
diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65x=
x.inc
index 8b1531c7..111ef96f 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -30,8 +30,3 @@ do_image_tar[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do=
_deploy"
=20
 OPTEEMACHINE =3D "k3-am65x"
 OPTEEOUTPUTMACHINE =3D "k3"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS =3D "am65xx"
-TI_PDK_LIMIT_BOARDS =3D "am65xx_evm am65xx_idk"
-TI_PDK_LIMIT_CORES =3D "mcu1_0 mpu1_0"
diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
index cf5f6a94..4ea3a5d8 100644
--- a/conf/machine/include/j7.inc
+++ b/conf/machine/include/j7.inc
@@ -5,8 +5,3 @@ OPTEEMACHINE =3D "k3-j721e"
 OPTEEOUTPUTMACHINE =3D "k3"
=20
 # Use default IMAGE_BOOT_FILES_LEGACY files
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS =3D "j721e j7200"
-TI_PDK_LIMIT_BOARDS =3D "j721e_evm j7200_evm"
-TI_PDK_LIMIT_CORES =3D "mpu1_0 mcu1_0 mcu1_1 mcu2_0 mcu2_1 mcu3_0 mcu3_1=
 c66xdsp_1 c66xdsp_2 c7x_1"
diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/oma=
pl138.inc
index f73517d0..c6eb0cd9 100644
--- a/conf/machine/include/omapl138.inc
+++ b/conf/machine/include/omapl138.inc
@@ -1,5 +1,2 @@
 require conf/machine/include/omapl1.inc
 SOC_FAMILY:append =3D ":omapl138"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS =3D "omapl138"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.=
inc
index 197cac19..afb80fd6 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -64,10 +64,6 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
 # List common SoC features, may need to add touchscreen for specific mac=
hines
 MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa ethernet gpu"
=20
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS =3D "am335x"
-TI_PDK_LIMIT_BOARDS =3D "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM=
335x"
-
 IMAGE_FSTYPES +=3D "tar.xz wic.xz"
 WKS_FILE ?=3D "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTL=
INUX_BOOT_FILES}"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.=
inc
index e6e0412d..2c3a3770 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -61,10 +61,6 @@ EXTRA_IMAGEDEPENDS +=3D "u-boot"
 # List common SoC features, may need to add touchscreen for specific mac=
hines
 MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa ethernet gpu"
=20
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS =3D "am437x"
-TI_PDK_LIMIT_BOARDS =3D "evmAM437x idkAM437x skAM437x"
-
 IMAGE_FSTYPES +=3D "tar.xz wic.xz"
 WKS_FILE ?=3D "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTL=
INUX_BOOT_FILES}"
diff --git a/conf/machine/omapl138-lcdk.conf b/conf/machine/omapl138-lcdk=
.conf
index 06db2f8d..ba4d5645 100644
--- a/conf/machine/omapl138-lcdk.conf
+++ b/conf/machine/omapl138-lcdk.conf
@@ -17,6 +17,3 @@ IMAGE_FSTYPES +=3D "tar.xz"
 SERIAL_CONSOLES =3D "115200;ttyS2"
=20
 KERNEL_DEVICETREE =3D "da850-evm.dtb da850-lcdk.dtb"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_BOARDS =3D "lcdkOMAPL138"
diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-=
bsp/audk2g-addon/audk2g-addon-rtos_git.bb
deleted file mode 100644
index e40fb43c..00000000
--- a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY =3D "TI RTOS Audio add-on software for k2g"
-
-inherit ti-pdk
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://audk2gaddonver.h;beginline=3D8;endline=3D47=
;md5=3D7a3996aaf1a3d3ca87358cf9b89bce3d"
-
-COMPATIBLE_MACHINE =3D "k2g"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-AUDK2G_ADDON_GIT_URI =3D "git://git.ti.com/processor-sdk/audk2g-addon.gi=
t"
-AUDK2G_ADDON_GIT_PROTOCOL =3D "git"
-AUDK2G_ADDON_GIT_BRANCH =3D "master"
-AUDK2G_ADDON_GIT_DESTSUFFIX =3D "git/ti/addon/audk2g"
-
-# Below commit ID corresponds to "DEV.AUDK2G.01.04.00.00"
-AUDK2G_ADDON_SRCREV =3D "815180b45ceb1fa3c110f9979106c7f5aa8b3ca2"
-
-BRANCH =3D "${AUDK2G_ADDON_GIT_BRANCH}"
-SRC_URI =3D "${AUDK2G_ADDON_GIT_URI};destsuffix=3D${AUDK2G_ADDON_GIT_DES=
TSUFFIX};protocol=3D${AUDK2G_ADDON_GIT_PROTOCOL};branch=3D${BRANCH}"
-
-SRCREV =3D "${AUDK2G_ADDON_SRCREV}"
-PV =3D "01.04.00.00"
-PR =3D "r0"
-
-S =3D "${WORKDIR}/git/ti/addon/audk2g"
-
-DEPENDS:append =3D " ti-sysbios \
-            gpio-lld-rtos \
-            i2c-lld-rtos \
-            board-rtos \
-"
-
-export PDK_AUDK2G_ROOT_PATH =3D "${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board=
-rtos/board-rtos_git.bb
deleted file mode 100644
index 50d66adc..00000000
--- a/recipes-bsp/board-rtos/board-rtos_git.bb
+++ /dev/null
@@ -1,76 +0,0 @@
-SUMMARY =3D "TI RTOS Board Library"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.board"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://board.h;beginline=3D1;endline=3D32;md5=3D9b=
ed8e4ac2fb37fc627cefe49eb1c919"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-
-
-PR =3D "r0"
-
-DEPENDS:append =3D " i2c-lld-rtos \
-                   spi-lld-rtos \
-                   uart-lld-rtos \
-                   osal-rtos \
-"
-
-DEPENDS:append:omap-a15 =3D " ti-ndk \
-                            mmcsd-lld-rtos \
-                            pm-lld-rtos \
-"
-
-DEPENDS:append:am57xx-evm =3D " gpio-lld-rtos \
-                              icss-emac-lld-rtos \
-                              pruss-lld-rtos \
-"
-
-
-DEPENDS:append:ti33x =3D " gpio-lld-rtos \
-                         gpmc-lld-rtos \
-                         icss-emac-lld-rtos \
-                         mmcsd-lld-rtos \
-                         pruss-lld-rtos \
-                         starterware-rtos \
-                         ti-ndk \
-"
-
-DEPENDS:append:ti43x =3D " gpio-lld-rtos \
-                         gpmc-lld-rtos \
-                         icss-emac-lld-rtos \
-                         mmcsd-lld-rtos \
-                         pruss-lld-rtos \
-                         starterware-rtos \
-                         ti-ndk \
-"
-
-DEPENDS:append:dra7xx =3D " pm-lld-rtos \
-                          mmcsd-lld-rtos \
-"
-
-DEPENDS:append:am65xx =3D " sciclient-rtos \
-"
-DEPENDS:append:j7 =3D " udma-lld-rtos \
-                          sciclient-rtos \
-                          mmcsd-lld-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-INHIBIT_SYSROOT_STRIP =3D "1"
-INHIBIT_PACKAGE_STRIP =3D "1"
-
-export PDK_BOARD_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-XDCPATH:append =3D ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DI=
R}/packages"
-
-INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/b=
oot-monitor/boot-monitor_git.bb
deleted file mode 100644
index dee180ff..00000000
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-DESCRIPTION =3D "Boot Monitor - TI ARM Boot monitor code"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D25fe219a6febf6e5bb45beda1b2eb=
315"
-
-COMPATIBLE_MACHINE =3D "keystone"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEPENDS =3D "u-boot-mkimage-native"
-
-SRC_URI =3D "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;pr=
otocol=3Dgit;branch=3D${BRANCH}"
-
-PV =3D "4.0+git${SRCPV}"
-
-BRANCH =3D "master"
-
-S =3D "${WORKDIR}/git"
-
-SRCREV =3D "d57d5c1d8f0b0b1487484d9ceb1595bd4507231a"
-
-BOOT_MONITOR_IMAGE  ?=3D "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
-
-FLOATABI =3D "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.cont=
ains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=3Dhard", " -mf=
loat-abi=3Dsoftfp", d), "" ,d)}"
-
-EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PREFIX=
}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}" LD=3D"${TARGET_PREFIX}gcc ${TOOLCH=
AIN_OPTIONS} ${FLOATABI}""
-
-FILES:${PN} =3D "/boot"
-
-inherit deploy
-
-do_compile () {
-	unset LDFLAGS
-	unset CFLAGS
-	unset CPPFLAGS
-	oe_runmake image_${BOOT_MONITOR_MAKE_TARGET}
-}
-
-do_install () {
-	install -d ${D}/boot
-	install -m 0644 ${S}/${BOOT_MONITOR_IMAGE} ${D}/boot/
-}
-
-do_deploy () {
-	install -d ${DEPLOYDIR}
-	install -m 0644 ${S}/${BOOT_MONITOR_IMAGE} ${DEPLOYDIR}/
-}
-
-addtask deploy before do_build after do_compile
diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cm=
b-addon/cmb-addon-rtos_git.bb
deleted file mode 100644
index 8ca44164..00000000
--- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY =3D "TI RTOS software supporting circular microphone array board=
"
-
-inherit ti-pdk
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://cmbaddonver.h;beginline=3D8;endline=3D47;md=
5=3Dd0cb159bf210cfafed63042da01c83e0"
-
-COMPATIBLE_MACHINE =3D "k2g|omapl137-evm"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-CMB_ADDON_GIT_URI =3D "git://git.ti.com/processor-sdk/circmicarray-addon=
.git"
-CMB_ADDON_GIT_PROTOCOL =3D "git"
-CMB_ADDON_GIT_BRANCH =3D "master"
-CMB_ADDON_GIT_DESTSUFFIX =3D "git/ti/addon"
-
-# Below commit ID corresponds to "DEV.CMB.01.01.00.03A"
-CMB_ADDON_SRCREV =3D "3655aad07f17d3a167ec7dcecb52450c1d2fe8be"
-
-SRCREV =3D "${CMB_ADDON_SRCREV}"
-PV =3D "01.01.00.03A"
-PR =3D "r0"
-
-BRANCH =3D "${CMB_ADDON_GIT_BRANCH}"
-SRC_URI =3D "${CMB_ADDON_GIT_URI};destsuffix=3D${CMB_ADDON_GIT_DESTSUFFI=
X};protocol=3D${CMB_ADDON_GIT_PROTOCOL};branch=3D${BRANCH}"
-
-
-S =3D "${WORKDIR}/git/ti/addon/cmb"
-
-DEPENDS:append =3D " ti-sysbios \
-            gpio-lld-rtos \
-            i2c-lld-rtos \
-            mcasp-lld-rtos \
-            board-rtos \
-"
-
-export PDK_CMB_ROOT_PATH =3D "${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipe=
s-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
deleted file mode 100644
index 11baafcc..00000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require common-csl-ip.inc
-PR =3D "${INC_PR}.6"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE:append =3D "|c66x|k3"
-
-inherit ti-pdk
-
-DEPENDS:remove =3D "${PN}"
-DEPENDS:remove =3D "ti-sysbios"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_CSL_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "CSL-Chip Support Library"
-
-# Workaround: dra7xx build requires am57xx CSL libraries for opencl-moni=
tor
-TI_PDK_LIMIT_SOCS:append:dra7xx =3D " am571x am572x am574x"
-TI_PDK_LIMIT_BOARDS:append:dra7xx =3D " evmAM571x evmAM572x idkAM574x"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/co=
mmon-csl-ip/common-csl-ip.inc
deleted file mode 100644
index 23586fd7..00000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION =3D "Chip support library low level interface"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D5857833e20836213677fac33f=
9aded21"
-
-COMPATIBLE_MACHINE =3D "keystone|dra7xx|ti33x|ti43x|omapl1"
-
-PV =3D "03.03.00.17B"
-INC_PR =3D "r0"
-PE =3D "2"
-
-CSL_GIT_URI =3D "git://git.ti.com/keystone-rtos/common-csl-ip.git"
-CSL_GIT_PROTOCOL =3D"git"
-CSL_GIT_BRANCH =3D "release"
-CSL_GIT_DESTSUFFIX =3D "git"
-
-# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.17B"
-CSL_SRCREV =3D "027d26031709ad6a0e9f84625d11a3419e486467"
-
-BRANCH=3D"${CSL_GIT_BRANCH}"
-SRC_URI =3D "${CSL_GIT_URI};protocol=3D${CSL_GIT_PROTOCOL};branch=3D${BR=
ANCH};destsuffix=3D${CSL_GIT_DESTSUFFIX}"
-SRCREV =3D "${CSL_SRCREV}"
-
-S =3D "${WORKDIR}/${CSL_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp=
/common-csl-ip/common-csl-ip_git.bb
deleted file mode 100644
index 6fffc7ee..00000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require common-csl-ip.inc
-
-PR =3D "${INC_PR}.0"
-
-ALLOW_EMPTY:${PN} =3D "1"
-
-CLEANBROKEN =3D "1"
-
-do_compile() {
-    :
-}
-
-do_install () {
-    install -d ${D}${includedir}/ti/csl
-    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${inclu=
dedir}/ti/csl
-    find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp --pa=
rents {} ${D}${includedir}/ti/csl
-}
diff --git a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb b/recip=
es-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
deleted file mode 100644
index a7936594..00000000
--- a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
+++ /dev/null
@@ -1,77 +0,0 @@
-SUMMARY =3D "MCU Watchdog test firmware"
-DESCRIPTION =3D "Firmware for the R5F core to test the detection of watc=
hdog timeout events to trigger SOC reset though DMSC."
-
-require recipes-bsp/common-csl-ip/common-csl-ip.inc
-require recipes-ti/includes/ti-paths.inc
-
-LIC_FILES_CHKSUM =3D "file://../../../COPYING.txt;md5=3D5857833e20836213=
677fac33f9aded21"
-
-S =3D "${WORKDIR}/${CSL_GIT_DESTSUFFIX}/example/rti/rti_dwwdtest_app"
-
-COMPATIBLE_MACHINE =3D "am65xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEPENDS =3D "ti-cgt-arm-native \
-           ti-pdk-build-rtos \
-           uart-lld-rtos \
-           board-rtos \
-           sciclient-rtos \
-           udma-lld-rtos"
-
-export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
-export TOOLCHAIN_PATH_R5 =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
-
-EXTRA_OEMAKE =3D "WDT_RESET=3Denable DEST_ROOT=3D${S}"
-
-do_compile() {
-    for soc in ${TI_PDK_LIMIT_SOCS}
-    do
-        for board in ${TI_PDK_LIMIT_BOARDS}
-        do
-            oe_runmake SOC=3D$soc BOARD=3D$board
-        done
-    done
-}
-
-do_install() {
-    install -d ${D}${base_libdir}/firmware/rti_dwwdtest
-
-    for board in ${TI_PDK_LIMIT_BOARDS}
-    do
-        install -d ${D}${base_libdir}/firmware/rti_dwwdtest/$board
-        install -m 0644 csl_rti_dwwd_test_app/bin/$board/csl_rti_dwwd_te=
st_app_mcu1_0_release.xer5f \
-                        ${D}${base_libdir}/firmware/rti_dwwdtest/$board
-    done
-}
-
-# Create separate package for each firmware so we can utilize
-# update-alternatives.
-PACKAGES =3D+ "${PN}-evm ${PN}-idk"
-RDEPENDS:${PN} =3D "${PN}-evm ${PN}-idk"
-ALLOW_EMPTY:${PN} =3D "1"
-
-FILES:${PN}-evm =3D "${base_libdir}/firmware/rti_dwwdtest/am65xx_evm"
-FILES:${PN}-idk =3D "${base_libdir}/firmware/rti_dwwdtest/am65xx_idk"
-
-# We are packaging R5 firmware
-INSANE_SKIP:${PN}-evm =3D "arch"
-INSANE_SKIP:${PN}-idk =3D "arch"
-
-# Configure update-alternatives as there may be other firmwares provided=
 in an
-# image.
-inherit update-alternatives
-
-# It might be nice to dynamically declare the following based on
-# TI_PDK_LIMIT_BOARDS, but that is probably overkill.
-ALTERNATIVE:${PN}-evm =3D "am65x-mcu-r5f0_0-fw"
-ALTERNATIVE:${PN}-idk =3D "am65x-mcu-r5f0_0-fw"
-
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/=
am65x-mcu-r5f0_0-fw"
-
-ALTERNATIVE_TARGET_${PN}-evm =3D "${base_libdir}/firmware/rti_dwwdtest/a=
m65xx_evm/csl_rti_dwwd_test_app_mcu1_0_release.xer5f"
-ALTERNATIVE_TARGET_${PN}-idk =3D "${base_libdir}/firmware/rti_dwwdtest/a=
m65xx_idk/csl_rti_dwwd_test_app_mcu1_0_release.xer5f"
-
-# Use a lesser priority than ipc example fw
-# See meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb
-ALTERNATIVE_PRIORITY_${PN}-evm =3D "4"
-ALTERNATIVE_PRIORITY_${PN}-idk =3D "3"
diff --git a/recipes-bsp/dsptop/temperature-module-drv_git.bb b/recipes-b=
sp/dsptop/temperature-module-drv_git.bb
deleted file mode 100644
index 1f49ddf8..00000000
--- a/recipes-bsp/dsptop/temperature-module-drv_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION =3D "Smart Reflex Sub-System (SRSS) module driver for Keysto=
ne devices"
-LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D9d4316fe434ba450dca4da253=
48ca5a3"
-
-# This package builds a kernel module, use kernel PR as base and append =
a local
-MACHINE_KERNEL_PR:append =3D "a"
-PR =3D "${MACHINE_KERNEL_PR}"
-PV:append =3D "+git${SRCPV}"
-
-S =3D "${WORKDIR}/git/temperature_module/temperature-mod"
-
-inherit module
-
-EXTRA_OEMAKE =3D "KVERSION=3D${KERNEL_VERSION} KERNEL_SRC=3D${STAGING_KE=
RNEL_DIR}"
-
-COMPATIBLE_MACHINE =3D "keystone"
-
-include dsptop.inc
diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb b/recipes-bsp/fatfs=
-rtos/fatfs-rtos_git.bb
deleted file mode 100644
index 5255e582..00000000
--- a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY =3D "TI RTOS driver for FAT filesystem"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.fs.fatfs"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://FATFS.h;beginline=3D1;endline=3D32;md5=3D66=
19832755598d1cc2b01f2e6a1801d6"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|omapl1|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r0"
-
-DEPENDS:append =3D " mmcsd-lld-rtos \
-                   osal-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_FATFS_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "FATFS Library"
diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/re=
cipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
deleted file mode 100644
index a999e813..00000000
--- a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY =3D "TI Fault management module for keystone devices"
-
-inherit ti-pdk
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://fault_mgmt.h;beginline=3D1;endline=3D41;md5=
=3D4be5df2b9c314da729e9e4f6cc0b2979"
-
-COMPATIBLE_MACHINE =3D "k2hk|k2e|k2l"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-FAULT_MANAGEMENT_GIT_URI =3D "git://git.ti.com/keystone-rtos/fault_mgmt.=
git"
-FAULT_MANAGEMENT_GIT_PROTOCOL =3D "git"
-FAULT_MANAGEMENT_GIT_BRANCH =3D "master"
-FAULT_MANAGEMENT_GIT_DESTSUFFIX =3D "git/ti/instrumentation/fault_mgmt"
-
-# Below commit ID corresponds to "DEV.FAULT_MGMT.01.00.01.04A"
-FAULT_MANAGEMENT_SRCREV =3D "67becdff0e3d181ab7b8fada226f5737517c1c52"
-
-BRANCH =3D "${FAULT_MANAGEMENT_GIT_BRANCH}"
-SRC_URI =3D "${FAULT_MANAGEMENT_GIT_URI};destsuffix=3D${FAULT_MANAGEMENT=
_GIT_DESTSUFFIX};protocol=3D${FAULT_MANAGEMENT_GIT_PROTOCOL};branch=3D${B=
RANCH}"
-
-SRCREV =3D "${FAULT_MANAGEMENT_SRCREV}"
-PV =3D "01.00.01.04A"
-PR =3D "r0"
-
-S =3D "${WORKDIR}/${FAULT_MANAGEMENT_GIT_DESTSUFFIX}"
-
-DEPENDS:append:keystone =3D " qmss-lld-rtos \
-                            cppi-lld-rtos \
-                            pa-lld-rtos \
-"
-
-DEPENDS:append:k2hk =3D " aif2-lld-rtos \
-"
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "Fault Management"
diff --git a/recipes-bsp/fvid2/fvid2-rtos_git.bb b/recipes-bsp/fvid2/fvid=
2-rtos_git.bb
deleted file mode 100644
index b70a9b07..00000000
--- a/recipes-bsp/fvid2/fvid2-rtos_git.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-SUMMARY =3D "TI RTOS Video Driver Interface"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.fvid2"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://fvid2.h;beginline=3D1;endline=3D31;md5=3D83=
d177cf3df55c16b27ae4102b6ade9a"
-
-COMPATIBLE_MACHINE =3D "k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r0"
-
-DEPENDS:append =3D " osal-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-FVID2_PACKAGE_BASE   =3D "${WORKDIR}/fvid2_base"
-FVID2_ROOTPATH =3D "${FVID2_PACKAGE_BASE}/package/all/pdk_/packages/ti/d=
rv/fvid2"
-
-export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
-export PDK_FVID2_ROOT_PATH =3D "${FVID2_PACKAGE_BASE}/package/all/pdk_/p=
ackages"
-
-
-BOARD_PACKAGE =3D ""
-BOARD_PACKAGE:am65xx =3D "am65xx_evm"
-BOARD_PACKAGE:j7 =3D "j721e_evm"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "FVID2"
-
-do_configure() {
-    rm -rf ${FVID2_PACKAGE_BASE}
-    cd ${S}
-
-    # remove any previous package
-    rm -f ${FVID2_PACKAGE_BASE}
-
-    # make the release package before building it
-    make package BOARD=3D${BOARD_PACKAGE} DEST_ROOT=3D${FVID2_PACKAGE_BA=
SE} PDK_FVID2_COMP_PATH=3D${S}
-}
-
-do_compile() {
-    echo "fvid2 root path is ${FVID2_ROOTPATH}"
-    cd ${FVID2_ROOTPATH}
-
-    # Build am65xx libraries
-    make clean lib xdc_meta LIMIT_SOCS=3D"${TI_PDK_LIMIT_SOCS}" LIMIT_BO=
ARDS=3D"${TI_PDK_LIMIT_BOARDS}"  LIMIT_CORES=3D"${TI_PDK_LIMIT_CORES}"
-
-    #archive
-    tar -cf fvid2.tar --exclude=3D'*.tar' ./*
-}
-
-do_install() {
-    cd ${FVID2_ROOTPATH}
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/fvid2
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INST=
ALL_DIR_RECIPE}/packages/ti/drv/fvid2 \;
-}
-
-FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INSANE_SKIP:${PN} =3D "arch ldflags"
diff --git a/recipes-bsp/hplib/hplib-mod_git.bb b/recipes-bsp/hplib/hplib=
-mod_git.bb
deleted file mode 100644
index c992b12f..00000000
--- a/recipes-bsp/hplib/hplib-mod_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "TI High Performance Library kernel module"
-LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/ti/runtime/hplib/module/COPY=
ING.txt;md5=3Dc1c4d3453cddc5b7f0ce84a277e66779"
-
-DEPENDS =3D "hplib"
-
-include hplib.inc
-
-# This package builds a kernel module, use kernel PR as base and append =
a local
-MACHINE_KERNEL_PR:append =3D "b"
-PR =3D "${MACHINE_KERNEL_PR}"
-
-S =3D"${WORKDIR}/git/ti/runtime/hplib/module"
-EXTRA_OEMAKE =3D "KDIR=3D${STAGING_KERNEL_DIR} PDK_INSTALL_PATH=3D${STAG=
ING_INCDIR}"
-
-inherit module
-
-do_install () {
-	oe_runmake install INSTALL_MOD_PATH=3D"${D}"
-}
-
-KERNEL_MODULE_AUTOLOAD +=3D "hplibmod"
diff --git a/recipes-bsp/hplib/hplib-test_git.bb b/recipes-bsp/hplib/hpli=
b-test_git.bb
deleted file mode 100644
index 4ba79dbd..00000000
--- a/recipes-bsp/hplib/hplib-test_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION =3D "TI High performance library test binaries"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING=
.txt;md5=3Db7982a377c680ad71ca2fbb735982462"
-
-DEPENDS =3D "common-csl-ip qmss-lld sa-lld pktlib hplib"
-
-include hplib.inc
-
-PR =3D "${INC_PR}.0"
-
-CHOICELIST =3D "yes no"
-
-S =3D "${WORKDIR}/git/ti/runtime/hplib"
-
-EXTRA_OEMAKE +=3D '-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
}'
-
-do_compile () {
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake tests HPLIB_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D$choice DEVICE=
=3D"$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL=
_LIB_BASE_DIR=3D${D}${libdir} INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=
=3D"$device"
-	done
-}
diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
deleted file mode 100644
index 217a4531..00000000
--- a/recipes-bsp/hplib/hplib.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-COMPATIBLE_MACHINE =3D "keystone"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEVICELIST:k2hk =3D "k2h k2k"
-DEVICELIST:k2l  =3D "k2l"
-DEVICELIST:k2e  =3D "k2e"
-
-HPLIB_GIT_URI =3D "git://git.ti.com/keystone-rtos/hplib.git"
-HPLIB_GIT_PROTOCOL =3D "git"
-HPLIB_GIT_BRANCH =3D "master"
-
-# Below Commit ID corresponds to "DEV.HPLIB.01.01.00.08"
-HPLIB_SRCREV =3D "5e9b27854f5d6f9f37a0ed8d7516d4874427cd8b"
-
-BRANCH =3D "${HPLIB_GIT_BRANCH}"
-SRC_URI =3D "${HPLIB_GIT_URI};protocol=3D${HPLIB_GIT_PROTOCOL};branch=3D=
${BRANCH}"
-SRCREV =3D "${HPLIB_SRCREV}"
-
-PV =3D "01.01.00.08+git${SRCPV}"
-INC_PR =3D "r0"
diff --git a/recipes-bsp/hplib/hplib_git.bb b/recipes-bsp/hplib/hplib_git=
.bb
deleted file mode 100644
index 0ccd1481..00000000
--- a/recipes-bsp/hplib/hplib_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION =3D "TI High performance libraries"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING=
.txt;md5=3Db7982a377c680ad71ca2fbb735982462"
-
-DEPENDS =3D "common-csl-ip rm-lld qmss-lld sa-lld pktlib"
-RDEPENDS:${PN} =3D "hplib-mod"
-
-include hplib.inc
-
-PR =3D "${INC_PR}.0"
-
-CHOICELIST =3D "yes no"
-
-S =3D "${WORKDIR}/git/ti/runtime/hplib"
-
-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
}"
-
-do_compile () {
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake lib HPLIB_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D$choice DEVICE=3D=
"$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LI=
B_BASE_DIR=3D${D}${libdir} INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D=
"$device"
-	done
-}
diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-=
boot/ibl-boot-rtos_git.bb
deleted file mode 100644
index 1e072272..00000000
--- a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
+++ /dev/null
@@ -1,75 +0,0 @@
-SUMMARY =3D "Second stage bootloader for c66x"
-DESCRIPTION =3D "The Intermediate Bootloader (IBL) is a second stage \
-bootloader for the c66x family of embedded processors. This second \
-stage bootloader takes care of additional initializations, advisory \
-setups, and errata workarounds that are not present in the first stage b=
oot."
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://src/ibl.h;beginline=3D1;endline=3D34;md5=3D=
ee7d7a3305d1e524955996d1c5e31cb9"
-
-require recipes-ti/includes/ti-paths.inc
-
-DEPENDS =3D " ti-cgt6x-7-native \
-            bison-native \
-            flex-native \
-"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "c66x"
-
-CLEANBROKEN =3D "1"
-
-IBL_BOOT_GIT_URI =3D "git://git.ti.com/keystone-rtos/ibl.git"
-IBL_BOOT_GIT_PROTOCOL =3D "git"
-IBL_BOOT_GIT_BRANCH =3D "master"
-IBL_BOOT_SRCREV =3D "ed3f0989d8cdc813b7ca1ed899c4d84b63de3a75"
-
-BRANCH =3D "${IBL_BOOT_GIT_BRANCH}"
-SRC_URI =3D "${IBL_BOOT_GIT_URI};protocol=3D${IBL_BOOT_GIT_PROTOCOL};bra=
nch=3D${BRANCH}"
-SRCREV =3D "${IBL_BOOT_SRCREV}"
-
-
-PR =3D "r2"
-
-S =3D "${WORKDIR}/git"
-
-PATH:prepend =3D "${TI_CGT6X_7_INSTALL_DIR}/bin:"
-
-IBLTARGETS =3D ""
-IBLTARGETS_c665x-evm =3D "evm_c6657_i2c"
-IBLTARGETS_c667x-evm =3D "evm_c6678_i2c"
-
-IBLENDIAN =3D ""
-IBLENDIAN_c665x-evm =3D "little"
-IBLENDIAN_c667x-evm =3D "little"
-
-export C6X_BASE_DIR=3D"${TI_CGT6X_7_INSTALL_DIR}"
-export TOOLSC6X=3D"${C6X_BASE_DIR}"
-export TOOLSC6XDOS=3D"${C6X_BASE_DIR}"
-export TOOLSBIOSC6XDOS=3D"${C6X_BASE_DIR}"
-export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
-
-do_compile() {
-    cd src/make
-    for t in ${IBLTARGETS}
-    do
-        for e in ${IBLENDIAN}
-        do
-            make ${t} ENDIAN=3D${e} I2C_BUS_ADDR=3D0x51
-        done
-    done
-    cd -
-}
-
-do_install() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
-    cp -rP --preserve=3Dmode,links,timestamps --no-preserve=3Downership =
* ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
-}
-
-FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_SYSROOT_STRIP =3D "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-
-INSANE_SKIP:${PN} =3D "arch file-rdeps"
diff --git a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb b/recipes-bsp/ma=
d-utils/mad-utils-rtos_git.bb
deleted file mode 100644
index 6eed9786..00000000
--- a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-SUMMARY =3D "Utility for loading and running multicore applications"
-DESCRIPTION =3D "Multicore Application Deployment (MAD) utility is used =
\
-for loading and running a multicore application on an embedded \
-processor with multiple cores. This utility package contains the \
-scripts to combine multiple applications for different cores into a \
-single binary as well as loadable application to parse and execute the a=
pplications on different cores."
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://README.txt;md5=3D44b2180aec0657f6b0e42e5611=
c0bafb"
-
-require recipes-ti/includes/ti-paths.inc
-
-DEPENDS =3D "ti-cgt6x-7-native"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "c66x"
-
-BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/keystone-rtos/mad-utils.git;protocol=3Dgit=
;branch=3D${BRANCH}"
-SRCREV =3D "2458510f76eddfa837c2b83448965e233156944b"
-PR =3D "r0"
-
-S =3D "${WORKDIR}/git"
-
-export C6X_BASE_DIR=3D"${TI_CGT6X_7_INSTALL_DIR}"
-PATH:prepend =3D "${TI_CGT6X_7_INSTALL_DIR}/bin:"
-
-DEVICE =3D ""
-DEVICE_c665x-evm =3D "C6657"
-DEVICE_c667x-evm =3D "C6678"
-
-ENDIAN =3D ""
-ENDIAN_c665x-evm =3D "little big"
-ENDIAN_c667x-evm =3D "little big"
-
-do_compile() {
-    cd mad-loader
-    for e in ${ENDIAN}
-    do
-        mkdir -p bin/${DEVICE}/${e}
-        make -C mal/malLib/build clean all DEVICE=3D${DEVICE} ENDIAN=3D$=
{e} C_DIR=3D${C6X_BASE_DIR}
-        make -C mal/malApp/build clean all DEVICE=3D${DEVICE} ENDIAN=3D$=
{e} C_DIR=3D${C6X_BASE_DIR}
-        cp mal/malApp/build/mal_app.exe bin/${DEVICE}/${e}
-        make -C nmlLoader/build clean all DEVICE=3D${DEVICE} ENDIAN=3D${=
e} C_DIR=3D${C6X_BASE_DIR}
-        cp nmlLoader/build/nml.exe bin/${DEVICE}/${e}
-    done
-    cd -
-}
-
-do_install() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils
-    cp -rP --preserve=3Dmode,links,timestamps --no-preserve=3Downership =
* ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils
-}
-
-FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils"
-
-INSANE_SKIP:${PN} +=3D "arch staticdev ldflags file-rdeps"
diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/net=
cp-pa-fw/netcp-pa-fw_git.bb
deleted file mode 100644
index 2a5bfb92..00000000
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-DESCRIPTION =3D "NETCP PA firmware for Keystone"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-PV =3D "${NETCP_PA_FW_VERSION}"
-PR =3D "${INC_PR}.1"
-
-CLEANBROKEN =3D "1"
-
-COMPATIBLE_MACHINE =3D "k2hk|k2l|k2e"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git"
-
-FWBASENAME =3D " \
-ks2_pa_eg0_pdsp0 \
-ks2_pa_eg0_pdsp1 \
-ks2_pa_eg0_pdsp2 \
-ks2_pa_eg1_pdsp0 \
-ks2_pa_eg2_pdsp0 \
-ks2_pa_in0_pdsp0 \
-ks2_pa_in0_pdsp1 \
-ks2_pa_in1_pdsp0 \
-ks2_pa_in1_pdsp1 \
-ks2_pa_in2_pdsp0 \
-ks2_pa_in3_pdsp0 \
-ks2_pa_in4_pdsp0 \
-ks2_pa_in4_pdsp1 \
-ks2_pa_post_pdsp0 \
-ks2_pa_post_pdsp1 \
-"
-
-FWBASENAME:k2hk =3D " \
-ks2_pa_pdsp0_classify1 \
-ks2_pa_pdsp1_classify1 \
-ks2_pa_pdsp2_classify1 \
-ks2_pa_pdsp3_classify2 \
-ks2_pa_pdsp4_pam \
-ks2_pa_pdsp5_pam \
-"
-
-do_install() {
-	install -d ${D}${base_libdir}/firmware
-	for f in ${FWBASENAME}; do
-		install -m 0644 ${S}/ti-keystone/$f.bin ${D}${base_libdir}/firmware/$f=
.bin
-	done
-}
-
-FILES:${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/net=
cp-sa-fw/netcp-sa-fw_git.bb
deleted file mode 100644
index ec3c30fb..00000000
--- a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION =3D "NETCP SA firmware for Keystone"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-PV =3D "${NETCP_SA_FW_VERSION}"
-PR =3D "${INC_PR}.0"
-
-CLEANBROKEN =3D "1"
-
-COMPATIBLE_MACHINE =3D "keystone"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git"
-
-TARGET =3D "sa_mci.fw"
-
-do_install() {
-	install -d ${D}${base_libdir}/firmware
-	install -m 0644 ${S}/ti-keystone/${TARGET} ${D}${base_libdir}/firmware/=
${TARGET}
-}
-
-FILES:${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/osal/osal-rtos_git.bb b/recipes-bsp/osal/osal-rt=
os_git.bb
deleted file mode 100644
index eeaeb23f..00000000
--- a/recipes-bsp/osal/osal-rtos_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-inherit ti-pdk
-require recipes-bsp/osal/osal.inc
-
-PR =3D "${INC_PR}.0"
-
-COMPATIBLE_MACHINE:append =3D "|c66x|k3"
-
-DEPENDS:append:ti33x =3D " starterware-rtos"
-DEPENDS:append:ti43x =3D " starterware-rtos"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_OSAL_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "OSAL Library"
diff --git a/recipes-bsp/osal/osal-test_git.bb b/recipes-bsp/osal/osal-te=
st_git.bb
deleted file mode 100644
index 354aa797..00000000
--- a/recipes-bsp/osal/osal-test_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "TI OSAL tests"
-
-DEPENDS=3D"common-csl-ip osal"
-
-include osal.inc
-
-PR =3D "${INC_PR}.1"
-
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
 OSAL_SRC_DIR=3D${S}"
-
-do_compile () {
-#   Build the tests
-    oe_runmake clean
-    oe_runmake tests
-}
-
-do_install () {
-#   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir}
-}
diff --git a/recipes-bsp/osal/osal.inc b/recipes-bsp/osal/osal.inc
deleted file mode 100644
index e2143e13..00000000
--- a/recipes-bsp/osal/osal.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://osal.h;beginline=3D1;endline=3D31;md5=3D6fb=
de6922f8bca1e6cd371d3c2faa4f9"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|omapl1"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.osal"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libosal.a"
diff --git a/recipes-bsp/osal/osal_git.bb b/recipes-bsp/osal/osal_git.bb
deleted file mode 100644
index 4f881d2e..00000000
--- a/recipes-bsp/osal/osal_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION =3D "TI OSAL library for Linux"
-
-DEPENDS=3D"common-csl-ip"
-
-include osal.inc
-
-PR =3D "${INC_PR}.1"
-
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
"
-
-do_compile () {
-#   Build the lib
-    oe_runmake clean
-    oe_runmake lib
-}
-
-do_install () {
-#   Install the lib
-    oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_=
LIB_BASE_DIR=3D${D}${libdir}
-    chown -R root:root ${D}
-}
diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/p=
ktlib-rtos_git.bb
deleted file mode 100644
index 1688d392..00000000
--- a/recipes-bsp/pktlib/pktlib-rtos_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit ti-pdk
-require pktlib.inc
-
-PR =3D "${INC_PR}.1"
-
-DEPENDS:append =3D " rm-lld-rtos \
-                   qmss-lld-rtos \
-                   cppi-lld-rtos \
-"
-COMPATIBLE_MACHINE:append =3D "|c66x"
diff --git a/recipes-bsp/pktlib/pktlib.inc b/recipes-bsp/pktlib/pktlib.in=
c
deleted file mode 100644
index af3f8bb1..00000000
--- a/recipes-bsp/pktlib/pktlib.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION =3D "Provides library for handling packet descriptors for ke=
ystone devices"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://docs/Doxyfile;md5=3D91d01dc3788e1f405f000b2=
089191a0a"
-
-COMPATIBLE_MACHINE =3D "keystone"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PKTLIB_GIT_URI =3D "git://git.ti.com/keystone-rtos/pktlib.git"
-PKTLIB_GIT_PROTOCOL =3D "git"
-PKTLIB_GIT_BRANCH =3D "master"
-PKTLIB_GIT_DESTSUFFIX =3D "git/ti/runtime/pktlib"
-
-# Below commit ID corresponds to "DEV.PKTLIB.2.1.0.8B"
-PKTLIB_SRCREV =3D "6d3758fda4c8c40fa9bd1194a9c713c9675b5a40"
-
-BRANCH =3D "${PKTLIB_GIT_BRANCH}"
-# Don't use DESTSUFFIX when cloning since repo contains ti/runtime/pktli=
b directory tree
-SRC_URI =3D "${PKTLIB_GIT_URI};protocol=3D${PKTLIB_GIT_PROTOCOL};branch=3D=
${BRANCH}"
-
-SRCREV =3D "${PKTLIB_SRCREV}"
-PV =3D "2.1.0.8B"
-INC_PR =3D "r0"
-
-S =3D "${WORKDIR}/${PKTLIB_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib=
_git.bb
deleted file mode 100644
index b15b61b2..00000000
--- a/recipes-bsp/pktlib/pktlib_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION =3D "Provides library for handling packet descriptors for ke=
ystone devices"
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/COPYING.txt;md5=3Db7982a377c=
680ad71ca2fbb735982462"
-
-DEPENDS =3D "common-csl-ip rm-lld qmss-lld cppi-lld"
-
-include pktlib.inc
-
-PR =3D "${INC_PR}.1"
-
-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
} INSTALL_INC_BASE_DIR=3D${D}${includedir} INSTALL_LIB_BASE_DIR=3D${D}${l=
ibdir}"
-
-do_compile () {
-	oe_runmake lib
-}
-
-do_install () {
-	oe_runmake install
-	chown -R root:root ${D}
-}
diff --git a/recipes-bsp/pru/pru-pwm-fw_git.bb b/recipes-bsp/pru/pru-pwm-=
fw_git.bb
deleted file mode 100644
index 14c81390..00000000
--- a/recipes-bsp/pru/pru-pwm-fw_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY =3D "Programmable Real-time Unit PWM Firmware"
-LICENSE =3D "BSD-3-Clause"
-
-LIC_FILES_CHKSUM =3D "file://main.c;beginline=3D1;endline=3D32;md5=3D893=
d6a0cf1644338ea96642c0db97f59"
-
-require recipes-ti/includes/ti-paths.inc
-
-COMPATIBLE_MACHINE =3D "am65xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.pruss.example.apps.icssg_pwm.firmware.src"
-
-PE =3D "1"
-
-DEPENDS =3D "ti-cgt-pru-native pru-icss common-csl-ip-rtos"
-
-
-EXTRA_OEMAKE +=3D " \
-    PRU_CGT=3D"${TI_CGT_PRU_INSTALL_DIR}" \
-    PRU_SSP=3D"${STAGING_DIR_TARGET}/usr" \
-    PDK_INSTALL_DIR=3D"${STAGING_DATADIR}/ti/ti-pdk-tree/packages" \
-"
-
-do_compile() {
-	oe_runmake
-}
-
-do_install() {
-	install -d ${D}/lib/firmware/ti-pruss
-	install -m 0644 ${S}/gen/pwm.out ${D}/lib/firmware/ti-pruss/am65x-pru0-=
pwm-fw.elf
-}
-
-FILES:${PN} =3D "/lib/firmware"
-
-INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Makefile-fo=
r-building-firmware.patch b/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-=
add-Makefile-for-building-firmware.patch
deleted file mode 100644
index 8414d945..00000000
--- a/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Makefile-for-build=
ing-firmware.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From d37359e7b2bd26da4d04fc97a94967cf457558e9 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 6 Aug 2019 19:50:59 -0400
-Subject: [PATCH] icss_uart: add Makefile for building firmware
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- firmware/icss_uart/src/Makefile | 125 +++++++++++++++++++++++++++++++++=
+++++++
- 1 file changed, 125 insertions(+)
- create mode 100644 firmware/icss_uart/src/Makefile
-
-diff --git a/firmware/icss_uart/src/Makefile b/firmware/icss_uart/src/Ma=
kefile
-new file mode 100644
-index 0000000..4764622
---- /dev/null
-+++ b/firmware/icss_uart/src/Makefile
-@@ -0,0 +1,125 @@
-+# PRU_CGT environment variable must point to the TI PRU code gen tools =
directory. E.g.:
-+#(Desktop Linux) export PRU_CGT=3D/path/to/pru/code/gen/tools/ti-cgt-pr=
u_2.x.y
-+#(Windows) set PRU_CGT=3DC:/path/to/pru/code/gen/tools/ti-cgt-pru_2.x.y
-+#(ARM Linux*) export PRU_CGT=3D/usr/share/ti/cgt-pru
-+#
-+# *ARM Linux also needs to create a symbolic link to the /usr/bin/ dire=
ctory in
-+# order to use the same Makefile
-+#(ARM Linux) ln -s /usr/bin/ /usr/share/ti/cgt-pru/bin
-+
-+ifndef PRU_CGT
-+define ERROR_BODY
-+
-+***********************************************************************=
********
-+PRU_CGT environment variable is not set. Examples given:
-+(Desktop Linux) export PRU_CGT=3D/path/to/pru/code/gen/tools/ti-cgt-pru=
_2.1.2
-+(Windows) set PRU_CGT=3DC:/path/to/pru/code/gen/tools/ti-cgt-pru_2.1.2
-+(ARM Linux*) export PRU_CGT=3D/usr/share/ti/cgt-pru
-+
-+*ARM Linux also needs to create a symbolic link to the /usr/bin/ direct=
ory in
-+order to use the same Makefile
-+(ARM Linux) ln -s /usr/bin/ /usr/share/ti/cgt-pru/bin
-+***********************************************************************=
********
-+
-+endef
-+$(error $(ERROR_BODY))
-+endif
-+
-+# PRU_SSP environment variable must point to the PRU Software Support P=
ackage. E.g.:
-+#(Desktop Linux) export PRU_SSP=3D/path/to/pru_software_support_package
-+#(Windows) set PRU_SSP=3DC:/path/to/pru_software_support_package
-+#(ARM Linux*) export PRU_SSP=3D/path/to/pru_software_support_package
-+
-+ifndef PRU_SSP
-+define ERROR_BODY
-+
-+***********************************************************************=
********
-+PRU_SSP environment variable must point to the PRU Software Support Pac=
kage. E.g.:
-+(Desktop Linux) export PRU_SSP=3D/path/to/pru_software_support_package
-+(Windows) set PRU_SSP=3DC:/path/to/pru_software_support_package
-+(ARM Linux*) export PRU_SSP=3D/path/to/pru_software_support_package
-+PRU_CGT environment variable is not set. Examples given:
-+***********************************************************************=
********
-+
-+endef
-+$(error $(ERROR_BODY))
-+endif
-+
-+MKFILE_PATH :=3D $(abspath $(lastword $(MAKEFILE_LIST)))
-+CURRENT_DIR :=3D $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
-+PROJ_NAME=3D$(CURRENT_DIR)
-+LINKER_COMMAND_FILE=3D./AM335x_PRU.cmd
-+LIBS=3D--library=3D$(PRU_SSP)/lib/rpmsg_lib.lib
-+INCLUDE=3D--include_path=3D$(PRU_SSP)/include --include_path=3D$(PRU_SS=
P)/include/am335x
-+STACK_SIZE=3D0x100
-+HEAP_SIZE=3D0x100
-+GEN_DIR=3Dgen
-+
-+#Common compiler and linker flags (Defined in 'PRU Optimizing C/C++ Com=
piler User's Guide)
-+CFLAGS=3D-v3 -o2 --display_error_number --endian=3Dlittle --hardware_ma=
c=3Don --asm_directory=3D$(GEN_DIR) --obj_directory=3D$(GEN_DIR) --pp_dir=
ectory=3D$(GEN_DIR) -ppd -ppa -DICSS_REV2
-+#Linker flags (Defined in 'PRU Optimizing C/C++ Compiler User's Guide)
-+LFLAGS=3D--reread_libs --warn_sections --stack_size=3D$(STACK_SIZE) --h=
eap_size=3D$(HEAP_SIZE)
-+
-+TARGET=3D$(GEN_DIR)/$(PROJ_NAME).out
-+MAP=3D$(GEN_DIR)/$(PROJ_NAME).map
-+OBJECTS=3D$(patsubst %.asm,$(GEN_DIR)/%.object,$(wildcard *.asm))
-+OBJECTS+=3D$(patsubst %.c,$(GEN_DIR)/%.object,$(wildcard *.c))
-+
-+
-+all: printStart $(TARGET) printEnd
-+
-+printStart:
-+	@echo ''
-+	@echo '************************************************************'
-+	@echo 'Building project: $(PROJ_NAME)'
-+
-+printEnd:
-+	@echo ''
-+	@echo 'Output files can be found in the "$(GEN_DIR)" directory'
-+	@echo ''
-+	@echo 'Finished building project: $(PROJ_NAME)'
-+	@echo '************************************************************'
-+	@echo ''
-+
-+# Invokes the linker (-z flag) to make the .out file
-+$(TARGET): $(OBJECTS) $(LINKER_COMMAND_FILE)
-+	@echo ''
-+	@echo 'Building target: $@'
-+	@echo 'Invoking: PRU Linker'
-+	$(PRU_CGT)/bin/clpru $(CFLAGS) -z -i$(PRU_CGT)/lib -i$(PRU_CGT)/includ=
e $(LFLAGS) -o $(TARGET) $(OBJECTS) -m$(MAP) $(LINKER_COMMAND_FILE) --lib=
rary=3Dlibc.a $(LIBS)
-+	@echo 'Finished building target: $@'
-+
-+# Invokes the compiler on all assembly files in the directory to create=
 the object files
-+$(GEN_DIR)/%.object: %.asm
-+	@mkdir -p $(GEN_DIR)
-+	@echo ''
-+	@echo 'Building file: $<'
-+	@echo 'Invoking: PRU Compiler'
-+	$(PRU_CGT)/bin/clpru --include_path=3D$(PRU_CGT)/include $(INCLUDE) $(=
CFLAGS) -fe $@ $<
-+
-+# Invokes the compiler on all c files in the directory to create the ob=
ject files
-+$(GEN_DIR)/%.object: %.c
-+	@mkdir -p $(GEN_DIR)
-+	@echo ''
-+	@echo 'Building file: $<'
-+	@echo 'Invoking: PRU Compiler'
-+	$(PRU_CGT)/bin/clpru -k --include_path=3D$(PRU_CGT)/include $(INCLUDE)=
 $(CFLAGS) -fe $@ $<
-+
-+.PHONY: all clean
-+
-+# Remove the $(GEN_DIR) directory
-+clean:
-+	@echo ''
-+	@echo '************************************************************'
-+	@echo 'Cleaning project: $(PROJ_NAME)'
-+	@echo ''
-+	@echo 'Removing files in the "$(GEN_DIR)" directory'
-+	@rm -rf $(GEN_DIR)
-+	@echo ''
-+	@echo 'Finished cleaning project: $(PROJ_NAME)'
-+	@echo '************************************************************'
-+	@echo ''
-+
-+# Includes the dependencies that the compiler creates (-ppd and -ppa fl=
ags)
-+-include $(OBJECTS:%.object=3D%.pp)
-+
---=20
-2.7.4
-
diff --git a/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-dependen=
cy-on-PDK-CSL.patch b/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove=
-dependency-on-PDK-CSL.patch
deleted file mode 100644
index b565ba0e..00000000
--- a/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-dependency-on-P=
DK-CSL.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 1b853cfd6194d3855310f47d43cb8c9f498b6182 Mon Sep 17 00:00:00 2001
-From: Bin Liu <b-liu@ti.com>
-Date: Wed, 27 Feb 2019 14:38:43 -0600
-Subject: [PATCH] icss_uart: remove dependency on PDK/CSL
-
-Signed-off-by: Bin Liu <b-liu@ti.com>
----
- firmware/icss_uart/src/icss_ctrl_regs.h | 32 ++++----------------------=
------
- 1 file changed, 4 insertions(+), 28 deletions(-)
-
-diff --git a/firmware/icss_uart/src/icss_ctrl_regs.h b/firmware/icss_uar=
t/src/icss_ctrl_regs.h
-index ce640f5..99ec90d 100644
---- a/firmware/icss_uart/src/icss_ctrl_regs.h
-+++ b/firmware/icss_uart/src/icss_ctrl_regs.h
-@@ -39,32 +39,8 @@
-     .if    !$isdefed("__icss_ctrl_regs_h")
- __icss_ctrl_regs_h    .set 1
-=20
--    .cdecls C,NOLIST
--%{
--#include "cslr_icss.h"
--%}
--
--    .if $defined("ICSS_REV1")
--ICSS_PRU_CTRL_CONTROL       .set    (CSL_ICSSM_PRU_CTRL_CONTROL)
--ICSS_PRU_CTRL_STATUS        .set    (CSL_ICSSM_PRU_CTRL_STATUS)
--ICSS_PRU_CTRL_WAKEUP_EN     .set    (CSL_ICSSM_PRU_CTRL_WAKEUP_EN)
--ICSS_PRU_CTRL_CYCLE         .set    (CSL_ICSSM_PRU_CTRL_CYCLE)
--ICSS_PRU_CTRL_STALL         .set    (CSL_ICSSM_PRU_CTRL_STALL)
--ICSS_PRU_CTRL_CTBIR0        .set    (CSL_ICSSM_PRU_CTRL_CTBIR0)
--ICSS_PRU_CTRL_CTBIR1        .set    (CSL_ICSSM_PRU_CTRL_CTBIR1)
--ICSS_PRU_CTRL_CTPPR0        .set    (CSL_ICSSM_PRU_CTRL_CTPPR0)
--ICSS_PRU_CTRL_CTPPR1        .set    (CSL_ICSSM_PRU_CTRL_CTPPR1)
--    .endif  ;ICSS_REV1
--
--    .if $defined("ICSS_REV2")
--ICSS_PRU_CTRL_CONTROL       .set    (CSL_ICSSPRUCTRL_CONTROL)
--ICSS_PRU_CTRL_STATUS        .set    (CSL_ICSSPRUCTRL_STATUS)
--ICSS_PRU_CTRL_WAKEUP_EN     .set    (CSL_ICSSPRUCTRL_WAKEUP_EN)
--ICSS_PRU_CTRL_CYCLE         .set    (CSL_ICSSPRUCTRL_CYCLE)
--ICSS_PRU_CTRL_STALL         .set    (CSL_ICSSPRUCTRL_STALL)
--ICSS_PRU_CTRL_CTBIR0        .set    (CSL_ICSSPRUCTRL_CTBIR0)
--ICSS_PRU_CTRL_CTBIR1        .set    (CSL_ICSSPRUCTRL_CTBIR1)
--ICSS_PRU_CTRL_CTPPR0        .set    (CSL_ICSSPRUCTRL_CTPPR0)
--ICSS_PRU_CTRL_CTPPR1        .set    (CSL_ICSSPRUCTRL_CTPPR1)
--    .endif  ;ICSS_REV2
-+ICSS_PRU_CTRL_CONTROL       .set    (0x0U)
-+ICSS_PRU_CTRL_STATUS        .set    (0x4U)
-+ICSS_PRU_CTRL_WAKEUP_EN     .set    (0x8U)
-+ICSS_PRU_CTRL_CYCLE         .set    (0xcU)
-     .endif
---=20
-2.7.4
-
diff --git a/recipes-bsp/pru/pru-swuart-fw_git.bb b/recipes-bsp/pru/pru-s=
wuart-fw_git.bb
deleted file mode 100644
index f0d9e80d..00000000
--- a/recipes-bsp/pru/pru-swuart-fw_git.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY =3D "Programmable Real-time Unit Software UART Firmware"
-LICENSE =3D "BSD-3-Clause"
-
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;beginline=3D1;endline=3D31;md5=3D=
94b6a199da1caf777f6756cb70aca4a7"
-
-require recipes-ti/includes/ti-paths.inc
-
-COMPATIBLE_MACHINE =3D "ti33x"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.uart"
-
-PE =3D "1"
-
-SRC_URI:append =3D " \
-	file://0001-icss_uart-add-Makefile-for-building-firmware.patch \
-	file://0001-icss_uart-remove-dependency-on-PDK-CSL.patch \
-"
-
-DEPENDS =3D "ti-cgt-pru-native pru-icss"
-
-
-export PRU_CGT =3D "${TI_CGT_PRU_INSTALL_DIR}"
-export PRU_SSP =3D "${STAGING_DIR_TARGET}/usr"
-
-do_compile() {
-	oe_runmake -C firmware/icss_uart/src
-}
-
-do_install() {
-	install -d ${D}/lib/firmware/ti-pruss
-	install -m 0644 ${S}/firmware/icss_uart/src/gen/src.out ${D}/lib/firmwa=
re/ti-pruss/pru_swuart-fw.elf
-}
-
-FILES:${PN} =3D "/lib/firmware"
-
-INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb b/recipes-bsp/q=
mss-pdsp-fw/qmss-pdsp-fw_git.bb
deleted file mode 100644
index 6ab26e6a..00000000
--- a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION =3D "QMSS PDSP firmware"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://LICENCE.ti-keystone;md5=3D3a86335d32864b0be=
f996bee26cc0f2c"
-
-PV =3D "${QMSS_PDSP_FW_VERSION}"
-PR =3D "${INC_PR}.1"
-
-CLEANBROKEN =3D "1"
-
-COMPATIBLE_MACHINE =3D "keystone"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git"
-ORIGIN =3D "ks2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin"
-TARGET =3D "ks2_qmss_pdsp_acc48.bin"
-
-do_install() {
-	install -d ${D}${base_libdir}/firmware
-	install -m 0644 ${S}/ti-keystone/${ORIGIN} ${D}${base_libdir}/firmware/=
${TARGET}
-}
-
-FILES:${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sc=
iclient/sciclient-rtos_git.bb
deleted file mode 100644
index 890db6e0..00000000
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ /dev/null
@@ -1,125 +0,0 @@
-SUMMARY =3D "TI RTOS low level driver for SCICLIENT"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.drv.sciclient"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D99d7639a81c1ba1f16fd070a9=
28ffddb"
-
-COMPATIBLE_MACHINE =3D "k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PR =3D "r1"
-
-DEPENDS:append =3D " osal-rtos common-csl-ip-rtos openssl-native"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-SCICLIENT_PACKAGE_BASE =3D "${WORKDIR}/sciclient_base"
-SCICLIENT_ROOTPATH =3D "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packa=
ges/ti/drv/sciclient"
-
-export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
-export PDK_SCICLIENT_ROOT_PATH =3D "${SCICLIENT_PACKAGE_BASE}/package/al=
l/pdk_/packages"
-
-BUILD_HS =3D ""
-BUILD_HS:am65xx-hs-evm =3D "yes"
-BUILD_HS:j7-hs-evm =3D "yes"
-export BUILD_HS
-
-# Sciclient for am65x supports mcu1_1 in addition to the default cores i=
n TI_PDK_LIMIT_CORES
-TI_PDK_LIMIT_CORES:append:am65xx =3D " mcu1_1"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "SCICLIENT"
-
-do_configure() {
-
-    rm -rf ${SCICLIENT_PACKAGE_BASE}
-    cd ${S}
-
-    # remove any previous package
-    rm -f ${SCICLIENT_PACKAGE_BASE}
-
-    # make the release package before building it
-    make package BOARD=3D"${TI_PDK_LIMIT_BOARDS}" DEST_ROOT=3D${SCICLIEN=
T_PACKAGE_BASE} PDK_SCICLIENT_COMP_PATH=3D${S}
-
-   # This is to ensure the make package completed successfully
-    cat  ${SCICLIENT_ROOTPATH}/makefile
-}
-
-do_compile() {
-
-    cd ${SCICLIENT_ROOTPATH}
-
-    # Clean
-    # make clean LIMIT_SOCS=3D"${LIMSOCS}" LIMIT_BOARDS=3D"${LIMBOARDS}"
-
-    # Build am65xx libraries
-    make lib xdc_meta doxygen LIMIT_SOCS=3D"${TI_PDK_LIMIT_SOCS}" LIMIT_=
BOARDS=3D"${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES=3D"${TI_PDK_LIMIT_CORES}"
-
-    #archive
-    tar -cf sciclient.tar --exclude=3D'*.tar' ./*
-}
-
-
-do_compile:prepend:am65xx-hs-evm() {
-
-    cd ${SCICLIENT_ROOTPATH}
-
-    # Saving the GP firmware to a different GP name
-    cp ${CP_ARGS} ./soc/V0/sysfw.bin ./soc/V0/sysfw-gp.bin
-   =20
-    cd ${SCICLIENT_ROOTPATH}/tools
-    # Create the .bin file for HS
-    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x-hs ${PDK_INST=
ALL_DIR}/packages
-    cd -
-}
-
-do_compile:prepend:am65xx-evm() {
-
-    cd ${SCICLIENT_ROOTPATH}/tools
-
-    # Create the .bin file for GP, PG1
-    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x ${PDK_INSTALL=
_DIR}/packages
-    # Create the .bin file for GP, PG2
-    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x_pg2 ${PDK_INS=
TALL_DIR}/packages
-   =20
-    cd -
-}
-
-
-do_compile:prepend:j7-evm() {
-
-    cd ${SCICLIENT_ROOTPATH}/tools
-    # Create the .bin file for GP
-    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh j721e ${PDK_INSTALL=
_DIR}/packages
-    cd -
-}
-
-do_compile:prepend:j7-hs-evm() {
-
-    cd ${SCICLIENT_ROOTPATH}/tools
-    # Create the .bin file for HS
-    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh j721e-hs ${PDK_INST=
ALL_DIR}/packages
-    cd -
-}
-
-do_install() {
-    cd ${SCICLIENT_ROOTPATH}
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INST=
ALL_DIR_RECIPE}/packages/ti/drv/sciclient \;
-}
-
-FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INSANE_SKIP:${PN} =3D "arch ldflags file-rdeps"
-
-INSANE_SKIP:${PN}-dbg =3D "arch"
-
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_SYSROOT_STRIP =3D "1"
diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb b/recipes-bs=
p/serdes-diag/serdes-diag-rtos_git.bb
deleted file mode 100644
index 3e87928d..00000000
--- a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY =3D "TI RTOS library for SERDES diagnostics"
-
-inherit ti-pdk
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://serdes_diag.h;beginline=3D1;endline=3D42;;m=
d5=3D68e7ce6fdc0e9328fa7d0ec41c54420c"
-
-COMPATIBLE_MACHINE =3D "keystone|c66x|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-SERDES_DIAG_GIT_URI =3D "git://git.ti.com/keystone-rtos/serdes_diag.git"
-SERDES_DIAG_GIT_PROTOCOL =3D "git"
-SERDES_DIAG_GIT_BRANCH =3D "master"
-SERDES_DIAG_GIT_DESTSUFFIX =3D "git/ti/diag/serdes_diag"
-
-# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.13"
-SERDES_DIAG_SRCREV =3D "6dd7cd2170efe3cb41cc424486ba55b8d5bba354"
-
-BRANCH =3D "${SERDES_DIAG_GIT_BRANCH}"
-SRC_URI =3D "${SERDES_DIAG_GIT_URI};destsuffix=3D${SERDES_DIAG_GIT_DESTS=
UFFIX};protocol=3D${SERDES_DIAG_GIT_PROTOCOL};branch=3D${BRANCH}"
-
-SRCREV =3D "${SERDES_DIAG_SRCREV}"
-PV =3D "01.00.00.13"
-PR =3D "r0"
-
-S =3D "${WORKDIR}/${SERDES_DIAG_GIT_DESTSUFFIX}"
-
-
-# Build with make instead of XDC for k3
-TI_PDK_XDCMAKE:k3 =3D "0"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "SERDES Diagnostics"
-
-INSANE_SKIP:${PN} =3D "arch"
diff --git a/recipes-bsp/serdes-fw/serdes-fw_git.bb b/recipes-bsp/serdes-=
fw/serdes-fw_git.bb
deleted file mode 100644
index 6f79c64d..00000000
--- a/recipes-bsp/serdes-fw/serdes-fw_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION =3D "SerDes firmware for Keystone PCIe and 1/10GigE"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://LICENCE.ti-keystone;md5=3D3a86335d32864b0be=
f996bee26cc0f2c"
-
-PV =3D "${SERDES_FW_VERSION}"
-PR =3D "${INC_PR}.0"
-
-CLEANBROKEN =3D "1"
-
-COMPATIBLE_MACHINE =3D "keystone"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-S =3D "${WORKDIR}/git"
-TARGET =3D "ks2_pcie_serdes.bin ks2_gbe_serdes.bin ks2_xgbe_serdes.bin"
-
-do_install() {
-	install -d ${D}${base_libdir}/firmware
-	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-keystone/$f ${D}${base_libdir}/firmware/$f
-	done
-}
-
-FILES:${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/srss-tc/srss-tc_git.bb b/recipes-bsp/srss-tc/srs=
s-tc_git.bb
deleted file mode 100644
index 483bde00..00000000
--- a/recipes-bsp/srss-tc/srss-tc_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION =3D "TI Smart Reflex temperature control application for Key=
Stone II"
-HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-linux/srss-tc.git=
"
-LICENSE =3D "BSD & MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2c17cd1dc60dc06a4c4f2a2c4=
5472a51"
-COMPATIBLE_MACHINE =3D "keystone"
-
-PV =3D "1.0.0.1"
-
-BRANCH =3D "master"
-# This commit corresponds to tag DEV.SRSS-TC-01.00.00.01A
-SRCREV =3D "107cd1433ef5785e5647ef086a4cc77566506604"
-
-SRC_URI =3D "git://git.ti.com/keystone-linux/srss-tc.git;protocol=3Dgit;=
branch=3D${BRANCH}"
-
-S =3D "${WORKDIR}/git"
-
-SRSS_BIN_NAME =3D "srss_tc.out"
-INITSCRIPT_NAME =3D "run_srss_tc.sh"
-INITSCRIPT_PARAMS =3D "defaults 10"
-
-inherit update-rc.d
-LDFLAGS +=3D "-lrt"
-CFLAGS +=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-
-EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX}"
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/src/${SRSS_BIN_NAME} ${D}${bindir}/${SRSS_BIN_NA=
ME}
-
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 755 ${S}/scripts/${INITSCRIPT_NAME} ${D}${sysconfdir}/ini=
t.d/${INITSCRIPT_NAME}
-}
diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb b/recipes-bs=
p/starterware/starterware-rtos_git.bb
deleted file mode 100644
index 1d94e949..00000000
--- a/recipes-bsp/starterware/starterware-rtos_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require starterware.inc
-
-DEPENDS =3D "gcc-arm-baremetal-native ti-pdk-build-rtos ti-xdctools-nati=
ve"
-
-require recipes-ti/includes/ti-paths.inc
-
-PR =3D "${INC_PR}.0"
-
-PARTNO:ti33x =3D "am335x"
-PARTNO:ti43x =3D "am437x"
-
-export TOOLCHAIN_PATH_A8 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
-export TOOLCHAIN_PATH_A9 =3D "${GCC_ARM_NONE_TOOLCHAIN}"
-export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
-export XDC_INSTALL_PATH =3D "${XDC_INSTALL_DIR}"
-
-do_compile() {
-    cd build
-    ./release_${PARTNO}.sh
-}
-
-do_install() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INST=
ALL_DIR_RECIPE}/packages/ti/starterware \;
-}
-
-FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_SYSROOT_STRIP =3D "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INSANE_SKIP:${PN} =3D "arch staticdev file-rdeps"
-
diff --git a/recipes-bsp/starterware/starterware.inc b/recipes-bsp/starte=
rware/starterware.inc
deleted file mode 100644
index 82b012ad..00000000
--- a/recipes-bsp/starterware/starterware.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://Makefile;beginline=3D1;endline=3D35;md5=3D2=
86cbb5dce3e348294b6b025cff969b3"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-STARTERWARE_GIT_URI =3D "git://git.ti.com/keystone-rtos/starterware.git"
-STARTERWARE_GIT_PROTOCOL =3D "git"
-STARTERWARE_GIT_BRANCH =3D "master"
-
-# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.12A"
-STARTERWARE_SRCREV =3D "49a4d4cd4c72bacee738d44b8e72e7f59aa948cd"
-
-BRANCH =3D "${STARTERWARE_GIT_BRANCH}"
-SRC_URI =3D "${STARTERWARE_GIT_URI};protocol=3D${STARTERWARE_GIT_PROTOCO=
L};branch=3D${BRANCH}"
-
-SRCREV =3D "${STARTERWARE_SRCREV}"
-PV =3D "02.01.01.12A"
-INC_PR =3D "r0"
-
-S =3D "${WORKDIR}/git"
diff --git a/recipes-bsp/starterware/starterware_git.bb b/recipes-bsp/sta=
rterware/starterware_git.bb
deleted file mode 100644
index a560e7bd..00000000
--- a/recipes-bsp/starterware/starterware_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require starterware.inc
-
-PR =3D "${INC_PR}.0"
-
-ALLOW_EMPTY:${PN} =3D "1"
-
-CLEANBROKEN =3D "1"
-
-do_compile() {
-    :
-}
-
-do_install () {
-    install -d ${D}${includedir}/ti/starterware
-    find . -name "*.h" -type f | xargs -I {} cp --parents --no-preserve=3D=
ownership {} ${D}${includedir}/ti/starterware
-}
diff --git a/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb b/recipes-bsp=
/ti-pdk-source/ti-pdk-source_git.bb
deleted file mode 100644
index f4b3da92..00000000
--- a/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-# Recipe to fetch/unpack sources used by ti-pdk-fetch recipes.
-#
-# Mimic gcc-source.inc from oe-core.
-
-# These shources will be unpacked to a "work-shared" directory. Then eac=
h
-# "ti-pdk-fetch" recipe will hard-link only the sources it requires.
-
-deltask do_configure
-deltask do_compile
-deltask do_install
-deltask do_populate_sysroot
-deltask do_populate_lic
-
-RM_WORK_EXCLUDE +=3D "${PN}"
-EXCLUDE_FROM_WORLD =3D "1"
-
-inherit nopackages ti-pdk-fetch
-
-LICENSE =3D "BSD-3-Clause"
-
-PN =3D "${TI_PDK_SOURCE_PN}"
-WORKDIR =3D "${TI_PDK_SOURCE_WORKDIR}"
-SSTATE_SWSPEC =3D "sstate:ti-pdk::${PV}:${PR}::${SSTATE_VERSION}:"
-
-STAMP =3D "${STAMPS_DIR}/work-shared/ti-pdk-${PV}"
-STAMPCLEAN =3D "${STAMPS_DIR}/work-shared/ti-pdk-${PV}*"
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-DEPENDS =3D ""
-PACKAGES =3D ""
-
-SRC_URI =3D "${TI_PDK_GIT_URI};branch=3D${TI_PDK_GIT_BRANCH};protocol=3D=
${TI_PDK_GIT_PROTOCOL}"
-SRCREV =3D "${TI_PDK_SRCREV}"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb b/recipes-bsp/ti=
-sci-fw/ti-sci-fw_0.1.1.50.bb
deleted file mode 100644
index 32ea3b4d..00000000
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION =3D "TI SCI firmware"
-
-LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://LICENCE.ti-keystone;md5=3D3a86335d32864b0be=
f996bee26cc0f2c"
-
-PV =3D "0.1.1.50"
-PR =3D "r2"
-
-CLEANBROKEN =3D "1"
-
-COMPATIBLE_MACHINE =3D "k2g"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-SRCREV =3D "ab507546f0f3f217f4c782a20845856e14b38224"
-BRANCH ?=3D "ti-linux-firmware"
-
-SRC_URI =3D "git://git.ti.com/processor-firmware/ti-linux-firmware.git;p=
rotocol=3Dgit;branch=3D${BRANCH}"
-
-S =3D "${WORKDIR}/git"
-TARGET =3D "ti-sci-firmware-k2g.bin"
-
-do_install() {
-	install -d ${D}/boot
-	install -m 0644 ${S}/ti-keystone/${TARGET} ${D}/boot/${TARGET}
-}
-
-FILES:${PN} =3D "/boot"
-
-inherit deploy
-
-do_deploy () {
-	install -d ${DEPLOYDIR}
-	install -m 0644 ${S}/ti-keystone/${TARGET} ${DEPLOYDIR}/${TARGET}
-}
-
-addtask deploy before do_build after do_compile
diff --git a/recipes-bsp/traceframework/traceframework-rtos_git.bb b/reci=
pes-bsp/traceframework/traceframework-rtos_git.bb
deleted file mode 100644
index 55e41188..00000000
--- a/recipes-bsp/traceframework/traceframework-rtos_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit ti-pdk
-
-require traceframework.inc
-
-PR =3D "${INC_PR}.2"
-
-XDCPATH:append =3D ";${UIA_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "Trace Framework"
diff --git a/recipes-bsp/traceframework/traceframework.inc b/recipes-bsp/=
traceframework/traceframework.inc
deleted file mode 100644
index 2312b020..00000000
--- a/recipes-bsp/traceframework/traceframework.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3De8f6789acdcda76d02ed9203f=
c2e603d"
-
-COMPATIBLE_MACHINE =3D "tci6614-evm|keystone"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-TRACEFRAMEWORK_GIT_URI =3D "git://git.ti.com/keystone-rtos/traceframewor=
k.git"
-TRACEFRAMEWORK_GIT_PROTOCOL =3D "git"
-TRACEFRAMEWORK_GIT_BRANCH =3D "master"
-TRACEFRAMEWORK_GIT_DESTSUFFIX =3D "git/ti/instrumentation/traceframework=
"
-
-# Below commit ID corresponds to "DEV.TFWK-01.01.01.09A"
-TRACEFRAMEWORK_SRCREV =3D "b7aa8d91901d1aabe2e56fabc3233ed66bf08819"
-
-BRANCH =3D "${TRACEFRAMEWORK_GIT_BRANCH}"
-SRC_URI =3D "${TRACEFRAMEWORK_GIT_URI};destsuffix=3D${TRACEFRAMEWORK_GIT=
_DESTSUFFIX};protocol=3D${TRACEFRAMEWORK_GIT_PROTOCOL};branch=3D${BRANCH}=
"
-
-SRCREV =3D "${TRACEFRAMEWORK_SRCREV}"
-PV =3D "01.01.01.09A"
-INC_PR =3D "r0"
-
-DEVICELIST =3D "k2k k2h k2e k2l"
-DEVICELIST:k2hk =3D "k2k k2h"
-DEVICELIST:k2e =3D "k2e"
-DEVICELIST:k2l =3D "k2l"
-
-S =3D "${WORKDIR}/${TRACEFRAMEWORK_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-b=
sp/traceframework/traceframework_git.bb
deleted file mode 100644
index 4c11e652..00000000
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION =3D "TI Trace Framework library"
-
-DEPENDS =3D "cuia"
-
-include traceframework.inc
-
-PR =3D "${INC_PR}.0"
-
-BASEDIR =3D "${WORKDIR}/git"
-
-EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
} \
-                 CUIA_INSTALL_DIR=3D${STAGING_INCDIR} CUIA_LIB_DIR=3D${S=
TAGING_LIBDIR}"
-
-do_compile () {
-#   making the library
-	oe_runmake clean
-	oe_runmake lib
-
-#   make the test application
-	for device in ${DEVICELIST}
-	do
-		oe_runmake tests DEVICE=3D"$device" TFW_INC_DIR=3D${BASEDIR} TFW_SRC_D=
IR=3D${S} \
-			TARGET_ROOT_DIR=3D${D}
-	done
-}
-
-do_install() {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake install DEVICE=3D"$device" TFW_SRC_DIR=3D${S} TARGET_ROOT_D=
IR=3D${D}
-	done
-	chown -R root:root ${D}
-}
-
-PACKAGES =3D+ "${PN}-test"
-
-FILES:${PN}-test =3D "${bindir}/tfw*.out \
-                    ${bindir}/*.txt"
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libtraceframework.a"
diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb b/recipes-bs=
p/transport-rtos/bmet-eth-rtos_git.bb
deleted file mode 100644
index aa21b652..00000000
--- a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY =3D "RTOS driver for BMET Ethernet"
-
-inherit ti-pdk
-require transport.inc
-
-PR =3D "${INC_PR}.0"
-
-LIC_FILES_CHKSUM =3D "file://bmet_transport.h;beginline=3D12;endline=3D4=
0;md5=3D6d209c698b273aef180b0c1d38469e8e"
-
-COMPATIBLE_MACHINE =3D "k2hk|k2e|k2l"
-
-DEPENDS:append =3D " qmss-lld-rtos \
-                   cppi-lld-rtos \
-"
-
-TI_PDK_COMP =3D "ti.transport.bmet_eth"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "Baremetal Ethernet Transport"
diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb b/recipes-b=
sp/transport-rtos/nimu-icss-rtos_git.bb
deleted file mode 100644
index a4ecaa28..00000000
--- a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY =3D "RTOS driver for NIMU ICSS"
-
-inherit ti-pdk
-require transport.inc
-
-PR =3D "${INC_PR}.0"
-
-LIC_FILES_CHKSUM =3D "file://nimu_icssEth.h;beginline=3D1;endline=3D35;m=
d5=3D3ea633a510be24d8a89d9d08b930994c"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|c66x|omapl1|k3"
-
-DEPENDS:append =3D " ti-ndk \
-                   pruss-lld-rtos \
-                   icss-emac-lld-rtos \
-"
-DEPENDS:append_c665x-evm =3D " emac-lld-rtos"
-DEPENDS:append_c667x-evm =3D " pa-lld-rtos"
-DEPENDS:append:omapl1 =3D " emac-lld-rtos"
-
-TI_PDK_COMP =3D "ti.transport.ndk.nimu_icss"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_NIMU_ICSS_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-export NDK_INSTALL_PATH =3D "${NDK_INSTALL_DIR}"
-XDCPATH:append =3D ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/tr=
ansport-rtos/nimu-rtos_git.bb
deleted file mode 100644
index b726be2c..00000000
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY =3D "RTOS driver for Network Interface Management Unit (NIMU)"
-
-inherit ti-pdk
-require transport.inc
-
-PR =3D "${INC_PR}.0"
-
-LIC_FILES_CHKSUM =3D "file://nimu_eth.h;beginline=3D1;endline=3D35;md5=3D=
ee9c662c39d4584fb2a8b66413d2866d"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|c66x|omapl1|k3"
-
-TI_PDK_COMP =3D "ti.transport.ndk.nimu"
-
-DEPENDS:append =3D " ti-ndk osal-rtos"
-DEPENDS:append:ti33x =3D " starterware-rtos emac-lld-rtos"
-DEPENDS:append:ti43x =3D " starterware-rtos emac-lld-rtos"
-DEPENDS:append:omap-a15 =3D " emac-lld-rtos"
-DEPENDS:append:keystone =3D " qmss-lld-rtos cppi-lld-rtos"
-DEPENDS:append:k2hk =3D " pa-lld-rtos"
-DEPENDS:append:k2e =3D " pa-lld-rtos"
-DEPENDS:append:k2l =3D " pa-lld-rtos"
-DEPENDS:append:k2g =3D " emac-lld-rtos"
-DEPENDS:append_c665x-evm =3D " emac-lld-rtos"
-DEPENDS:append_c667x-evm =3D " pa-lld-rtos cppi-lld-rtos"
-DEPENDS:append:omapl1 =3D " emac-lld-rtos"
-DEPENDS:append:k3 =3D " emac-lld-rtos pruss-lld-rtos"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_NIMU_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-export NDK_INSTALL_PATH =3D "${NDK_INSTALL_DIR}"
-XDCPATH:append =3D ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/transport-rtos/timesync-rtos_git.bb b/recipes-bs=
p/transport-rtos/timesync-rtos_git.bb
deleted file mode 100644
index 3913ecf4..00000000
--- a/recipes-bsp/transport-rtos/timesync-rtos_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY =3D "RTOS driver for timesync driver"
-
-inherit ti-pdk
-require recipes-bsp/transport-rtos/transport.inc
-
-PR =3D "${INC_PR}.0"
-
-LIC_FILES_CHKSUM =3D "file://timeSync_ver.h;beginline=3D23;endline=3D45;=
md5=3D4bd873035e47065aaa811e53622992e9"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g"
-
-DEPENDS:append =3D " ti-ndk \
-                   osal-rtos \
-                   pruss-lld-rtos \
-                   icss-emac-lld-rtos \
-                   nimu-icss-rtos \
-                   edma3-lld-rtos \
-"
-
-TI_PDK_COMP =3D "ti.transport.timeSync"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_TIMESYNC_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-export NDK_INSTALL_PATH =3D "${NDK_INSTALL_DIR}"
-export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"
-
-XDCPATH:append =3D ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/transport-rtos/transport.inc b/recipes-bsp/trans=
port-rtos/transport.inc
deleted file mode 100644
index 866d7a34..00000000
--- a/recipes-bsp/transport-rtos/transport.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.transport"
-
-PE =3D "1"
-
-INC_PR =3D "r0"
diff --git a/recipes-bsp/utils-rtos/profiling-rtos_git.bb b/recipes-bsp/u=
tils-rtos/profiling-rtos_git.bb
deleted file mode 100644
index 9846804d..00000000
--- a/recipes-bsp/utils-rtos/profiling-rtos_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY =3D "TI RTOS profiling utilities"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.utils.profiling"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://profilingver.h;beginline=3D1;endline=3D46;m=
d5=3D974494ad60f33cfc0340e421c5a5a7a0"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|c66x|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-
-PR =3D "r0"
-
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_PROFILING_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "Profiling Utility Library"
diff --git a/recipes-bsp/utils-rtos/trace-rtos_git.bb b/recipes-bsp/utils=
-rtos/trace-rtos_git.bb
deleted file mode 100644
index 249ffc79..00000000
--- a/recipes-bsp/utils-rtos/trace-rtos_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY =3D "TI RTOS Trace utility"
-
-DESCRIPTION =3D "This utility allows for tracing support in PDK drivers"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.utils.trace"
-
-PE =3D "1"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://tracever.h;beginline=3D19;endline=3D47;md5=3D=
983f531ecfc9fc8c4bc3af9333ab6696"
-
-COMPATIBLE_MACHINE =3D "k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-
-PR =3D "r0"
-
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE =3D "0"
-
-export PDK_TRACE_ROOT_PATH =3D"${WORKDIR}/build"
-export DEST_ROOT=3D"${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "Trace Utility"
diff --git a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb b/recipes-bsp/wdtime=
r/wdtimer-rtos_git.bb
deleted file mode 100644
index 59ebf31f..00000000
--- a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY =3D "Watchdog Timer (wdtimer) test example"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://WatchdogTimer.xdc;beginline=3D1;endline=3D3=
1;md5=3D837fb1761f89c7671e79bd5992bcf9e4"
-
-inherit ti-pdk
-
-COMPATIBLE_MACHINE =3D "k2hk|k2e|k2l"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-WATCHDOG_TIMER_GIT_URI =3D "git://git.ti.com/keystone-rtos/wdtimer.git"
-WATCHDOG_TIMER_GIT_PROTOCOL =3D "git"
-WATCHDOG_TIMER_GIT_BRANCH =3D "master"
-WATCHDOG_TIMER_GIT_DESTSUFFIX =3D "git/ti/instrumentation/wdtimer"
-
-# Below commit ID corresponds to "DEV.WDTIMER.01.00.00.04A"
-WATCHDOG_TIMER_SRCREV =3D "5c382014ed02fdf054beb1dd0263758eb17c34e2"
-
-BRANCH =3D "${WATCHDOG_TIMER_GIT_BRANCH}"
-SRC_URI =3D "${WATCHDOG_TIMER_GIT_URI};destsuffix=3D${WATCHDOG_TIMER_GIT=
_DESTSUFFIX};protocol=3D${WATCHDOG_TIMER_GIT_PROTOCOL};branch=3D${BRANCH}=
"
-
-SRCREV =3D "${WATCHDOG_TIMER_SRCREV}"
-PV =3D "01.00.00.04A"
-PR =3D "r0"
-
-S =3D "${WORKDIR}/git/ti/instrumentation/wdtimer"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT =3D "Watchdog Timer"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-pa=
ths.inc
index d226c4af..86689d3c 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -29,8 +29,6 @@ export IMGLIB_C64P_INSTALL_DIR_RECIPE=3D "${installdir}=
/ti-imglib-tree"
 export IPC_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-ipc-tree"
 export LINK_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-dsplink-tree"
 export LPM_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-local-power-m=
anager-tree"
-export NDK_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-ndk-tree"
-export NS_INSTALL_DIR_RECIPE              =3D "${installdir}/ti-ns-tree"
 export OMX_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-omx-tree"
 export OSAL_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-osal-tree"
 export RTFS_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-rtfs-tree"
@@ -81,8 +79,6 @@ export IMGLIB_C64P_INSTALL_DIR=3D "${STAGING_DIR_TARGET=
}${IMGLIB_C64P_INSTALL_DIR_
 export IPC_INSTALL_DIR        =3D "${STAGING_DIR_TARGET}${IPC_INSTALL_DI=
R_RECIPE}"
 export LINK_INSTALL_DIR       =3D "${STAGING_DIR_TARGET}${LINK_INSTALL_D=
IR_RECIPE}"
 export LPM_INSTALL_DIR        =3D "${STAGING_DIR_TARGET}${LPM_INSTALL_DI=
R_RECIPE}"
-export NDK_INSTALL_DIR        =3D "${STAGING_DIR_TARGET}${NDK_INSTALL_DI=
R_RECIPE}"
-export NS_INSTALL_DIR         =3D "${STAGING_DIR_TARGET}${NS_INSTALL_DIR=
_RECIPE}"
 export OMX_INSTALL_DIR        =3D "${STAGING_DIR_TARGET}${OMX_INSTALL_DI=
R_RECIPE}"
 export SYSBIOS_INSTALL_DIR    =3D "${STAGING_DIR_TARGET}${SYSBIOS_INSTAL=
L_DIR_RECIPE}"
 export SYSLINK_INSTALL_DIR    =3D "${STAGING_DIR_TARGET}${SYSLINK_INSTAL=
L_DIR_RECIPE}"
diff --git a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb b/recipes-ti=
/ipc/ipc-transport-common-rtos_git.bb
deleted file mode 100644
index ade78022..00000000
--- a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require recipes-ti/includes/ti-paths.inc
-require ipc-transport.inc
-
-PR =3D "${INC_PR}.1"
-
-LIC_FILES_CHKSUM =3D "file://common_src/bench_common.h;beginline=3D1;end=
line=3D31;md5=3Da6ddfb26d2097041d513e3881f40e4e8"
-
-COMPATIBLE_MACHINE =3D "k2hk|k2l|k2e"
-
-IPC_TRANSPORT_COMMON_DESTSUFFIX =3D "git/c66/example"
-
-S =3D "${WORKDIR}/${IPC_TRANSPORT_COMMON_DESTSUFFIX}"
-
-do_compile() {
-    :
-}
-
-do_install () {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c=
66/example
-    cp -r ${S} ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c=
66
-}
-
-FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c6=
6/example/*"
diff --git a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb b/recipes-ti/i=
pc/ipc-transport-qmss-rtos_git.bb
deleted file mode 100644
index 2dffc11e..00000000
--- a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-inherit ti-pdk
-require ipc-transport.inc
-
-PR =3D "${INC_PR}.4"
-
-LIC_FILES_CHKSUM =3D "file://TransportQmss.xdc;beginline=3D1;endline=3D3=
5;md5=3Dad783760d74a4cc5b8d4ad3d8a1f28a2"
-
-COMPATIBLE_MACHINE =3D "k2hk|k2l|k2e"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEPENDS:append =3D " qmss-lld-rtos \
-                   cppi-lld-rtos \
-                   ti-ipc-rtos \
-                   ipc-transport-common-rtos \
-"
-
-IPC_TRANSPORT_QMSS_DESTSUFFIX =3D "git/c66/qmss"
-
-S =3D "${WORKDIR}/${IPC_TRANSPORT_QMSS_DESTSUFFIX}"
-
-export IPC_INSTALL_PATH =3D "${IPC_INSTALL_DIR}"
-XDCPATH:append =3D ";${IPC_INSTALL_DIR}/packages"
diff --git a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb b/recipes-ti/i=
pc/ipc-transport-qmss-test_git.bb
deleted file mode 100644
index 158d1856..00000000
--- a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-include ipc-transport-qmss.inc
-
-PR =3D "${INC_PR}.0"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEPENDS =3D "ipc-transport-qmss ti-ipc"
-
-#FILES_${PN}-test =3D "${bindir}/multiProcessTest_*.out"
-
-CHOICELIST =3D "yes no"
-
-DEVICELIST:k2hk =3D "k2h k2k"
-DEVICELIST:k2e  =3D "k2e"
-DEVICELIST:k2l  =3D "k2l"
-
-do_compile () {
-#   Now build the test code
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake tests \
-				IPC_DEVKIT_INSTALL_PATH=3D${STAGING_INCDIR} \
-				USEDYNAMIC_LIB=3D"$choice" DEVICE=3D"$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin \
-			INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D"$device"
-	done
-
-}
diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc b/recipes-ti/ipc/ipc-t=
ransport-qmss.inc
deleted file mode 100644
index 04705269..00000000
--- a/recipes-ti/ipc/ipc-transport-qmss.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "TI QMSS-Based IPC MessageQ Transport"
-LICENSE =3D "BSD-3-Clause"
-
-require ipc-transport.inc
-
-INC_PR:append =3D ".1"
-
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D27bb0deb260c60120a8d7b91d=
a7c3b02"
-
-COMPATIBLE_MACHINE =3D "keystone"
-
-S =3D "${WORKDIR}/git/linux/qmss"
-
-EXTRA_OEMAKE +=3D "PDK_INSTALL_PATH=3D${STAGING_INCDIR} TRANS_QMSS_SRC_D=
IR=3D${S}"
diff --git a/recipes-ti/ipc/ipc-transport-qmss_git.bb b/recipes-ti/ipc/ip=
c-transport-qmss_git.bb
deleted file mode 100644
index 93136670..00000000
--- a/recipes-ti/ipc/ipc-transport-qmss_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-include ipc-transport-qmss.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS =3D "ti-ipc mpm-transport"
-
-do_compile () {
-#   Now build the transport
-	oe_runmake clean
-	oe_runmake lib
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir} \
-		INSTALL_LIB_BASE_DIR=3D${D}${libdir}
-	chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libTransportQmss.a"
diff --git a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb b/recipes-ti/i=
pc/ipc-transport-srio-rtos_git.bb
deleted file mode 100644
index 52720916..00000000
--- a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-inherit ti-pdk
-require ipc-transport.inc
-
-PR =3D "${INC_PR}.2"
-
-LIC_FILES_CHKSUM =3D "file://TransportSrio.xdc;beginline=3D1;endline=3D3=
5;md5=3D4d466471e4b933a0cc353a46bb546fe7"
-
-COMPATIBLE_MACHINE =3D "k2hk"
-
-DEPENDS:append =3D " qmss-lld-rtos \
-                   cppi-lld-rtos \
-                   srio-lld-rtos \
-                   ti-ipc-rtos \
-                   ipc-transport-common-rtos \
-"
-
-IPC_TRANSPORT_SRIO_DESTSUFFIX =3D "git/c66/srio"
-
-S =3D "${WORKDIR}/${IPC_TRANSPORT_SRIO_DESTSUFFIX}"
-
-export IPC_INSTALL_PATH =3D "${IPC_INSTALL_DIR}"
-XDCPATH:append =3D ";${IPC_INSTALL_DIR}/packages"
diff --git a/recipes-ti/ipc/ipc-transport-srio-test_git.bb b/recipes-ti/i=
pc/ipc-transport-srio-test_git.bb
deleted file mode 100644
index 4e23fb21..00000000
--- a/recipes-ti/ipc/ipc-transport-srio-test_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-include ipc-transport-srio.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS =3D "ipc-transport-srio ipc-transport-qmss ti-ipc"
-
-DEVICELIST =3D "k2h k2k"
-
-CHOICELIST =3D "yes no"
-
-do_compile () {
-#   Now build the test code
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake tests \
-				IPC_DEVKIT_INSTALL_PATH=3D${STAGING_INCDIR} \
-				USEDYNAMIC_LIB=3D"$choice" DEVICE=3D"$device"
-		done
-	done
-}
-
-do_install () {
-
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin \
-			INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D"$device"
-	done
-
-}
diff --git a/recipes-ti/ipc/ipc-transport-srio.inc b/recipes-ti/ipc/ipc-t=
ransport-srio.inc
deleted file mode 100644
index 89425703..00000000
--- a/recipes-ti/ipc/ipc-transport-srio.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "TI SRIO-Based IPC MessageQ Transport"
-LICENSE =3D "BSD-3-Clause"
-
-require ipc-transport.inc
-
-INC_PR:append =3D ".1"
-
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D27bb0deb260c60120a8d7b91d=
a7c3b02"
-
-COMPATIBLE_MACHINE =3D "k2hk"
-
-S =3D "${WORKDIR}/git/linux/srio"
-
-EXTRA_OEMAKE +=3D "PDK_INSTALL_PATH=3D${STAGING_INCDIR} TRANS_SRIO_SRC_D=
IR=3D${S}"
diff --git a/recipes-ti/ipc/ipc-transport-srio_git.bb b/recipes-ti/ipc/ip=
c-transport-srio_git.bb
deleted file mode 100644
index 6001585a..00000000
--- a/recipes-ti/ipc/ipc-transport-srio_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-include ipc-transport-srio.inc
-
-PR =3D "${INC_PR}.0"
-
-DEPENDS =3D "ti-ipc mpm-transport"
-
-do_compile () {
-#   Now build the transport
-	oe_runmake clean
-	oe_runmake lib
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir} \
-		INSTALL_LIB_BASE_DIR=3D${D}${libdir}
-	chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/libTransportSrio.a"
diff --git a/recipes-ti/ipc/ipc-transport.inc b/recipes-ti/ipc/ipc-transp=
ort.inc
deleted file mode 100644
index 0c1edef1..00000000
--- a/recipes-ti/ipc/ipc-transport.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-
-IPC_TRANSPORT_GIT_URI =3D "git://git.ti.com/keystone-linux/ipc-transport=
.git"
-IPC_TRANSPORT_GIT_PROTOCOL =3D "git"
-IPC_TRANSPORT_GIT_BRANCH =3D "master"
-
-# Below commit ID corresponds to "DEV.IPC-TRANSPORT.02.00.00.02A"
-IPC_TRANSPORT_SRCREV =3D "f75e2e29b9b1b63443a0c82493e41dd2f771c6f5"
-
-BRANCH =3D "${IPC_TRANSPORT_GIT_BRANCH}"
-SRC_URI =3D "${IPC_TRANSPORT_GIT_URI};protocol=3D${IPC_TRANSPORT_GIT_PRO=
TOCOL};branch=3D${BRANCH}"
-
-SRCREV =3D "${IPC_TRANSPORT_SRCREV}"
-PV =3D "02.00.00.02A"
-INC_PR =3D "r0"
diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/m=
pm-transport/mpm-transport_git.bb
deleted file mode 100644
index 3b80af34..00000000
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-DESCRIPTION =3D "Multiproc transport layer for KeyStone devices: Provide=
 basic transport layer for moving data between different processing nodes=
"
-HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-linux/mpm-transpo=
rt.git"
-LICENSE =3D "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D122b7757f366f3f6fe1198871=
5258fc9"
-COMPATIBLE_MACHINE =3D "keystone"
-
-DEPENDS =3D "common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-=
lld uio-module-drv"
-DEPENDS:append:k2hk =3D " hyplnk-lld srio-lld"
-DEPENDS:append:k2e =3D " hyplnk-lld"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-SRC_URI =3D "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=3D=
git;branch=3D${BRANCH}"
-
-BRANCH =3D "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.04.00
-SRCREV =3D "e0e44fe55bef7ddf89f7ff3574f07fa906e72a37"
-
-PV =3D "2.0.4.0"
-PR =3D "r0"
-
-CC +=3D "-fcommon"
-EXTRA_OEMAKE =3D "PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
-EXTRA_OEMAKE:append:k2hk =3D " HYPLNK_TRANSPORT=3Dtrue SRIO_TRANSPORT=3D=
true"
-EXTRA_OEMAKE:append:k2e =3D " HYPLNK_TRANSPORT=3Dtrue"
-INSANE_SKIP:${PN} +=3D "ldflags"
-
-S =3D "${WORKDIR}/git"
-
-PACKAGES =3D+ "${PN}-test"
-FILES:${PN}-test =3D "${bindir}/mpm_transport_test.out \
-					${bindir}/mpm_transport_hyplnk_loopback.out \
-					${bindir}/mpm_transport_hyplnk_remote.out \
-					${bindir}/mpm_transport_hyplnk_loopback_dma.out \
-					${bindir}/mpm_transport_hyplnk_loopback64.out \
-					${bindir}/mpm_transport_qmss_arm_mt.out \
-					${bindir}/mpm_transport_srio_arm_mt.out"
-
-do_install() {
-	oe_runmake installbin BASE_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}/${bin=
dir}
-
-	install -d ${D}${includedir}/
-	install -c -m 644 ${S}/include/* ${D}${includedir}/
-
-	install -d ${D}${libdir}/
-	cp  -a --preserve=3Dmode,timestamps --no-preserve=3Downership ${S}/lib/=
* ${D}${libdir}/
-
-	install -d ${D}${sysconfdir}/mpm/
-	install -c -m 644 ${S}/scripts/mpm_config.json ${D}${sysconfdir}/mpm/mp=
m_config.json
-}
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb b/recipes-t=
i/multiprocmgr/multiprocmgr-rtos_git.bb
deleted file mode 100644
index 41efe38b..00000000
--- a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY =3D "TI Multiproc Manager (RTOS) for KeyStone II"
-DESCRIPTION =3D "Provides download, debug and other utilities for other =
cores in the SOC like DSP"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/multiprocmgr/multiprocmgr.inc
-
-DEPENDS =3D "ti-cgt6x-native"
-
-PR =3D "${INC_PR}.2"
-
-PACKAGES =3D+ "${PN}-test"
-FILES:${PN}-test =3D "${datadir}/ti/examples/mpm/test/filetestdemo/c66x/=
demo_loopback/build/bin/*.out \
-                    ${datadir}/ti/examples/mpm/test/sync_test/c66x/bin/*=
.out"
-
-EXTRA_OEMAKE =3D "LOCAL_SYSROOT=3D"${STAGING_DIR_TARGET}" \
-                C6X_GEN_INSTALL_PATH=3D"${STAGING_DIR_NATIVE}/usr/share/=
ti/cgt-c6x" \
-               "
-
-do_compile() {
-    oe_runmake c66x
-    oe_runmake test_c66x
-}
-
-do_install() {
-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
-    install -d ${D}${MPM_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${MPM_INSTALL_DIR_RECIPE}
-
-    # Copy C66x binaries
-    install -d ${D}${datadir}/ti/examples/mpm/test/filetestdemo/c66x/dem=
o_loopback/build/bin
-    cp ${S}/test/filetestdemo/c66x/demo_loopback/build/bin/*.out \
-        ${D}${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopb=
ack/build/bin/
-    install -d ${D}${datadir}/ti/examples/mpm/test/sync_test/c66x/bin
-    cp ${S}/test/sync_test/c66x/bin/*.out \
-        ${D}${datadir}/ti/examples/mpm/test/sync_test/c66x/bin/
-}
-
-FILES:${PN}-dev +=3D "${MPM_INSTALL_DIR_RECIPE}"
-INSANE_SKIP:${PN}-dev =3D "arch"
-INSANE_SKIP:${PN}-test =3D "arch"
-
-RDEPENDS:${PN}-dev =3D "bash"
-
-ALLOW_EMPTY:${PN} =3D "1"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-t=
i/multiprocmgr/multiprocmgr-test_git.bb
deleted file mode 100644
index 3d1b3aee..00000000
--- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY =3D "TI Multiproc Manager test code"
-
-include multiprocmgr.inc
-
-PR =3D "${INC_PR}.2"
-
-DEPENDS =3D "multiprocmgr cmem"
-RDEPENDS:${PN} =3D "multiprocmgr mpm-transport cmem"
-RDEPENDS:${PN} +=3D "multiprocmgr-rtos-test bash"
-
-FILES:${PN} +=3D "\
-    ${datadir}/ti/examples/mpm \
-"
-
-FILES:${PN}-dbg +=3D "\
-    ${datadir}/ti/examples/mpm/*/.debug \
-"
-
-do_compile() {
-	oe_runmake -C ${S} test
-}
-
-do_install() {
-	# Copy Sources and binary
-	install -d ${D}${datadir}/ti/examples/mpm/src
-	cp -r ${S}/src/mailbox ${D}${datadir}/ti/examples/mpm/src
-	cp -r ${S}/src/sync ${D}${datadir}/ti/examples/mpm/src
-	cp -r ${S}/test ${D}${datadir}/ti/examples/mpm
-}
-
-INSANE_SKIP:${PN} =3D "ldflags staticdev"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multip=
rocmgr/multiprocmgr.inc
deleted file mode 100644
index 64fb6f6f..00000000
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-linux/multi-proc-=
manager.git"
-LICENSE =3D "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfce208c498eb9669223724dc9=
c1d8fe4"
-SECTION =3D "console"
-COMPATIBLE_MACHINE =3D "keystone"
-
-MULTIPROCMGR_GIT_URI =3D "git://git.ti.com/keystone-linux/multi-proc-man=
ager.git"
-MULTIPROCMGR_GIT_PROTOCOL =3D "git"
-MULTIPROCMGR_GIT_BRANCH =3D "master"
-
-# The following commits correspond to DEV.MPM-3.00.05.00
-MULTIPROCMGR_SRCREV =3D "810d8a31c797d07abe808cb3fa89465fa934d4dd"
-
-PV =3D "3.0.5.0"
-INC_PR =3D "r1"
-
-BRANCH =3D "${MULTIPROCMGR_GIT_BRANCH}"
-SRC_URI =3D "${MULTIPROCMGR_GIT_URI};protocol=3D${MULTIPROCMGR_GIT_PROTO=
COL};branch=3D${BRANCH}"
-SRCREV =3D "${MULTIPROCMGR_SRCREV}"
-
-S =3D "${WORKDIR}/git"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service b=
/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service
deleted file mode 100644
index 40eb4650..00000000
--- a/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service
+++ /dev/null
@@ -1,14 +0,0 @@
-[Unit]
-Description=3DTI Multiproc Manager
-
-[Service]
-ExecStartPre=3D/sbin/modprobe keystone_remoteproc
-ExecStartPre=3D/sbin/modprobe keystone_dsp_mem
-ExecStartPre=3D/sbin/modprobe uio_module_drv
-
-Type=3Dforking
-PIDFile=3D/var/run/mpm/pid
-ExecStart=3D/usr/bin/mpmsrv
-
-[Install]
-WantedBy=3Dbasic.target
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/mul=
tiprocmgr/multiprocmgr_git.bb
deleted file mode 100644
index 1bd24885..00000000
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY =3D "TI Multiproc Manager for KeyStone II"
-DESCRIPTION =3D "Provides download, debug and other utilities for other =
cores in the SOC like DSP"
-
-include multiprocmgr.inc
-
-SRC_URI +=3D " \
-	file://mpmsrv-daemon.service \
-"
-
-PR =3D "${INC_PR}.2"
-
-DEPENDS =3D "mpm-transport libdaemon virtual/kernel cmem"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-INITSCRIPT_NAME =3D "mpmsrv-daemon.sh"
-INITSCRIPT_PARAMS =3D "defaults 10"
-
-SYSTEMD_SERVICE:${PN} =3D "mpmsrv-daemon.service"
-
-inherit update-rc.d systemd
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/bin/mpmsrv ${D}${bindir}/mpmsrv
-	install -c -m 755 ${S}/bin/mpmcl ${D}${bindir}/mpmcl
-
-	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/mpmsrv-daemon.service ${D}${systemd_system_u=
nitdir}
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 755 ${S}/scripts/mpmsrv-daemon.sh ${D}${sysconfdir}/init.=
d/${INITSCRIPT_NAME}
-
-	install -d ${D}${sysconfdir}/mpm/
-	install -c -m 755 ${S}/scripts/crash_callback.sh ${D}${sysconfdir}/mpm/=
crash_callback.sh
-
-	install -d ${D}${includedir}/
-	install -c -m 755 ${S}/include/* ${D}${includedir}/
-
-	install -d ${D}${libdir}/
-	cp -a ${S}/lib/* ${D}${libdir}/
-	chown -R root:root ${D}${libdir}/
-}
-
-INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc
deleted file mode 100644
index 89c1adf8..00000000
--- a/recipes-ti/ndk/ti-ndk.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY =3D "TI RTOS_Networking"
-HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/ndk/index.html"
-SECTION =3D "devel"
-LICENSE =3D "BSD"
-
-require recipes-ti/includes/ti-paths.inc
-
-S =3D "${WORKDIR}/ndk_${PV}"
-SRC_URI =3D "http://software-dl.ti.com/targetcontent/ndk/${PV}/exports/n=
dk_${PV}.zip;name=3Dndkzip"
-
-do_install() {
-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
-    install -d ${D}${NDK_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${NDK_INSTALL_DIR_RECIPE}
-}
-
-ALLOW_EMPTY:${PN} =3D "1"
-FILES:${PN}-dev +=3D "${NDK_INSTALL_DIR_RECIPE}"
-
-INSANE_SKIP:${PN}-dev =3D "arch ldflags staticdev file-rdeps"
diff --git a/recipes-ti/ndk/ti-ndk_3.61.01.01.bb b/recipes-ti/ndk/ti-ndk_=
3.61.01.01.bb
deleted file mode 100644
index 41e8bc1e..00000000
--- a/recipes-ti/ndk/ti-ndk_3.61.01.01.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require ti-ndk.inc
-
-PE =3D "1"
-PV =3D "3_61_01_01"
-PR =3D "r0"
-
-LIC_FILES_CHKSUM =3D "file://manifest_ndk_${PV}.html;md5=3D871c716abcf52=
bac5a7c23154eaba3b6"
-
-SRC_URI[ndkzip.md5sum] =3D "87f0494c9faee344fe93ae68e71ca189"
-SRC_URI[ndkzip.sha256sum] =3D "3bfca50367432603ebc1d53d9185302bb4fa4558a=
c766696f086dc7a5a2ccd29"
-
-INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INHIBIT_SYSROOT_STRIP =3D "1"
-
-COMPATIBLE_HOST ?=3D "null"
-COMPATIBLE_HOST:ti-soc =3D "(.*)"
diff --git a/recipes-ti/ns/ti-ns.inc b/recipes-ti/ns/ti-ns.inc
deleted file mode 100644
index a6b37c6b..00000000
--- a/recipes-ti/ns/ti-ns.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY =3D "TI Network Services"
-HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/ns/index.html"
-SECTION =3D "devel"
-LICENSE =3D "BSD"
-
-require recipes-ti/includes/ti-paths.inc
-
-S =3D "${WORKDIR}/ns_${PV}"
-
-SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/ns/${PV}/exports/ns_${PV}.zip;name=3Dnszip"
-
-do_install() {
-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
-    install -d ${D}${NS_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${NS_INSTALL_DIR_RECIPE}
-}
-
-ALLOW_EMPTY:${PN} =3D "1"
-FILES:${PN}-dev +=3D "${NS_INSTALL_DIR_RECIPE}"
-
-INSANE_SKIP:${PN}-dev =3D "arch ldflags staticdev file-rdeps"
diff --git a/recipes-ti/ns/ti-ns_2.60.01.06.bb b/recipes-ti/ns/ti-ns_2.60=
.01.06.bb
deleted file mode 100644
index 36a9003b..00000000
--- a/recipes-ti/ns/ti-ns_2.60.01.06.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require ti-ns.inc
-
-PE =3D "1"
-PV =3D "2_60_01_06"
-PR =3D "r0"
-SRC_URI =3D "http://software-dl.ti.com/targetcontent/ns/${PV}/exports/ns=
_${PV}.zip;name=3Dnszip"
-
-LIC_FILES_CHKSUM =3D "file://manifest_ns_${PV}.html;md5=3De15dc261b0ef14=
c6fbabba24abcde4f0"
-
-SRC_URI[nszip.md5sum] =3D "b78d86423e9c4d148be5fba5903cc2c7"
-SRC_URI[nszip.sha256sum] =3D "f66b2fda6ab02585020e67d84897305209f3e14184=
7581a214ccf123c3f15f00"
-
-INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INHIBIT_SYSROOT_STRIP =3D "1"
diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-t=
i/ti-pdk-build/ti-pdk-build-rtos_git.bb
deleted file mode 100644
index 6b491dcc..00000000
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION =3D "Package containing PDK makefile infrastructure"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;beginline=3D1;endline=3D31;md5=3D=
92ab6f5e10f1502081c6080207e57ec1"
-
-require recipes-ti/includes/ti-paths.inc
-
-PR =3D "r0"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP =3D "ti.build"
-
-PE =3D "1"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PARALLEL_MAKE =3D ""
-CLEANBROKEN =3D "1"
-
-do_compile() {
-    :
-}
-
-EXTRA_OEMAKE =3D "-f make_install LIMIT_SOCS=3D"${TI_PDK_LIMIT_SOCS}" PD=
K_INSTALL_DIR=3D"${D}${PDK_INSTALL_DIR_RECIPE}""
-
-do_install() {
-    oe_runmake
-}
-
-FILES:${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-INSANE_SKIP:${PN} +=3D " file-rdeps"
diff --git a/recipes-ti/udma/udma_git.bb b/recipes-ti/udma/udma_git.bb
deleted file mode 100644
index b6100a37..00000000
--- a/recipes-ti/udma/udma_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION =3D "Provides zero copy access from user-space to packet dma=
 channels via udma kernel driver"
-LICENSE =3D "BSD-3-Clause"
-
-COMPATIBLE_MACHINE =3D "keystone"
-LIC_FILES_CHKSUM =3D "file://include/udma.h;startline=3D1;endline=3D39;m=
d5=3Dba3c7f91f970afe073b759ced61d0f27"
-
-BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/keystone-linux/udma.git;protocol=3Dgit;bra=
nch=3D${BRANCH}"
-S =3D "${WORKDIR}/git"
-# Commit corresponds to UDMA.01.00.00.00
-SRCREV =3D "53d09fb0bc98c41c5eb43623097e363c497d6fd8"
-
-PV =3D "01.00.00.00"
-
-PACKAGES =3D+ "${PN}-test"
-
-FILES:${PN}-test =3D "${bindir}/udma_test"
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -d ${D}${libdir}/
-	install -d ${D}${includedir}/
-	install -c -m 755 ${S}/udma_test ${D}${bindir}/
-	install -c -m 755 ${S}/libudma.a ${D}${libdir}/
-	install -c -m 755 ${S}/libudma.so ${D}${libdir}/libudma.so.1.0.0
-	cd ${D}${libdir}/
-	ln -sf libudma.so.1.0.0 libudma.so.1
-	ln -sf libudma.so.1.0.0 libudma.so
-	install -c -m 755 ${S}/include/* ${D}${includedir}/
-}
-
-INSANE_SKIP:${PN} +=3D "textrel"
--=20
2.25.1

