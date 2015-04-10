Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0FF0E009AE; Fri, 10 Apr 2015 10:59:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D79F2E00961
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 10:59:53 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CEB5A529D0; Fri, 10 Apr 2015 17:59:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150410175952.CEB5A529D0@arago-project.org>
Date: Fri, 10 Apr 2015 17:59:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : cppi-lld: Update to new version 2.1.0.8
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
X-List-Received-Date: Fri, 10 Apr 2015 17:59:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 7f0bfb45e602cafaec78d12edbd500321cb8598b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7f0bfb45e602cafaec78d12edbd500321cb8598b

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Apr 10 20:11:02 2015 +0000

cppi-lld: Update to new version 2.1.0.8

- Add init script for creating symbolic link for generic device library boot time

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cppi-lld/cppi-lld.inc       |    8 ++--
 recipes-bsp/cppi-lld/cppi-lld_git.bb    |   16 ++++++++++-
 recipes-bsp/cppi-lld/files/init_cppi.sh |   47 +++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index d26adc5..0a8ee55 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/cppi/COPYING.txt;md5=e8f6789acd
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/cppi-lld.git;destsuffix=git/ti/drv/cppi;protocol=git;branch=${BRANCH}"
 
-# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.06"
-SRCREV = "4c6c0a857786c49d8003453d3bc7c3c97ff4f5a4"
-PV = "02.01.00.06"
-PR = "r0"
+# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.08"
+SRCREV = "320af092dc382af52b9e68f14ca8acd5c1c467c1"
+PV = "02.01.00.09"
+PR = "r1"
 
 DEVICELIST = "k2h k2k k2l k2e"
 
diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
index bb2028b..cd419f6 100755
--- a/recipes-bsp/cppi-lld/cppi-lld_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld_git.bb
@@ -5,15 +5,29 @@ DEPENDS = "common-csl-ip rm-lld qmss-lld"
 
 include cppi-lld.inc
 
+SRC_URI += "file://init_cppi.sh"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "init_cppi.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
 do_compile () {
 #   Now build the lld in the updated directory
 	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
 	for device in ${DEVICELIST}
 	do
-		make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}" 
+		make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}"
 	done
 }
 
 do_install () {
 	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+#   Set the generic device library symbolic link to default k2h
+    cd ${D}${libdir}
+    ln -sf libcppi_k2h.so.1.0.0 libcppi_device.so.1
+    ln -sf libcppi_device.so.1 libcppi_device.so
+#   Copy init scripts
+    install -d ${D}${sysconfdir}/init.d/
+    install -c -m 755 ${WORKDIR}/init_cppi.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
diff --git a/recipes-bsp/cppi-lld/files/init_cppi.sh b/recipes-bsp/cppi-lld/files/init_cppi.sh
new file mode 100755
index 0000000..7a602da
--- /dev/null
+++ b/recipes-bsp/cppi-lld/files/init_cppi.sh
@@ -0,0 +1,47 @@
+#*
+#* Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+#*
+#*
+#*  Redistribution and use in source and binary forms, with or without
+#*  modification, are permitted provided that the following conditions
+#*  are met:
+#*
+#*    Redistributions of source code must retain the above copyright
+#*    notice, this list of conditions and the following disclaimer.
+#*
+#*    Redistributions in binary form must reproduce the above copyright
+#*    notice, this list of conditions and the following disclaimer in the
+#*    documentation and/or other materials provided with the
+#*    distribution.
+#*
+#*    Neither the name of Texas Instruments Incorporated nor the names of
+#*    its contributors may be used to endorse or promote products derived
+#*    from this software without specific prior written permission.
+#*
+
+#! /bin/sh
+compatible=$(cat /proc/device-tree/compatible)
+
+cd /usr/lib
+case "$compatible" in
+	*k2hk*)
+		device=k2hk
+		ln -sf libcppi_k2h.so.1.0.0 libcppi_device.so.1
+	;;
+	*k2l*)
+		device=k2l
+		ln -sf libcppi_k2l.so.1.0.0 libcppi_device.so.1
+	;;
+	*k2e*)
+	device=k2e
+		ln -sf libcppi_k2e.so.1.0.0 libcppi_device.so.1
+	;;
+	*)
+		device=unknown
+	;;
+esac
+
+if [ $device != unknown ]; then
+	ln -sf libcppi_device.so.1 libcppi_device.so
+	echo cppi library link established for device : $device
+fi


