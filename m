Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A194BE00C00; Wed, 21 May 2014 12:57:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF3BAE00B8C
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:57:21 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 582E352A79; Wed, 21 May 2014 19:57:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521195718.582E352A79@arago-project.org>
Date: Wed, 21 May 2014 19:57:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : vis: Add radio application firmware
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
X-List-Received-Date: Wed, 21 May 2014 19:57:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 82cb9bf59a156d090daf269e78a86796dabbfd34
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=82cb9bf59a156d090daf269e78a86796dabbfd34

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Tue May 20 01:19:45 2014 +0000

vis: Add radio application firmware

* Migrated from meta-ti-glsdk and preserved authorship for
  Karthik
* Modified for upstream:
    * Made PACKAGE_ARCH machine specific
    * Removed bogus HOMEPAGE setting
    * Separated the firmware into a ${PN}-fw package and left the
      ARM side RadioApp in the base package.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/vis-fw/vis_01.50.07.15.bb |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

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


