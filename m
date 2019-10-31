Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09F08E00DDC; Thu, 31 Oct 2019 11:20:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
	low *      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC586E00DAF
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2019 11:20:49 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0480140BEB;
	Thu, 31 Oct 2019 18:20:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5XmAozbCYuas; Thu, 31 Oct 2019 18:20:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CA04F40A3D;
	Thu, 31 Oct 2019 18:20:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0FF471742A1;
	Thu, 31 Oct 2019 14:20:46 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 31 Oct 2019 14:20:45 -0400
Message-Id: <1572546045-11227-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCHv2] ti-sgx-ddk-um: update SRCREV to pick up Mesa-based EGL/GLES libraries
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
X-List-Received-Date: Thu, 31 Oct 2019 18:20:51 -0000

From: "e-ruei1@ti.com" <e-ruei1@ti.com>

This is the initial step toward Mesa-based EGL/GLES libraries which
support all the required EGL 1.5 extensions. We plan to provide a
Mesa-pvr recipe to build Mesa from source and SGX/DDK patches where
ti-sgx-ddk-um shall provide the EGL/GLES plugins only at the next step.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - re-enable stripping

 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 7a6f013..ecf3ffc 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -11,7 +11,7 @@ PR = "r34"
 BRANCH = "ti-img-sgx/thud/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "87d7e5c1e4db1bab048939c9719059d549c1e8dd"
+SRCREV = "2a2e5bb090ced870d73ed4edbc54793e952cc6d8"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
@@ -47,7 +47,9 @@ S = "${WORKDIR}/git"
 
 do_install () {
     oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
-    ln -sf libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
+    ln -sf libGLESv2.so ${D}${libdir}/libGLESv2.so.1
+
+    rm -rf ${D}${includedir}/GL
 
     chown -R root:root ${D}
 }
@@ -58,14 +60,11 @@ FILES_${PN} +=  "${includedir}/*"
 FILES_${PN} +=  "${sysconfdir}/*"
 
 PACKAGES =+ "${PN}-plugins"
-FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLES_CM.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
+FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLESv1_CM.so ${libdir}/libGLES_CM.so ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
 RDEPENDS_${PN} += "${PN}-plugins"
 
 ALLOW_EMPTY_${PN}-plugins = "1"
 
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-
 INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
 INSANE_SKIP_${PN}-plugins = "dev-so"
 INSANE_SKIP_${PN} += "already-stripped"
-- 
2.7.4


