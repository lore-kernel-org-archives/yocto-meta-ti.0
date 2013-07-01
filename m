Return-Path: <mrinmayee@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C27A8E0140D
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 05:31:58 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61CVvS7016399
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 07:31:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61CVvNO005582
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 07:31:57 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 07:31:57 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r61CVtro012506;
	Mon, 1 Jul 2013 07:31:56 -0500
Date: Mon, 1 Jul 2013 18:01:55 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130701123155.GA16127@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 2/2] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Mon, 01 Jul 2013 12:31:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* These libraries are not distributable in source and hence
  are available only as binary. They implement OpenGLES 1.x and
  OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
  class of devices.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
new file mode 100644
index 0000000..d3a847d
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Userspace libraries for sgx"
+HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
+LICENSE = "TI"
+DEPENDS = ""
+
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-linux-${PV}.tar.gz;protocol=http"
+
+LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=d280df8e94bb2e7b9251c8526078eeb8"
+
+PR = "r1" 
+
+SRC_URI[md5sum] = "3cfb875de031098a4c1eeeaf4e442367"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
+
+PACKAGES =+ "${PN}-${PV}"
+
+FILES_${PN} =  "${bindir}/*"
+FILES_${PN} += " ${libdir}/*"
+FILES_${PN} +=  "${includedir}/*"
-- 
1.7.0.4


