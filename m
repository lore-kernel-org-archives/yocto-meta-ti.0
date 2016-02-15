Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADEADE0079A; Mon, 15 Feb 2016 12:31:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3708AE006AE
	for <meta-ti@yoctoproject.org>; Mon, 15 Feb 2016 12:31:35 -0800 (PST)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.148])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2L005AVVO39E50@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 15 Feb 2016 14:31:19 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=EQWvt9tfZbzlQOAJBBAA:9
Received: by 100.15.86.14 with SMTP id 4ac70468; Mon, 15 Feb 2016 20:31:19 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7F29D161E9F;	Mon,
	15 Feb 2016 15:31:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 15 Feb 2016 15:31:11 -0500
Message-id: <1455568271-11485-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1455568271-11485-1-git-send-email-denis@denix.org>
References: <1455568271-11485-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] omap5-sgx-ddk-um-linux: SGX user mode driver v1.14 for all TI SoCs
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
X-List-Received-Date: Mon, 15 Feb 2016 20:31:38 -0000

From: Anand Balagopalakrishnan <anandb@ti.com>

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 ...2.bb => omap5-sgx-ddk-um-linux_1.14.3699939.bb} |   53 ++++++--------------
 1 file changed, 15 insertions(+), 38 deletions(-)
 copy recipes-graphics/libgles/{omap5-sgx-ddk-um-linux_1.9.0.12.bb => omap5-sgx-ddk-um-linux_1.14.3699939.bb} (26%)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
similarity index 26%
copy from recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
copy to recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
index dfd22d0..1d0f09f 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
@@ -1,28 +1,23 @@
-DESCRIPTION = "Userspace libraries for SGX"
-HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
+DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
+LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-BRANCH_omap-a15 = "master"
-BRANCH_ti33x = "am3/k4.1"
-BRANCH_ti43x = "am4/k4.1"
+BRANCH = "ti-img-sgx/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV_omap-a15 = "b6801bf89e00d69893c2957455bbeb3195c0ed52"
-SRCREV_ti33x    = "84ae5444c7cbc3f4c65a226b9fea62d4a513f3e0"
-SRCREV_ti43x    = "fdf4c0b594ca142a68aabb4c3f82b75be50b46cc"
+SRCREV = "0e98623e944864f080cd886906b46ea9a5d830e5"
 
-INITSCRIPT_NAME = "pvr-init"
-INITSCRIPT_PARAMS = "defaults 8"
+TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+TARGET_PRODUCT_ti33x = "ti335x"
+TARGET_PRODUCT_ti43x = "ti437x"
 
-inherit update-rc.d
-
-PR = "r14"
+PR = "r2"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
-RDEPENDS_${PN} += "libdrm"
+RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"
 RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
@@ -30,37 +25,19 @@ RREPLACES_${PN}-dbg = "libegl-dbg"
 
 S = "${WORKDIR}/git"
 
-SRC_URI_append = " \
-    file://rc.pvr \
-    file://powervr.ini \
-"
-
 do_install () {
-    oe_runmake install DESTDIR=${D}
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
-
-    install -d ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/powervr.ini ${D}${sysconfdir}/
+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
+    mkdir -p ${D}${libdir}/gbm
+    ln -sf ../libpvrGBMWSEGL.so.${PV} ${D}${libdir}/gbm/gbm_pvr.so
 }
 
 FILES_${PN} =  "${bindir}/*"
 FILES_${PN} += " ${libdir}/*"
-FILES_${PN} +=  "${includedir}/* /usr/share/sgx-lib/"
-FILES_${PN} += "${sysconfdir}/init.d/pvr-init"
-FILES_${PN} += "${sysconfdir}/powervr.ini"
-
-PACKAGES =+ "${PN}-plugins"
-FILES_${PN}-plugins = ""
-FILES_${PN}-plugins_ti43x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrws_WAYLAND.so ${libdir}/libpvrws_KMS.so "
-FILES_${PN}-plugins_ti33x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrDRMWSEGL.so ${libdir}/libpvrDRMWSEGL_FRONT.so "
-RDEPENDS_${PN} += "${PN}-plugins"
-
-ALLOW_EMPTY_${PN}-plugins = "1"
+FILES_${PN} +=  "${includedir}/*"
+FILES_${PN} +=  "${sysconfdir}/*"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
 INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
-INSANE_SKIP_${PN}-plugins = "dev-so"
 
 CLEANBROKEN = "1"
-- 
1.7.9.5


