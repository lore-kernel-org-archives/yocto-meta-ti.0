Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.56.1598290259854093100
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 10:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5428640C4D;
	Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uO535TFCHghd; Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3D8AE40BBF;
	Mon, 24 Aug 2020 17:30:58 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 285AB174470;
	Mon, 24 Aug 2020 13:30:56 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 07/14] Revert "gcc-arm, gcc-aarch64: upgrade baremetal gcc compilers to 9.2-2019.12"
Date: Mon, 24 Aug 2020 13:30:42 -0400
Message-Id: <1598290249-23943-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598290249-23943-1-git-send-email-denis@denix.org>
References: <1598290249-23943-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 3a657f7d350149dc277e735d96ef2d66360a3ac3.
---
 classes/ti-pdk.bbclass                             |  4 +--
 .../devtools/gcc-aarch64-none-elf_9.2-2019.12.bb   | 38 --------------------
 ...r.bb => gcc-arm-none-eabi-native_4.9.2015q3.bb} | 40 +++++++---------------
 ...or.bb => gcc-arm-none-eabi_7-2018-q2-update.bb} | 36 +++++++------------
 .../gcc-linaro-baremetal-aarch64-native.bb         | 23 +++++++++++++
 recipes-ti/devtools/gcc-linaro-baremetal-native.bb | 23 +++++++++++++
 recipes-ti/includes/ti-paths.inc                   |  6 ++--
 7 files changed, 76 insertions(+), 94 deletions(-)
 delete mode 100644 recipes-ti/devtools/gcc-aarch64-none-elf_9.2-2019.12.bb
 copy recipes-ti/devtools/{gcc-arm-none-eabi_9-2019-q4-major.bb => gcc-arm-none-eabi-native_4.9.2015q3.bb} (11%)
 rename recipes-ti/devtools/{gcc-arm-none-eabi_9-2019-q4-major.bb => gcc-arm-none-eabi_7-2018-q2-update.bb} (24%)
 create mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
 create mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-native.bb

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 37305e8..2571234 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -10,9 +10,9 @@ DEPENDS_remove_ti33x = "ti-cgt6x-native"
 DEPENDS_remove_ti43x = "ti-cgt6x-native"
 DEPENDS_append_omapl1 = " ti-cgt-arm-native"
 DEPENDS_remove_am65xx = "gcc-arm-none-eabi-native ti-cgt6x-native"
-DEPENDS_append_am65xx = " ti-cgt-arm-native gcc-aarch64-none-elf-native"
+DEPENDS_append_am65xx = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
 DEPENDS_remove_j7 = "gcc-arm-none-eabi-native"
-DEPENDS_append_j7 = " ti-cgt-arm-native gcc-aarch64-none-elf-native ti-cgt7x-native"
+DEPENDS_append_j7 = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/recipes-ti/devtools/gcc-aarch64-none-elf_9.2-2019.12.bb b/recipes-ti/devtools/gcc-aarch64-none-elf_9.2-2019.12.bb
deleted file mode 100644
index 2ec0f9c..0000000
--- a/recipes-ti/devtools/gcc-aarch64-none-elf_9.2-2019.12.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-# Copyright (C) 2020 Texas Instruments Inc.
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "Baremetal GCC for Aarch64 processors"
-LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
-
-LIC_FILES_CHKSUM = "file://share/doc/gcc/GNU-Free-Documentation-License.html;md5=cc1e9a49a59ce7e6ae5ef37cd16eca0c"
-
-PROVIDES = "virtual/aarch64-none-elf-gcc"
-
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-${PV}-x86_64-aarch64-none-elf.tar.xz"
-
-SRC_URI[sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
-
-S = "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"
-
-COMPATIBLE_HOST = "x86_64.*-linux"
-
-do_install() {
-    install -d ${D}${datadir}/aarch64-none-elf/
-    cp -r ${S}/. ${D}${datadir}/aarch64-none-elf/
-
-    install -d ${D}${bindir}
-    # Symlink all executables into bindir
-    for f in ${D}${datadir}/aarch64-none-elf/bin/aarch64-none-elf-*; do
-        lnr $f ${D}${bindir}/$(basename $f)
-    done
-}
-
-FILES_${PN} = "${datadir} ${bindir}"
-
-INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
-
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_9-2019-q4-major.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
similarity index 11%
copy from recipes-ti/devtools/gcc-arm-none-eabi_9-2019-q4-major.bb
copy to recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
index 84f6dba..1fe5c52 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi_9-2019-q4-major.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
@@ -1,39 +1,23 @@
-# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
+DESCRIPTION = "Baremetal GCC for ARM"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
-LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
-
-PROVIDES = "virtual/arm-none-eabi-gcc"
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=cba77c7fde3ed13e866b04a2f3d93918"
 
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}-${PV}-x86_64-linux.tar.bz2"
+inherit native
+require recipes-ti/includes/ti-paths.inc
 
-SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
-SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
+SRC_URI = "https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2;name=gcc-arm-none"
 
-S = "${WORKDIR}/${BPN}-${PV}"
+SRC_URI[gcc-arm-none.md5sum] = "8a4a74872830f80c788c944877d3ad8c"
+SRC_URI[gcc-arm-none.sha256sum] = "c50078bfbd29e6c15615900e746f4d0acde917338e55860b0f145f57387c12ab"
 
