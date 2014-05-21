Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C715BE00C1F; Wed, 21 May 2014 12:57:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC1E9E00B6F
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:57:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4F86452A3E; Wed, 21 May 2014 19:57:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521195725.4F86452A3E@arago-project.org>
Date: Wed, 21 May 2014 19:57:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Mrinmayee Hingolikar : ipumm-fw: Add MM accelerator firmware recipe
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
X-List-Received-Date: Wed, 21 May 2014 19:57:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 5770e1f79167065b0155d9ba4c5a6c0680077d62
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5770e1f79167065b0155d9ba4c5a6c0680077d62

Author: Mrinmayee Hingolikar <mrinmayee@ti.com>
Date:   Tue May 20 01:19:43 2014 +0000

ipumm-fw: Add MM accelerator firmware recipe

* Based on recipes from meta-ti-glsdk and preserved authorship
  for Mrinmayee
* Modified for upstreaming:
    * Combined the dra7xx-evm and omap5-evm versions into a
      shared recipe.  This changes the recipe name to just
      ipumm-fw.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipumm-fw/ipumm-fw_3.00.04.02.bb |   30 ++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/ipumm-fw/ipumm-fw_3.00.04.02.bb b/recipes-ti/ipumm-fw/ipumm-fw_3.00.04.02.bb
new file mode 100644
index 0000000..c3017fe
--- /dev/null
+++ b/recipes-ti/ipumm-fw/ipumm-fw_3.00.04.02.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Firmware for IPU "
+
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM_dra7xx-evm = "file://MMIP-${PV}-Manifest.doc;md5=64ca6f9d7e5243b8a4084eb918a543bc"
+LIC_FILES_CHKSUM_omap5-evm = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
+
+COMPATIBLE_MACHINE = "omap-a15"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-3.00.04.02.tar.gz;protocol=http;name=${MACHINE}"
+
+# DRA7xx checksums
+SRC_URI[dra7xx-evm.md5sum] = "da04c03b0fd57901e8283afa80f81379"
+SRC_URI[dra7xx-evm.sha256sum] = "0b26fd13f9c318b52c18b9bff56862ef1f58a768b19285b87c035e65bc828ddc"
+
+# OMAP5 checksums
+SRC_URI[omap5-evm.md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
+SRC_URI[omap5-evm.sha256sum] = "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da22ec0d5beaa5cc65"
+
+S = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
+
+TARGET_dra7xx-evm = "dra7-ipu2-fw.xem4"
+TARGET_omap5-evm = "ducati-m3-core0.xem3"
+
+do_install() {
+        mkdir -p ${D}${base_libdir}/firmware
+        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} += "${base_libdir}/firmware/${TARGET}"


