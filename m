Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89FA6E00CC9; Thu, 28 Jul 2016 06:05:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21C3DE00CAA
	for <meta-ti@yoctoproject.org>; Thu, 28 Jul 2016 06:05:41 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6SD5dJO015177
	for <meta-ti@yoctoproject.org>; Thu, 28 Jul 2016 08:05:39 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6SD5dj0019350
	for <meta-ti@yoctoproject.org>; Thu, 28 Jul 2016 08:05:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 28 Jul 2016 08:05:39 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6SD5b8V012117;	Thu, 28 Jul 2016 08:05:38 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Jul 2016 18:35:36 +0530
Message-ID: <1469711136-3519-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ipumm-fw: cleanup recipe for pre-built binary
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
X-List-Received-Date: Thu, 28 Jul 2016 13:05:45 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.02.bb | 35 -----------------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.02.bb

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.02.bb
deleted file mode 100644
index 8b077b0..0000000
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.02.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-python __anonymous() {
-    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
-    if not features:
-        return
-    if "mmip" not in features:
-        raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
-}
-
-DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
-LICENSE = "TI-TSPA"
-
-LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=81f4b23808c36c9223523f43e35d291c"
-
-COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-RDEPENDS_${PN} = " libdce"
-
-SRC_URI = "http://downloads.ti.com/infotainment/esd/jacinto6/glsdk/ipumm/3_00_08_02/exports/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
-
-SRC_URI[md5sum] = "53f47909c2e2575b188bba9ddc325437"
-SRC_URI[sha256sum] = "4ac7598bbbb5dd0cd6504906afe0e09d76ba612a3c326e45425e67535e5f2d09"
-
-S = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
-
-TARGET = "dra7-ipu2-fw.xem4"
-
-do_install() {
-        mkdir -p ${D}${base_libdir}/firmware
-        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
-}
-
-FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
-
-PR = "r2"
-- 
1.9.1


