Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4517.1598317263862488316
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 18:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1888A40C24;
	Tue, 25 Aug 2020 01:01:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rAVcZqkr7EVC; Tue, 25 Aug 2020 01:01:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ED40440020;
	Tue, 25 Aug 2020 01:01:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4482E172DF3;
	Mon, 24 Aug 2020 21:01:01 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] rtos,gcc-arm-none-eabi: Rename gcc-arm-none-eabi -> gcc-arm-baremetal
Date: Mon, 24 Aug 2020 21:01:01 -0400
Message-Id: <1598317261-45888-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Rename gcc-arm-none-eabi to gcc-arm-baremetal.
As meta-arm now provides baremetal gcc-arm-none-eabi version 9, and due to layer
priorities, let's rename gcc-arm-none-eabi to gcc-arm-baremetal to force picking
the right version for RTOS builds.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 classes/ti-pdk.bbclass                             |  6 +++---
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb        |  2 +-
 recipes-bsp/starterware/starterware-rtos_git.bb    |  2 +-
 ...te.bb => gcc-arm-baremetal_7-2018-q2-update.bb} |  0
 .../gcc-arm-none-eabi-native_4.9.2015q3.bb         | 23 ----------------------
 recipes-ti/ipc/ti-ipc-rtos.inc                     |  4 ++--
 6 files changed, 7 insertions(+), 30 deletions(-)
 rename recipes-ti/devtools/{gcc-arm-none-eabi_7-2018-q2-update.bb => gcc-arm-baremetal_7-2018-q2-update.bb} (100%)
 delete mode 100644 recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 2571234..6831421 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -3,15 +3,15 @@ require recipes-ti/includes/ti-staging.inc
 
 inherit perlnative
 
-DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native"
+DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-baremetal-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native"
 
 DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
 DEPENDS_remove_ti33x = "ti-cgt6x-native"
 DEPENDS_remove_ti43x = "ti-cgt6x-native"
 DEPENDS_append_omapl1 = " ti-cgt-arm-native"
-DEPENDS_remove_am65xx = "gcc-arm-none-eabi-native ti-cgt6x-native"
+DEPENDS_remove_am65xx = "gcc-arm-baremetal-native ti-cgt6x-native"
 DEPENDS_append_am65xx = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
-DEPENDS_remove_j7 = "gcc-arm-none-eabi-native"
+DEPENDS_remove_j7 = "gcc-arm-baremetal-native"
 DEPENDS_append_j7 = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index 71c4fce..4812afe 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -3,7 +3,7 @@ require recipes-ti/includes/ti-paths.inc
 
 PR = "${INC_PR}.1"
 
-DEPENDS = "ti-sysbios ti-xdctools-native gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
+DEPENDS = "ti-sysbios ti-xdctools-native gcc-arm-baremetal-native ti-cgt-arm-native ti-cgt6x-native"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb b/recipes-bsp/starterware/starterware-rtos_git.bb
index 5e3535e..bcac8d4 100644
--- a/recipes-bsp/starterware/starterware-rtos_git.bb
+++ b/recipes-bsp/starterware/starterware-rtos_git.bb
@@ -1,6 +1,6 @@
 require starterware.inc
 
-DEPENDS = "gcc-arm-none-eabi-native ti-pdk-build-rtos ti-xdctools-native"
+DEPENDS = "gcc-arm-baremetal-native ti-pdk-build-rtos ti-xdctools-native"
 
 require recipes-ti/includes/ti-paths.inc
 
diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb b/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
similarity index 100%
rename from recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
rename to recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
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
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index a68ba80..b6b7892 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -42,11 +42,11 @@ RELEASE_SUFFIX = ""
 PR = "${INC_PR}.r0"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
-                            gcc-arm-none-eabi-native \
+                            gcc-arm-baremetal-native \
 "
 DEPENDS_append_omap-a15 = " ti-cgt6x-native \
                             ti-cgt-arm-native \
-                            gcc-arm-none-eabi-native \
+                            gcc-arm-baremetal-native \
 "
 DEPENDS_append_omapl138 = " ti-cgt6x-native \
 "
-- 
2.7.4

