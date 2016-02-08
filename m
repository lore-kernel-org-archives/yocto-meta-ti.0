Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CEDF0E00DA7; Mon,  8 Feb 2016 09:30:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26659E00DA0
	for <meta-ti@yoctoproject.org>; Mon,  8 Feb 2016 09:30:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 991E452AB1; Mon,  8 Feb 2016 17:30:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160208173055.991E452AB1@arago-project.org>
Date: Mon,  8 Feb 2016 17:30:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Adam YH Lee : libgles-omap3: fix RPM compatibility by faking hardcoded deps
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
X-List-Received-Date: Mon, 08 Feb 2016 17:30:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 65739cbc43bf68800b87329e7e680d74ab2d8335
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=65739cbc43bf68800b87329e7e680d74ab2d8335

Author: Adam YH Lee <adam.yh.lee@gmail.com>
Date:   Wed Oct 14 00:00:27 2015 +0000

libgles-omap3: fix RPM compatibility by faking hardcoded deps

When RPM is used as the packaging type, rootfs will fail because RPM, by
design, check for file level dependency. Here one of the shared objects
(libpvrEWS_REMWSEGL.so) has dependency on ld-linux.so.3 and libews.so.

It is unclear why meta-ti requires ld-linux.so.3, which is a dynamic
loader for soft-float arch. Hence I fake the existence here.

Signed-off-by: Adam YH Lee <adam.yh.lee@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 13418ad..7681a26 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -188,6 +188,9 @@ do_install () {
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${WORKDIR}/99-bufferclass.rules ${D}${sysconfdir}/udev/rules.d/
 
+	touch ${D}${libdir}/ES5.0/ld-linux.so.3
+	touch ${D}${libdir}/ES5.0/ld-linux.so.3\(GLIBC_2.4\)
+	cp -pPR ${S}/gfx_rel_es5.x/libews.so ${D}${libdir}/ES5.0/
 }
 
 PACKAGES =+ "${PN}-rawdemos ${PN}-rawtrainingcourses ${PN}-tests"
@@ -209,6 +212,7 @@ PRIVATE_LIBS_${PN}-es9 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so lib
 
 
 RPROVIDES_${PN} += "libGLESv2.so libEGL.so libGLES_CM.so libpvr2d.so libIMGegl.so libsrv_init.so libsrv_um.so libsrv_um_dri.so libglslcompiler.so"
+RPROVIDES_${PN}-es5 += "ld-linux.so.3 ld-linux.so.3(GLIBC_2.4) libews.so"
 
 PACKAGES =+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl"
 FILES_${PN}-blitwsegl = "${libdir}/libpvrPVR2D_BLITWSEGL.so.*"
@@ -330,3 +334,8 @@ rm -f $D${sysconfdir}/powervr-esrev
 pkg_postinst_${PN}-linuxfbwsegl() {
 rm -f $D${sysconfdir}/powervr-esrev
 }
+
+pkg_postinst_${PN}-es5() {
+rm -f $D${libdir}/ES5.0/ld-linux.so.3*
+rm -f $D${libdir}/ES5.0/libews.so
+}


