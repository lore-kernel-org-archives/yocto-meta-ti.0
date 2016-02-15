Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 904A9E00444; Mon, 15 Feb 2016 14:27:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00, RDNS_DYNAMIC, URI_HEX
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D13EE00444
	for <meta-ti@yoctoproject.org>; Mon, 15 Feb 2016 14:27:18 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9F1BB52A86; Mon, 15 Feb 2016 22:27:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160215222717.9F1BB52A86@arago-project.org>
Date: Mon, 15 Feb 2016 22:27:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : omap5-sgx-ddk-um-linux: SGX user mode driver v1. 14 for all TI SoCs
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
X-List-Received-Date: Mon, 15 Feb 2016 22:27:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 2ea5fb2aa03cc4be0258cd23f9c79784e3d44ad2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2ea5fb2aa03cc4be0258cd23f9c79784e3d44ad2

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Sat Feb 13 20:30:37 2016 +0000

omap5-sgx-ddk-um-linux: SGX user mode driver v1.14 for all TI SoCs

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb |   43 ++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
new file mode 100644
index 0000000..1d0f09f
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BRANCH = "ti-img-sgx/${PV}"
+
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
+SRCREV = "0e98623e944864f080cd886906b46ea9a5d830e5"
+
+TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+TARGET_PRODUCT_ti33x = "ti335x"
+TARGET_PRODUCT_ti43x = "ti437x"
+
+PR = "r2"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
+
+RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
+
+RREPLACES_${PN} = "libegl libgles1 libgles2"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
+    mkdir -p ${D}${libdir}/gbm
+    ln -sf ../libpvrGBMWSEGL.so.${PV} ${D}${libdir}/gbm/gbm_pvr.so
+}
+
+FILES_${PN} =  "${bindir}/*"
+FILES_${PN} += " ${libdir}/*"
+FILES_${PN} +=  "${includedir}/*"
+FILES_${PN} +=  "${sysconfdir}/*"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
+
+CLEANBROKEN = "1"


