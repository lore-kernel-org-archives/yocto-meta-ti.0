Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63625E00A5B; Wed,  8 Jul 2015 15:01:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D63B3E00A16
	for <meta-ti@yoctoproject.org>; Wed,  8 Jul 2015 15:01:24 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 617E552AA1; Wed,  8 Jul 2015 22:01:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150708220124.617E552AA1@arago-project.org>
Date: Wed,  8 Jul 2015 22:01:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libdrm.inc: overlay recently removed . inc used by our custom version
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
X-List-Received-Date: Wed, 08 Jul 2015 22:01:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2d2633227f541395276316a4b45bafa41be94003
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2d2633227f541395276316a4b45bafa41be94003

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jul  9 02:53:50 2015 +0000

libdrm.inc: overlay recently removed .inc used by our custom version

Consider dropping custom version altogether after verifying everything
is upstreamed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/drm/libdrm.inc |   41 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/drm/libdrm.inc b/recipes-graphics/drm/libdrm.inc
new file mode 100644
index 0000000..d3e1e92
--- /dev/null
+++ b/recipes-graphics/drm/libdrm.inc
@@ -0,0 +1,41 @@
+SUMMARY = "Userspace interface to the kernel DRM services"
+DESCRIPTION = "The runtime library for accessing the kernel DRM services.  DRM \
+stands for \"Direct Rendering Manager\", which is the kernel portion of the \
+\"Direct Rendering Infrastructure\" (DRI).  DRI is required for many hardware \
+accelerated OpenGL drivers."
+HOMEPAGE = "http://dri.freedesktop.org"
+SECTION = "x11/base"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
+SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
+PROVIDES = "drm"
+DEPENDS = "libpthread-stubs udev"
+
+# be aware that libdrm_2.4.44.bb ignores this
+INC_PR = "r4"
+
+#libpciaccess is required starting from libdrm 2.4.26
+DEPENDS += " libpciaccess"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--disable-cairo-tests \
+                 --enable-omap-experimental-api \
+                 --enable-install-test-programs \
+                 --disable-manpages \
+                "
+ALLOW_EMPTY_${PN}-drivers = "1"
+PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
+             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno"
+
+RRECOMMENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
+                             ${PN}-exynos ${PN}-freedreno"
+
+FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
+FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
+FILES_${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
+FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
+FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
+FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
+FILES_${PN}-kms = "${libdir}/libkms*.so.*"
+FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"


