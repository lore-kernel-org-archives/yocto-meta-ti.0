Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48D55E00722
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 10:16:39 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RHGci0027688
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 12:16:38 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RHGcQh031461
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 12:16:38 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 12:16:38 -0500
Received: from ti.com (a0875592-linux.apr.dhcp.ti.com [172.24.145.76])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5RHGb5T016271;
	Thu, 27 Jun 2013 12:16:37 -0500
Date: Thu, 27 Jun 2013 22:46:36 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130627171636.GA7291@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] libdrm: Add GLSDK specific staging tree for omap-a15
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
X-List-Received-Date: Thu, 27 Jun 2013 17:16:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Override SRC_URI to use TI's tree at https://git.ti.com/glsdk/libdrm
  This tree includes patches on top of the upstream libdrm for
  omap5 and dra7xx class of devices.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes-graphics/drm/libdrm_2.4.41.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/drm/libdrm_2.4.41.bb

diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
new file mode 100644
index 0000000..31f7cee
--- /dev/null
+++ b/recipes-graphics/drm/libdrm_2.4.41.bb
@@ -0,0 +1,15 @@
+require recipes-graphics/drm/libdrm.inc
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+DEFAULT_PREFERENCE = "-1"
+
+EXTRA_OECONF += "--enable-omap-experimental-api"
+
+SRC_URI = "git://git.ti.com/glsdk/libdrm.git;protocol=git"
+SRCREV = "3cb5405084111193cedb8796d259b56560b088f0"
+
+# Append to the PR so that a new SRCREV will cause a rebuild
+PR_append = "a+gitr${SRCPV}"
+
+S = "${WORKDIR}/git"
-- 
1.7.0.4


