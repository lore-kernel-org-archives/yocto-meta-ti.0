Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE125E00CC7; Tue, 25 Oct 2016 15:56:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2AF7E00C93
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 15:56:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 847C252AD1; Tue, 25 Oct 2016 22:56:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161025225609.847C252AD1@arago-project.org>
Date: Tue, 25 Oct 2016 22:56:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/recipes: add k2g-ice machine and k2g SOC family
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
X-List-Received-Date: Tue, 25 Oct 2016 22:56:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fd78bce5bad884974db369d8b156ea210ed6006b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fd78bce5bad884974db369d8b156ea210ed6006b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Oct 25 08:31:47 2016 +0000

conf/recipes: add k2g-ice machine and k2g SOC family

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/k2g.inc                       |    2 ++
 conf/machine/k2g-evm.conf                          |    2 +-
 conf/machine/k2g-ice.conf                          |    7 +++++++
 .../common-csl-ip/common-csl-ip-rtos_git.bb        |    2 +-
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb          |    2 +-
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb          |    6 +++---
 recipes-bsp/pru/pru-icss_git.bb                    |    8 ++++----
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb          |    2 +-
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb              |    2 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb             |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb       |    4 ++--
 recipes-ti/ipc/ti-ipc.inc                          |    2 +-
 recipes-ti/ipc/ti-ipc_git.bb                       |    2 +-
 recipes-ti/openmp-rtos/openmp-rtos_git.bb          |    6 +++---
 14 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/conf/machine/include/k2g.inc b/conf/machine/include/k2g.inc
new file mode 100644
index 0000000..3cd540d
--- /dev/null
+++ b/conf/machine/include/k2g.inc
@@ -0,0 +1,2 @@
+require conf/machine/include/keystone.inc
+SOC_FAMILY_append = ":k2g"
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index cc4f210..fa1edfa 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: Keystone 2 K2G machine
 #@DESCRIPTION: Machine configuration for the TI Keystone 2 K2G EVM
 
-require conf/machine/include/keystone.inc
+require conf/machine/include/k2g.inc
 
 MACHINE_FEATURES += "alsa opencl"
 
diff --git a/conf/machine/k2g-ice.conf b/conf/machine/k2g-ice.conf
new file mode 100644
index 0000000..6998b3f
--- /dev/null
+++ b/conf/machine/k2g-ice.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: Keystone 2 K2G ICE machine
+#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2G ICE
+
+require conf/machine/k2g-evm.conf
+
+UBOOT_MACHINE = "k2g_ice_config"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 45a047d..8c5f73d 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -16,7 +16,7 @@ LIMSOCS_omap-a15 = "am571x am572x"
 LIMSOCS_k2hk-evm = "k2h k2k"
 LIMSOCS_k2l-evm = "k2l"
 LIMSOCS_k2e = "k2e"
-LIMSOCS_k2g-evm = "k2g"
+LIMSOCS_k2g = "k2g"
 
 export PDK_CSL_ROOT_PATH ="${WORKDIR}/build"
 export DEST_ROOT="${S}"
diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
index 9766b42..115e9ae 100644
--- a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
@@ -10,4 +10,4 @@ DEPENDS_append = " rm-lld-rtos \
 XDCARGS_k2hk-evm = "k2h k2k"
 XDCARGS_k2e = "k2e"
 XDCARGS_k2l-evm = "k2l"
-XDCARGS_k2g-evm = "k2g"
+XDCARGS_k2g = "k2g"
diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
index f4a6c5d..0540d17 100644
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -9,9 +9,9 @@ DEPENDS="common-csl-ip mmap-lld"
 RDEPENDS_${PN}="uio-module-drv"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
-DEVICELIST_k2e  = "k2e"
-DEVICELIST_k2l-evm  = "k2l"
-DEVICELIST_k2g-evm  = "k2g"
+DEVICELIST_k2e = "k2e"
+DEVICELIST_k2l-evm = "k2l"
+DEVICELIST_k2g = "k2g"
 
 CHOICELIST = " yes \
                no \
diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 144e338..1fbfd12 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -15,7 +15,7 @@ PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g-evm"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES_prepend = " \
@@ -39,7 +39,7 @@ SUBDIRS = "examples pru_cape/pru_fw lib/src labs"
 PLATFORM_ti33x = "am335x"
 PLATFORM_ti43x = "am437x"
 PLATFORM_omap-a15 = "am572x"
