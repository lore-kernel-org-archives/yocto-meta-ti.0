Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A361BE00EDB; Mon, 22 Aug 2016 11:15:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.7 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEAD9E00EC7
	for <meta-ti@yoctoproject.org>; Mon, 22 Aug 2016 11:15:44 -0700 (PDT)
Received: from vz-proxy-m001.mx.aol.com ([64.236.83.14])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OCB00D5FPDPTYC0@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 22 Aug 2016 13:15:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=4W5ZkvKtNJ33r7yLwgMA:9
Received: by 100.15.86.14 with SMTP id 797c95a9; Mon, 22 Aug 2016 18:15:25 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 6F00E162106;	Mon, 22 Aug 2016 14:15:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 22 Aug 2016 14:14:59 -0400
Message-id: <1471889699-5948-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1471889699-5948-1-git-send-email-denis@denix.org>
References: <1471889699-5948-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] ti-gc320-libs: add recipe for gc320 user lib
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
X-List-Received-Date: Mon, 22 Aug 2016 18:15:46 -0000

From: Gowtham Tammana <g-tammana@ti.com>

Userspace libraries for GC320 chipset on TI SoCs

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb

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
-- 
2.7.4


