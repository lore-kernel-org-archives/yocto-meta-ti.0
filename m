Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1360.1589993655244479479
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 May 2020 09:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9E6EE40C14;
	Wed, 20 May 2020 16:54:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJ_ofyygZ0gb; Wed, 20 May 2020 16:54:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1575940A35;
	Wed, 20 May 2020 16:54:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C363B16F347;
	Wed, 20 May 2020 12:54:12 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] gcc-arm,gcc-aarch64: upgrade baremetal gcc compilers to 9.2-2019.12
Date: Wed, 20 May 2020 12:54:12 -0400
Message-Id: <1589993652-4627-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Overlay recipes from meta-arm/master to provide baremetal gcc 9.2-2019.12

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 classes/ti-pdk.bbclass                             |  4 +--
 .../devtools/gcc-aarch64-none-elf_9.2-2019.12.bb   | 38 +++++++++++++++++++++
 .../gcc-arm-none-eabi-native_4.9.2015q3.bb         | 23 -------------
 .../devtools/gcc-arm-none-eabi_7-2018-q2-update.bb | 29 ----------------
 .../devtools/gcc-arm-none-eabi_9-2019-q4-major.bb  | 39 ++++++++++++++++++++++
 .../gcc-linaro-baremetal-aarch64-native.bb         | 23 -------------
 recipes-ti/devtools/gcc-linaro-baremetal-native.bb | 23 -------------
 recipes-ti/includes/ti-paths.inc                   |  6 ++--
 8 files changed, 82 insertions(+), 103 deletions(-)
 create mode 100644 recipes-ti/devtools/gcc-aarch64-none-elf_9.2-2019.12.bb
 delete mode 100644 recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
 delete mode 100644 recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
 create mode 100644 recipes-ti/devtools/gcc-arm-none-eabi_9-2019-q4-major.bb
 delete mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
 delete mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-native.bb

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 2571234..37305e8 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -10,9 +10,9 @@ DEPENDS_remove_ti33x = "ti-cgt6x-native"
 DEPENDS_remove_ti43x = "ti-cgt6x-native"
 DEPENDS_append_omapl1 = " ti-cgt-arm-native"
 DEPENDS_remove_am65xx = "gcc-arm-none-eabi-native ti-cgt6x-native"
-DEPENDS_append_am65xx = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
+DEPENDS_append_am65xx = " ti-cgt-arm-native gcc-aarch64-none-elf-native"
 DEPENDS_remove_j7 = "gcc-arm-none-eabi-native"
-DEPENDS_append_j7 = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
+DEPENDS_append_j7 = " ti-cgt-arm-native gcc-aarch64-none-elf-native ti-cgt7x-native"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/recipes-ti/devtools/gcc-aarch64-none-elf_9.2-2019.12.bb b/recipes-ti/devtools/gcc-aarch64-none-elf_9.2-2019.12.bb
new file mode 100644
index 0000000..2ec0f9c
--- /dev/null
+++ b/recipes-ti/devtools/gcc-aarch64-none-elf_9.2-2019.12.bb
@@ -0,0 +1,38 @@
+# Copyright (C) 2020 Texas Instruments Inc.
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Baremetal GCC for Aarch64 processors"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "file://share/doc/gcc/GNU-Free-Documentation-License.html;md5=cc1e9a49a59ce7e6ae5ef37cd16eca0c"
+
+PROVIDES = "virtual/aarch64-none-elf-gcc"
+
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-${PV}-x86_64-aarch64-none-elf.tar.xz"
+
+SRC_URI[sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
+
+S = "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"
+
+COMPATIBLE_HOST = "x86_64.*-linux"
+
+do_install() {
+    install -d ${D}${datadir}/aarch64-none-elf/
+    cp -r ${S}/. ${D}${datadir}/aarch64-none-elf/
+
+    install -d ${D}${bindir}
+    # Symlink all executables into bindir
+    for f in ${D}${datadir}/aarch64-none-elf/bin/aarch64-none-elf-*; do
+        lnr $f ${D}${bindir}/$(basename $f)
+    done
+}
+
+FILES_${PN} = "${datadir} ${bindir}"
+
+INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
+
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
deleted file mode 100644
index 1fe5c52..0000000
--- a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Baremetal GCC for ARM"
-LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
-
-LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=cba77c7fde3ed13e866b04a2f3d93918"
-
-inherit native
-require recipes-ti/includes/ti-paths.inc
-
-SRC_URI = "https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2;name=gcc-arm-none"
-
-SRC_URI[gcc-arm-none.md5sum] = "8a4a74872830f80c788c944877d3ad8c"
-SRC_URI[gcc-arm-none.sha256sum] = "c50078bfbd29e6c15615900e746f4d0acde917338e55860b0f145f57387c12ab"
-
-S = "${WORKDIR}/gcc-arm-none-eabi-4_9-2015q3"
-
-do_install() {
-    install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
-    cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
-}
-
-FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
-
-INSANE_SKIP_${PN} = "already-stripped"
diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
deleted file mode 100644
index f474c87..0000000
--- a/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "Baremetal GCC for ARM"
-LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
-
-LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=f77466c63f5787f4bd669c402aabe061"
-
-require recipes-ti/includes/ti-paths.inc
-
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2;name=gcc-arm-none"
-
-SRC_URI[gcc-arm-none.md5sum] = "299ebd3f1c2c90930d28ab82e5d8d6c0"
-SRC_URI[gcc-arm-none.sha256sum] = "bb17109f0ee697254a5d4ae6e5e01440e3ea8f0277f2e8169bf95d07c7d5fe69"
-
-S = "${WORKDIR}/gcc-arm-none-eabi-7-2018-q2-update"
-
-# only x86_64 is supported
-COMPATIBLE_HOST = "x86_64.*-linux"
-COMPATIBLE_HOST_class-target = "null"
-
-do_install() {
-    install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
-    cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
-}
-
-FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
-
-INSANE_SKIP_${PN} = "already-stripped libdir staticdev build-deps file-rdeps"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_9-2019-q4-major.bb b/recipes-ti/devtools/gcc-arm-none-eabi_9-2019-q4-major.bb
new file mode 100644
index 0000000..84f6dba
--- /dev/null
+++ b/recipes-ti/devtools/gcc-arm-none-eabi_9-2019-q4-major.bb
@@ -0,0 +1,39 @@
+# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
+
+PROVIDES = "virtual/arm-none-eabi-gcc"
+
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}-${PV}-x86_64-linux.tar.bz2"
+
+SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
+SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+COMPATIBLE_HOST = "x86_64.*-linux"
+
+do_install() {
+    install -d ${D}${datadir}/arm-none-eabi/
+    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
+
+    install -d ${D}${bindir}
+    # Symlink all executables into bindir
+    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
+        lnr $f ${D}${bindir}/$(basename $f)
+    done
+}
+
+FILES_${PN} = "${datadir} ${bindir}"
+
+INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
+
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
deleted file mode 100644
index 97344f9..0000000
--- a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-include recipes-ti/devtools/gcc-linaro.inc
-
-PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf"
-S = "${WORKDIR}/${PACKAGE_DIR}"
-
-LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
-
-inherit native
-require recipes-ti/includes/ti-paths.inc
-
-SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
-
-SRC_URI[gcc-linaro-aarch64.md5sum] = "4972f8943820bdd2f577f498de78964b"
-SRC_URI[gcc-linaro-aarch64.sha256sum] = "30fb7d876bcb982c502057c593d9c1f11b35d5158a26d986718e2b998388c4c8"
-
-do_install() {
-    install -d ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
-    cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
-}
-
-FILES_${PN} = "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}/*"
-
-INSANE_SKIP_${PN} = "already-stripped"
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
deleted file mode 100644
index 0268ae3..0000000
--- a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-include recipes-ti/devtools/gcc-linaro.inc
-
-PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
-S = "${WORKDIR}/${PACKAGE_DIR}"
-
-LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
-
-inherit native
-require recipes-ti/includes/ti-paths.inc
-
-SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi.tar.xz;name=gcc-linaro"
-
-SRC_URI[gcc-linaro.md5sum] = "9a4a39cfc78c84375b1160aa93587aed"
-SRC_URI[gcc-linaro.sha256sum] = "45fc4f90af2e2e9c3197a275f6005ef5639f7a1889fa3eb24c3125ccd70fcd3d"
-
-do_install() {
-    install -d ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
-    cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
-}
-
-FILES_${PN} = "${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*"
-
-INSANE_SKIP_${PN} = "already-stripped"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 52a93cf..d45b77f 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -48,7 +48,7 @@ export XDC_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdctools-tree"
 export PDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-pdk-tree"
 export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
-export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
+export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${datadir}/arm-none-eabi"
 export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
 export MATHLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c66x-tree"
 export MATHLIB_C674_INSTALL_DIR_RECIPE    = "${installdir}/ti-mathlib-c674x-tree"
@@ -58,8 +58,8 @@ export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
 export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
 export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
 export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
-export GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE          = "${installdir}/gcc-linaro-baremetal"
-export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE  = "${installdir}/gcc-linaro-baremetal-aarch64"
+export GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE          = "${datadir}/arm-none-eabi"
+export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE  = "${datadir}/aarch64-none-elf"
 export TI_CGT7X_INSTALL_DIR_RECIPE        = "${installdir}/cgt-c7x"
 
 
-- 
2.7.4