-COMPATIBLE_HOST = "x86_64.*-linux"
+S = "${WORKDIR}/gcc-arm-none-eabi-4_9-2015q3"
 
 do_install() {
-    install -d ${D}${datadir}/arm-none-eabi/
-    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
-
-    install -d ${D}${bindir}
-    # Symlink all executables into bindir
-    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
-        lnr $f ${D}${bindir}/$(basename $f)
-    done
+    install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
+    cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
 }
 
-FILES_${PN} = "${datadir} ${bindir}"
-
-INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
-
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
 
-BBCLASSEXTEND = "native nativesdk"
+INSANE_SKIP_${PN} = "already-stripped"
diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_9-2019-q4-major.bb b/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
similarity index 24%
rename from recipes-ti/devtools/gcc-arm-none-eabi_9-2019-q4-major.bb
rename to recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
index 84f6dba..f474c87 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi_9-2019-q4-major.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
@@ -1,39 +1,29 @@
-# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
+DESCRIPTION = "Baremetal GCC for ARM"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
-LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=f77466c63f5787f4bd669c402aabe061"
 
-PROVIDES = "virtual/arm-none-eabi-gcc"
+require recipes-ti/includes/ti-paths.inc
 
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}-${PV}-x86_64-linux.tar.bz2"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2;name=gcc-arm-none"
 
-SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
-SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
+SRC_URI[gcc-arm-none.md5sum] = "299ebd3f1c2c90930d28ab82e5d8d6c0"
+SRC_URI[gcc-arm-none.sha256sum] = "bb17109f0ee697254a5d4ae6e5e01440e3ea8f0277f2e8169bf95d07c7d5fe69"
 
-S = "${WORKDIR}/${BPN}-${PV}"
+S = "${WORKDIR}/gcc-arm-none-eabi-7-2018-q2-update"
 
+# only x86_64 is supported
 COMPATIBLE_HOST = "x86_64.*-linux"
+COMPATIBLE_HOST_class-target = "null"
 
 do_install() {
-    install -d ${D}${datadir}/arm-none-eabi/
-    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
-
-    install -d ${D}${bindir}
-    # Symlink all executables into bindir
-    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
-        lnr $f ${D}${bindir}/$(basename $f)
-    done
+    install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
+    cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
 }
 
-FILES_${PN} = "${datadir} ${bindir}"
-
-INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
+FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
 
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_STRIP = "1"
+INSANE_SKIP_${PN} = "already-stripped libdir staticdev build-deps file-rdeps"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
new file mode 100644
index 0000000..97344f9
--- /dev/null
+++ b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
@@ -0,0 +1,23 @@
+include recipes-ti/devtools/gcc-linaro.inc
+
+PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf"
+S = "${WORKDIR}/${PACKAGE_DIR}"
+
+LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
+
+inherit native
+require recipes-ti/includes/ti-paths.inc
+
+SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
+
+SRC_URI[gcc-linaro-aarch64.md5sum] = "4972f8943820bdd2f577f498de78964b"
+SRC_URI[gcc-linaro-aarch64.sha256sum] = "30fb7d876bcb982c502057c593d9c1f11b35d5158a26d986718e2b998388c4c8"
+
+do_install() {
+    install -d ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
+    cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
+}
+
+FILES_${PN} = "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}/*"
+
+INSANE_SKIP_${PN} = "already-stripped"
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
new file mode 100644
index 0000000..0268ae3
--- /dev/null
+++ b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
@@ -0,0 +1,23 @@
+include recipes-ti/devtools/gcc-linaro.inc
+
+PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
+S = "${WORKDIR}/${PACKAGE_DIR}"
+
+LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
+
+inherit native
+require recipes-ti/includes/ti-paths.inc
+
+SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi.tar.xz;name=gcc-linaro"
+
+SRC_URI[gcc-linaro.md5sum] = "9a4a39cfc78c84375b1160aa93587aed"
+SRC_URI[gcc-linaro.sha256sum] = "45fc4f90af2e2e9c3197a275f6005ef5639f7a1889fa3eb24c3125ccd70fcd3d"
+
+do_install() {
+    install -d ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
+    cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
+}
+
+FILES_${PN} = "${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*"
+
+INSANE_SKIP_${PN} = "already-stripped"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index d45b77f..52a93cf 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -48,7 +48,7 @@ export XDC_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdctools-tree"
 export PDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-pdk-tree"
 export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
-export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${datadir}/arm-none-eabi"
+export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
 export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
 export MATHLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c66x-tree"
 export MATHLIB_C674_INSTALL_DIR_RECIPE    = "${installdir}/ti-mathlib-c674x-tree"
@@ -58,8 +58,8 @@ export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
 export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
 export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
 export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
-export GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE          = "${datadir}/arm-none-eabi"
-export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE  = "${datadir}/aarch64-none-elf"
+export GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE          = "${installdir}/gcc-linaro-baremetal"
+export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE  = "${installdir}/gcc-linaro-baremetal-aarch64"
 export TI_CGT7X_INSTALL_DIR_RECIPE        = "${installdir}/cgt-c7x"
 
 
-- 
2.7.4

