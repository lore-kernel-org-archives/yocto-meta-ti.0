Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8A4CE009A4; Fri, 10 Apr 2015 14:55:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 074C9E00961
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 14:55:49 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3ALtnVs022261
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 16:55:49 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3ALtm36007175
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 16:55:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 16:55:47 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3ALtllI009249;	Fri, 10 Apr 2015 16:55:47 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 10 Apr 2015 17:55:43 -0400
Message-ID: <1428702943-23546-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] qmss-lld: Update to new version 2.1.0.10
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
X-List-Received-Date: Fri, 10 Apr 2015 21:55:50 -0000
Content-Type: text/plain

- Add init script for creating symbolic link for generic device library at boot time

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/qmss-lld/files/init_qmss.sh |   47 +++++++++++++++++++++++++++++++
 recipes-bsp/qmss-lld/qmss-lld.inc       |    8 +++---
 recipes-bsp/qmss-lld/qmss-lld_git.bb    |   16 +++++++++++
 3 files changed, 67 insertions(+), 4 deletions(-)
 create mode 100755 recipes-bsp/qmss-lld/files/init_qmss.sh

diff --git a/recipes-bsp/qmss-lld/files/init_qmss.sh b/recipes-bsp/qmss-lld/files/init_qmss.sh
new file mode 100755
index 0000000..af69531
--- /dev/null
+++ b/recipes-bsp/qmss-lld/files/init_qmss.sh
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
+		ln -sf libqmss_k2h.so.1.0.0 libqmss_device.so.1
+	;;
+	*k2l*)
+		device=k2l
+		ln -sf libqmss_k2l.so.1.0.0 libqmss_device.so.1
+	;;
+	*k2e*)
+		device=k2e
+		ln -sf libqmss_k2e.so.1.0.0 libqmss_device.so.1
+	;;
+	*)
+		device=unknown
+	;;
+esac
+
+if [ $device != unknown ]; then
+	ln -sf libqmss_device.so.1 libqmss_device.so
+	echo qmss library link established for device : $device
+fi
diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index 87499cc..d2eb81b 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=e8f6789acd
 BRANCH ="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/qmss-lld.git;destsuffix=git/ti/drv/qmss;protocol=git;branch=${BRANCH}"
 
-# commit ID corresponding to DEV.QMSS_LLD.02.01.00.06
-SRCREV = "661fff76530fd56cf7550f76c7b7a541ea18fda8"
-PV = "02.01.00.06"
-PR = "r0"
+# commit ID corresponding to DEV.QMSS_LLD.02.01.00.10
+SRCREV = "ffec14248f460b7cf4def4457f9c2335df62618d"
+PV = "02.01.00.10"
+PR = "r1"
 
 DEVICELIST = "k2h k2k k2l k2e"
 
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qmss-lld_git.bb
index 9d2f547..38b0762 100755
--- a/recipes-bsp/qmss-lld/qmss-lld_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld_git.bb
@@ -5,6 +5,14 @@ DEPENDS="common-csl-ip rm-lld"
 
 include qmss-lld.inc
 
+
+SRC_URI += "file://init_qmss.sh"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "init_qmss.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
 do_compile () {
 #   Now build the lld
     make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
@@ -17,4 +25,12 @@ do_compile () {
 
 do_install () {
     make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+
+#   Set the generic device library symbolic link to default k2h
+    cd ${D}${libdir}
+    ln -sf libqmss_k2h.so.1.0.0 libqmss_device.so.1
+    ln -sf libqmss_device.so.1 libqmss_device.so
+#   Copy init scripts
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${WORKDIR}/init_qmss.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
-- 
1.7.9.5


