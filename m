Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB70FE00C42; Wed,  4 Nov 2015 07:01:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DCCFE00B5C
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:00:05 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1EAE252AB1; Wed,  4 Nov 2015 15:00:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150005.1EAE252AB1@arago-project.org>
Date: Wed,  4 Nov 2015 15:00:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : qmss-lld: Only build binaries relevent to the machine
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
X-List-Received-Date: Wed, 04 Nov 2015 15:01:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 48e404d38fc4beb63a4a074c336eda7ef7db94f0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=48e404d38fc4beb63a4a074c336eda7ef7db94f0

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:26 2015 +0000

qmss-lld: Only build binaries relevent to the machine

* Due to this change, the init script is no longer needed

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/qmss-lld/files/init_qmss.sh   |   47 -----------------------------
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb |    3 +-
 recipes-bsp/qmss-lld/qmss-lld.inc         |    7 ++++-
 recipes-bsp/qmss-lld/qmss-lld_git.bb      |   23 +++++--------
 4 files changed, 16 insertions(+), 64 deletions(-)

diff --git a/recipes-bsp/qmss-lld/files/init_qmss.sh b/recipes-bsp/qmss-lld/files/init_qmss.sh
deleted file mode 100755
index af69531..0000000
--- a/recipes-bsp/qmss-lld/files/init_qmss.sh
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
-		ln -sf libqmss_k2h.so.1.0.0 libqmss_device.so.1
-	;;
-	*k2l*)
-		device=k2l
-		ln -sf libqmss_k2l.so.1.0.0 libqmss_device.so.1
-	;;
-	*k2e*)
-		device=k2e
-		ln -sf libqmss_k2e.so.1.0.0 libqmss_device.so.1
-	;;
-	*)
-		device=unknown
-	;;
-esac
-
-if [ $device != unknown ]; then
-	ln -sf libqmss_device.so.1 libqmss_device.so
-	echo qmss library link established for device : $device
-fi
diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
index 7c19364..60a35b1 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
@@ -1,11 +1,10 @@
 DESCRIPTION = "TI QMSS low level driver unit test and example binaries"
-COMPATIBLE_MACHINE = "keystone"
 
 DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld"
 
 include qmss-lld.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 CHOICELIST = "yes no"
 
diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index efd681e..1cf9b0b 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -1,6 +1,9 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
 
+COMPATIBLE_MACHINE = "keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 QMSS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/qmss-lld.git"
 QMSS_LLD_GIT_PROTOCOL = "git"
 QMSS_LLD_GIT_BRANCH = "master"
@@ -16,6 +19,8 @@ SRCREV = "${QMSS_LLD_SRCREV}"
 PV = "02.01.00.11"
 INC_PR = "r1"
 
-DEVICELIST = "k2h k2k k2l k2e"
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2l-evm = "k2l"
+DEVICELIST_k2e-evm = "k2e"
 
 S = "${WORKDIR}/${QMSS_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qmss-lld_git.bb
index 83c9a7e..813929e 100644
--- a/recipes-bsp/qmss-lld/qmss-lld_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld_git.bb
@@ -1,18 +1,10 @@
 DESCRIPTION = "TI QMSS low level driver library"
-COMPATIBLE_MACHINE = "keystone"
 
 DEPENDS="common-csl-ip rm-lld"
 
 include qmss-lld.inc
 
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://init_qmss.sh"
-
-inherit update-rc.d
-
-INITSCRIPT_NAME = "init_qmss.sh"
-INITSCRIPT_PARAMS = "defaults 10"
+PR = "${INC_PR}.1"
 
 do_compile () {
 #   Now build the lld
@@ -27,11 +19,14 @@ do_compile () {
 do_install () {
     make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
 
-#   Set the generic device library symbolic link to default k2h
+    # Set the generic device library symbolic link to default k2h
     cd ${D}${libdir}
-    ln -sf libqmss_k2h.so.1.0.0 libqmss_device.so.1
+
+    # Link only the first device in the list
+    for device in ${DEVICELIST}
+    do
+        ln -sf libqmss_${device}.so.1.0.0 libqmss_device.so.1
+        break
+    done
     ln -sf libqmss_device.so.1 libqmss_device.so
-#   Copy init scripts
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 755 ${WORKDIR}/init_qmss.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }


