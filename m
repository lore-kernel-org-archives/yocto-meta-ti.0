Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C203E00D6D; Wed, 16 Sep 2015 18:32:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2554EE00D6E
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 18:31:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 694F152AB4; Thu, 17 Sep 2015 01:31:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150917013156.694F152AB4@arago-project.org>
Date: Thu, 17 Sep 2015 01:31:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ipumm-fw: Update to 3.00.09.01
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
X-List-Received-Date: Thu, 17 Sep 2015 01:32:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b71de915aaffaa59166e6ade6ce201789f71d002
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b71de915aaffaa59166e6ade6ce201789f71d002

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Sep 16 19:53:54 2015 +0000

ipumm-fw: Update to 3.00.09.01

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb |   35 +++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb
new file mode 100644
index 0000000..f537179
--- /dev/null
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb
@@ -0,0 +1,35 @@
+python __anonymous() {
+    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
+    if not features:
+        return
+    if "mmip" not in features:
+        raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
+}
+
+DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
+LICENSE = "TI-TSPA"
+
+LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=5803e271087f74d03239d868bebcc2c7"
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = " libdce"
+
+SRC_URI = "http://downloads.ti.com/infotainment/esd/jacinto6/glsdk/ipumm/3_00_09_01/exports/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
+
+SRC_URI[md5sum] = "bf15624e26bdef4dbb67b98ccd8b9754"
+SRC_URI[sha256sum] = "e70a38b62e3e4d11d5ce68f0980de4df5256bd597068f179e220fa5afcd065fe"
+
+S = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
+
+TARGET = "dra7-ipu2-fw.xem4"
+
+do_install() {
+        mkdir -p ${D}${base_libdir}/firmware
+        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
+
+PR = "r0"


