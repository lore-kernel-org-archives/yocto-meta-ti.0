Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.853.1582679546884690563
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 17:12:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4789E016B6; Tue, 25 Feb 2020 17:12:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	TVD_SPACE_RATIO,TVD_SPACE_RATIO_MINFP autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  1.2 TVD_SPACE_RATIO_MINFP Space ratio
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDBB5E0107C
	for <meta-ti@yoctoproject.org>; Tue, 25 Feb 2020 17:12:25 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6A52940BFE;
	Wed, 26 Feb 2020 01:12:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dI5MlcSdmKi3; Wed, 26 Feb 2020 01:12:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 534A740A23;
	Wed, 26 Feb 2020 01:12:24 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0D42017407B;
	Tue, 25 Feb 2020 20:12:24 -0500 (EST)
From: "Denys Dmytriyenko" <denys@ti.com>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] ti-cgt6x: remove deprecated versions
Date: Tue, 25 Feb 2020 20:12:23 -0500
Message-Id: <1582679543-48750-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/devtools/ti-cgt6x.inc       | 24 ------------------------
 recipes-ti/devtools/ti-cgt6x_6.1.20.bb | 11 -----------
 recipes-ti/devtools/ti-cgt6x_7.2.7.bb  | 13 -------------
 3 files changed, 48 deletions(-)
 delete mode 100644 recipes-ti/devtools/ti-cgt6x.inc
 delete mode 100644 recipes-ti/devtools/ti-cgt6x_6.1.20.bb
 delete mode 100644 recipes-ti/devtools/ti-cgt6x_7.2.7.bb

diff --git a/recipes-ti/devtools/ti-cgt6x.inc b/recipes-ti/devtools/ti-cgt6x.inc
deleted file mode 100644
index 1d00a55..0000000
--- a/recipes-ti/devtools/ti-cgt6x.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "TI DSP Code Generation Tools"
-HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
-SECTION = "devel"
-LICENSE = "TI"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
-
-PR = "r4"
-
-S = "${WORKDIR}/cgt6x_${PV}"
-
-SRC_URI = "http://install.source.dir.local/ti_cgt_c6000_${PVwithdots}_setup_linux_x86.bin;name=cgt6xbin"
-
-BINFILE="ti_cgt_c6000_${PVwithdots}_setup_linux_x86.bin"
-TI_BIN_UNPK_CMDS="Y:qY:workdir: : "
-TI_BIN_UNPK_WDEXT="/cgt6x_${PV}"
-
-do_install() {
-    install -d ${D}${CODEGEN_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${CODEGEN_INSTALL_DIR_RECIPE}
-}
-
diff --git a/recipes-ti/devtools/ti-cgt6x_6.1.20.bb b/recipes-ti/devtools/ti-cgt6x_6.1.20.bb
deleted file mode 100644
index 1d6609c..0000000
--- a/recipes-ti/devtools/ti-cgt6x_6.1.20.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ti-cgt6x.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62f46f1125a152a2e213b414db7ac600"
-
-PE = "1"
-PV = "6_1_20"
-PVwithdots = "6.1.20"
-
-SRC_URI[cgt6xbin.md5sum] = "39485ea8211960de0a958ab27106ab9b"
-SRC_URI[cgt6xbin.sha256sum] = "a020142011c8160e24f6386f7696ecfbfe02dab2a6c83af74ce6b67eb1da9900"
-
diff --git a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb b/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
deleted file mode 100644
index a226600..0000000
--- a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ti-cgt6x.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62f46f1125a152a2e213b414db7ac600"
-
-PE = "1"
-PV = "7_2_7"
-PVwithdots = "7.2.7"
-
-SRC_URI[cgt6xbin.md5sum] = "71a0768a541fdebd9c35d44301019d1d"
-SRC_URI[cgt6xbin.sha256sum] = "211477f0142d603975544abe3c45cc3b77a3b38038158676c60812806378738b"
-
-
-INSANE_SKIP_${PN} = "installed-vs-shipped"
-- 
2.7.4

