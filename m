Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4BA77E00C88; Thu, 27 Aug 2015 20:16:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE6D4E00B18
	for <meta-ti@yoctoproject.org>; Thu, 27 Aug 2015 20:16:15 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7S3GFGd022898
	for <meta-ti@yoctoproject.org>; Thu, 27 Aug 2015 22:16:15 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7S3GE5A012049
	for <meta-ti@yoctoproject.org>; Thu, 27 Aug 2015 22:16:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 27 Aug 2015 22:16:14 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t7S3GDdb011689;	Thu, 27 Aug 2015 22:16:14 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Aug 2015 23:16:08 -0400
Message-ID: <1440731769-15759-3-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440731769-15759-1-git-send-email-h-gou@ti.com>
References: <1440731769-15759-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] omap5-sgx-ddk-um-linux: add AM3 and AM4, and pvr-init to initialization
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
X-List-Received-Date: Fri, 28 Aug 2015 03:16:19 -0000
Content-Type: text/plain

* Add AM3 and AM4 which use null_windown DRM
* Add pvr-init to /etc/init.d

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux/dummy.ini       |  0
 .../libgles/omap5-sgx-ddk-um-linux/powervr.ini     |  3 ++
 .../libgles/omap5-sgx-ddk-um-linux/rc.pvr          | 17 +++++++++++
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     | 33 ++++++++++++++++++++--
 4 files changed, 50 insertions(+), 3 deletions(-)
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/dummy.ini
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/powervr.ini
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/rc.pvr

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/dummy.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/dummy.ini
new file mode 100644
index 0000000..e69de29
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/powervr.ini
new file mode 100644
index 0000000..0657ab8
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/powervr.ini
@@ -0,0 +1,3 @@
+[default]
+WindowSystem=null_libdrm.so
+DisableHWTQTextureUpload=1
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/rc.pvr b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/rc.pvr
new file mode 100644
index 0000000..2711d6b
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/rc.pvr
@@ -0,0 +1,17 @@
+#!/bin/bash
+
+case "$1" in
+  start)
+
+  echo "Initializing the graphics driver ..."
+  pvrsrvinit
+
+  ;;
+  stop)
+    # Nothing to be done.
+  ;;
+  *)
+    echo "Usage: $0 {start|stop}"
+    exit 1
+  ;;
+esac
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index c29b91d..0509250 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -3,12 +3,23 @@ HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
 
-BRANCH = "master"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BRANCH_omap-a15 = "master"
+BRANCH_ti33x = "am4/k4.1"
+BRANCH_ti43x = "am4/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "d63cd6469fff610317a8e1c986f227bb3e7922f6"
+SRCREV_omap-a15 = "d63cd6469fff610317a8e1c986f227bb3e7922f6"
+SRCREV_ti33x    = "c30d4b35701e1b88d58a9ae713b2e679298d1a37"
+SRCREV_ti43x    = "c30d4b35701e1b88d58a9ae713b2e679298d1a37"
+
+INITSCRIPT_NAME = "pvr-init"
+INITSCRIPT_PARAMS = "defaults 30"
+
+inherit update-rc.d
 
-PR = "r9"
+PR = "r10"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"
@@ -17,13 +28,29 @@ RREPLACES_${PN}-dbg = "libegl-dbg"
 
 S = "${WORKDIR}/git"
 
+PVR_INI_FILE_omap-a15 = "dummy.ini"
+PVR_INI_FILE_ti33x = "powervr.ini"
+PVR_INI_FILE_ti43x = "powervr.ini"
+
+SRC_URI_append = " \
+    file://rc.pvr \
+    file://${PVR_INI_FILE} \
+"
+
 do_install () {
     oe_runmake install DESTDIR=${D}
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
+
+    install -d ${D}${sysconfdir}
+    install -m 0644 ${WORKDIR}/${PVR_INI_FILE} ${D}${sysconfdir}/powervr.ini
 }
 
 FILES_${PN} =  "${bindir}/*"
 FILES_${PN} += " ${libdir}/*"
 FILES_${PN} +=  "${includedir}/* /usr/share/sgx-lib/"
+FILES_${PN} += "${sysconfdir}/init.d/pvr-init"
+FILES_${PN} += "${sysconfdir}/powervr.ini"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
-- 
1.9.1