-PLATFORM_k2g-evm = "k2g"
+PLATFORM_k2g = "k2g"
 
 do_compile() {
     for dir in ${SUBDIRS}
@@ -84,7 +84,7 @@ do_install_append_omap-a15() {
     done
 }
 
-do_install_append_k2g-evm() {
+do_install_append_k2g() {
     for i in 0 1
     do
         for j in 0 1
@@ -102,7 +102,7 @@ FILES_${PN}-rpmsg-echo = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt*"
 PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
 PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_0-fw am437x-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES_omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
-PRU_ICSS_ALTERNATIVES_k2g-evm  = "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0-fw k2g-pru1_1-fw"
+PRU_ICSS_ALTERNATIVES_k2g      = "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0-fw k2g-pru1_1-fw"
 
 # Set up link names for the firmwares
 ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "/lib/firmware/am335x-pru0-fw"
diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
index 43fd803..de74d0b 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
@@ -9,4 +9,4 @@ DEPENDS_append = " rm-lld-rtos"
 XDCARGS_k2hk-evm = "k2h k2k"
 XDCARGS_k2l-evm = "k2l"
 XDCARGS_k2e = "k2e"
-XDCARGS_k2g-evm = "k2g"
+XDCARGS_k2g = "k2g"
diff --git a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
index 0bf24e2..50de457 100644
--- a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
@@ -9,4 +9,4 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 XDCARGS_k2hk-evm = "k2h k2k"
 XDCARGS_k2e = "k2e"
 XDCARGS_k2l-evm = "k2l"
-XDCARGS_k2g-evm = "k2g"
+XDCARGS_k2g = "k2g"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 70c9698..eed61d5 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -8,7 +8,7 @@ PR = "r0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "k2g-evm"
+COMPATIBLE_MACHINE = "k2g"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 708ce85..1b4676a 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -29,7 +29,7 @@ RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
 RDEPENDS_kernel-base_append_keystone = " boot-monitor"
 
 # Install ti-sci-fw into /boot dir of rootfs
-RDEPENDS_kernel-base_append_k2g-evm = " ti-sci-fw"
+RDEPENDS_kernel-base_append_k2g = " ti-sci-fw"
 
 # Add run-time dependency for SerDes firmware to the rootfs
 RDEPENDS_kernel-base_append_keystone = " serdes-fw"
@@ -67,7 +67,7 @@ KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beag
 KERNEL_DEVICETREE_pandaboard = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
 KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
 KERNEL_DEVICETREE_k2e = "keystone-k2e-evm.dtb"
-KERNEL_DEVICETREE_k2g-evm = "keystone-k2g-evm.dtb"
+KERNEL_DEVICETREE_k2g = "keystone-k2g-evm.dtb"
 KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4|keystone"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index c6c0965..3ce02c4 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -27,6 +27,6 @@ PLATFORM_dra7xx = "DRA7XX"
 PLATFORM_k2hk-evm = "TCI6638"
 PLATFORM_k2l-evm = "TCI6630"
 PLATFORM_k2e = "66AK2E"
-PLATFORM_k2g-evm = "66AK2G"
+PLATFORM_k2g = "66AK2G"
 
 ALT_PLATFORM_k2hk-evm = "TCI6636"
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 4cbc022..cd844b4 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -17,7 +17,7 @@ DAEMON_dra7xx = "lad_dra7xx"
 DAEMON_k2hk-evm = "lad_tci6638"
 DAEMON_k2l-evm = "lad_tci6630"
 DAEMON_k2e = "lad_66ak2e"
-DAEMON_k2g-evm = "lad_66ak2g"
+DAEMON_k2g = "lad_66ak2g"
 
 inherit autotools-brokensep pkgconfig update-rc.d
 
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index ace7319..104ccde 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -43,13 +43,13 @@ export BUILD_K2G = "0"
 
 BUILD_K2H_keystone = "1"
 BUILD_AM572_omap-a15 = "1"
-BUILD_K2H_k2g-evm = "0"
-BUILD_K2G_k2g-evm = "1"
+BUILD_K2H_k2g = "0"
+BUILD_K2G_k2g = "1"
 
 RELEASE_TARGET = ""
 RELEASE_TARGET_keystone = "k2x"
 RELEASE_TARGET_omap-a15 = "am57xx"
-RELEASE_TARGET_k2g-evm = "k2g"
+RELEASE_TARGET_k2g = "k2g"
 
 do_compile() {
     make -f utils/product/Makefile .zipfile


