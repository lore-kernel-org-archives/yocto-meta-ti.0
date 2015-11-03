Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E60E2E00AEB; Tue,  3 Nov 2015 11:47:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6E55E00AAA
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:43 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JlhcX027122
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:43 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jlhsv014828
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:43 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:43 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla7A022118;	Tue, 3 Nov 2015 13:47:42 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:16 -0500
Message-ID: <1446580053-16935-11-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 10/27] hyplnk-lld: Only build binaries relevent to the machine
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:45 -0000
Content-Type: text/plain

* Due to this change, the init script is no longer needed

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/hyplnk-lld/files/init_hyplnk.sh | 43 -----------------------------
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc       |  9 +++---
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb    | 24 +++++++---------
 3 files changed, 14 insertions(+), 62 deletions(-)
 delete mode 100755 recipes-bsp/hyplnk-lld/files/init_hyplnk.sh

diff --git a/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh b/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh
deleted file mode 100755
index d6795f1..0000000
--- a/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh
+++ /dev/null
@@ -1,43 +0,0 @@
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
-		ln -sf libhyplnk_k2h.so.1.0.0 libhyplnk_device.so.1
-	;;
-	*k2e*)
-		device=k2e
-		ln -sf libhyplnk_k2e.so.1.0.0 libhyplnk_device.so.1
-	;;
-	*)
-		device=unknown
-	;;
-esac
-
-if [ $device != unknown ]; then
-	ln -sf libhyplnk_device.so.1 libhyplnk_device.so
-	echo hyplnk library link established for device : $device
-fi
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
index 09fec45..ecd68e9 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
@@ -1,7 +1,8 @@
 DESCRIPTION = "TI Hyperlink Low Level Driver"
 LICENSE = "BSD-3-Clause"
 
-COMPATIBLE_MACHINE = "keystone"
+COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 LLDNAME="hyplnk"
 
@@ -22,9 +23,7 @@ SRCREV = "${HYPLNK_SRCREV}"
 PV = "2.1.0.5"
 INC_PR = "r2"
 
-DEVICELIST = " k2h \
-               k2k \
-               k2e \
-"
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2e-evm  = "k2e"
 
 S = "${WORKDIR}/${HYPLNK_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
index e20ad1f..8ef3c82 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
@@ -1,16 +1,9 @@
 include hyplnk-lld.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS = "common-csl-ip"
 
-SRC_URI += "file://init_hyplnk.sh"
-
-inherit update-rc.d
-
-INITSCRIPT_NAME = "init_hyplnk.sh"
-INITSCRIPT_PARAMS = "defaults 10"
-
 do_compile () {
 	make -f makefile_armv7 clean PDK_INSTALL_PATH="${STAGING_INCDIR}" \
 		HYPLNK_SRC_DIR="${S}"
@@ -25,12 +18,15 @@ do_install () {
 	make -f makefile_armv7 install PDK_INSTALL_PATH="${STAGING_INCDIR}" \
 		INSTALL_INC_BASE_DIR="${D}/${includedir}" \
 		INSTALL_LIB_BASE_DIR="${D}${libdir}" HYPLNK_SRC_DIR="${S}"
-#   Set the generic device library symbolic link to default k2h
+
+	# Set the generic device library symbolic link to default k2h
 	cd ${D}${libdir}
-	ln -sf libhyplnk_k2h.so.1.0.0 libhyplnk_device.so.1
-	ln -sf libhyplnk_device.so.1 libhyplnk_device.so
-#   Copy init scripts
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 755 ${WORKDIR}/init_hyplnk.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 
+	# Link only the first device in the list
+	for device in ${DEVICELIST}
+	do
+		ln -sf libhyplnk_${device}.so.1.0.0 libhyplnk_device.so.1
+		break
+	done
+	ln -sf libhyplnk_device.so.1 libhyplnk_device.so
 }
-- 
1.9.1


