Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3848E00CAE; Wed,  2 Sep 2015 06:46:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18104E00CB3
	for <meta-ti@yoctoproject.org>; Wed,  2 Sep 2015 06:46:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B836C529D2; Wed,  2 Sep 2015 13:46:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150902134625.B836C529D2@arago-project.org>
Date: Wed,  2 Sep 2015 13:46:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : ipumm-fw: update to 3.00.08.02
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
X-List-Received-Date: Wed, 02 Sep 2015 13:46:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 404eb49c6252c2c25c1d2c035cbe7307670b89aa
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=404eb49c6252c2c25c1d2c035cbe7307670b89aa

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Mon Aug 31 15:24:33 2015 +0000

ipumm-fw: update to 3.00.08.02

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.02.bb |   35 +++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.02.bb
new file mode 100644
index 0000000..8b077b0
--- /dev/null
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.02.bb
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
+LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=81f4b23808c36c9223523f43e35d291c"
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = " libdce"
+
+SRC_URI = "http://downloads.ti.com/infotainment/esd/jacinto6/glsdk/ipumm/3_00_08_02/exports/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
+
+SRC_URI[md5sum] = "53f47909c2e2575b188bba9ddc325437"
+SRC_URI[sha256sum] = "4ac7598bbbb5dd0cd6504906afe0e09d76ba612a3c326e45425e67535e5f2d09"
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
+PR = "r2"


