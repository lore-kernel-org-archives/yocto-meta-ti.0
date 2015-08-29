Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36935E00CAD; Fri, 28 Aug 2015 17:04:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E0CAE00AD7
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 17:04:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1152252A65; Sat, 29 Aug 2015 00:04:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150829000430.1152252A65@arago-project.org>
Date: Sat, 29 Aug 2015 00:04:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : omap5-sgx-ddk-um-linux: add AM3 and AM4, and pvr-init to initialization
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
X-List-Received-Date: Sat, 29 Aug 2015 00:04:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 483a8ce22c6c120272f6eeffb4ea7e07aca1bda1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=483a8ce22c6c120272f6eeffb4ea7e07aca1bda1

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Sat Aug 29 03:07:32 2015 +0000

omap5-sgx-ddk-um-linux: add AM3 and AM4, and pvr-init to initialization

* Add AM3 and AM4 which use null_windown DRM
* Add pvr-init to /etc/init.d

Signed-off-by: Hongmei Gou <h-gou@ti.com>

v2 changes:
1) Use 8 as the initialization number for pvr-init, since pvr-init needs to be done before starting weston which uses number 9
2) Create empty powervr.ini as the default, and place ti33x and ti43x specific ones in their corresponding directories
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux/rc.pvr          |   17 +++++++++++
 .../omap5-sgx-ddk-um-linux/ti33x/powervr.ini       |    3 ++
 .../omap5-sgx-ddk-um-linux/ti43x/powervr.ini       |    3 ++
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |   29 +++++++++++++++++--
 4 files changed, 49 insertions(+), 3 deletions(-)

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
 


