Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4DAE6E00B7C; Fri, 28 Aug 2015 14:07:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12B45E00ABC
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 14:07:39 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7SL7cga020370
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 16:07:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7SL7cL5019421
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 16:07:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 28 Aug 2015 16:07:37 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t7SL7b4A026920;	Fri, 28 Aug 2015 16:07:37 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Aug 2015 17:07:32 -0400
Message-ID: <1440796052-10282-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] omap5-sgx-ddk-um-linux: add AM3 and AM4, and pvr-init to initialization
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
X-List-Received-Date: Fri, 28 Aug 2015 21:07:44 -0000
Content-Type: text/plain

* Add AM3 and AM4 which use null_windown DRM
* Add pvr-init to /etc/init.d

Signed-off-by: Hongmei Gou <h-gou@ti.com>

v2 changes:
1) Use 8 as the initialization number for pvr-init, since pvr-init needs to be done before starting weston which uses number 9
2) Create empty powervr.ini as the default, and place ti33x and ti43x specific ones in their corresponding directories

---
 .../libgles/omap5-sgx-ddk-um-linux/powervr.ini     |  0
 .../libgles/omap5-sgx-ddk-um-linux/rc.pvr          | 17 +++++++++++++
 .../omap5-sgx-ddk-um-linux/ti33x/powervr.ini       |  3 +++
 .../omap5-sgx-ddk-um-linux/ti43x/powervr.ini       |  3 +++
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     | 29 +++++++++++++++++++---
 5 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/powervr.ini
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/rc.pvr
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/powervr.ini
new file mode 100644
index 0000000..e69de29
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
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
new file mode 100644
index 0000000..0657ab8
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
@@ -0,0 +1,3 @@
+[default]
+WindowSystem=null_libdrm.so
+DisableHWTQTextureUpload=1
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
new file mode 100644
index 0000000..0657ab8
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
@@ -0,0 +1,3 @@
+[default]
+WindowSystem=null_libdrm.so
+DisableHWTQTextureUpload=1
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index c29b91d..a97f88b 100644
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
+INITSCRIPT_PARAMS = "defaults 8"
+
+inherit update-rc.d
 
-PR = "r9"
+PR = "r10"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"
@@ -17,13 +28,25 @@ RREPLACES_${PN}-dbg = "libegl-dbg"
 
 S = "${WORKDIR}/git"
 
+SRC_URI_append = " \
+    file://rc.pvr \
+    file://powervr.ini \
+"
+
 do_install () {
     oe_runmake install DESTDIR=${D}
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
+
+    install -d ${D}${sysconfdir}
+    install -m 0644 ${WORKDIR}/powervr.ini ${D}${sysconfdir}/
 }
 
 FILES_${PN} =  "${bindir}/*"
 FILES_${PN} += " ${libdir}/*"
 FILES_${PN} +=  "${includedir}/* /usr/share/sgx-lib/"
+FILES_${PN} += "${sysconfdir}/init.d/pvr-init"
+FILES_${PN} += "${sysconfdir}/powervr.ini"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
-- 
1.9.1


