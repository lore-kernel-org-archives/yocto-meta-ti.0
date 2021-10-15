Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1482.1634324289598848249
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 Oct 2021 11:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4827440C5F;
	Fri, 15 Oct 2021 18:58:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcaJyclwS9Q6; Fri, 15 Oct 2021 18:58:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1E28040BC4;
	Fri, 15 Oct 2021 18:58:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 630CE174670;
	Fri, 15 Oct 2021 14:58:04 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Phil Sutherland <phils@rct-global.com>,
	Phil Sutherland <phil@sutherland.id.au>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] meta-ti: Fix several errors introduced during override syntax changes
Date: Fri, 15 Oct 2021 14:58:03 -0400
Message-Id: <1634324283-6461-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Phil Sutherland <phils@rct-global.com>

Signed-off-by: Phil Sutherland <phil@sutherland.id.au>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb | 4 ++--
 recipes-ti/devtools/gcc-linaro-baremetal-native.bb         | 4 ++--
 recipes-ti/devtools/ti-cgt-arm_18.12.5.bb                  | 2 +-
 recipes-ti/devtools/ti-cgt-pru_2.3.2.bb                    | 4 ++--
 recipes-ti/devtools/ti-cgt470.inc                          | 2 +-
 recipes-ti/devtools/ti-cgt6x_8.3.2.bb                      | 8 ++++----
 recipes-ti/devtools/ti-cgt7x_1.2.0.bb                      | 2 +-
 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh        | 2 +-
 recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh    | 2 +-
 recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh      | 2 +-
 10 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
index f1596a8..3b40c9b 100644
--- a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
+++ b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
@@ -1,6 +1,6 @@
 include recipes-ti/devtools/gcc-linaro.inc
 
-PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch64-elf"
+PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf"
 S = "${WORKDIR}/${PACKAGE_DIR}"
 
 LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
@@ -8,7 +8,7 @@ LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
 inherit native
 require recipes-ti/includes/ti-paths.inc
 
-SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
+SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
 
 SRC_URI[gcc-linaro-aarch64.md5sum] = "4972f8943820bdd2f577f498de78964b"
 SRC_URI[gcc-linaro-aarch64.sha256sum] = "30fb7d876bcb982c502057c593d9c1f11b35d5158a26d986718e2b998388c4c8"
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
index d0683fe..6d5ec19 100644
--- a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
+++ b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
@@ -1,6 +1,6 @@
 include recipes-ti/devtools/gcc-linaro.inc
 
-PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:arm-eabi"
+PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
 S = "${WORKDIR}/${PACKAGE_DIR}"
 
 LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
@@ -8,7 +8,7 @@ LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
 inherit native
 require recipes-ti/includes/ti-paths.inc
 
-SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:arm-eabi.tar.xz;name=gcc-linaro"
+SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi.tar.xz;name=gcc-linaro"
 
 SRC_URI[gcc-linaro.md5sum] = "9a4a39cfc78c84375b1160aa93587aed"
 SRC_URI[gcc-linaro.sha256sum] = "45fc4f90af2e2e9c3197a275f6005ef5639f7a1889fa3eb24c3125ccd70fcd3d"
diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
index 60b216f..b7b6d9b 100644
--- a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
+++ b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
@@ -31,7 +31,7 @@ do_install() {
 SRC_URI[cgt_arm_installer.md5sum] = "e9e668332cf86c965b4da9d1d488426b"
 SRC_URI[cgt_arm_installer.sha256sum] = "da976143128c619a278cb4214a4295c409d100f9e65ad2f4d0d1039db7cf98f4"
 
-BINFILE_NAME = "cgt:arm_installer"
+BINFILE_NAME = "cgt_arm_installer"
 
 FILES:${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
 
diff --git a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
index d14c196..8b3e2a0 100644
--- a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
+++ b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM:class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Genera
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-unpack.inc
 
-BINFILE = "ti_cgt_pru_${PV}_linux_installer:x86.bin"
+BINFILE = "ti_cgt_pru_${PV}_linux_installer_x86.bin"
 BINFILE_NAME = "cgt-pru-x86"
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""
 
-BINFILE:class-target = "ti_cgt_pru_${PV}:armlinuxa8hf_busybox_installer.sh"
+BINFILE:class-target = "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
 BINFILE_NAME:class-target = "cgt-pru-arm"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
diff --git a/recipes-ti/devtools/ti-cgt470.inc b/recipes-ti/devtools/ti-cgt470.inc
index c8f9127..f0992aa 100644
--- a/recipes-ti/devtools/ti-cgt470.inc
+++ b/recipes-ti/devtools/ti-cgt470.inc
@@ -13,7 +13,7 @@ S = "${WORKDIR}/cgt470_${PV}"
 
 SRC_URI = "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
 
-BINFILE="ti_cgt_tms470_${PVwithdots}_setup_linux:x86.bin"
+BINFILE="ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin"
 TI_BIN_UNPK_CMDS="Y:qY:workdir: : "
 TI_BIN_UNPK_WDEXT="/cgt470_${PV}"
 
diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
index 00221d8..fd34657 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
@@ -26,13 +26,13 @@ python __anonymous() {
             raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
 }
 
-BINFILE = "ti_cgt_c6000_${PV}_linux_installer:x86.bin"
-BINFILE_NAME = "cgt6x:x86_installer"
+BINFILE = "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
+BINFILE_NAME = "cgt6x_x86_installer"
 TI_BIN_UNPK_ARGS = "--prefix ${S}"
 TI_BIN_UNPK_CMDS = ""
 
-BINFILE:class-target = "ti_cgt_c6000_${PV}:armlinuxa8hf_busybox_installer.sh"
-BINFILE_NAME:class-target = "cgt6x:arm_installer"
+BINFILE:class-target = "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installer.sh"
+BINFILE_NAME:class-target = "cgt6x_arm_installer"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
diff --git a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
index 35b58d4..b45b52a 100644
--- a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
+++ b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
@@ -20,7 +20,7 @@ COMPATIBLE_HOST:class-target = "null"
 PE = "1"
 
 BINFILE = "ti_cgt_c7000_${PV}.STS_linux_installer_x86.bin"
-BINFILE_NAME = "cgt7x:x86_installer"
+BINFILE_NAME = "cgt7x_x86_installer"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C7000/${PV}.STS/${BINFILE};name=${BINFILE_NAME}"
 
diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
index 2bfd03c..7120b74 100755
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
+++ b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
@@ -34,4 +34,4 @@ modprobe dsplinkk
 
 # insert Local Power Manager driver
 #
-modprobe lpm:omap3530
+modprobe lpm_omap3530
diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
index 094d23d..076af07 100755
--- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
+++ b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
@@ -38,5 +38,5 @@ mknod /dev/dsplink c `awk "\\$2==\"dsplink\" {print \\$1}" /proc/devices` 0
 
 # insert Local Power Manager driver
 #
-modprobe lpm:omap3530
+modprobe lpm_omap3530
 
diff --git a/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh b/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
index 81d00af..793d727 100644
--- a/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
+++ b/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
@@ -1,7 +1,7 @@
 # Unload modules - DMAI - OMAP3530
 
 # remove lpm module
-rmmod lpm:omap3530
+rmmod lpm_omap3530
 
 # remove DSP/BIOS Link driver
 rmmod dsplinkk
-- 
2.7.4

