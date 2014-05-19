Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2DBB6E00BAA; Mon, 19 May 2014 12:20:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from devils.ext.ti.com (unknown [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F26CE00B6C
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 12:20:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJK5Iv031461
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:20:05 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJK42c016755
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:20:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:04 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJJog6019914;	Mon, 19 May 2014 14:20:02 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 May 2014 14:19:43 -0500
Message-ID: <1400527188-16951-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] ipumm-fw: Add MM accelerator firmware recipe
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
X-List-Received-Date: Mon, 19 May 2014 19:20:09 -0000
Content-Type: text/plain

From: Mrinmayee Hingolikar <mrinmayee@ti.com>

* Based on recipes from meta-ti-glsdk and preserved authorship
  for Mrinmayee
* Modified for upstreaming:
    * Combined the dra7xx-evm and omap5-evm versions into a
      shared recipe.  This changes the recipe name to just
      ipumm-fw.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-ti/ipumm-fw/ipumm-fw_3.00.04.02.bb |   30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 recipes-ti/ipumm-fw/ipumm-fw_3.00.04.02.bb

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
-- 
1.7.9.5


