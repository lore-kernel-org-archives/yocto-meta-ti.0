Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF964E00998; Wed,  8 Jul 2015 13:54:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A25E8E0096A
	for <meta-ti@yoctoproject.org>; Wed,  8 Jul 2015 13:54:24 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NR6006ZSSPQVC60@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 08 Jul 2015 15:54:07 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Jp0M15MC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8 a=e5mUnYsNAAAA:8	a=9l06uSHlElp1mbEEXQUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B3FD8161AC2;	Wed,
	8 Jul 2015 16:53:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 08 Jul 2015 16:53:50 -0400
Message-id: <1436388830-4093-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master][PATCH] libdrm.inc: overlay recently removed .inc used by our custom version
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
X-List-Received-Date: Wed, 08 Jul 2015 20:54:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Consider dropping custom version altogether after verifying everything
is upstreamed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/drm/libdrm.inc | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 recipes-graphics/drm/libdrm.inc

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
-- 
2.2.0


