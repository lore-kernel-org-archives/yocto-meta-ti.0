Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3405BC7EE26
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 16:51:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.79.1684774307330642120
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 May 2023 09:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=o5RRlDMT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MGpje8019769;
	Mon, 22 May 2023 11:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684774305;
	bh=xIzKRvZ3hswPJq880Q2tgd4AX+wFJlzainHEugxI6qg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o5RRlDMTrY+RWaL0gRt+KUN6nUoLCDKrAMYlvzzuZu4+TmbDkbStEtVqYBuN5mKK6
	 23yBsh0M2e7Wc8vjQLp1+3B4jc2Rf+rm6E5Qwu8oUfIeacuWXt86fKDWVvfk4i6WNY
	 y4dXN5yioTuwVxRGG/t3JVUDaX/lSVT/Pwk0S0yc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MGpjDQ012014
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 11:51:45 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 11:51:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 11:51:44 -0500
Received: from fllv0040.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MGpiim027526;
	Mon, 22 May 2023 11:51:44 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] ti-xdctools: Fold include files into the one remaining user
Date: Mon, 22 May 2023 11:51:43 -0500
Message-ID: <20230522165143.156123-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522165143.156123-1-afd@ti.com>
References: <20230522165143.156123-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 May 2023 16:51:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16572

There is only one user of these include files, expand the files inside
the one user and remove the includes.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../devtools/ti-xdctools-common.inc           | 70 -----------------
 .../recipes-ti/devtools/ti-xdctools-core.inc  |  5 --
 .../recipes-ti/devtools/ti-xdctools.inc       | 10 ---
 .../devtools/ti-xdctools_3.55.02.22.bb        | 75 ++++++++++++++++++-
 4 files changed, 74 insertions(+), 86 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
 delete mode 100644 meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
 delete mode 100644 meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc

diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
deleted file mode 100644
index 7051fccc..00000000
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
+++ /dev/null
@@ -1,70 +0,0 @@
-DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
-SECTION = "devel"
-LICENSE = "BSD-3-Clause & GPL-2.0-only"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-do_install() {
-    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-
-    install -d ${D}${XDC_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS}  ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
-}
-
-FILES:${PN}-dev = "${XDC_INSTALL_DIR_RECIPE}"
-
-BBCLASSEXTEND = "native nativesdk"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INSANE_SKIP:${PN}-dev = "libdir dev-elf arch file-rdeps"
-
-# Prevent internal libs from getting picked up
-PRIVATE_LIBS = " \
-libncdb.so \
-libcdb.so \
-libjavaplugin_oji.so \
-libjavaplugin_jni.so \
-libjsound.so \
-libinstrument.so \
-libjawt.so \
-libzip.so \
-libjava_crw_demo.so \
-libjavaplugin_nscp_gcc29.so \
-libhprof.so \
-libcmm.so \
-libjdwp.so \
-libmlib_image.so \
-libjpeg.so \
-libverify.so \
-libjavaplugin_nscp.so \
-libmanagement.so \
-libunpack.so \
-librmi.so \
-libJdbcOdbc.so \
-libawt.so \
-libnet.so \
-libjaas_unix.so \
-libnio.so \
-libdcpr.so \
-libioser12.so \
-libjsoundalsa.so \
-libjava.so \
-libfontmanager.so \
-libdt_socket.so \
-libmawt.so \
-libjvm.so \
-libhpi.so \
-lib.so \
-libcairo.so.2 \
-libjli.so \
-libawt_xawt.so \
-"
-
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST:ti-soc = "(.*)"
-COMPATIBLE_HOST:class-native = "(.*)"
-COMPATIBLE_HOST:class-nativesdk = "(.*)"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
deleted file mode 100644
index 47f73b6d..00000000
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-require ti-xdctools-common.inc
-
-S = "${WORKDIR}/xdctools_${PV}_core"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdccore/xdctools_${PV}_core_linux.zip;name=xdczip"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc
deleted file mode 100644
index 1415f83e..00000000
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-require ti-xdctools-common.inc
-require ../includes/ti-eula-unpack.inc
-
-S = "${WORKDIR}/xdctools_${PV}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdctools_setuplinux_${PV}.bin;name=xdcbin"
-
-BINFILE="xdctools_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y:workdir:Y"
-TI_BIN_UNPK_WDEXT="/ti"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb b/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
index 6c3fdeb2..b1361804 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
@@ -1,4 +1,77 @@
-require recipes-ti/devtools/ti-xdctools-core.inc
+DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
+HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
+SECTION = "devel"
+LICENSE = "BSD-3-Clause & GPL-2.0-only"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+do_install() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
+    install -d ${D}${XDC_INSTALL_DIR_RECIPE}
+    cp ${CP_ARGS}  ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
+}
+
+FILES:${PN}-dev = "${XDC_INSTALL_DIR_RECIPE}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INSANE_SKIP:${PN}-dev = "libdir dev-elf arch file-rdeps"
+
+# Prevent internal libs from getting picked up
+PRIVATE_LIBS = " \
+libncdb.so \
+libcdb.so \
+libjavaplugin_oji.so \
+libjavaplugin_jni.so \
+libjsound.so \
+libinstrument.so \
+libjawt.so \
+libzip.so \
+libjava_crw_demo.so \
+libjavaplugin_nscp_gcc29.so \
+libhprof.so \
+libcmm.so \
+libjdwp.so \
+libmlib_image.so \
+libjpeg.so \
+libverify.so \
+libjavaplugin_nscp.so \
+libmanagement.so \
+libunpack.so \
+librmi.so \
+libJdbcOdbc.so \
+libawt.so \
+libnet.so \
+libjaas_unix.so \
+libnio.so \
+libdcpr.so \
+libioser12.so \
+libjsoundalsa.so \
+libjava.so \
+libfontmanager.so \
+libdt_socket.so \
+libmawt.so \
+libjvm.so \
+libhpi.so \
+lib.so \
+libcairo.so.2 \
+libjli.so \
+libawt_xawt.so \
+"
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST:ti-soc = "(.*)"
+COMPATIBLE_HOST:class-native = "(.*)"
+COMPATIBLE_HOST:class-nativesdk = "(.*)"
+
+S = "${WORKDIR}/xdctools_${PV}_core"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdccore/xdctools_${PV}_core_linux.zip;name=xdczip"
 
 PE = "1"
 PV = "3_55_02_22"
-- 
2.39.2


