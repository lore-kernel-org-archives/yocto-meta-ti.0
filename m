Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.21196.1643238553001889617
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 705F840CC0;
	Wed, 26 Jan 2022 23:09:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2yCIgiUzN1P; Wed, 26 Jan 2022 23:09:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5DB2540CCA;
	Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EAD2D17473A;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 18/19] gcc-linaro-baremetal: remove 7.2 version of GCC for baremetal Arm and Aarch64
Date: Wed, 26 Jan 2022 18:08:58 -0500
Message-Id: <1643238539-20686-19-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Newer versions of baremetal GCC toolchain available from meta-arm-toolchain.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../gcc-linaro-baremetal-aarch64-native.bb         | 23 ----------------------
 recipes-ti/devtools/gcc-linaro-baremetal-native.bb | 23 ----------------------
 recipes-ti/devtools/gcc-linaro.inc                 | 10 ----------
 recipes-ti/includes/ti-paths.inc                   |  2 --
 4 files changed, 58 deletions(-)
 delete mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
 delete mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-native.bb
 delete mode 100644 recipes-ti/devtools/gcc-linaro.inc

diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
deleted file mode 100644
index 3b40c9b..0000000
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
-FILES:${PN} = "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}/*"
-
-INSANE_SKIP:${PN} = "already-stripped"
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
deleted file mode 100644
index 6d5ec19..0000000
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
-FILES:${PN} = "${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*"
-
-INSANE_SKIP:${PN} = "already-stripped"
diff --git a/recipes-ti/devtools/gcc-linaro.inc b/recipes-ti/devtools/gcc-linaro.inc
deleted file mode 100644
index 19f5a2c..0000000
--- a/recipes-ti/devtools/gcc-linaro.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Linaro GCC for ARM"
-HOMEPAGE = "https://launchpad.net/gcc-arm-embedded"
-SECTION = "devel"
-LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
-LIC_FILES_CHKSUM = "file://share/doc/gcc/GNU-Free-Documentation-License.html;md5=${LIC_CHKSUM}"
-
-PV = "7.2.1"
-PR = "r0"
-
-GCC_ARM_YEAR = "2017.11"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index ea985be..358d7df 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -50,8 +50,6 @@ export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
 export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
 export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
 export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
-export GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE          = "${installdir}/gcc-linaro-baremetal"
-export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE  = "${installdir}/gcc-linaro-baremetal-aarch64"
 export TI_CGT7X_INSTALL_DIR_RECIPE        = "${installdir}/cgt-c7x"
 
 
-- 
2.7.4

