Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91101E00B85; Wed, 21 May 2014 13:39:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A32A2E0077C
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 13:39:51 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9421052A1E; Wed, 21 May 2014 20:39:51 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521203951.9421052A1E@arago-project.org>
Date: Wed, 21 May 2014 20:39:51 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Mrinmayee Hingolikar : omap5-sgx-ddk-um-linux: Add version 1.9.0.12
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
X-List-Received-Date: Wed, 21 May 2014 20:39:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a701d20e99bfaae4092ff9a3d9005f1e3f69629f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a701d20e99bfaae4092ff9a3d9005f1e3f69629f

Author: Mrinmayee Hingolikar <mrinmayee@ti.com>
Date:   Thu May 22 02:23:23 2014 +0000

omap5-sgx-ddk-um-linux: Add version 1.9.0.12

* Pulled in latest version 1.9.0.12 from meta-ti-gsldk and
  preserved authorship for Mrinmayee
* Mark this recipe as providing the gles1, gles2, and egl
  libraries so that it doesn't conflict with other recipes like
  mesa and will be pulled in to satisfy those dependencies

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
new file mode 100644
index 0000000..b875328
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Userspace libraries for SGX"
+HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
+
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git"
+SRCREV = "994922a5655c63b05343a9238cb30e6ef61744be"
+
+PR = "r2"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
+
+RREPLACES_${PN} = "libegl libgles1 libgles2"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
+
+FILES_${PN} =  "${bindir}/*"
+FILES_${PN} += " ${libdir}/*"
+FILES_${PN} +=  "${includedir}/* /usr/share/sgx-lib/"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+INSANE_SKIP_${PN} += "dev-so"


