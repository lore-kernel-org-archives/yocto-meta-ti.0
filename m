Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D82E3E00B4C; Wed,  4 Nov 2015 07:00:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A08CE00B31
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:00:02 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4927E52AA7; Wed,  4 Nov 2015 15:00:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150002.4927E52AA7@arago-project.org>
Date: Wed,  4 Nov 2015 15:00:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : pa-lld: Only build binaries relevent to the machine
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
X-List-Received-Date: Wed, 04 Nov 2015 15:00:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bb3b5d10f0c16d807dc6e8451955c33e50f59bb4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bb3b5d10f0c16d807dc6e8451955c33e50f59bb4

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:23 2015 +0000

pa-lld: Only build binaries relevent to the machine

* Due to this change, the init script is no longer needed

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pa-lld/files/init_pa.sh   |   47 ---------------------------------
 recipes-bsp/pa-lld/pa-lld-test_git.bb |    4 +--
 recipes-bsp/pa-lld/pa-lld.inc         |    9 ++++++
 recipes-bsp/pa-lld/pa-lld_git.bb      |   21 +++++----------
 4 files changed, 17 insertions(+), 64 deletions(-)

diff --git a/recipes-bsp/pa-lld/files/init_pa.sh b/recipes-bsp/pa-lld/files/init_pa.sh
deleted file mode 100755
index 8f80e35..0000000
--- a/recipes-bsp/pa-lld/files/init_pa.sh
+++ /dev/null
@@ -1,47 +0,0 @@
-#*
-#* Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
-#*
-#*
-#*  Redistribution and use in source and binary forms, with or without
-#*  modification, are permitted provided that the following conditions
-#*  are met:
-#*
-#*    Redistributions of source code must retain the above copyright
-#*    notice, this list of conditions and the following disclaimer.
-#*
-#*    Redistributions in binary form must reproduce the above copyright
-#*    notice, this list of conditions and the following disclaimer in the
-#*    documentation and/or other materials provided with the
-#*    distribution.
-#*
-#*    Neither the name of Texas Instruments Incorporated nor the names of
-#*    its contributors may be used to endorse or promote products derived
-#*    from this software without specific prior written permission.
-#*
-
-#! /bin/sh
-compatible=$(cat /proc/device-tree/compatible)
-
-cd /usr/lib
-case "$compatible" in
-	*k2hk*)
-		device=k2hk
-		ln -sf libpa.so.1.0.0 libpa_device.so.1
-	;;
-	*k2l*)
-		device=k2l
-		ln -sf libpa2.so.1.0.0 libpa_device.so.1
-	;;
-	*k2e*)
-	device=k2e
-		ln -sf libpa2.so.1.0.0 libpa_device.so.1
-	;;
-	*)
-		device=unknown
-	;;
-esac
-
-if [ $device != unknown ]; then
-	ln -sf libpa_device.so.1 libpa_device.so
-	echo PA library link established for device : $device
-fi
diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bb b/recipes-bsp/pa-lld/pa-lld-test_git.bb
index 0fb6f07..62ec122 100644
--- a/recipes-bsp/pa-lld/pa-lld-test_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld-test_git.bb
@@ -4,9 +4,7 @@ DEPENDS = "common-csl-ip pa-lld cppi-lld qmss-lld sa-lld"
 
 include pa-lld.inc
 
-PR = "${INC_PR}.0"
-
-DEVICELIST = "k2h k2k k2l k2e"
+PR = "${INC_PR}.1"
 
 CHOICELIST = "yes no"
 
diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 58f0f42..082d59d 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -2,6 +2,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
 
 COMPATIBLE_MACHINE = "keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pa-lld.git"
 PA_LLD_GIT_PROTOCOL = "git"
@@ -19,3 +20,11 @@ PV = "03.00.01.05"
 INC_PR = "r2"
 
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
+
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2l-evm = "k2l"
+DEVICELIST_k2e-evm = "k2e"
+
+LIBPA_k2hk-evm = "libpa"
+LIBPA_k2e-evm = "libpa2"
+LIBPA_k2l-evm = "libpa2"
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
index 0cb3bc5..501ee2d 100644
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld_git.bb
@@ -4,27 +4,20 @@ DEPENDS = "common-csl-ip rm-lld"
 
 include pa-lld.inc
 
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://init_pa.sh"
-
-inherit update-rc.d
-
-INITSCRIPT_NAME = "init_pa.sh"
-INITSCRIPT_PARAMS = "defaults 10"
+PR = "${INC_PR}.1"
 
 do_compile () {
 #   Now build the lld in the updated directory
-	make -f makefile_armv7 DEVICE=k2h clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
-	make -f makefile_armv7 DEVICE=k2l lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+    for device in ${DEVICELIST}
+    do
+        make -f makefile_armv7 DEVICE=$device lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+    done
 }
 
 do_install () {
 	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+
 #   Set the generic device library symbolic link
-    ln -sf libpa.so.1.0.0 ${D}${libdir}/libpa_device.so.1
+    ln -sf ${LIBPA}.so.1.0.0 ${D}${libdir}/libpa_device.so.1
     ln -sf libpa_device.so.1 ${D}${libdir}/libpa_device.so
-#   Copy init scripts
-    install -d ${D}${sysconfdir}/init.d/
-    install -c -m 755 ${WORKDIR}/${INITSCRIPT_NAME} ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }


