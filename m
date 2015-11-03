Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA643E007FE; Tue,  3 Nov 2015 11:47:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E187E007FE
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:41 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JleQJ027106
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:40 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JleA8001441
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:40 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:41 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla74022118;	Tue, 3 Nov 2015 13:47:40 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:10 -0500
Message-ID: <1446580053-16935-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 04/27] cppi-lld: Only build binaries relevent to the machine
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:43 -0000
Content-Type: text/plain

* Due to this change, the init script is no longer needed

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/cppi-lld/cppi-lld-test_git.bb |  1 -
 recipes-bsp/cppi-lld/cppi-lld.inc         |  9 ++++--
 recipes-bsp/cppi-lld/cppi-lld_git.bb      | 22 ++++++---------
 recipes-bsp/cppi-lld/files/init_cppi.sh   | 47 -------------------------------
 4 files changed, 16 insertions(+), 63 deletions(-)
 delete mode 100755 recipes-bsp/cppi-lld/files/init_cppi.sh

diff --git a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
index 8f4856a..b4f5c23 100644
--- a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "TI CPPI low level driver unit test and example binaries"
-COMPATIBLE_MACHINE = "keystone"
 DEPENDS = "common-csl-ip rm-lld cppi-lld qmss-lld"
 
 include cppi-lld.inc
diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index ae81a3f..cbcad34 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -1,6 +1,9 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/cppi/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
 
+COMPATIBLE_MACHINE = "keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 CPPI_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/cppi-lld.git"
 CPPI_LLD_GIT_PROTOCOL = "git"
 CPPI_LLD_GIT_BRANCH = "master"
@@ -14,8 +17,10 @@ SRC_URI = "${CPPI_LLD_GIT_URI};destsuffix=${CPPI_LLD_GIT_DESTSUFFIX};protocol=${
 
 SRCREV = "${CPPI_LLD_SRCREV}"
 PV = "02.01.00.10"
-INC_PR = "r1"
+INC_PR = "r2"
 
-DEVICELIST = "k2h k2k k2l k2e"
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2e-evm  = "k2e"
 
 S = "${WORKDIR}/${CPPI_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
index 169e0fc..edbc35d 100644
--- a/recipes-bsp/cppi-lld/cppi-lld_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld_git.bb
@@ -1,18 +1,10 @@
 DESCRIPTION = "TI CPPI Module low level driver"
-COMPATIBLE_MACHINE = "keystone"
 
 DEPENDS = "common-csl-ip rm-lld qmss-lld"
 
 include cppi-lld.inc
 
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://init_cppi.sh"
-
-inherit update-rc.d
-
-INITSCRIPT_NAME = "init_cppi.sh"
-INITSCRIPT_PARAMS = "defaults 10"
+PR = "${INC_PR}.1"
 
 do_compile () {
 #   Now build the lld in the updated directory
@@ -25,11 +17,15 @@ do_compile () {
 
 do_install () {
 	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+
 #   Set the generic device library symbolic link to default k2h
     cd ${D}${libdir}
-    ln -sf libcppi_k2h.so.1.0.0 libcppi_device.so.1
+
+    # Link only the first device in the list
+    for device in ${DEVICELIST}
+    do
+        ln -sf libcppi_${device}.so.1.0.0 libcppi_device.so.1
+        break
+    done
     ln -sf libcppi_device.so.1 libcppi_device.so
-#   Copy init scripts
-    install -d ${D}${sysconfdir}/init.d/
-    install -c -m 755 ${WORKDIR}/init_cppi.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
diff --git a/recipes-bsp/cppi-lld/files/init_cppi.sh b/recipes-bsp/cppi-lld/files/init_cppi.sh
deleted file mode 100755
index 7a602da..0000000
--- a/recipes-bsp/cppi-lld/files/init_cppi.sh
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
-		ln -sf libcppi_k2h.so.1.0.0 libcppi_device.so.1
-	;;
-	*k2l*)
-		device=k2l
-		ln -sf libcppi_k2l.so.1.0.0 libcppi_device.so.1
-	;;
-	*k2e*)
-	device=k2e
-		ln -sf libcppi_k2e.so.1.0.0 libcppi_device.so.1
-	;;
-	*)
-		device=unknown
-	;;
-esac
-
-if [ $device != unknown ]; then
-	ln -sf libcppi_device.so.1 libcppi_device.so
-	echo cppi library link established for device : $device
-fi
-- 
1.9.1


