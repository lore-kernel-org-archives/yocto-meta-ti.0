Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C012E01206
	for <meta-ti@yoctoproject.org>; Sun, 30 Jun 2013 02:54:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5U9s8mS013017
	for <meta-ti@yoctoproject.org>; Sun, 30 Jun 2013 04:54:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5U9s8R4000652
	for <meta-ti@yoctoproject.org>; Sun, 30 Jun 2013 04:54:08 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 30 Jun 2013 04:54:08 -0500
Received: from ti.com (a0875592-linux.apr.dhcp.ti.com [172.24.145.76])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5U9s68n017312;
	Sun, 30 Jun 2013 04:54:07 -0500
Date: Sun, 30 Jun 2013 15:24:06 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130630095406.GA2807@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCHv2] libdrm: Add GLSDK specific staging tree for omap-a15
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
X-List-Received-Date: Sun, 30 Jun 2013 09:54:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

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
---
 recipes-graphics/drm/libdrm_2.4.41.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/drm/libdrm_2.4.41.bb

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
-- 
1.7.0.4


