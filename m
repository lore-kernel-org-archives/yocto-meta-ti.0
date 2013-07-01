Return-Path: <Hingolikar@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2BE8E013B8
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 01:33:36 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r618Xav6027331
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 03:33:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r618XaEx029912
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 03:33:36 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 03:33:35 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r618XYbD030614;
	Mon, 1 Jul 2013 03:33:35 -0500
Date: Mon, 1 Jul 2013 14:03:33 +0530
From: Siddharth Heroor <Hingolikar@ti.com>, Mrinmayee <mrinmayee@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130701083333.GA4777@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCHv2] gbm: Add TI staging tree
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
X-List-Received-Date: Mon, 01 Jul 2013 08:33:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* This is the gbm frontend used by (for example) weston
  compositor to load the GLES stack, and retrieve the
  backing buffer objects behind an eglImage (created
  with EGL_WAYLAND_BUFFER_WL), etc.  The frontend is really
  just a backend loader and shim. The backend library must
  be provided by the GLES implementation.
* The original libgbm is actually part of mesa but in the TI
  stack this is implemented as a separate and standalone package
  hosted at git://git.ti.com/glsdk/libgbm.git

v2:
* Cleaned up description and rewrote the commit.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes-graphics/gbm/libgbm.inc    |   10 ++++++++++
 recipes-graphics/gbm/libgbm_git.bb |    7 +++++++
 2 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/gbm/libgbm.inc
 create mode 100644 recipes-graphics/gbm/libgbm_git.bb

diff --git a/recipes-graphics/gbm/libgbm.inc b/recipes-graphics/gbm/libgbm.inc
new file mode 100644
index 0000000..8aad4af
--- /dev/null
+++ b/recipes-graphics/gbm/libgbm.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Userspace interface for the kernel GBM services."
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
+PROVIDES = "gbm"
+
+inherit autotools pkgconfig
+
+PACKAGES =+ "${PN}-dev"
+FILES_${PN}-dev = "${libdir}/libgbm_*.so.*"
diff --git a/recipes-graphics/gbm/libgbm_git.bb b/recipes-graphics/gbm/libgbm_git.bb
new file mode 100644
index 0000000..d1fa38d
--- /dev/null
+++ b/recipes-graphics/gbm/libgbm_git.bb
@@ -0,0 +1,7 @@
+require libgbm.inc
+
+SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "cb86a2f2cecd41023bf1bf12fbcf11be11220f31"
-- 
1.7.0.4


