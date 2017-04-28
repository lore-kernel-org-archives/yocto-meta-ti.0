Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75E1BE009CE; Fri, 28 Apr 2017 11:24:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 409A1E009A5
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 11:24:30 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9BCC120B62;
	Fri, 28 Apr 2017 18:24:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8tjd1JV34wsR; Fri, 28 Apr 2017 18:24:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6779D20756;
	Fri, 28 Apr 2017 18:24:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E45D8162439;
	Fri, 28 Apr 2017 14:24:25 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 28 Apr 2017 14:24:23 -0400
Message-Id: <1493403863-126827-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] edma3lld: remove outdated v1 recipe
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
X-List-Received-Date: Fri, 28 Apr 2017 18:24:37 -0000

Current v2 version is in recipes-bsp

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Sam Nelson <sam.nelson@ti.com>
Cc: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/edma3lld/ti-edma3lld.inc            | 23 -----------------------
 recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb | 10 ----------
 2 files changed, 33 deletions(-)
 delete mode 100644 recipes-ti/edma3lld/ti-edma3lld.inc
 delete mode 100644 recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb

diff --git a/recipes-ti/edma3lld/ti-edma3lld.inc b/recipes-ti/edma3lld/ti-edma3lld.inc
deleted file mode 100644
index fb131b6..0000000
--- a/recipes-ti/edma3lld/ti-edma3lld.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "TI EDMA3 Low Level Driver (LLD)"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/${SRC_URI_edma3lldsite}/edma3_lld"
-SECTION = "devel"
-LICENSE = "TI"
-LIC_FILES_CHKSUM = "file://packages/ti/sdo/edma3/drv/edma3_drv.h;md5=c1aa300aaf369a0a03e7922c1b0bbf8e"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
-
-TI_BIN_UNPK_WDEXT="/edma3_lld_${PV}"
-S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/${SRC_URI_edma3lldsite}/edma3_lld/edma3-lld-bios5/${PV}/exports/EDMA3_LLD_setuplinux_${PV}.bin;name=edma3lldbin"
-
-BINFILE="EDMA3_LLD_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y:workdir"
-
-do_install() {
-    install -d ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
-}
-
diff --git a/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb b/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb
deleted file mode 100644
index 549e020..0000000
--- a/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ti-edma3lld.inc
-
-PV = "01_11_01_04"
-
-SRC_URI_edma3lldsite = "sdo_tii/psp"
-
-SRC_URI[edma3lldbin.md5sum] = "b3c41cb946e2e4b94348fc6bcbe30b16"
-SRC_URI[edma3lldbin.sha256sum] = "617db3eadff33a88e3d42818c204f379906da3b312bc120092408043e7e2aaeb"
-
-INSANE_SKIP_${PN} = "installed-vs-shipped"
-- 
2.7.4


