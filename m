Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F9DFE00E88; Tue, 23 Aug 2016 11:40:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB45BE00D88
	for <meta-ti@yoctoproject.org>; Tue, 23 Aug 2016 11:40:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 099F752A33; Tue, 23 Aug 2016 18:40:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160823184030.099F752A33@arago-project.org>
Date: Tue, 23 Aug 2016 18:40:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gowtham Tammana : ti-gc320-libs: add recipe for gc320 user lib
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
X-List-Received-Date: Tue, 23 Aug 2016 18:40:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7e84356c3bb8a2628e1d356b7e4d4f040fa1b0fa
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7e84356c3bb8a2628e1d356b7e4d4f040fa1b0fa

Author: Gowtham Tammana <g-tammana@ti.com>
Date:   Tue Aug 23 00:14:59 2016 +0000

ti-gc320-libs: add recipe for gc320 user lib

Userspace libraries for GC320 chipset on TI SoCs

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb |   39 ++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
new file mode 100644
index 0000000..45c8d51
--- /dev/null
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Userspace libraries for GC320 chipset on TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/ti-gc320-libs"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://Manifest.html;md5=4d759c4e533af6aaeff2af7f405697c2"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+CLEANBROKEN = "1"
+
+BRANCH = "ti-${PV}"
+
+SRC_URI = "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
+SRCREV = "ab0ca5bff345f6c13807fea3c4acabf5f2b9b10a"
+
+# There's only hardfp version available
+python __anonymous() {
+    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+    if not tunes:
+        return
+    pkgn = bb.data.getVar("PN", d, 1)
+    pkgv = bb.data.getVar("PV", d, 1)
+    if "callconvention-hard" not in tunes:
+        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+}
+
+TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+
+PR = "r1"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} LIBDIR=${libdir}"
+
+do_install() {
+    oe_runmake install
+}
+
+INSANE_SKIP_${PN} += "ldflags"


