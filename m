Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF9FBE00AF2; Tue,  1 Dec 2015 07:40:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6CDF0E00ADF
	for <meta-ti@yoctoproject.org>; Tue,  1 Dec 2015 07:39:59 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB1FdwwP003651
	for <meta-ti@yoctoproject.org>; Tue, 1 Dec 2015 09:39:59 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB1Fdwi8018146
	for <meta-ti@yoctoproject.org>; Tue, 1 Dec 2015 09:39:58 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Dec 2015 09:39:58 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tB1FdvOj027913	for <meta-ti@yoctoproject.org>;
	Tue, 1 Dec 2015 09:39:58 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Dec 2015 10:39:50 -0500
Message-ID: <1448984390-21457-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448984390-21457-1-git-send-email-e-ruei1@ti.com>
References: <1448984390-21457-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] omap5-sgx-ddk-um-linux: Configure DDK UM based on the availability of SGX
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
X-List-Received-Date: Tue, 01 Dec 2015 15:40:04 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@uda0850410>

Enable non-SGX build for AM3/AM4:
- Remove SGX init support if SGX is not included at MACHINE_FEATURES.
- For ti43x: Select DDK UM libaries based on whether SGX is available
             NullDRM libraries if SGX is not available
             DRM/Wayland libraries if SGX is available
             Select plugin lists based on whether SGX is available

Note: The nullDRM DDK libraries are still required for QT5 library and
      application build for the non-SGX build, however, the SGX related
      APIs will not be invoked at the software rendering mode.

Signed-off-by: Eric Ruei <a0850410@uda0850410>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb             | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index 8b032e3..0aefb33 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -7,12 +7,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 BRANCH_omap-a15 = "master"
 BRANCH_ti33x = "am3/k4.1"
-BRANCH_ti43x = "am4/k4.1"
+BRANCH_ti43x = "${@base_contains('MACHINE_FEATURES', 'sgx', 'am4/k4.1', 'am3/k4.1', d)}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
 SRCREV_omap-a15 = "d63cd6469fff610317a8e1c986f227bb3e7922f6"
 SRCREV_ti33x    = "84ae5444c7cbc3f4c65a226b9fea62d4a513f3e0"
-SRCREV_ti43x    = "fdf4c0b594ca142a68aabb4c3f82b75be50b46cc"
+SRCREV_ti43x    = "${@base_contains('MACHINE_FEATURES', 'sgx', 'fdf4c0b594ca142a68aabb4c3f82b75be50b46cc', '84ae5444c7cbc3f4c65a226b9fea62d4a513f3e0', d)}"
 
 INITSCRIPT_NAME = "pvr-init"
 INITSCRIPT_PARAMS = "defaults 8"
@@ -44,15 +44,17 @@ do_install () {
     install -m 0644 ${WORKDIR}/powervr.ini ${D}${sysconfdir}/
 }
 
-FILES_${PN} =  "${bindir}/*"
+FILES_${PN} =  "${@base_contains('MACHINE_FEATURES', 'sgx', '${bindir}/*', '', d)}"
 FILES_${PN} += " ${libdir}/*"
 FILES_${PN} +=  "${includedir}/* /usr/share/sgx-lib/"
-FILES_${PN} += "${sysconfdir}/init.d/pvr-init"
-FILES_${PN} += "${sysconfdir}/powervr.ini"
+FILES_${PN} += "${@base_contains('MACHINE_FEATURES', 'sgx', '${sysconfdir}/init.d/pvr-init', '', d)}"
+FILES_${PN} += "${@base_contains('MACHINE_FEATURES', 'sgx', '${sysconfdir}/powervr.ini', '', d)}"
 
 PACKAGES =+ "${PN}-plugins"
+SGX_PLUGINS_FILES_NULLDRM = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrDRMWSEGL.so ${libdir}/libpvrDRMWSEGL_FRONT.so "
+SGX_PLUGINS_FILES_DRM = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrws_WAYLAND.so ${libdir}/libpvrws_KMS.so "
 FILES_${PN}-plugins = ""
-FILES_${PN}-plugins_ti43x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrws_WAYLAND.so ${libdir}/libpvrws_KMS.so "
+FILES_${PN}-plugins_ti43x = "${@base_contains('MACHINE_FEATURES', 'sgx', SGX_PLUGINS_FILES_DRM, SGX_PLUGINS_FILES_NULLDRM, d)}"
 FILES_${PN}-plugins_ti33x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libpvrDRMWSEGL.so ${libdir}/libpvrDRMWSEGL_FRONT.so "
 RDEPENDS_${PN} += "${PN}-plugins"
 
-- 
1.9.1


