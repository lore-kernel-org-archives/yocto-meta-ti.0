Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9272AE009C2; Fri, 10 Apr 2015 15:09:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C88D8E00993
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 15:09:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1542D529C6; Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150410220932.1542D529C6@arago-project.org>
Date: Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : hyplnk-lld: Update to new version 2.1.0.2
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
X-List-Received-Date: Fri, 10 Apr 2015 22:09:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3a17af114edc5c0e1178ce90789a8afabad056fb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3a17af114edc5c0e1178ce90789a8afabad056fb

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Apr 11 03:52:27 2015 +0000

hyplnk-lld: Update to new version 2.1.0.2

- Add init script to add symbolic link for generic device library
- remove unused CHOICELIST

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hyplnk-lld/files/init_hyplnk.sh |   47 +++++++++++++++++++++++++++
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc       |    8 ++--
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb    |   18 ++++++++--
 3 files changed, 66 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh b/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh
new file mode 100755
index 0000000..fb65057
--- /dev/null
+++ b/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh
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
+		ln -sf libhyplnk_k2h.so.1.0.0 libhyplnk_device.so.1
+	;;
+	*k2l*)
+		device=k2l
+		ln -sf libhyplnk_k2l.so.1.0.0 libhyplnk_device.so.1
+	;;
+	*k2e*)
+		device=k2e
+		ln -sf libhyplnk_k2e.so.1.0.0 libhyplnk_device.so.1
+	;;
+	*)
+		device=unknown
+	;;
+esac
+
+if [ $device != unknown ]; then
+	ln -sf libhyplnk_device.so.1 libhyplnk_device.so
+	echo hyplnk library link established for device : $device
+fi
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
index 4c8bb32..7f46b7d 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=6233
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/hyplnk-lld.git;destsuffix=git/ti/drv/${LLDNAME};protocol=git;branch=${BRANCH}"
-# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.01
-SRCREV = "6910da379501984ecf27f8d23ba6fc6310fe387e"
+# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.02
+SRCREV = "8451586025a0cf561ed9bc6ab70a2cad88a7e95e"
 
-PV = "2.1.0"
-PR = "r0"
+PV = "2.1.0.2"
+PR = "r1"
 
 DEVICELIST = " k2h \
                k2k \
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
index a582f98..8be072c 100755
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
@@ -2,9 +2,13 @@ include hyplnk-lld.inc
 
 DEPENDS = "common-csl-ip"
 
-CHOICELIST = " yes \
-               no  \
-"
+SRC_URI += "file://init_hyplnk.sh"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "init_hyplnk.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
 do_compile () {
 	make -f makefile_armv7 clean PDK_INSTALL_PATH="${STAGING_INCDIR}" \
 		HYPLNK_SRC_DIR="${S}"
@@ -19,4 +23,12 @@ do_install () {
 	make -f makefile_armv7 install PDK_INSTALL_PATH="${STAGING_INCDIR}" \
 		INSTALL_INC_BASE_DIR="${D}/${includedir}" \
 		INSTALL_LIB_BASE_DIR="${D}${libdir}" HYPLNK_SRC_DIR="${S}"
+#   Set the generic device library symbolic link to default k2h
+	cd ${D}${libdir}
+	ln -sf libhyplnk_k2h.so.1.0.0 libhyplnk_device.so.1
+	ln -sf libhyplnk_device.so.1 libhyplnk_device.so
+#   Copy init scripts
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${WORKDIR}/init_hyplnk.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+
 }


