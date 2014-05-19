Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 821D4E00BB1; Mon, 19 May 2014 12:20:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28159E00B6C
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 12:20:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKA1J012400
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:20:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKA1F016874
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:20:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:10 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJJog8019914;	Mon, 19 May 2014 14:20:08 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 May 2014 14:19:45 -0500
Message-ID: <1400527188-16951-7-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Karthik Ramanan <a0393906@ti.com>
Subject: [PATCH 6/9] vis: Add radio application firmware
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
X-List-Received-Date: Mon, 19 May 2014 19:20:12 -0000
Content-Type: text/plain

From: Karthik Ramanan <a0393906@ti.com>

* Migrated from meta-ti-glsdk and preserved authorship for
  Karthik
* Modified for upstream:
    * Made PACKAGE_ARCH machine specific
    * Removed bogus HOMEPAGE setting
    * Separated the firmware into a ${PN}-fw package and left the
      ARM side RadioApp in the base package.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-ti/vis-fw/vis_01.50.07.15.bb |   31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 recipes-ti/vis-fw/vis_01.50.07.15.bb

diff --git a/recipes-ti/vis-fw/vis_01.50.07.15.bb b/recipes-ti/vis-fw/vis_01.50.07.15.bb
new file mode 100644
index 0000000..85d8539
--- /dev/null
+++ b/recipes-ti/vis-fw/vis_01.50.07.15.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Radio Application Firmware"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.html;md5=a59aa54b9470f555cf086b91dca0afa3"
+
+COMPATIBLE_MACHINE = "dra7xx-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vis/01_50_07_15/exports/vis-${MACHINE}-01.50.07.15.tar.gz;protocol=http"
+
+SRC_URI[md5sum] = "fe8b00e398fb3b7ada0c15b601867acb"
+SRC_URI[sha256sum] = "6e2aa47ae892910616ebdc96646af778af9a59ca0657716ab4fa4b24a9afae69"
+
+S = "${WORKDIR}"
+
+DSPAPP = "dra7-dsp1-fw-radio.xe66"
+GPPAPP = "RadioApp"
+
+do_install() {
+    install -d ${D}${base_libdir}/firmware
+    install -d ${D}${bindir}
+    install ${S}/prebuilt/${DSPAPP} ${D}${base_libdir}/firmware/${DSPAPP}
+    install -m 0755 ${S}/prebuilt/${GPPAPP} ${D}${bindir}/${GPPAPP}
+}
+
+PACKAGES += "${PN}-fw"
+RDEPENDS_${PN} += "${PN}-fw"
+
+FILES_${PN}-fw += "${base_libdir}/firmware/${DSPAPP}"
+
+INSANE_SKIP_${PN}-fw = "arch"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1" 
-- 
1.7.9.5


