Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.20897.1643238549588955751
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E487D40CD0;
	Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54xg40dMxPlW; Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A723540CC8;
	Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9B66C174735;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 13/19] classes,recipes: remove K1/2 PDK RTOS support, FWs and IPC transports
Date: Wed, 26 Jan 2022 18:08:53 -0500
Message-Id: <1643238539-20686-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Remove deprecated support for compiling Keystone1/2 RTOS components and
Linux firmwares using PDK, CSL, etc.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 classes/ti-pdk-fetch.bbclass                       |  47 -------
 classes/ti-pdk.bbclass                             | 144 --------------------
 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb  |  38 ------
 recipes-bsp/board-rtos/board-rtos_git.bb           |  76 -----------
 recipes-bsp/boot-monitor/boot-monitor_git.bb       |  47 -------
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb        |  41 ------
 .../common-csl-ip/common-csl-ip-rtos_git.bb        |  23 ----
 recipes-bsp/common-csl-ip/common-csl-ip.inc        |  23 ----
 recipes-bsp/common-csl-ip/common-csl-ip_git.bb     |  17 ---
 .../common-csl-ip/csl-rti-dwwdtest-fw_git.bb       |  77 -----------
 recipes-bsp/dsptop/temperature-module-drv_git.bb   |  18 ---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb           |  28 ----
 .../faultmanagement/faultmanagement-rtos_git.bb    |  36 -----
 recipes-bsp/fvid2/fvid2-rtos_git.bb                |  67 ----------
 recipes-bsp/hplib/hplib-mod_git.bb                 |  22 ----
 recipes-bsp/hplib/hplib-test_git.bb                |  32 -----
 recipes-bsp/hplib/hplib.inc                        |  20 ---
 recipes-bsp/hplib/hplib_git.bb                     |  33 -----
 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb          |  75 -----------
 recipes-bsp/mad-utils/mad-utils-rtos_git.bb        |  57 --------
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb         |  50 -------
 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb         |  23 ----
 recipes-bsp/osal/osal-rtos_git.bb                  |  18 ---
 recipes-bsp/osal/osal-test_git.bb                  |  20 ---
 recipes-bsp/osal/osal.inc                          |  15 ---
 recipes-bsp/osal/osal_git.bb                       |  21 ---
 recipes-bsp/pktlib/pktlib-rtos_git.bb              |  10 --
 recipes-bsp/pktlib/pktlib.inc                      |  24 ----
 recipes-bsp/pktlib/pktlib_git.bb                   |  19 ---
 recipes-bsp/pru/pru-pwm-fw_git.bb                  |  39 ------
 ...s_uart-add-Makefile-for-building-firmware.patch | 145 ---------------------
 ...01-icss_uart-remove-dependency-on-PDK-CSL.patch |  54 --------
 recipes-bsp/pru/pru-swuart-fw_git.bb               |  40 ------
 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb       |  26 ----
 recipes-bsp/sciclient/sciclient-rtos_git.bb        | 125 ------------------
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb    |  35 -----
 recipes-bsp/serdes-fw/serdes-fw_git.bb             |  27 ----
 recipes-bsp/srss-tc/srss-tc_git.bb                 |  33 -----
 recipes-bsp/starterware/starterware-rtos_git.bb    |  33 -----
 recipes-bsp/starterware/starterware.inc            |  21 ---
 recipes-bsp/starterware/starterware_git.bb         |  16 ---
 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb     |  33 -----
 recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb        |  37 ------
 .../traceframework/traceframework-rtos_git.bb      |  10 --
 recipes-bsp/traceframework/traceframework.inc      |  27 ----
 recipes-bsp/traceframework/traceframework_git.bb   |  40 ------
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb    |  19 ---
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb   |  29 -----
 recipes-bsp/transport-rtos/nimu-rtos_git.bb        |  35 -----
 recipes-bsp/transport-rtos/timesync-rtos_git.bb    |  31 -----
 recipes-bsp/transport-rtos/transport.inc           |  11 --
 recipes-bsp/utils-rtos/profiling-rtos_git.bb       |  26 ----
 recipes-bsp/utils-rtos/trace-rtos_git.bb           |  28 ----
 recipes-bsp/wdtimer/wdtimer-rtos_git.bb            |  29 -----
 recipes-ti/includes/ti-paths.inc                   |   4 -
 recipes-ti/ipc/ipc-transport-common-rtos_git.bb    |  23 ----
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb      |  23 ----
 recipes-ti/ipc/ipc-transport-qmss-test_git.bb      |  37 ------
 recipes-ti/ipc/ipc-transport-qmss.inc              |  14 --
 recipes-ti/ipc/ipc-transport-qmss_git.bb           |  19 ---
 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb      |  22 ----
 recipes-ti/ipc/ipc-transport-srio-test_git.bb      |  32 -----
 recipes-ti/ipc/ipc-transport-srio.inc              |  14 --
 recipes-ti/ipc/ipc-transport-srio_git.bb           |  19 ---
 recipes-ti/ipc/ipc-transport.inc                   |  15 ---
 recipes-ti/mpm-transport/mpm-transport_git.bb      |  50 -------
 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb   |  44 -------
 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb   |  31 -----
 recipes-ti/multiprocmgr/multiprocmgr.inc           |  21 ---
 .../multiprocmgr/mpmsrv-daemon.service             |  14 --
 recipes-ti/multiprocmgr/multiprocmgr_git.bb        |  44 -------
 recipes-ti/ndk/ti-ndk.inc                          |  20 ---
 recipes-ti/ndk/ti-ndk_3.61.01.01.bb                |  17 ---
 recipes-ti/ns/ti-ns.inc                            |  21 ---
 recipes-ti/ns/ti-ns_2.60.01.06.bb                  |  15 ---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb   |  32 -----
 recipes-ti/udma/udma_git.bb                        |  32 -----
 77 files changed, 2633 deletions(-)
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
 delete mode 100644 recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
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
 delete mode 100644 recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Makefile-for-building-firmware.patch
 delete mode 100644 recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-dependency-on-PDK-CSL.patch
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
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr_git.bb
 delete mode 100644 recipes-ti/ndk/ti-ndk.inc
 delete mode 100644 recipes-ti/ndk/ti-ndk_3.61.01.01.bb
 delete mode 100644 recipes-ti/ns/ti-ns.inc
 delete mode 100644 recipes-ti/ns/ti-ns_2.60.01.06.bb
 delete mode 100644 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
 delete mode 100644 recipes-ti/udma/udma_git.bb

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
deleted file mode 100644
index e4c55e3..0000000
--- a/classes/ti-pdk-fetch.bbclass
+++ /dev/null
@@ -1,47 +0,0 @@
-TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
-TI_PDK_GIT_BRANCH ?= "master"
-TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "a1ace885998e9adbcbbd0abf8b9ded6ba9ec54ff"
-
-TI_PDK_VERSION ?= "2020.5.6"
-
-PV = "${TI_PDK_VERSION}"
-PE = "2"
-
-TI_PDK_COMP ?= ""
-TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
-
-TI_PDK_SOURCE_PN = "ti-pdk-source"
-TI_PDK_SOURCE_WORKDIR = "${TMPDIR}/work-shared/ti-pdk-${PV}"
-TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
-
-S = "${@'${WORKDIR}/git/${TI_PDK_COMP_PATH}'.rstrip('/')}"
-
-# Hard-link only required sources from PDK
-python do_unpack:append() {
-    if len(d.getVar('TI_PDK_COMP') or '') > 0:
-        import shutil
-
-        # Get src/dst paths
-        src = os.path.join(d.getVar('TI_PDK_SOURCE'),'packages',d.getVar('TI_PDK_COMP_PATH'))
-        s = d.getVar('S')
-
-        # Set up the directory structure, except for the root of the sources
-        # hard-linked.
-        bb.utils.mkdirhier(s)
-        os.rmdir(s)
-
-        # Recursively hard-link the sources
-        shutil.copytree(src, s, copy_function=os.link)
-
-        # Recursively hard-link the git directory
-        shutil.copytree(os.path.join(d.getVar('TI_PDK_SOURCE'),'.git'), os.path.join(s,'.git'), copy_function=os.link)
-}
-
-# Make sure that ti-pdk-source is unpacked before we set up the hardlinks.
-python __anonymous () {
-    pn = d.getVar('PN')
-    pdk_src_pn = d.getVar('TI_PDK_SOURCE_PN')
-    if pn != pdk_src_pn:
-        d.appendVarFlag('do_unpack', 'depends', ' ${TI_PDK_SOURCE_PN}:do_unpack')
-}
diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
deleted file mode 100644
index aa0568e..0000000
--- a/classes/ti-pdk.bbclass
+++ /dev/null
@@ -1,144 +0,0 @@
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-inherit perlnative
-
-DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-baremetal-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native"
-
-DEPENDS:append:omap-a15 = " ti-cgt-arm-native"
-DEPENDS:remove:ti33x = "ti-cgt6x-native"
-DEPENDS:remove:ti43x = "ti-cgt6x-native"
-DEPENDS:append:omapl1 = " ti-cgt-arm-native"
-DEPENDS:remove:am65xx = "gcc-arm-baremetal-native ti-cgt6x-native"
-DEPENDS:append:am65xx = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
-DEPENDS:remove:j7 = "gcc-arm-baremetal-native"
-DEPENDS:append:j7 = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-# HTML hyperlink text
-PDK_COMP_LINK_TEXT ?= ""
-
-DOC_FILE = "API_Documentation_${PN}.html"
-
-create_doc_link () {
-    PDK_COMP_DIR=`get_build_dir_bash`
-
-    echo "<a href=\"${PDK_COMP_DIR}/docs/doxygen/html/index.html\">${PDK_COMP_LINK_TEXT}</a>" >> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras/doc/${DOC_FILE}
-}
-
-get_build_dir_bash() {
-  if [ -f ${S}/package.xdc ]
-  then
-    grep '^package' ${S}/package.xdc | sed -e 's|\[.*$||' | awk '{ print $2 }' | sed -e 's|\.|/|g'
-  else
-    echo ${S}
-    return 1
-  fi
-}
-
-export CROSS_TOOL_PRFX="arm-none-eabi-"
-export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
-export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
-export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
-export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
-export TOOLCHAIN_PATH_Arm9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
-export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export C7X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c7x"
-export TOOLCHAIN_PATH_EVE = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-arp32"
-export CL_PRU_INSTALL_PATH = "${TI_CGT_PRU_INSTALL_DIR}"
-export TOOLCHAIN_PATH_GCC_ARCH64 = "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}"
-export TOOLCHAIN_PATH_R5 = "${M4_TOOLCHAIN_INSTALL_DIR}"
-
-export ROOTDIR = "${B}"
-export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
-export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
-export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
-
-export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
-export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
-
-TI_PDK_XDCMAKE ?= "1"
-
-# By default, only build the cores with available toolchains
-TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 mpu1_0 mcu1_0 mcu1_1 mcu2_0 mcu2_1 mcu3_0 mcu3_1 c66x c66xdsp_1 c66xdsp_2 c7x_1 arm9_0 c674x a9host a8host pru_0 pru_1"
-TI_PDK_LIMIT_SOCS ?= ""
-TI_PDK_LIMIT_BOARDS ?= ""
-TI_PDK_MAKE_TARGET ?= "release"
-TI_PDK_EXTRA_MAKE ?= ""
-TI_PDK_DOXYGEN_SUPPORT ?= "1"
-
-TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
-
-PARALLEL_XDC = "${@oe.utils.parallel_make_argument(d, '--jobs=%d')}"
-PARALLEL_MAKE = ""
-
-def get_doxygen_support(d):
-    if d.getVar('TI_PDK_DOXYGEN_SUPPORT') == '1':
-        return ''
-    return 'DOXYGEN_SUPPORT=no'
-
-EXTRA_OEMAKE = " \
-    LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" \
-    LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" \
-    LIMIT_CORES="${TI_PDK_LIMIT_CORES}" \
-    ${TI_PDK_EXTRA_MAKE} \
-    ${@get_doxygen_support(d)} \
-"
-
-do_configure() {
-    BUILD_DIR=${B}/`get_build_dir_bash`
-
-    mkdir -p ${BUILD_DIR}
-    cp -r ${S}/* ${BUILD_DIR}
-
-    if [ "${TI_PDK_XDCMAKE}" == "1" ]
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
-        if [ "${CLEANBROKEN}" != "1" ]
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
-    if [ "${TI_PDK_XDCMAKE}" == "1" ]
-    then
-        ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS="${TI_PDK_XDC_ARGS}" ROOTDIR="${ROOTDIR}" -PR .
-        ${XDC_INSTALL_DIR}/xdc release XDCARGS="${TI_PDK_XDC_ARGS}" -PR .
-    else
-        BUILD_DIR=${B}/`get_build_dir_bash`
-        cd ${BUILD_DIR}
-
-        oe_runmake ${TI_PDK_MAKE_TARGET}
-    fi
-}
-
-do_install () {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
-    
-    if [ "${PDK_COMP_LINK_TEXT}" != "" ]
-    then
-        install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras/doc
-        create_doc_link
-    fi
-}
-
-FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
deleted file mode 100644
index e40fb43..0000000
--- a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "TI RTOS Audio add-on software for k2g"
-
-inherit ti-pdk
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://audk2gaddonver.h;beginline=8;endline=47;md5=7a3996aaf1a3d3ca87358cf9b89bce3d"
-
-COMPATIBLE_MACHINE = "k2g"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-AUDK2G_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/audk2g-addon.git"
-AUDK2G_ADDON_GIT_PROTOCOL = "git"
-AUDK2G_ADDON_GIT_BRANCH = "master"
-AUDK2G_ADDON_GIT_DESTSUFFIX = "git/ti/addon/audk2g"
-
-# Below commit ID corresponds to "DEV.AUDK2G.01.04.00.00"
-AUDK2G_ADDON_SRCREV = "815180b45ceb1fa3c110f9979106c7f5aa8b3ca2"
-
-BRANCH = "${AUDK2G_ADDON_GIT_BRANCH}"
-SRC_URI = "${AUDK2G_ADDON_GIT_URI};destsuffix=${AUDK2G_ADDON_GIT_DESTSUFFIX};protocol=${AUDK2G_ADDON_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${AUDK2G_ADDON_SRCREV}"
-PV = "01.04.00.00"
-PR = "r0"
-
-S = "${WORKDIR}/git/ti/addon/audk2g"
-
-DEPENDS:append = " ti-sysbios \
-            gpio-lld-rtos \
-            i2c-lld-rtos \
-            board-rtos \
-"
-
-export PDK_AUDK2G_ROOT_PATH = "${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
deleted file mode 100644
index 50d66ad..0000000
--- a/recipes-bsp/board-rtos/board-rtos_git.bb
+++ /dev/null
@@ -1,76 +0,0 @@
-SUMMARY = "TI RTOS Board Library"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.board"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=9bed8e4ac2fb37fc627cefe49eb1c919"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-
-
-PR = "r0"
-
-DEPENDS:append = " i2c-lld-rtos \
-                   spi-lld-rtos \
-                   uart-lld-rtos \
-                   osal-rtos \
-"
-
-DEPENDS:append:omap-a15 = " ti-ndk \
-                            mmcsd-lld-rtos \
-                            pm-lld-rtos \
-"
-
-DEPENDS:append:am57xx-evm = " gpio-lld-rtos \
-                              icss-emac-lld-rtos \
-                              pruss-lld-rtos \
-"
-
-
-DEPENDS:append:ti33x = " gpio-lld-rtos \
-                         gpmc-lld-rtos \
-                         icss-emac-lld-rtos \
-                         mmcsd-lld-rtos \
-                         pruss-lld-rtos \
-                         starterware-rtos \
-                         ti-ndk \
-"
-
-DEPENDS:append:ti43x = " gpio-lld-rtos \
-                         gpmc-lld-rtos \
-                         icss-emac-lld-rtos \
-                         mmcsd-lld-rtos \
-                         pruss-lld-rtos \
-                         starterware-rtos \
-                         ti-ndk \
-"
-
-DEPENDS:append:dra7xx = " pm-lld-rtos \
-                          mmcsd-lld-rtos \
-"
-
-DEPENDS:append:am65xx = " sciclient-rtos \
-"
-DEPENDS:append:j7 = " udma-lld-rtos \
-                          sciclient-rtos \
-                          mmcsd-lld-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-
-export PDK_BOARD_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-XDCPATH:append = ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
deleted file mode 100644
index dee180f..0000000
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-DESCRIPTION = "Boot Monitor - TI ARM Boot monitor code"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
-
-COMPATIBLE_MACHINE = "keystone"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS = "u-boot-mkimage-native"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
-
-PV = "4.0+git${SRCPV}"
-
-BRANCH = "master"
-
-S = "${WORKDIR}/git"
-
-SRCREV = "d57d5c1d8f0b0b1487484d9ceb1595bd4507231a"
-
-BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
-
-FLOATABI = "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
-
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}" LD="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}""
-
-FILES:${PN} = "/boot"
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
diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
deleted file mode 100644
index 8ca4416..0000000
--- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "TI RTOS software supporting circular microphone array board"
-
-inherit ti-pdk
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://cmbaddonver.h;beginline=8;endline=47;md5=d0cb159bf210cfafed63042da01c83e0"
-
-COMPATIBLE_MACHINE = "k2g|omapl137-evm"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-CMB_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/circmicarray-addon.git"
-CMB_ADDON_GIT_PROTOCOL = "git"
-CMB_ADDON_GIT_BRANCH = "master"
-CMB_ADDON_GIT_DESTSUFFIX = "git/ti/addon"
-
-# Below commit ID corresponds to "DEV.CMB.01.01.00.03A"
-CMB_ADDON_SRCREV = "3655aad07f17d3a167ec7dcecb52450c1d2fe8be"
-
-SRCREV = "${CMB_ADDON_SRCREV}"
-PV = "01.01.00.03A"
-PR = "r0"
-
-BRANCH = "${CMB_ADDON_GIT_BRANCH}"
-SRC_URI = "${CMB_ADDON_GIT_URI};destsuffix=${CMB_ADDON_GIT_DESTSUFFIX};protocol=${CMB_ADDON_GIT_PROTOCOL};branch=${BRANCH}"
-
-
-S = "${WORKDIR}/git/ti/addon/cmb"
-
-DEPENDS:append = " ti-sysbios \
-            gpio-lld-rtos \
-            i2c-lld-rtos \
-            mcasp-lld-rtos \
-            board-rtos \
-"
-
-export PDK_CMB_ROOT_PATH = "${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
deleted file mode 100644
index 11baafc..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require common-csl-ip.inc
-PR = "${INC_PR}.6"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE:append = "|c66x|k3"
-
-inherit ti-pdk
-
-DEPENDS:remove = "${PN}"
-DEPENDS:remove = "ti-sysbios"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_CSL_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "CSL-Chip Support Library"
-
-# Workaround: dra7xx build requires am57xx CSL libraries for opencl-monitor
-TI_PDK_LIMIT_SOCS:append:dra7xx = " am571x am572x am574x"
-TI_PDK_LIMIT_BOARDS:append:dra7xx = " evmAM571x evmAM572x idkAM574x"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
deleted file mode 100644
index 23586fd..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Chip support library low level interface"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
-
-COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
-
-PV = "03.03.00.17B"
-INC_PR = "r0"
-PE = "2"
-
-CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
-CSL_GIT_PROTOCOL ="git"
-CSL_GIT_BRANCH = "release"
-CSL_GIT_DESTSUFFIX = "git"
-
-# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.17B"
-CSL_SRCREV = "027d26031709ad6a0e9f84625d11a3419e486467"
-
-BRANCH="${CSL_GIT_BRANCH}"
-SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
-SRCREV = "${CSL_SRCREV}"
-
-S = "${WORKDIR}/${CSL_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
deleted file mode 100644
index 6fffc7e..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require common-csl-ip.inc
-
-PR = "${INC_PR}.0"
-
-ALLOW_EMPTY:${PN} = "1"
-
-CLEANBROKEN = "1"
-
-do_compile() {
-    :
-}
-
-do_install () {
-    install -d ${D}${includedir}/ti/csl
-    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl
-    find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl
-}
diff --git a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb b/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
deleted file mode 100644
index a793659..0000000
--- a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
+++ /dev/null
@@ -1,77 +0,0 @@
-SUMMARY = "MCU Watchdog test firmware"
-DESCRIPTION = "Firmware for the R5F core to test the detection of watchdog timeout events to trigger SOC reset though DMSC."
-
-require recipes-bsp/common-csl-ip/common-csl-ip.inc
-require recipes-ti/includes/ti-paths.inc
-
-LIC_FILES_CHKSUM = "file://../../../COPYING.txt;md5=5857833e20836213677fac33f9aded21"
-
-S = "${WORKDIR}/${CSL_GIT_DESTSUFFIX}/example/rti/rti_dwwdtest_app"
-
-COMPATIBLE_MACHINE = "am65xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS = "ti-cgt-arm-native \
-           ti-pdk-build-rtos \
-           uart-lld-rtos \
-           board-rtos \
-           sciclient-rtos \
-           udma-lld-rtos"
-
-export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
-export TOOLCHAIN_PATH_R5 = "${M4_TOOLCHAIN_INSTALL_DIR}"
-
-EXTRA_OEMAKE = "WDT_RESET=enable DEST_ROOT=${S}"
-
-do_compile() {
-    for soc in ${TI_PDK_LIMIT_SOCS}
-    do
-        for board in ${TI_PDK_LIMIT_BOARDS}
-        do
-            oe_runmake SOC=$soc BOARD=$board
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
-        install -m 0644 csl_rti_dwwd_test_app/bin/$board/csl_rti_dwwd_test_app_mcu1_0_release.xer5f \
-                        ${D}${base_libdir}/firmware/rti_dwwdtest/$board
-    done
-}
-
-# Create separate package for each firmware so we can utilize
-# update-alternatives.
-PACKAGES =+ "${PN}-evm ${PN}-idk"
-RDEPENDS:${PN} = "${PN}-evm ${PN}-idk"
-ALLOW_EMPTY:${PN} = "1"
-
-FILES:${PN}-evm = "${base_libdir}/firmware/rti_dwwdtest/am65xx_evm"
-FILES:${PN}-idk = "${base_libdir}/firmware/rti_dwwdtest/am65xx_idk"
-
-# We are packaging R5 firmware
-INSANE_SKIP:${PN}-evm = "arch"
-INSANE_SKIP:${PN}-idk = "arch"
-
-# Configure update-alternatives as there may be other firmwares provided in an
-# image.
-inherit update-alternatives
-
-# It might be nice to dynamically declare the following based on
-# TI_PDK_LIMIT_BOARDS, but that is probably overkill.
-ALTERNATIVE:${PN}-evm = "am65x-mcu-r5f0_0-fw"
-ALTERNATIVE:${PN}-idk = "am65x-mcu-r5f0_0-fw"
-
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/am65x-mcu-r5f0_0-fw"
-
-ALTERNATIVE_TARGET_${PN}-evm = "${base_libdir}/firmware/rti_dwwdtest/am65xx_evm/csl_rti_dwwd_test_app_mcu1_0_release.xer5f"
-ALTERNATIVE_TARGET_${PN}-idk = "${base_libdir}/firmware/rti_dwwdtest/am65xx_idk/csl_rti_dwwd_test_app_mcu1_0_release.xer5f"
-
-# Use a lesser priority than ipc example fw
-# See meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb
-ALTERNATIVE_PRIORITY_${PN}-evm = "4"
-ALTERNATIVE_PRIORITY_${PN}-idk = "3"
diff --git a/recipes-bsp/dsptop/temperature-module-drv_git.bb b/recipes-bsp/dsptop/temperature-module-drv_git.bb
deleted file mode 100644
index 1f49ddf..0000000
--- a/recipes-bsp/dsptop/temperature-module-drv_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Smart Reflex Sub-System (SRSS) module driver for Keystone devices"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
-
-# This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR:append = "a"
-PR = "${MACHINE_KERNEL_PR}"
-PV:append = "+git${SRCPV}"
-
-S = "${WORKDIR}/git/temperature_module/temperature-mod"
-
-inherit module
-
-EXTRA_OEMAKE = "KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
-
-COMPATIBLE_MACHINE = "keystone"
-
-include dsptop.inc
diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
deleted file mode 100644
index 5255e58..0000000
--- a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "TI RTOS driver for FAT filesystem"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.fs.fatfs"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://FATFS.h;beginline=1;endline=32;md5=6619832755598d1cc2b01f2e6a1801d6"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0"
-
-DEPENDS:append = " mmcsd-lld-rtos \
-                   osal-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_FATFS_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "FATFS Library"
diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
deleted file mode 100644
index a999e81..0000000
--- a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "TI Fault management module for keystone devices"
-
-inherit ti-pdk
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://fault_mgmt.h;beginline=1;endline=41;md5=4be5df2b9c314da729e9e4f6cc0b2979"
-
-COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-FAULT_MANAGEMENT_GIT_URI = "git://git.ti.com/keystone-rtos/fault_mgmt.git"
-FAULT_MANAGEMENT_GIT_PROTOCOL = "git"
-FAULT_MANAGEMENT_GIT_BRANCH = "master"
-FAULT_MANAGEMENT_GIT_DESTSUFFIX = "git/ti/instrumentation/fault_mgmt"
-
-# Below commit ID corresponds to "DEV.FAULT_MGMT.01.00.01.04A"
-FAULT_MANAGEMENT_SRCREV = "67becdff0e3d181ab7b8fada226f5737517c1c52"
-
-BRANCH = "${FAULT_MANAGEMENT_GIT_BRANCH}"
-SRC_URI = "${FAULT_MANAGEMENT_GIT_URI};destsuffix=${FAULT_MANAGEMENT_GIT_DESTSUFFIX};protocol=${FAULT_MANAGEMENT_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${FAULT_MANAGEMENT_SRCREV}"
-PV = "01.00.01.04A"
-PR = "r0"
-
-S = "${WORKDIR}/${FAULT_MANAGEMENT_GIT_DESTSUFFIX}"
-
-DEPENDS:append:keystone = " qmss-lld-rtos \
-                            cppi-lld-rtos \
-                            pa-lld-rtos \
-"
-
-DEPENDS:append:k2hk = " aif2-lld-rtos \
-"
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "Fault Management"
diff --git a/recipes-bsp/fvid2/fvid2-rtos_git.bb b/recipes-bsp/fvid2/fvid2-rtos_git.bb
deleted file mode 100644
index b70a9b0..0000000
--- a/recipes-bsp/fvid2/fvid2-rtos_git.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-SUMMARY = "TI RTOS Video Driver Interface"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.fvid2"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://fvid2.h;beginline=1;endline=31;md5=83d177cf3df55c16b27ae4102b6ade9a"
-
-COMPATIBLE_MACHINE = "k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0"
-
-DEPENDS:append = " osal-rtos \
-"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-FVID2_PACKAGE_BASE   = "${WORKDIR}/fvid2_base"
-FVID2_ROOTPATH = "${FVID2_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/fvid2"
-
-export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
-export PDK_FVID2_ROOT_PATH = "${FVID2_PACKAGE_BASE}/package/all/pdk_/packages"
-
-
-BOARD_PACKAGE = ""
-BOARD_PACKAGE:am65xx = "am65xx_evm"
-BOARD_PACKAGE:j7 = "j721e_evm"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "FVID2"
-
-do_configure() {
-    rm -rf ${FVID2_PACKAGE_BASE}
-    cd ${S}
-
-    # remove any previous package
-    rm -f ${FVID2_PACKAGE_BASE}
-
-    # make the release package before building it
-    make package BOARD=${BOARD_PACKAGE} DEST_ROOT=${FVID2_PACKAGE_BASE} PDK_FVID2_COMP_PATH=${S}
-}
-
-do_compile() {
-    echo "fvid2 root path is ${FVID2_ROOTPATH}"
-    cd ${FVID2_ROOTPATH}
-
-    # Build am65xx libraries
-    make clean lib xdc_meta LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"  LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
-
-    #archive
-    tar -cf fvid2.tar --exclude='*.tar' ./*
-}
-
-do_install() {
-    cd ${FVID2_ROOTPATH}
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/fvid2
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/fvid2 \;
-}
-
-FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INSANE_SKIP:${PN} = "arch ldflags"
diff --git a/recipes-bsp/hplib/hplib-mod_git.bb b/recipes-bsp/hplib/hplib-mod_git.bb
deleted file mode 100644
index c992b12..0000000
--- a/recipes-bsp/hplib/hplib-mod_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "TI High Performance Library kernel module"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/runtime/hplib/module/COPYING.txt;md5=c1c4d3453cddc5b7f0ce84a277e66779"
-
-DEPENDS = "hplib"
-
-include hplib.inc
-
-# This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR:append = "b"
-PR = "${MACHINE_KERNEL_PR}"
-
-S ="${WORKDIR}/git/ti/runtime/hplib/module"
-EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR} PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-inherit module
-
-do_install () {
-	oe_runmake install INSTALL_MOD_PATH="${D}"
-}
-
-KERNEL_MODULE_AUTOLOAD += "hplibmod"
diff --git a/recipes-bsp/hplib/hplib-test_git.bb b/recipes-bsp/hplib/hplib-test_git.bb
deleted file mode 100644
index 4ba79db..0000000
--- a/recipes-bsp/hplib/hplib-test_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "TI High performance library test binaries"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
-
-DEPENDS = "common-csl-ip qmss-lld sa-lld pktlib hplib"
-
-include hplib.inc
-
-PR = "${INC_PR}.0"
-
-CHOICELIST = "yes no"
-
-S = "${WORKDIR}/git/ti/runtime/hplib"
-
-EXTRA_OEMAKE += '-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}'
-
-do_compile () {
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake tests HPLIB_SRC_DIR=${S} USEDYNAMIC_LIB=$choice DEVICE="$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
-	done
-}
diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
deleted file mode 100644
index 217a453..0000000
--- a/recipes-bsp/hplib/hplib.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-COMPATIBLE_MACHINE = "keystone"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEVICELIST:k2hk = "k2h k2k"
-DEVICELIST:k2l  = "k2l"
-DEVICELIST:k2e  = "k2e"
-
-HPLIB_GIT_URI = "git://git.ti.com/keystone-rtos/hplib.git"
-HPLIB_GIT_PROTOCOL = "git"
-HPLIB_GIT_BRANCH = "master"
-
-# Below Commit ID corresponds to "DEV.HPLIB.01.01.00.08"
-HPLIB_SRCREV = "5e9b27854f5d6f9f37a0ed8d7516d4874427cd8b"
-
-BRANCH = "${HPLIB_GIT_BRANCH}"
-SRC_URI = "${HPLIB_GIT_URI};protocol=${HPLIB_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${HPLIB_SRCREV}"
-
-PV = "01.01.00.08+git${SRCPV}"
-INC_PR = "r0"
diff --git a/recipes-bsp/hplib/hplib_git.bb b/recipes-bsp/hplib/hplib_git.bb
deleted file mode 100644
index 0ccd148..0000000
--- a/recipes-bsp/hplib/hplib_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "TI High performance libraries"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
-
-DEPENDS = "common-csl-ip rm-lld qmss-lld sa-lld pktlib"
-RDEPENDS:${PN} = "hplib-mod"
-
-include hplib.inc
-
-PR = "${INC_PR}.0"
-
-CHOICELIST = "yes no"
-
-S = "${WORKDIR}/git/ti/runtime/hplib"
-
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-do_compile () {
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake lib HPLIB_SRC_DIR=${S} USEDYNAMIC_LIB=$choice DEVICE="$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
-	done
-}
diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
deleted file mode 100644
index 1e07227..0000000
--- a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
+++ /dev/null
@@ -1,75 +0,0 @@
-SUMMARY = "Second stage bootloader for c66x"
-DESCRIPTION = "The Intermediate Bootloader (IBL) is a second stage \
-bootloader for the c66x family of embedded processors. This second \
-stage bootloader takes care of additional initializations, advisory \
-setups, and errata workarounds that are not present in the first stage boot."
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://src/ibl.h;beginline=1;endline=34;md5=ee7d7a3305d1e524955996d1c5e31cb9"
-
-require recipes-ti/includes/ti-paths.inc
-
-DEPENDS = " ti-cgt6x-7-native \
-            bison-native \
-            flex-native \
-"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "c66x"
-
-CLEANBROKEN = "1"
-
-IBL_BOOT_GIT_URI = "git://git.ti.com/keystone-rtos/ibl.git"
-IBL_BOOT_GIT_PROTOCOL = "git"
-IBL_BOOT_GIT_BRANCH = "master"
-IBL_BOOT_SRCREV = "ed3f0989d8cdc813b7ca1ed899c4d84b63de3a75"
-
-BRANCH = "${IBL_BOOT_GIT_BRANCH}"
-SRC_URI = "${IBL_BOOT_GIT_URI};protocol=${IBL_BOOT_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${IBL_BOOT_SRCREV}"
-
-
-PR = "r2"
-
-S = "${WORKDIR}/git"
-
-PATH:prepend = "${TI_CGT6X_7_INSTALL_DIR}/bin:"
-
-IBLTARGETS = ""
-IBLTARGETS_c665x-evm = "evm_c6657_i2c"
-IBLTARGETS_c667x-evm = "evm_c6678_i2c"
-
-IBLENDIAN = ""
-IBLENDIAN_c665x-evm = "little"
-IBLENDIAN_c667x-evm = "little"
-
-export C6X_BASE_DIR="${TI_CGT6X_7_INSTALL_DIR}"
-export TOOLSC6X="${C6X_BASE_DIR}"
-export TOOLSC6XDOS="${C6X_BASE_DIR}"
-export TOOLSBIOSC6XDOS="${C6X_BASE_DIR}"
-export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
-
-do_compile() {
-    cd src/make
-    for t in ${IBLTARGETS}
-    do
-        for e in ${IBLENDIAN}
-        do
-            make ${t} ENDIAN=${e} I2C_BUS_ADDR=0x51
-        done
-    done
-    cd -
-}
-
-do_install() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
-    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership * ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/ibl
-}
-
-FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-INSANE_SKIP:${PN} = "arch file-rdeps"
diff --git a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb b/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
deleted file mode 100644
index 6eed978..0000000
--- a/recipes-bsp/mad-utils/mad-utils-rtos_git.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-SUMMARY = "Utility for loading and running multicore applications"
-DESCRIPTION = "Multicore Application Deployment (MAD) utility is used \
-for loading and running a multicore application on an embedded \
-processor with multiple cores. This utility package contains the \
-scripts to combine multiple applications for different cores into a \
-single binary as well as loadable application to parse and execute the applications on different cores."
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://README.txt;md5=44b2180aec0657f6b0e42e5611c0bafb"
-
-require recipes-ti/includes/ti-paths.inc
-
-DEPENDS = "ti-cgt6x-7-native"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "c66x"
-
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/mad-utils.git;protocol=git;branch=${BRANCH}"
-SRCREV = "2458510f76eddfa837c2b83448965e233156944b"
-PR = "r0"
-
-S = "${WORKDIR}/git"
-
-export C6X_BASE_DIR="${TI_CGT6X_7_INSTALL_DIR}"
-PATH:prepend = "${TI_CGT6X_7_INSTALL_DIR}/bin:"
-
-DEVICE = ""
-DEVICE_c665x-evm = "C6657"
-DEVICE_c667x-evm = "C6678"
-
-ENDIAN = ""
-ENDIAN_c665x-evm = "little big"
-ENDIAN_c667x-evm = "little big"
-
-do_compile() {
-    cd mad-loader
-    for e in ${ENDIAN}
-    do
-        mkdir -p bin/${DEVICE}/${e}
-        make -C mal/malLib/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
-        make -C mal/malApp/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
-        cp mal/malApp/build/mal_app.exe bin/${DEVICE}/${e}
-        make -C nmlLoader/build clean all DEVICE=${DEVICE} ENDIAN=${e} C_DIR=${C6X_BASE_DIR}
-        cp nmlLoader/build/nml.exe bin/${DEVICE}/${e}
-    done
-    cd -
-}
-
-do_install() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils
-    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership * ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils
-}
-
-FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/mad-utils"
-
-INSANE_SKIP:${PN} += "arch staticdev ldflags file-rdeps"
diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
deleted file mode 100644
index 2a5bfb9..0000000
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-DESCRIPTION = "NETCP PA firmware for Keystone"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-PV = "${NETCP_PA_FW_VERSION}"
-PR = "${INC_PR}.1"
-
-CLEANBROKEN = "1"
-
-COMPATIBLE_MACHINE = "k2hk|k2l|k2e"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-S = "${WORKDIR}/git"
-
-FWBASENAME = " \
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
-FWBASENAME:k2hk = " \
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
-		install -m 0644 ${S}/ti-keystone/$f.bin ${D}${base_libdir}/firmware/$f.bin
-	done
-}
-
-FILES:${PN} = "${base_libdir}/firmware"
diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
deleted file mode 100644
index ec3c30f..0000000
--- a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "NETCP SA firmware for Keystone"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-PV = "${NETCP_SA_FW_VERSION}"
-PR = "${INC_PR}.0"
-
-CLEANBROKEN = "1"
-
-COMPATIBLE_MACHINE = "keystone"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-S = "${WORKDIR}/git"
-
-TARGET = "sa_mci.fw"
-
-do_install() {
-	install -d ${D}${base_libdir}/firmware
-	install -m 0644 ${S}/ti-keystone/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
-}
-
-FILES:${PN} = "${base_libdir}/firmware"
diff --git a/recipes-bsp/osal/osal-rtos_git.bb b/recipes-bsp/osal/osal-rtos_git.bb
deleted file mode 100644
index eeaeb23..0000000
--- a/recipes-bsp/osal/osal-rtos_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-inherit ti-pdk
-require recipes-bsp/osal/osal.inc
-
-PR = "${INC_PR}.0"
-
-COMPATIBLE_MACHINE:append = "|c66x|k3"
-
-DEPENDS:append:ti33x = " starterware-rtos"
-DEPENDS:append:ti43x = " starterware-rtos"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_OSAL_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "OSAL Library"
diff --git a/recipes-bsp/osal/osal-test_git.bb b/recipes-bsp/osal/osal-test_git.bb
deleted file mode 100644
index 354aa79..0000000
--- a/recipes-bsp/osal/osal-test_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "TI OSAL tests"
-
-DEPENDS="common-csl-ip osal"
-
-include osal.inc
-
-PR = "${INC_PR}.1"
-
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} OSAL_SRC_DIR=${S}"
-
-do_compile () {
-#   Build the tests
-    oe_runmake clean
-    oe_runmake tests
-}
-
-do_install () {
-#   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir}
-}
diff --git a/recipes-bsp/osal/osal.inc b/recipes-bsp/osal/osal.inc
deleted file mode 100644
index e2143e1..0000000
--- a/recipes-bsp/osal/osal.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://osal.h;beginline=1;endline=31;md5=6fbde6922f8bca1e6cd371d3c2faa4f9"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.osal"
-
-PE = "1"
-
-INC_PR = "r0"
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libosal.a"
diff --git a/recipes-bsp/osal/osal_git.bb b/recipes-bsp/osal/osal_git.bb
deleted file mode 100644
index 4f881d2..0000000
--- a/recipes-bsp/osal/osal_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "TI OSAL library for Linux"
-
-DEPENDS="common-csl-ip"
-
-include osal.inc
-
-PR = "${INC_PR}.1"
-
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-do_compile () {
-#   Build the lib
-    oe_runmake clean
-    oe_runmake lib
-}
-
-do_install () {
-#   Install the lib
-    oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
-    chown -R root:root ${D}
-}
diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/pktlib-rtos_git.bb
deleted file mode 100644
index 1688d39..0000000
--- a/recipes-bsp/pktlib/pktlib-rtos_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit ti-pdk
-require pktlib.inc
-
-PR = "${INC_PR}.1"
-
-DEPENDS:append = " rm-lld-rtos \
-                   qmss-lld-rtos \
-                   cppi-lld-rtos \
-"
-COMPATIBLE_MACHINE:append = "|c66x"
diff --git a/recipes-bsp/pktlib/pktlib.inc b/recipes-bsp/pktlib/pktlib.inc
deleted file mode 100644
index af3f8bb..0000000
--- a/recipes-bsp/pktlib/pktlib.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Provides library for handling packet descriptors for keystone devices"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://docs/Doxyfile;md5=91d01dc3788e1f405f000b2089191a0a"
-
-COMPATIBLE_MACHINE = "keystone"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PKTLIB_GIT_URI = "git://git.ti.com/keystone-rtos/pktlib.git"
-PKTLIB_GIT_PROTOCOL = "git"
-PKTLIB_GIT_BRANCH = "master"
-PKTLIB_GIT_DESTSUFFIX = "git/ti/runtime/pktlib"
-
-# Below commit ID corresponds to "DEV.PKTLIB.2.1.0.8B"
-PKTLIB_SRCREV = "6d3758fda4c8c40fa9bd1194a9c713c9675b5a40"
-
-BRANCH = "${PKTLIB_GIT_BRANCH}"
-# Don't use DESTSUFFIX when cloning since repo contains ti/runtime/pktlib directory tree
-SRC_URI = "${PKTLIB_GIT_URI};protocol=${PKTLIB_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${PKTLIB_SRCREV}"
-PV = "2.1.0.8B"
-INC_PR = "r0"
-
-S = "${WORKDIR}/${PKTLIB_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
deleted file mode 100644
index b15b61b..0000000
--- a/recipes-bsp/pktlib/pktlib_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Provides library for handling packet descriptors for keystone devices"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
-
-DEPENDS = "common-csl-ip rm-lld qmss-lld cppi-lld"
-
-include pktlib.inc
-
-PR = "${INC_PR}.1"
-
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}"
-
-do_compile () {
-	oe_runmake lib
-}
-
-do_install () {
-	oe_runmake install
-	chown -R root:root ${D}
-}
diff --git a/recipes-bsp/pru/pru-pwm-fw_git.bb b/recipes-bsp/pru/pru-pwm-fw_git.bb
deleted file mode 100644
index 14c8139..0000000
--- a/recipes-bsp/pru/pru-pwm-fw_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Programmable Real-time Unit PWM Firmware"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=32;md5=893d6a0cf1644338ea96642c0db97f59"
-
-require recipes-ti/includes/ti-paths.inc
-
-COMPATIBLE_MACHINE = "am65xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.pruss.example.apps.icssg_pwm.firmware.src"
-
-PE = "1"
-
-DEPENDS = "ti-cgt-pru-native pru-icss common-csl-ip-rtos"
-
-
-EXTRA_OEMAKE += " \
-    PRU_CGT="${TI_CGT_PRU_INSTALL_DIR}" \
-    PRU_SSP="${STAGING_DIR_TARGET}/usr" \
-    PDK_INSTALL_DIR="${STAGING_DATADIR}/ti/ti-pdk-tree/packages" \
-"
-
-do_compile() {
-	oe_runmake
-}
-
-do_install() {
-	install -d ${D}/lib/firmware/ti-pruss
-	install -m 0644 ${S}/gen/pwm.out ${D}/lib/firmware/ti-pruss/am65x-pru0-pwm-fw.elf
-}
-
-FILES:${PN} = "/lib/firmware"
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Makefile-for-building-firmware.patch b/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Makefile-for-building-firmware.patch
deleted file mode 100644
index 8414d94..0000000
--- a/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Makefile-for-building-firmware.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From d37359e7b2bd26da4d04fc97a94967cf457558e9 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 6 Aug 2019 19:50:59 -0400
-Subject: [PATCH] icss_uart: add Makefile for building firmware
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- firmware/icss_uart/src/Makefile | 125 ++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 125 insertions(+)
- create mode 100644 firmware/icss_uart/src/Makefile
-
-diff --git a/firmware/icss_uart/src/Makefile b/firmware/icss_uart/src/Makefile
-new file mode 100644
-index 0000000..4764622
---- /dev/null
-+++ b/firmware/icss_uart/src/Makefile
-@@ -0,0 +1,125 @@
-+# PRU_CGT environment variable must point to the TI PRU code gen tools directory. E.g.:
-+#(Desktop Linux) export PRU_CGT=/path/to/pru/code/gen/tools/ti-cgt-pru_2.x.y
-+#(Windows) set PRU_CGT=C:/path/to/pru/code/gen/tools/ti-cgt-pru_2.x.y
-+#(ARM Linux*) export PRU_CGT=/usr/share/ti/cgt-pru
-+#
-+# *ARM Linux also needs to create a symbolic link to the /usr/bin/ directory in
-+# order to use the same Makefile
-+#(ARM Linux) ln -s /usr/bin/ /usr/share/ti/cgt-pru/bin
-+
-+ifndef PRU_CGT
-+define ERROR_BODY
-+
-+*******************************************************************************
-+PRU_CGT environment variable is not set. Examples given:
-+(Desktop Linux) export PRU_CGT=/path/to/pru/code/gen/tools/ti-cgt-pru_2.1.2
-+(Windows) set PRU_CGT=C:/path/to/pru/code/gen/tools/ti-cgt-pru_2.1.2
-+(ARM Linux*) export PRU_CGT=/usr/share/ti/cgt-pru
-+
-+*ARM Linux also needs to create a symbolic link to the /usr/bin/ directory in
-+order to use the same Makefile
-+(ARM Linux) ln -s /usr/bin/ /usr/share/ti/cgt-pru/bin
-+*******************************************************************************
-+
-+endef
-+$(error $(ERROR_BODY))
-+endif
-+
-+# PRU_SSP environment variable must point to the PRU Software Support Package. E.g.:
-+#(Desktop Linux) export PRU_SSP=/path/to/pru_software_support_package
-+#(Windows) set PRU_SSP=C:/path/to/pru_software_support_package
-+#(ARM Linux*) export PRU_SSP=/path/to/pru_software_support_package
-+
-+ifndef PRU_SSP
-+define ERROR_BODY
-+
-+*******************************************************************************
-+PRU_SSP environment variable must point to the PRU Software Support Package. E.g.:
-+(Desktop Linux) export PRU_SSP=/path/to/pru_software_support_package
-+(Windows) set PRU_SSP=C:/path/to/pru_software_support_package
-+(ARM Linux*) export PRU_SSP=/path/to/pru_software_support_package
-+PRU_CGT environment variable is not set. Examples given:
-+*******************************************************************************
-+
-+endef
-+$(error $(ERROR_BODY))
-+endif
-+
-+MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
-+CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
-+PROJ_NAME=$(CURRENT_DIR)
-+LINKER_COMMAND_FILE=./AM335x_PRU.cmd
-+LIBS=--library=$(PRU_SSP)/lib/rpmsg_lib.lib
-+INCLUDE=--include_path=$(PRU_SSP)/include --include_path=$(PRU_SSP)/include/am335x
-+STACK_SIZE=0x100
-+HEAP_SIZE=0x100
-+GEN_DIR=gen
-+
-+#Common compiler and linker flags (Defined in 'PRU Optimizing C/C++ Compiler User's Guide)
-+CFLAGS=-v3 -o2 --display_error_number --endian=little --hardware_mac=on --asm_directory=$(GEN_DIR) --obj_directory=$(GEN_DIR) --pp_directory=$(GEN_DIR) -ppd -ppa -DICSS_REV2
-+#Linker flags (Defined in 'PRU Optimizing C/C++ Compiler User's Guide)
-+LFLAGS=--reread_libs --warn_sections --stack_size=$(STACK_SIZE) --heap_size=$(HEAP_SIZE)
-+
-+TARGET=$(GEN_DIR)/$(PROJ_NAME).out
-+MAP=$(GEN_DIR)/$(PROJ_NAME).map
-+OBJECTS=$(patsubst %.asm,$(GEN_DIR)/%.object,$(wildcard *.asm))
-+OBJECTS+=$(patsubst %.c,$(GEN_DIR)/%.object,$(wildcard *.c))
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
-+	$(PRU_CGT)/bin/clpru $(CFLAGS) -z -i$(PRU_CGT)/lib -i$(PRU_CGT)/include $(LFLAGS) -o $(TARGET) $(OBJECTS) -m$(MAP) $(LINKER_COMMAND_FILE) --library=libc.a $(LIBS)
-+	@echo 'Finished building target: $@'
-+
-+# Invokes the compiler on all assembly files in the directory to create the object files
-+$(GEN_DIR)/%.object: %.asm
-+	@mkdir -p $(GEN_DIR)
-+	@echo ''
-+	@echo 'Building file: $<'
-+	@echo 'Invoking: PRU Compiler'
-+	$(PRU_CGT)/bin/clpru --include_path=$(PRU_CGT)/include $(INCLUDE) $(CFLAGS) -fe $@ $<
-+
-+# Invokes the compiler on all c files in the directory to create the object files
-+$(GEN_DIR)/%.object: %.c
-+	@mkdir -p $(GEN_DIR)
-+	@echo ''
-+	@echo 'Building file: $<'
-+	@echo 'Invoking: PRU Compiler'
-+	$(PRU_CGT)/bin/clpru -k --include_path=$(PRU_CGT)/include $(INCLUDE) $(CFLAGS) -fe $@ $<
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
-+# Includes the dependencies that the compiler creates (-ppd and -ppa flags)
-+-include $(OBJECTS:%.object=%.pp)
-+
--- 
-2.7.4
-
diff --git a/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-dependency-on-PDK-CSL.patch b/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-dependency-on-PDK-CSL.patch
deleted file mode 100644
index b565ba0..0000000
--- a/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-dependency-on-PDK-CSL.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 1b853cfd6194d3855310f47d43cb8c9f498b6182 Mon Sep 17 00:00:00 2001
-From: Bin Liu <b-liu@ti.com>
-Date: Wed, 27 Feb 2019 14:38:43 -0600
-Subject: [PATCH] icss_uart: remove dependency on PDK/CSL
-
-Signed-off-by: Bin Liu <b-liu@ti.com>
----
- firmware/icss_uart/src/icss_ctrl_regs.h | 32 ++++----------------------------
- 1 file changed, 4 insertions(+), 28 deletions(-)
-
-diff --git a/firmware/icss_uart/src/icss_ctrl_regs.h b/firmware/icss_uart/src/icss_ctrl_regs.h
-index ce640f5..99ec90d 100644
---- a/firmware/icss_uart/src/icss_ctrl_regs.h
-+++ b/firmware/icss_uart/src/icss_ctrl_regs.h
-@@ -39,32 +39,8 @@
-     .if    !$isdefed("__icss_ctrl_regs_h")
- __icss_ctrl_regs_h    .set 1
- 
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
--- 
-2.7.4
-
diff --git a/recipes-bsp/pru/pru-swuart-fw_git.bb b/recipes-bsp/pru/pru-swuart-fw_git.bb
deleted file mode 100644
index f0d9e80..0000000
--- a/recipes-bsp/pru/pru-swuart-fw_git.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "Programmable Real-time Unit Software UART Firmware"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=31;md5=94b6a199da1caf777f6756cb70aca4a7"
-
-require recipes-ti/includes/ti-paths.inc
-
-COMPATIBLE_MACHINE = "ti33x"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.uart"
-
-PE = "1"
-
-SRC_URI:append = " \
-	file://0001-icss_uart-add-Makefile-for-building-firmware.patch \
-	file://0001-icss_uart-remove-dependency-on-PDK-CSL.patch \
-"
-
-DEPENDS = "ti-cgt-pru-native pru-icss"
-
-
-export PRU_CGT = "${TI_CGT_PRU_INSTALL_DIR}"
-export PRU_SSP = "${STAGING_DIR_TARGET}/usr"
-
-do_compile() {
-	oe_runmake -C firmware/icss_uart/src
-}
-
-do_install() {
-	install -d ${D}/lib/firmware/ti-pruss
-	install -m 0644 ${S}/firmware/icss_uart/src/gen/src.out ${D}/lib/firmware/ti-pruss/pru_swuart-fw.elf
-}
-
-FILES:${PN} = "/lib/firmware"
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
deleted file mode 100644
index 6ab26e6..0000000
--- a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "QMSS PDSP firmware"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
-
-PV = "${QMSS_PDSP_FW_VERSION}"
-PR = "${INC_PR}.1"
-
-CLEANBROKEN = "1"
-
-COMPATIBLE_MACHINE = "keystone"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-S = "${WORKDIR}/git"
-ORIGIN = "ks2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin"
-TARGET = "ks2_qmss_pdsp_acc48.bin"
-
-do_install() {
-	install -d ${D}${base_libdir}/firmware
-	install -m 0644 ${S}/ti-keystone/${ORIGIN} ${D}${base_libdir}/firmware/${TARGET}
-}
-
-FILES:${PN} = "${base_libdir}/firmware"
diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
deleted file mode 100644
index 890db6e..0000000
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ /dev/null
@@ -1,125 +0,0 @@
-SUMMARY = "TI RTOS low level driver for SCICLIENT"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.drv.sciclient"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=99d7639a81c1ba1f16fd070a928ffddb"
-
-COMPATIBLE_MACHINE = "k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r1"
-
-DEPENDS:append = " osal-rtos common-csl-ip-rtos openssl-native"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-SCICLIENT_PACKAGE_BASE = "${WORKDIR}/sciclient_base"
-SCICLIENT_ROOTPATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/sciclient"
-
-export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
-export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages"
-
-BUILD_HS = ""
-BUILD_HS:am65xx-hs-evm = "yes"
-BUILD_HS:j7-hs-evm = "yes"
-export BUILD_HS
-
-# Sciclient for am65x supports mcu1_1 in addition to the default cores in TI_PDK_LIMIT_CORES
-TI_PDK_LIMIT_CORES:append:am65xx = " mcu1_1"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "SCICLIENT"
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
-    make package BOARD="${TI_PDK_LIMIT_BOARDS}" DEST_ROOT=${SCICLIENT_PACKAGE_BASE} PDK_SCICLIENT_COMP_PATH=${S}
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
-    # make clean LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
-
-    # Build am65xx libraries
-    make lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
-
-    #archive
-    tar -cf sciclient.tar --exclude='*.tar' ./*
-}
-
-
-do_compile:prepend:am65xx-hs-evm() {
-
-    cd ${SCICLIENT_ROOTPATH}
-
-    # Saving the GP firmware to a different GP name
-    cp ${CP_ARGS} ./soc/V0/sysfw.bin ./soc/V0/sysfw-gp.bin
-    
-    cd ${SCICLIENT_ROOTPATH}/tools
-    # Create the .bin file for HS
-    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x-hs ${PDK_INSTALL_DIR}/packages
-    cd -
-}
-
-do_compile:prepend:am65xx-evm() {
-
-    cd ${SCICLIENT_ROOTPATH}/tools
-
-    # Create the .bin file for GP, PG1
-    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x ${PDK_INSTALL_DIR}/packages
-    # Create the .bin file for GP, PG2
-    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x_pg2 ${PDK_INSTALL_DIR}/packages
-    
-    cd -
-}
-
-
-do_compile:prepend:j7-evm() {
-
-    cd ${SCICLIENT_ROOTPATH}/tools
-    # Create the .bin file for GP
-    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh j721e ${PDK_INSTALL_DIR}/packages
-    cd -
-}
-
-do_compile:prepend:j7-hs-evm() {
-
-    cd ${SCICLIENT_ROOTPATH}/tools
-    # Create the .bin file for HS
-    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh j721e-hs ${PDK_INSTALL_DIR}/packages
-    cd -
-}
-
-do_install() {
-    cd ${SCICLIENT_ROOTPATH}
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient \;
-}
-
-FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INSANE_SKIP:${PN} = "arch ldflags file-rdeps"
-
-INSANE_SKIP:${PN}-dbg = "arch"
-
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
deleted file mode 100644
index 3e87928..0000000
--- a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "TI RTOS library for SERDES diagnostics"
-
-inherit ti-pdk
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://serdes_diag.h;beginline=1;endline=42;;md5=68e7ce6fdc0e9328fa7d0ec41c54420c"
-
-COMPATIBLE_MACHINE = "keystone|c66x|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SERDES_DIAG_GIT_URI = "git://git.ti.com/keystone-rtos/serdes_diag.git"
-SERDES_DIAG_GIT_PROTOCOL = "git"
-SERDES_DIAG_GIT_BRANCH = "master"
-SERDES_DIAG_GIT_DESTSUFFIX = "git/ti/diag/serdes_diag"
-
-# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.13"
-SERDES_DIAG_SRCREV = "6dd7cd2170efe3cb41cc424486ba55b8d5bba354"
-
-BRANCH = "${SERDES_DIAG_GIT_BRANCH}"
-SRC_URI = "${SERDES_DIAG_GIT_URI};destsuffix=${SERDES_DIAG_GIT_DESTSUFFIX};protocol=${SERDES_DIAG_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${SERDES_DIAG_SRCREV}"
-PV = "01.00.00.13"
-PR = "r0"
-
-S = "${WORKDIR}/${SERDES_DIAG_GIT_DESTSUFFIX}"
-
-
-# Build with make instead of XDC for k3
-TI_PDK_XDCMAKE:k3 = "0"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "SERDES Diagnostics"
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/recipes-bsp/serdes-fw/serdes-fw_git.bb b/recipes-bsp/serdes-fw/serdes-fw_git.bb
deleted file mode 100644
index 6f79c64..0000000
--- a/recipes-bsp/serdes-fw/serdes-fw_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "SerDes firmware for Keystone PCIe and 1/10GigE"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
-
-PV = "${SERDES_FW_VERSION}"
-PR = "${INC_PR}.0"
-
-CLEANBROKEN = "1"
-
-COMPATIBLE_MACHINE = "keystone"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-S = "${WORKDIR}/git"
-TARGET = "ks2_pcie_serdes.bin ks2_gbe_serdes.bin ks2_xgbe_serdes.bin"
-
-do_install() {
-	install -d ${D}${base_libdir}/firmware
-	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-keystone/$f ${D}${base_libdir}/firmware/$f
-	done
-}
-
-FILES:${PN} = "${base_libdir}/firmware"
diff --git a/recipes-bsp/srss-tc/srss-tc_git.bb b/recipes-bsp/srss-tc/srss-tc_git.bb
deleted file mode 100644
index 483bde0..0000000
--- a/recipes-bsp/srss-tc/srss-tc_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "TI Smart Reflex temperature control application for KeyStone II"
-HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/srss-tc.git"
-LICENSE = "BSD & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c17cd1dc60dc06a4c4f2a2c45472a51"
-COMPATIBLE_MACHINE = "keystone"
-
-PV = "1.0.0.1"
-
-BRANCH = "master"
-# This commit corresponds to tag DEV.SRSS-TC-01.00.00.01A
-SRCREV = "107cd1433ef5785e5647ef086a4cc77566506604"
-
-SRC_URI = "git://git.ti.com/keystone-linux/srss-tc.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-SRSS_BIN_NAME = "srss_tc.out"
-INITSCRIPT_NAME = "run_srss_tc.sh"
-INITSCRIPT_PARAMS = "defaults 10"
-
-inherit update-rc.d
-LDFLAGS += "-lrt"
-CFLAGS += "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/src/${SRSS_BIN_NAME} ${D}${bindir}/${SRSS_BIN_NAME}
-
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 755 ${S}/scripts/${INITSCRIPT_NAME} ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
-}
diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb b/recipes-bsp/starterware/starterware-rtos_git.bb
deleted file mode 100644
index 1d94e94..0000000
--- a/recipes-bsp/starterware/starterware-rtos_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require starterware.inc
-
-DEPENDS = "gcc-arm-baremetal-native ti-pdk-build-rtos ti-xdctools-native"
-
-require recipes-ti/includes/ti-paths.inc
-
-PR = "${INC_PR}.0"
-
-PARTNO:ti33x = "am335x"
-PARTNO:ti43x = "am437x"
-
-export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
-export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
-export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
-export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
-
-do_compile() {
-    cd build
-    ./release_${PARTNO}.sh
-}
-
-do_install() {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware
-    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware \;
-}
-
-FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INSANE_SKIP:${PN} = "arch staticdev file-rdeps"
-
diff --git a/recipes-bsp/starterware/starterware.inc b/recipes-bsp/starterware/starterware.inc
deleted file mode 100644
index 82b012a..0000000
--- a/recipes-bsp/starterware/starterware.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=35;md5=286cbb5dce3e348294b6b025cff969b3"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
-STARTERWARE_GIT_PROTOCOL = "git"
-STARTERWARE_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.12A"
-STARTERWARE_SRCREV = "49a4d4cd4c72bacee738d44b8e72e7f59aa948cd"
-
-BRANCH = "${STARTERWARE_GIT_BRANCH}"
-SRC_URI = "${STARTERWARE_GIT_URI};protocol=${STARTERWARE_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${STARTERWARE_SRCREV}"
-PV = "02.01.01.12A"
-INC_PR = "r0"
-
-S = "${WORKDIR}/git"
diff --git a/recipes-bsp/starterware/starterware_git.bb b/recipes-bsp/starterware/starterware_git.bb
deleted file mode 100644
index a560e7b..0000000
--- a/recipes-bsp/starterware/starterware_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require starterware.inc
-
-PR = "${INC_PR}.0"
-
-ALLOW_EMPTY:${PN} = "1"
-
-CLEANBROKEN = "1"
-
-do_compile() {
-    :
-}
-
-do_install () {
-    install -d ${D}${includedir}/ti/starterware
-    find . -name "*.h" -type f | xargs -I {} cp --parents --no-preserve=ownership {} ${D}${includedir}/ti/starterware
-}
diff --git a/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb b/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
deleted file mode 100644
index f4b3da9..0000000
--- a/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-# Recipe to fetch/unpack sources used by ti-pdk-fetch recipes.
-#
-# Mimic gcc-source.inc from oe-core.
-
-# These shources will be unpacked to a "work-shared" directory. Then each
-# "ti-pdk-fetch" recipe will hard-link only the sources it requires.
-
-deltask do_configure
-deltask do_compile
-deltask do_install
-deltask do_populate_sysroot
-deltask do_populate_lic
-
-RM_WORK_EXCLUDE += "${PN}"
-EXCLUDE_FROM_WORLD = "1"
-
-inherit nopackages ti-pdk-fetch
-
-LICENSE = "BSD-3-Clause"
-
-PN = "${TI_PDK_SOURCE_PN}"
-WORKDIR = "${TI_PDK_SOURCE_WORKDIR}"
-SSTATE_SWSPEC = "sstate:ti-pdk::${PV}:${PR}::${SSTATE_VERSION}:"
-
-STAMP = "${STAMPS_DIR}/work-shared/ti-pdk-${PV}"
-STAMPCLEAN = "${STAMPS_DIR}/work-shared/ti-pdk-${PV}*"
-
-INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = ""
-PACKAGES = ""
-
-SRC_URI = "${TI_PDK_GIT_URI};branch=${TI_PDK_GIT_BRANCH};protocol=${TI_PDK_GIT_PROTOCOL}"
-SRCREV = "${TI_PDK_SRCREV}"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
deleted file mode 100644
index 32ea3b4..0000000
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "TI SCI firmware"
-
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
-
-PV = "0.1.1.50"
-PR = "r2"
-
-CLEANBROKEN = "1"
-
-COMPATIBLE_MACHINE = "k2g"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRCREV = "ab507546f0f3f217f4c782a20845856e14b38224"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-TARGET = "ti-sci-firmware-k2g.bin"
-
-do_install() {
-	install -d ${D}/boot
-	install -m 0644 ${S}/ti-keystone/${TARGET} ${D}/boot/${TARGET}
-}
-
-FILES:${PN} = "/boot"
-
-inherit deploy
-
-do_deploy () {
-	install -d ${DEPLOYDIR}
-	install -m 0644 ${S}/ti-keystone/${TARGET} ${DEPLOYDIR}/${TARGET}
-}
-
-addtask deploy before do_build after do_compile
diff --git a/recipes-bsp/traceframework/traceframework-rtos_git.bb b/recipes-bsp/traceframework/traceframework-rtos_git.bb
deleted file mode 100644
index 55e4118..0000000
--- a/recipes-bsp/traceframework/traceframework-rtos_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit ti-pdk
-
-require traceframework.inc
-
-PR = "${INC_PR}.2"
-
-XDCPATH:append = ";${UIA_INSTALL_DIR}/packages"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "Trace Framework"
diff --git a/recipes-bsp/traceframework/traceframework.inc b/recipes-bsp/traceframework/traceframework.inc
deleted file mode 100644
index 2312b02..0000000
--- a/recipes-bsp/traceframework/traceframework.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
-
-COMPATIBLE_MACHINE = "tci6614-evm|keystone"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-TRACEFRAMEWORK_GIT_URI = "git://git.ti.com/keystone-rtos/traceframework.git"
-TRACEFRAMEWORK_GIT_PROTOCOL = "git"
-TRACEFRAMEWORK_GIT_BRANCH = "master"
-TRACEFRAMEWORK_GIT_DESTSUFFIX = "git/ti/instrumentation/traceframework"
-
-# Below commit ID corresponds to "DEV.TFWK-01.01.01.09A"
-TRACEFRAMEWORK_SRCREV = "b7aa8d91901d1aabe2e56fabc3233ed66bf08819"
-
-BRANCH = "${TRACEFRAMEWORK_GIT_BRANCH}"
-SRC_URI = "${TRACEFRAMEWORK_GIT_URI};destsuffix=${TRACEFRAMEWORK_GIT_DESTSUFFIX};protocol=${TRACEFRAMEWORK_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${TRACEFRAMEWORK_SRCREV}"
-PV = "01.01.01.09A"
-INC_PR = "r0"
-
-DEVICELIST = "k2k k2h k2e k2l"
-DEVICELIST:k2hk = "k2k k2h"
-DEVICELIST:k2e = "k2e"
-DEVICELIST:k2l = "k2l"
-
-S = "${WORKDIR}/${TRACEFRAMEWORK_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
deleted file mode 100644
index 4c11e65..0000000
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION = "TI Trace Framework library"
-
-DEPENDS = "cuia"
-
-include traceframework.inc
-
-PR = "${INC_PR}.0"
-
-BASEDIR = "${WORKDIR}/git"
-
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} \
-                 CUIA_INSTALL_DIR=${STAGING_INCDIR} CUIA_LIB_DIR=${STAGING_LIBDIR}"
-
-do_compile () {
-#   making the library
-	oe_runmake clean
-	oe_runmake lib
-
-#   make the test application
-	for device in ${DEVICELIST}
-	do
-		oe_runmake tests DEVICE="$device" TFW_INC_DIR=${BASEDIR} TFW_SRC_DIR=${S} \
-			TARGET_ROOT_DIR=${D}
-	done
-}
-
-do_install() {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake install DEVICE="$device" TFW_SRC_DIR=${S} TARGET_ROOT_DIR=${D}
-	done
-	chown -R root:root ${D}
-}
-
-PACKAGES =+ "${PN}-test"
-
-FILES:${PN}-test = "${bindir}/tfw*.out \
-                    ${bindir}/*.txt"
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libtraceframework.a"
diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
deleted file mode 100644
index aa21b65..0000000
--- a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "RTOS driver for BMET Ethernet"
-
-inherit ti-pdk
-require transport.inc
-
-PR = "${INC_PR}.0"
-
-LIC_FILES_CHKSUM = "file://bmet_transport.h;beginline=12;endline=40;md5=6d209c698b273aef180b0c1d38469e8e"
-
-COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
-
-DEPENDS:append = " qmss-lld-rtos \
-                   cppi-lld-rtos \
-"
-
-TI_PDK_COMP = "ti.transport.bmet_eth"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "Baremetal Ethernet Transport"
diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
deleted file mode 100644
index a4ecaa2..0000000
--- a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "RTOS driver for NIMU ICSS"
-
-inherit ti-pdk
-require transport.inc
-
-PR = "${INC_PR}.0"
-
-LIC_FILES_CHKSUM = "file://nimu_icssEth.h;beginline=1;endline=35;md5=3ea633a510be24d8a89d9d08b930994c"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|c66x|omapl1|k3"
-
-DEPENDS:append = " ti-ndk \
-                   pruss-lld-rtos \
-                   icss-emac-lld-rtos \
-"
-DEPENDS:append_c665x-evm = " emac-lld-rtos"
-DEPENDS:append_c667x-evm = " pa-lld-rtos"
-DEPENDS:append:omapl1 = " emac-lld-rtos"
-
-TI_PDK_COMP = "ti.transport.ndk.nimu_icss"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_NIMU_ICSS_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
-XDCPATH:append = ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
deleted file mode 100644
index b726be2..0000000
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "RTOS driver for Network Interface Management Unit (NIMU)"
-
-inherit ti-pdk
-require transport.inc
-
-PR = "${INC_PR}.0"
-
-LIC_FILES_CHKSUM = "file://nimu_eth.h;beginline=1;endline=35;md5=ee9c662c39d4584fb2a8b66413d2866d"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1|k3"
-
-TI_PDK_COMP = "ti.transport.ndk.nimu"
-
-DEPENDS:append = " ti-ndk osal-rtos"
-DEPENDS:append:ti33x = " starterware-rtos emac-lld-rtos"
-DEPENDS:append:ti43x = " starterware-rtos emac-lld-rtos"
-DEPENDS:append:omap-a15 = " emac-lld-rtos"
-DEPENDS:append:keystone = " qmss-lld-rtos cppi-lld-rtos"
-DEPENDS:append:k2hk = " pa-lld-rtos"
-DEPENDS:append:k2e = " pa-lld-rtos"
-DEPENDS:append:k2l = " pa-lld-rtos"
-DEPENDS:append:k2g = " emac-lld-rtos"
-DEPENDS:append_c665x-evm = " emac-lld-rtos"
-DEPENDS:append_c667x-evm = " pa-lld-rtos cppi-lld-rtos"
-DEPENDS:append:omapl1 = " emac-lld-rtos"
-DEPENDS:append:k3 = " emac-lld-rtos pruss-lld-rtos"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_NIMU_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
-XDCPATH:append = ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/transport-rtos/timesync-rtos_git.bb b/recipes-bsp/transport-rtos/timesync-rtos_git.bb
deleted file mode 100644
index 3913ecf..0000000
--- a/recipes-bsp/transport-rtos/timesync-rtos_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "RTOS driver for timesync driver"
-
-inherit ti-pdk
-require recipes-bsp/transport-rtos/transport.inc
-
-PR = "${INC_PR}.0"
-
-LIC_FILES_CHKSUM = "file://timeSync_ver.h;beginline=23;endline=45;md5=4bd873035e47065aaa811e53622992e9"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
-
-DEPENDS:append = " ti-ndk \
-                   osal-rtos \
-                   pruss-lld-rtos \
-                   icss-emac-lld-rtos \
-                   nimu-icss-rtos \
-                   edma3-lld-rtos \
-"
-
-TI_PDK_COMP = "ti.transport.timeSync"
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_TIMESYNC_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
-export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
-
-XDCPATH:append = ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/transport-rtos/transport.inc b/recipes-bsp/transport-rtos/transport.inc
deleted file mode 100644
index 866d7a3..0000000
--- a/recipes-bsp/transport-rtos/transport.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-LICENSE = "BSD-3-Clause"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.transport"
-
-PE = "1"
-
-INC_PR = "r0"
diff --git a/recipes-bsp/utils-rtos/profiling-rtos_git.bb b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
deleted file mode 100644
index 9846804..0000000
--- a/recipes-bsp/utils-rtos/profiling-rtos_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "TI RTOS profiling utilities"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.utils.profiling"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://profilingver.h;beginline=1;endline=46;md5=974494ad60f33cfc0340e421c5a5a7a0"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-
-PR = "r0"
-
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_PROFILING_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "Profiling Utility Library"
diff --git a/recipes-bsp/utils-rtos/trace-rtos_git.bb b/recipes-bsp/utils-rtos/trace-rtos_git.bb
deleted file mode 100644
index 249ffc7..0000000
--- a/recipes-bsp/utils-rtos/trace-rtos_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "TI RTOS Trace utility"
-
-DESCRIPTION = "This utility allows for tracing support in PDK drivers"
-
-inherit ti-pdk ti-pdk-fetch
-
-TI_PDK_COMP = "ti.utils.trace"
-
-PE = "1"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://tracever.h;beginline=19;endline=47;md5=983f531ecfc9fc8c4bc3af9333ab6696"
-
-COMPATIBLE_MACHINE = "k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-
-PR = "r0"
-
-
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_TRACE_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "Trace Utility"
diff --git a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb b/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
deleted file mode 100644
index 59ebf31..0000000
--- a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Watchdog Timer (wdtimer) test example"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://WatchdogTimer.xdc;beginline=1;endline=31;md5=837fb1761f89c7671e79bd5992bcf9e4"
-
-inherit ti-pdk
-
-COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-WATCHDOG_TIMER_GIT_URI = "git://git.ti.com/keystone-rtos/wdtimer.git"
-WATCHDOG_TIMER_GIT_PROTOCOL = "git"
-WATCHDOG_TIMER_GIT_BRANCH = "master"
-WATCHDOG_TIMER_GIT_DESTSUFFIX = "git/ti/instrumentation/wdtimer"
-
-# Below commit ID corresponds to "DEV.WDTIMER.01.00.00.04A"
-WATCHDOG_TIMER_SRCREV = "5c382014ed02fdf054beb1dd0263758eb17c34e2"
-
-BRANCH = "${WATCHDOG_TIMER_GIT_BRANCH}"
-SRC_URI = "${WATCHDOG_TIMER_GIT_URI};destsuffix=${WATCHDOG_TIMER_GIT_DESTSUFFIX};protocol=${WATCHDOG_TIMER_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${WATCHDOG_TIMER_SRCREV}"
-PV = "01.00.00.04A"
-PR = "r0"
-
-S = "${WORKDIR}/git/ti/instrumentation/wdtimer"
-
-# HTML doc link params
-PDK_COMP_LINK_TEXT = "Watchdog Timer"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index d226c4a..86689d3 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -29,8 +29,6 @@ export IMGLIB_C64P_INSTALL_DIR_RECIPE= "${installdir}/ti-imglib-tree"
 export IPC_INSTALL_DIR_RECIPE        = "${installdir}/ti-ipc-tree"
 export LINK_INSTALL_DIR_RECIPE       = "${installdir}/ti-dsplink-tree"
 export LPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-local-power-manager-tree"
-export NDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-ndk-tree"
-export NS_INSTALL_DIR_RECIPE              = "${installdir}/ti-ns-tree"
 export OMX_INSTALL_DIR_RECIPE        = "${installdir}/ti-omx-tree"
 export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 export RTFS_INSTALL_DIR_RECIPE       = "${installdir}/ti-rtfs-tree"
@@ -81,8 +79,6 @@ export IMGLIB_C64P_INSTALL_DIR= "${STAGING_DIR_TARGET}${IMGLIB_C64P_INSTALL_DIR_
 export IPC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${IPC_INSTALL_DIR_RECIPE}"
 export LINK_INSTALL_DIR       = "${STAGING_DIR_TARGET}${LINK_INSTALL_DIR_RECIPE}"
 export LPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${LPM_INSTALL_DIR_RECIPE}"
-export NDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${NDK_INSTALL_DIR_RECIPE}"
-export NS_INSTALL_DIR         = "${STAGING_DIR_TARGET}${NS_INSTALL_DIR_RECIPE}"
 export OMX_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OMX_INSTALL_DIR_RECIPE}"
 export SYSBIOS_INSTALL_DIR    = "${STAGING_DIR_TARGET}${SYSBIOS_INSTALL_DIR_RECIPE}"
 export SYSLINK_INSTALL_DIR    = "${STAGING_DIR_TARGET}${SYSLINK_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
deleted file mode 100644
index ade7802..0000000
--- a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require recipes-ti/includes/ti-paths.inc
-require ipc-transport.inc
-
-PR = "${INC_PR}.1"
-
-LIC_FILES_CHKSUM = "file://common_src/bench_common.h;beginline=1;endline=31;md5=a6ddfb26d2097041d513e3881f40e4e8"
-
-COMPATIBLE_MACHINE = "k2hk|k2l|k2e"
-
-IPC_TRANSPORT_COMMON_DESTSUFFIX = "git/c66/example"
-
-S = "${WORKDIR}/${IPC_TRANSPORT_COMMON_DESTSUFFIX}"
-
-do_compile() {
-    :
-}
-
-do_install () {
-    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66/example
-    cp -r ${S} ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66
-}
-
-FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66/example/*"
diff --git a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
deleted file mode 100644
index 2dffc11..0000000
--- a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-inherit ti-pdk
-require ipc-transport.inc
-
-PR = "${INC_PR}.4"
-
-LIC_FILES_CHKSUM = "file://TransportQmss.xdc;beginline=1;endline=35;md5=ad783760d74a4cc5b8d4ad3d8a1f28a2"
-
-COMPATIBLE_MACHINE = "k2hk|k2l|k2e"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS:append = " qmss-lld-rtos \
-                   cppi-lld-rtos \
-                   ti-ipc-rtos \
-                   ipc-transport-common-rtos \
-"
-
-IPC_TRANSPORT_QMSS_DESTSUFFIX = "git/c66/qmss"
-
-S = "${WORKDIR}/${IPC_TRANSPORT_QMSS_DESTSUFFIX}"
-
-export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
-XDCPATH:append = ";${IPC_INSTALL_DIR}/packages"
diff --git a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
deleted file mode 100644
index 158d185..0000000
--- a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-include ipc-transport-qmss.inc
-
-PR = "${INC_PR}.0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS = "ipc-transport-qmss ti-ipc"
-
-#FILES_${PN}-test = "${bindir}/multiProcessTest_*.out"
-
-CHOICELIST = "yes no"
-
-DEVICELIST:k2hk = "k2h k2k"
-DEVICELIST:k2e  = "k2e"
-DEVICELIST:k2l  = "k2l"
-
-do_compile () {
-#   Now build the test code
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake tests \
-				IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} \
-				USEDYNAMIC_LIB="$choice" DEVICE="$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin \
-			INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
-	done
-
-}
diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc b/recipes-ti/ipc/ipc-transport-qmss.inc
deleted file mode 100644
index 0470526..0000000
--- a/recipes-ti/ipc/ipc-transport-qmss.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "TI QMSS-Based IPC MessageQ Transport"
-LICENSE = "BSD-3-Clause"
-
-require ipc-transport.inc
-
-INC_PR:append = ".1"
-
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
-
-COMPATIBLE_MACHINE = "keystone"
-
-S = "${WORKDIR}/git/linux/qmss"
-
-EXTRA_OEMAKE += "PDK_INSTALL_PATH=${STAGING_INCDIR} TRANS_QMSS_SRC_DIR=${S}"
diff --git a/recipes-ti/ipc/ipc-transport-qmss_git.bb b/recipes-ti/ipc/ipc-transport-qmss_git.bb
deleted file mode 100644
index 9313667..0000000
--- a/recipes-ti/ipc/ipc-transport-qmss_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-include ipc-transport-qmss.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS = "ti-ipc mpm-transport"
-
-do_compile () {
-#   Now build the transport
-	oe_runmake clean
-	oe_runmake lib
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} \
-		INSTALL_LIB_BASE_DIR=${D}${libdir}
-	chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libTransportQmss.a"
diff --git a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
deleted file mode 100644
index 5272091..0000000
--- a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-inherit ti-pdk
-require ipc-transport.inc
-
-PR = "${INC_PR}.2"
-
-LIC_FILES_CHKSUM = "file://TransportSrio.xdc;beginline=1;endline=35;md5=4d466471e4b933a0cc353a46bb546fe7"
-
-COMPATIBLE_MACHINE = "k2hk"
-
-DEPENDS:append = " qmss-lld-rtos \
-                   cppi-lld-rtos \
-                   srio-lld-rtos \
-                   ti-ipc-rtos \
-                   ipc-transport-common-rtos \
-"
-
-IPC_TRANSPORT_SRIO_DESTSUFFIX = "git/c66/srio"
-
-S = "${WORKDIR}/${IPC_TRANSPORT_SRIO_DESTSUFFIX}"
-
-export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
-XDCPATH:append = ";${IPC_INSTALL_DIR}/packages"
diff --git a/recipes-ti/ipc/ipc-transport-srio-test_git.bb b/recipes-ti/ipc/ipc-transport-srio-test_git.bb
deleted file mode 100644
index 4e23fb2..0000000
--- a/recipes-ti/ipc/ipc-transport-srio-test_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-include ipc-transport-srio.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS = "ipc-transport-srio ipc-transport-qmss ti-ipc"
-
-DEVICELIST = "k2h k2k"
-
-CHOICELIST = "yes no"
-
-do_compile () {
-#   Now build the test code
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake tests \
-				IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} \
-				USEDYNAMIC_LIB="$choice" DEVICE="$device"
-		done
-	done
-}
-
-do_install () {
-
-	for device in ${DEVICELIST}
-	do
-		oe_runmake installbin \
-			INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
-	done
-
-}
diff --git a/recipes-ti/ipc/ipc-transport-srio.inc b/recipes-ti/ipc/ipc-transport-srio.inc
deleted file mode 100644
index 8942570..0000000
--- a/recipes-ti/ipc/ipc-transport-srio.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "TI SRIO-Based IPC MessageQ Transport"
-LICENSE = "BSD-3-Clause"
-
-require ipc-transport.inc
-
-INC_PR:append = ".1"
-
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
-
-COMPATIBLE_MACHINE = "k2hk"
-
-S = "${WORKDIR}/git/linux/srio"
-
-EXTRA_OEMAKE += "PDK_INSTALL_PATH=${STAGING_INCDIR} TRANS_SRIO_SRC_DIR=${S}"
diff --git a/recipes-ti/ipc/ipc-transport-srio_git.bb b/recipes-ti/ipc/ipc-transport-srio_git.bb
deleted file mode 100644
index 6001585..0000000
--- a/recipes-ti/ipc/ipc-transport-srio_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-include ipc-transport-srio.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS = "ti-ipc mpm-transport"
-
-do_compile () {
-#   Now build the transport
-	oe_runmake clean
-	oe_runmake lib
-}
-
-do_install () {
-	oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} \
-		INSTALL_LIB_BASE_DIR=${D}${libdir}
-	chown -R root:root ${D}
-}
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libTransportSrio.a"
diff --git a/recipes-ti/ipc/ipc-transport.inc b/recipes-ti/ipc/ipc-transport.inc
deleted file mode 100644
index 0c1edef..0000000
--- a/recipes-ti/ipc/ipc-transport.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "BSD-3-Clause"
-
-IPC_TRANSPORT_GIT_URI = "git://git.ti.com/keystone-linux/ipc-transport.git"
-IPC_TRANSPORT_GIT_PROTOCOL = "git"
-IPC_TRANSPORT_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.IPC-TRANSPORT.02.00.00.02A"
-IPC_TRANSPORT_SRCREV = "f75e2e29b9b1b63443a0c82493e41dd2f771c6f5"
-
-BRANCH = "${IPC_TRANSPORT_GIT_BRANCH}"
-SRC_URI = "${IPC_TRANSPORT_GIT_URI};protocol=${IPC_TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${IPC_TRANSPORT_SRCREV}"
-PV = "02.00.00.02A"
-INC_PR = "r0"
diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
deleted file mode 100644
index 3b80af3..0000000
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-DESCRIPTION = "Multiproc transport layer for KeyStone devices: Provide basic transport layer for moving data between different processing nodes"
-HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/mpm-transport.git"
-LICENSE = "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=122b7757f366f3f6fe11988715258fc9"
-COMPATIBLE_MACHINE = "keystone"
-
-DEPENDS = "common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld uio-module-drv"
-DEPENDS:append:k2hk = " hyplnk-lld srio-lld"
-DEPENDS:append:k2e = " hyplnk-lld"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
-
-BRANCH = "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.04.00
-SRCREV = "e0e44fe55bef7ddf89f7ff3574f07fa906e72a37"
-
-PV = "2.0.4.0"
-PR = "r0"
-
-CC += "-fcommon"
-EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
-EXTRA_OEMAKE:append:k2hk = " HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
-EXTRA_OEMAKE:append:k2e = " HYPLNK_TRANSPORT=true"
-INSANE_SKIP:${PN} += "ldflags"
-
-S = "${WORKDIR}/git"
-
-PACKAGES =+ "${PN}-test"
-FILES:${PN}-test = "${bindir}/mpm_transport_test.out \
-					${bindir}/mpm_transport_hyplnk_loopback.out \
-					${bindir}/mpm_transport_hyplnk_remote.out \
-					${bindir}/mpm_transport_hyplnk_loopback_dma.out \
-					${bindir}/mpm_transport_hyplnk_loopback64.out \
-					${bindir}/mpm_transport_qmss_arm_mt.out \
-					${bindir}/mpm_transport_srio_arm_mt.out"
-
-do_install() {
-	oe_runmake installbin BASE_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
-
-	install -d ${D}${includedir}/
-	install -c -m 644 ${S}/include/* ${D}${includedir}/
-
-	install -d ${D}${libdir}/
-	cp  -a --preserve=mode,timestamps --no-preserve=ownership ${S}/lib/* ${D}${libdir}/
-
-	install -d ${D}${sysconfdir}/mpm/
-	install -c -m 644 ${S}/scripts/mpm_config.json ${D}${sysconfdir}/mpm/mpm_config.json
-}
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
deleted file mode 100644
index 41efe38..0000000
--- a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "TI Multiproc Manager (RTOS) for KeyStone II"
-DESCRIPTION = "Provides download, debug and other utilities for other cores in the SOC like DSP"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/multiprocmgr/multiprocmgr.inc
-
-DEPENDS = "ti-cgt6x-native"
-
-PR = "${INC_PR}.2"
-
-PACKAGES =+ "${PN}-test"
-FILES:${PN}-test = "${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/build/bin/*.out \
-                    ${datadir}/ti/examples/mpm/test/sync_test/c66x/bin/*.out"
-
-EXTRA_OEMAKE = "LOCAL_SYSROOT="${STAGING_DIR_TARGET}" \
-                C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-               "
-
-do_compile() {
-    oe_runmake c66x
-    oe_runmake test_c66x
-}
-
-do_install() {
-    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-    install -d ${D}${MPM_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${MPM_INSTALL_DIR_RECIPE}
-
-    # Copy C66x binaries
-    install -d ${D}${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/build/bin
-    cp ${S}/test/filetestdemo/c66x/demo_loopback/build/bin/*.out \
-        ${D}${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/build/bin/
-    install -d ${D}${datadir}/ti/examples/mpm/test/sync_test/c66x/bin
-    cp ${S}/test/sync_test/c66x/bin/*.out \
-        ${D}${datadir}/ti/examples/mpm/test/sync_test/c66x/bin/
-}
-
-FILES:${PN}-dev += "${MPM_INSTALL_DIR_RECIPE}"
-INSANE_SKIP:${PN}-dev = "arch"
-INSANE_SKIP:${PN}-test = "arch"
-
-RDEPENDS:${PN}-dev = "bash"
-
-ALLOW_EMPTY:${PN} = "1"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
deleted file mode 100644
index 3d1b3ae..0000000
--- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "TI Multiproc Manager test code"
-
-include multiprocmgr.inc
-
-PR = "${INC_PR}.2"
-
-DEPENDS = "multiprocmgr cmem"
-RDEPENDS:${PN} = "multiprocmgr mpm-transport cmem"
-RDEPENDS:${PN} += "multiprocmgr-rtos-test bash"
-
-FILES:${PN} += "\
-    ${datadir}/ti/examples/mpm \
-"
-
-FILES:${PN}-dbg += "\
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
-INSANE_SKIP:${PN} = "ldflags staticdev"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
deleted file mode 100644
index 64fb6f6..0000000
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/multi-proc-manager.git"
-LICENSE = "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
-SECTION = "console"
-COMPATIBLE_MACHINE = "keystone"
-
-MULTIPROCMGR_GIT_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git"
-MULTIPROCMGR_GIT_PROTOCOL = "git"
-MULTIPROCMGR_GIT_BRANCH = "master"
-
-# The following commits correspond to DEV.MPM-3.00.05.00
-MULTIPROCMGR_SRCREV = "810d8a31c797d07abe808cb3fa89465fa934d4dd"
-
-PV = "3.0.5.0"
-INC_PR = "r1"
-
-BRANCH = "${MULTIPROCMGR_GIT_BRANCH}"
-SRC_URI = "${MULTIPROCMGR_GIT_URI};protocol=${MULTIPROCMGR_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${MULTIPROCMGR_SRCREV}"
-
-S = "${WORKDIR}/git"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service b/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service
deleted file mode 100644
index 40eb465..0000000
--- a/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service
+++ /dev/null
@@ -1,14 +0,0 @@
-[Unit]
-Description=TI Multiproc Manager
-
-[Service]
-ExecStartPre=/sbin/modprobe keystone_remoteproc
-ExecStartPre=/sbin/modprobe keystone_dsp_mem
-ExecStartPre=/sbin/modprobe uio_module_drv
-
-Type=forking
-PIDFile=/var/run/mpm/pid
-ExecStart=/usr/bin/mpmsrv
-
-[Install]
-WantedBy=basic.target
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
deleted file mode 100644
index 1bd2488..0000000
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "TI Multiproc Manager for KeyStone II"
-DESCRIPTION = "Provides download, debug and other utilities for other cores in the SOC like DSP"
-
-include multiprocmgr.inc
-
-SRC_URI += " \
-	file://mpmsrv-daemon.service \
-"
-
-PR = "${INC_PR}.2"
-
-DEPENDS = "mpm-transport libdaemon virtual/kernel cmem"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-INITSCRIPT_NAME = "mpmsrv-daemon.sh"
-INITSCRIPT_PARAMS = "defaults 10"
-
-SYSTEMD_SERVICE:${PN} = "mpmsrv-daemon.service"
-
-inherit update-rc.d systemd
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/bin/mpmsrv ${D}${bindir}/mpmsrv
-	install -c -m 755 ${S}/bin/mpmcl ${D}${bindir}/mpmcl
-
-	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/mpmsrv-daemon.service ${D}${systemd_system_unitdir}
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 755 ${S}/scripts/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
-
-	install -d ${D}${sysconfdir}/mpm/
-	install -c -m 755 ${S}/scripts/crash_callback.sh ${D}${sysconfdir}/mpm/crash_callback.sh
-
-	install -d ${D}${includedir}/
-	install -c -m 755 ${S}/include/* ${D}${includedir}/
-
-	install -d ${D}${libdir}/
-	cp -a ${S}/lib/* ${D}${libdir}/
-	chown -R root:root ${D}${libdir}/
-}
-
-INSANE_SKIP:${PN} = "ldflags"
diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc
deleted file mode 100644
index 89c1adf..0000000
--- a/recipes-ti/ndk/ti-ndk.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "TI RTOS_Networking"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/index.html"
-SECTION = "devel"
-LICENSE = "BSD"
-
-require recipes-ti/includes/ti-paths.inc
-
-S = "${WORKDIR}/ndk_${PV}"
-SRC_URI = "http://software-dl.ti.com/targetcontent/ndk/${PV}/exports/ndk_${PV}.zip;name=ndkzip"
-
-do_install() {
-    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-    install -d ${D}${NDK_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${NDK_INSTALL_DIR_RECIPE}
-}
-
-ALLOW_EMPTY:${PN} = "1"
-FILES:${PN}-dev += "${NDK_INSTALL_DIR_RECIPE}"
-
-INSANE_SKIP:${PN}-dev = "arch ldflags staticdev file-rdeps"
diff --git a/recipes-ti/ndk/ti-ndk_3.61.01.01.bb b/recipes-ti/ndk/ti-ndk_3.61.01.01.bb
deleted file mode 100644
index 41e8bc1..0000000
--- a/recipes-ti/ndk/ti-ndk_3.61.01.01.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require ti-ndk.inc
-
-PE = "1"
-PV = "3_61_01_01"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://manifest_ndk_${PV}.html;md5=871c716abcf52bac5a7c23154eaba3b6"
-
-SRC_URI[ndkzip.md5sum] = "87f0494c9faee344fe93ae68e71ca189"
-SRC_URI[ndkzip.sha256sum] = "3bfca50367432603ebc1d53d9185302bb4fa4558ac766696f086dc7a5a2ccd29"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST:ti-soc = "(.*)"
diff --git a/recipes-ti/ns/ti-ns.inc b/recipes-ti/ns/ti-ns.inc
deleted file mode 100644
index a6b37c6..0000000
--- a/recipes-ti/ns/ti-ns.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "TI Network Services"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ns/index.html"
-SECTION = "devel"
-LICENSE = "BSD"
-
-require recipes-ti/includes/ti-paths.inc
-
-S = "${WORKDIR}/ns_${PV}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ns/${PV}/exports/ns_${PV}.zip;name=nszip"
-
-do_install() {
-    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-    install -d ${D}${NS_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${NS_INSTALL_DIR_RECIPE}
-}
-
-ALLOW_EMPTY:${PN} = "1"
-FILES:${PN}-dev += "${NS_INSTALL_DIR_RECIPE}"
-
-INSANE_SKIP:${PN}-dev = "arch ldflags staticdev file-rdeps"
diff --git a/recipes-ti/ns/ti-ns_2.60.01.06.bb b/recipes-ti/ns/ti-ns_2.60.01.06.bb
deleted file mode 100644
index 36a9003..0000000
--- a/recipes-ti/ns/ti-ns_2.60.01.06.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require ti-ns.inc
-
-PE = "1"
-PV = "2_60_01_06"
-PR = "r0"
-SRC_URI = "http://software-dl.ti.com/targetcontent/ns/${PV}/exports/ns_${PV}.zip;name=nszip"
-
-LIC_FILES_CHKSUM = "file://manifest_ns_${PV}.html;md5=e15dc261b0ef14c6fbabba24abcde4f0"
-
-SRC_URI[nszip.md5sum] = "b78d86423e9c4d148be5fba5903cc2c7"
-SRC_URI[nszip.sha256sum] = "f66b2fda6ab02585020e67d84897305209f3e141847581a214ccf123c3f15f00"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INHIBIT_SYSROOT_STRIP = "1"
diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
deleted file mode 100644
index 6b491dc..0000000
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "Package containing PDK makefile infrastructure"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=31;md5=92ab6f5e10f1502081c6080207e57ec1"
-
-require recipes-ti/includes/ti-paths.inc
-
-PR = "r0"
-
-inherit ti-pdk-fetch
-
-TI_PDK_COMP = "ti.build"
-
-PE = "1"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PARALLEL_MAKE = ""
-CLEANBROKEN = "1"
-
-do_compile() {
-    :
-}
-
-EXTRA_OEMAKE = "-f make_install LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" PDK_INSTALL_DIR="${D}${PDK_INSTALL_DIR_RECIPE}""
-
-do_install() {
-    oe_runmake
-}
-
-FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-INSANE_SKIP:${PN} += " file-rdeps"
diff --git a/recipes-ti/udma/udma_git.bb b/recipes-ti/udma/udma_git.bb
deleted file mode 100644
index b6100a3..0000000
--- a/recipes-ti/udma/udma_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "Provides zero copy access from user-space to packet dma channels via udma kernel driver"
-LICENSE = "BSD-3-Clause"
-
-COMPATIBLE_MACHINE = "keystone"
-LIC_FILES_CHKSUM = "file://include/udma.h;startline=1;endline=39;md5=ba3c7f91f970afe073b759ced61d0f27"
-
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-linux/udma.git;protocol=git;branch=${BRANCH}"
-S = "${WORKDIR}/git"
-# Commit corresponds to UDMA.01.00.00.00
-SRCREV = "53d09fb0bc98c41c5eb43623097e363c497d6fd8"
-
-PV = "01.00.00.00"
-
-PACKAGES =+ "${PN}-test"
-
-FILES:${PN}-test = "${bindir}/udma_test"
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
-INSANE_SKIP:${PN} += "textrel"
-- 
2.7.4

