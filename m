Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA7C5E00D2A; Wed,  8 May 2019 21:15:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 883BDE00CC9
	for <meta-ti@yoctoproject.org>; Wed,  8 May 2019 21:14:59 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BE8C940BB2;
	Thu,  9 May 2019 04:14:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id OGJhVoumUhmb; Thu,  9 May 2019 04:14:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9F4BB40024;
	Thu,  9 May 2019 04:14:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8A1F116EAEF;
	Thu,  9 May 2019 00:14:56 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  9 May 2019 00:14:54 -0400
Message-Id: <1557375295-41687-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557375295-41687-1-git-send-email-denys@ti.com>
References: <1557375295-41687-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/3] recipes: convert existing uses of am65xx-evm to am65xx SOC family
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2019 04:15:01 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb             | 6 +++---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 6 +++---
 recipes-ti/ipc/ti-ipc-common.inc            | 2 +-
 recipes-ti/ipc/ti-ipc-examples_git.bb       | 2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc              | 6 +++---
 recipes-ti/ipc/ti-ipc-rtos_git.bb           | 8 ++++----
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 94522f6..a36bce0 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -40,7 +40,7 @@ PLATFORM_ti33x = "am335x"
 PLATFORM_ti43x = "am437x"
 PLATFORM_omap-a15 = "am572x"
 PLATFORM_k2g = "k2g"
-PLATFORM_am65xx-evm = "am65x"
+PLATFORM_am65xx = "am65x"
 
 do_compile() {
     for dir in ${SUBDIRS}
@@ -102,7 +102,7 @@ do_install_append_k2g() {
     done
 }
 
-do_install_append_am65xx-evm() {
+do_install_append_am65xx() {
     for i in 0 1 
     do
         install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
@@ -131,7 +131,7 @@ PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
 PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_0-fw am437x-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES_omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
 PRU_ICSS_ALTERNATIVES_k2g      = "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0-fw k2g-pru1_1-fw"
-PRU_ICSS_ALTERNATIVES_am65xx-evm = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
+PRU_ICSS_ALTERNATIVES_am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
 
 # Set up link names for the firmwares
 ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "/lib/firmware/am335x-pru0-fw"
diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index 2de94d0..e145599 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -36,9 +36,9 @@ export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/pac
 #export PDK_SCICLIENT_ROOT_PATH ="${WORKDIR}/build"
 #export DEST_ROOT="${S}"
 
-LIMSOCS_am65xx-evm = "am65xx"
-LIMBOARDS_am65xx-evm = "am65xx_evm"
-BOARD_PACKAGE_am65xx-evm = "am65xx_evm"
+LIMSOCS_am65xx = "am65xx"
+LIMBOARDS_am65xx = "am65xx_evm"
+BOARD_PACKAGE_am65xx = "am65xx_evm"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "SCICLIENT"
diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 8401ea6..036e46d 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -15,7 +15,7 @@ PLATFORM_k2g = "66AK2G"
 PLATFORM_omapl138 = "OMAPL138"
 PLATFORM_c667x-evm = "C6678"
 PLATFORM_c665x-evm = "C6678"
-PLATFORM_am65xx-evm = "AM65XX"
+PLATFORM_am65xx = "AM65XX"
 
 ALT_PLATFORM_k2hk = "TCI6636"
 ALT_PLATFORM_am57xx-evm = "AM572X AM571X"
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
index d8733ae..43e45e6 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -3,7 +3,7 @@ require ti-ipc-examples.inc
 
 DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"
 
-DEPENDS_append_am65xx-evm = " sciclient-rtos"
+DEPENDS_append_am65xx = " sciclient-rtos"
 
 do_compile_append() {
 
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 9b7bccf..dcd6309 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -53,7 +53,7 @@ DEPENDS_append_omapl138 = " ti-cgt6x-native \
 DEPENDS_append_c66x = " ti-cgt6x-native \
 "
 
-DEPENDS_append_am65xx-evm = " ti-cgt-arm-native \
+DEPENDS_append_am65xx = " ti-cgt-arm-native \
                               gcc-linaro-baremetal-aarch64-native"
 
 IPC_TARGETS = ""
@@ -79,7 +79,7 @@ IPC_TARGETS_c66x = " \
     ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
 "
 
-IPC_TARGETS_am65xx-evm = "\
+IPC_TARGETS_am65xx = "\
     gnu.targets.arm.A53F="${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}" \
     ti.targets.arm.elf.R5F="${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
@@ -92,5 +92,5 @@ EXTRA_OEMAKE = "\
     JOBS="--jobs=${BB_NUMBER_THREADS}" \
     JAVA_TOOL_OPTIONS=-Xss2560k \
 "
-EXTRA_OEMAKE_append_am65xx-evm = " PDK_INSTALL_DIR=${PDK_INSTALL_DIR}"
+EXTRA_OEMAKE_append_am65xx = " PDK_INSTALL_DIR=${PDK_INSTALL_DIR}"
 
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 7f1cae0..4c0e71e 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -3,7 +3,7 @@ require ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
 DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
-DEPENDS_append_am65xx-evm = " sciclient-rtos"
+DEPENDS_append_am65xx = " sciclient-rtos"
 
 PACKAGES =+ "${PN}-fw"
 FILES_${PN}-fw = "${base_libdir}/firmware/*"
@@ -62,7 +62,7 @@ do_compile() {
   fi
 }
 
-do_install_prepend_am65xx-evm () {
+do_install_prepend_am65xx () {
   # Trim directory name
   mv ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_false_R5F0 ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_R5F0
   mv ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_false_R5F1 ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_R5F1
@@ -130,12 +130,12 @@ pkg_postrm_${PN}-fw_omapl138 () {
   update-alternatives --remove rproc-dsp-fw ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674
 }
 
-pkg_postinst_${PN}-fw_am65xx-evm () {
+pkg_postinst_${PN}-fw_am65xx () {
   update-alternatives --install /lib/firmware/am65x-mcu-r5f0_0-fw am65x-mcu-r5f0_0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
   update-alternatives --install /lib/firmware/am65x-mcu-r5f0_1-fw am65x-mcu-r5f0_1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
 }
 
-pkg_postrm_${PN}-fw_am65xx-evm () {
+pkg_postrm_${PN}-fw_am65xx () {
   update-alternatives --remove am65x-mcu-r5f0_0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f
   update-alternatives --remove am65x-mcu-r5f0_1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f
 }
-- 
2.7.4


