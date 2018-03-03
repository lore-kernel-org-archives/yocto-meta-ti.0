Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13F8CE01070; Fri,  2 Mar 2018 18:46:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A251AE00E39
	for <meta-ti@yoctoproject.org>; Fri,  2 Mar 2018 18:45:57 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E364020B82;
	Sat,  3 Mar 2018 02:45:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eo9XSF7ic7vL; Sat,  3 Mar 2018 02:45:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A553C20B77;
	Sat,  3 Mar 2018 02:45:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 285C91632F3;
	Fri,  2 Mar 2018 21:45:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri,  2 Mar 2018 21:45:53 -0500
Message-Id: <1520045153-26802-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520045153-26802-1-git-send-email-denis@denix.org>
References: <1520045153-26802-1-git-send-email-denis@denix.org>
Subject: [rocko/master][PATCH 4/4] netapi: remove due to external ipsecmgr dependency
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
X-List-Received-Date: Sat, 03 Mar 2018 02:46:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Moved to meta-arago

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/netapi/netapi-test_git.bb | 51 ------------------------------------
 recipes-ti/netapi/netapi.inc         | 33 -----------------------
 recipes-ti/netapi/netapi_git.bb      | 32 ----------------------
 3 files changed, 116 deletions(-)
 delete mode 100644 recipes-ti/netapi/netapi-test_git.bb
 delete mode 100644 recipes-ti/netapi/netapi.inc
 delete mode 100644 recipes-ti/netapi/netapi_git.bb

diff --git a/recipes-ti/netapi/netapi-test_git.bb b/recipes-ti/netapi/netapi-test_git.bb
deleted file mode 100644
index 3b7825c..0000000
--- a/recipes-ti/netapi/netapi-test_git.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-DESCRIPTION = "Provides test and application binaries using NETAPI module"
-
-DEPENDS = "netapi ipsecmgr"
-
-include netapi.inc
-
-PR = "${INC_PR}.1"
-
-EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-do_compile () {
-#   Build the netapi binaries
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake -f makefile_armv7 tests NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
-				USEDYNAMIC_LIB="$choice" DEVICE="$device"
-		done
-
-#     Now build the netapi appplications
-		cd ${S}/applications/ipsec_offload/ipsecmgr/build
-		oe_runmake clean NETAPI_SRC_DIR=${S} DEVICE="$device"
-		oe_runmake app NETAPI_SRC_DIR=${S} DEVICE="$device"
-
-		cd ${S}/applications/ipsec_offload/config-app/build
-		oe_runmake clean DEVICE="$device"
-		oe_runmake app DEVICE="$device"
-		cd ${S}
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake -f makefile_armv7 installbin INSTALL_INC_BASE_DIR=${D}/${includedir} \
-			INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} \
-			SYSCONFDIR=${D}${sysconfdir} DEVICE="$device"
-
-		cd ${S}/applications/ipsec_offload/ipsecmgr/build
-		oe_runmake install \
-			INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir} \
-			DEVICE="$device"
-
-		cd ${S}/applications/ipsec_offload/config-app/build
-		oe_runmake install \
-			INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir} \
-			DEVICE="$device"
-		cd ${S}
-	done
-}
diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
deleted file mode 100644
index 83fb6aa..0000000
--- a/recipes-ti/netapi/netapi.inc
+++ /dev/null
@@ -1,33 +0,0 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=f2b4f162358b1ffaf3f2307287ca2074"
-
-COMPATIBLE_MACHINE = "keystone"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEBIAN_NOAUTONAME_${PN} = "1"
-DEBIAN_NOAUTONAME_${PN}-dev = "1"
-DEBIAN_NOAUTONAME_${PN}-dbg = "1"
-DEBIAN_NOAUTONAME_${PN}-staticdev = "1"
-
-NETAPI_GIT_URI = "git://git.ti.com/keystone-rtos/netapi.git"
-NETAPI_GIT_PROTOCOL = "git"
-NETAPI_GIT_BRANCH = "master"
-
-# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.07"
-NETAPI_SRCREV = "50026020384737d253668c4be80745a3653106f8"
-
-BRANCH = "${NETAPI_GIT_BRANCH}"
-SRC_URI = "${NETAPI_GIT_URI};protocol=${NETAPI_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${NETAPI_SRCREV}"
-
-PV = "01.01.00.07"
-INC_PR = "r0"
-
-DEVICELIST_k2hk = "k2h k2k"
-DEVICELIST_k2l-evm  = "k2l"
-DEVICELIST_k2e  = "k2e"
-
-CHOICELIST = "yes no"
-
-BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/runtime/netapi"
diff --git a/recipes-ti/netapi/netapi_git.bb b/recipes-ti/netapi/netapi_git.bb
deleted file mode 100644
index 4427ecc..0000000
--- a/recipes-ti/netapi/netapi_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "Provides NETAPI module: TI user space network library"
-
-DEPENDS = "common-csl-ip rm-lld qmss-lld cppi-lld sa-lld hplib pktlib nwal-lld"
-
-include netapi.inc
-
-PR = "${INC_PR}.1"
-
-EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
-
-do_compile () {
-#   Now build the netapi
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake  clean NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
-				USEDYNAMIC_LIB="$choice" DEVICE="$device"
-			oe_runmake lib NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
-				USEDYNAMIC_LIB="$choice" DEVICE="$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} \
-			INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} \
-			SYSCONFDIR=${D}${sysconfdir} DEVICE="$device"
-	done
-}
-- 
2.7.4


