Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74748E013B8
	for <meta-ti@yoctoproject.org>; Sun, 30 Jun 2013 21:55:36 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 458155298D; Mon,  1 Jul 2013 04:55:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130701045536.458155298D@arago-project.org>
Date: Mon,  1 Jul 2013 04:55:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Siddharth Heroor : libdrm: Add GLSDK specific staging tree for omap-a15
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
X-List-Received-Date: Mon, 01 Jul 2013 04:55:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2144ae369a1554064809c1a432784e8c44705a9e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2144ae369a1554064809c1a432784e8c44705a9e

Author: Siddharth Heroor <heroor@ti.com>
Date:   Sun Jun 30 15:42:06 2013 +0530

libdrm: Add GLSDK specific staging tree for omap-a15

* Override SRC_URI to use TI's tree at https://git.ti.com/glsdk/libdrm
  This tree includes patches on top of the upstream libdrm for
  omap5 and dra7xx class of devices.

v2 :
* Change PR to "${INC_PR}.0" instead of using the SRCREV as per comments
  received in v1.
* Add missing configure options to get Kernel Mode Setting (KMS) as
  well. This was missing in the original patch.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Siddharth Heroor <heroor@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/drm/libdrm_2.4.41.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
new file mode 100644
index 0000000..1d89401
--- /dev/null
+++ b/recipes-graphics/drm/libdrm_2.4.41.bb
@@ -0,0 +1,14 @@
+require recipes-graphics/drm/libdrm.inc
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+DEFAULT_PREFERENCE = "-1"
+
+EXTRA_OECONF += "--enable-omap-experimental-api --enable-kms"
+
+SRC_URI = "git://git.ti.com/glsdk/libdrm.git;protocol=git"
+SRCREV = "3cb5405084111193cedb8796d259b56560b088f0"
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/git"


