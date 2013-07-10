Return-Path: <Hingolikar@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2859FE013B0
	for <meta-ti@yoctoproject.org>; Wed, 10 Jul 2013 06:00:57 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6AD0vkL004339
	for <meta-ti@yoctoproject.org>; Wed, 10 Jul 2013 08:00:57 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6AD0vwu019630
	for <meta-ti@yoctoproject.org>; Wed, 10 Jul 2013 08:00:57 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 10 Jul 2013 08:00:56 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r6AD0tsS021354;
	Wed, 10 Jul 2013 08:00:56 -0500
Date: Wed, 10 Jul 2013 18:30:54 +0530
From: Siddharth Heroor <Hingolikar@ti.com>, Mrinmayee <mrinmayee@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130710130054.GA2217@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCHv4] gbm: Add TI staging tree
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
X-List-Received-Date: Wed, 10 Jul 2013 13:00:58 -0000
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
* In the Danny branch, oe-core/meta/recipes-graphics/mesa
  has 8.0.0 as its version. For the GLSDK stack, the libgbm
  is more in line with 9.0.0 mesa. The goal is to move over
  to mesa for libgbm in future.

v2:
* Cleaned up description and rewrote the commit.

v3:

* Rename as libgbm-glsdk to avoid clash with mesa-libgbm.

v4:

*  Move into a single versioned recipe and delete .inc file

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb

diff --git a/recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb b/recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb
new file mode 100644
index 0000000..17207a1
--- /dev/null
+++ b/recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Userspace interface for the kernel GBM services."
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
+PROVIDES = "libgbm"
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+DEFAULT_PREFERENCE = "-1"
+
+inherit autotools pkgconfig
+
+SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "cb86a2f2cecd41023bf1bf12fbcf11be11220f31"
-- 
1.7.0.4


