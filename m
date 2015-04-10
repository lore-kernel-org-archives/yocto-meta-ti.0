Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B2F1E009A1; Fri, 10 Apr 2015 14:52:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6114E00961
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 14:52:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3ALqUq2012282
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 16:52:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3ALqT3w001849
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 16:52:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 16:52:28 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3ALqST9023614;	Fri, 10 Apr 2015 16:52:28 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 10 Apr 2015 17:52:27 -0400
Message-ID: <1428702747-23411-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] hyplnk-lld: Update to new version 2.1.0.2
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
X-List-Received-Date: Fri, 10 Apr 2015 21:52:34 -0000
Content-Type: text/plain

- Add init script to add symbolic link for generic device library
- remove unused CHOICELIST

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/hyplnk-lld/files/init_hyplnk.sh |   47 +++++++++++++++++++++++++++
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc       |    8 ++---
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb    |   18 ++++++++--
 3 files changed, 66 insertions(+), 7 deletions(-)
 create mode 100755 recipes-bsp/hyplnk-lld/files/init_hyplnk.sh

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
-- 
1.7.9.5


