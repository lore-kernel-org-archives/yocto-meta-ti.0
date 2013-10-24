Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E61D1E0175B
	for <meta-ti@yoctoproject.org>; Wed, 23 Oct 2013 22:47:10 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9O5lA5t030264
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 00:47:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9O5lAjq008337
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 00:47:10 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 24 Oct 2013 00:47:10 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9O5l8cO014628	for
	<meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 00:47:09 -0500
Date: Thu, 24 Oct 2013 11:17:08 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20131024054708.GA8184@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCHv4] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Thu, 24 Oct 2013 05:47:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

 These libraries are not distributable in source and hence
 are available only as binary. They implement OpenGLES 1.x and
 OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
 class of devices.

v2:

Addressed Chases's comments:
 * Updated the PR
 * Added shasum for the tarball
 * Removed redundant FILES section

v3:
 * Replaced shasum by sha256sum

v4:
 * Corrected license information to "TSPA"

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
new file mode 100644
index 0000000..5e21bd5
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Userspace libraries for sgx"
+HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
+LICENSE = "TSPA"
+
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/OMAP5_1_09_00_10//exports/${PN}-${PV}.tar.gz;protocol=http"
+
+LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=d280df8e94bb2e7b9251c8526078eeb8"
+
+PR = "r0" 
+
+SRC_URI[md5sum] = "3cfb875de031098a4c1eeeaf4e442367"
+SRC_URI[sha256sum] = "20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa053cf3488c762fbc72f22489a"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
+
+FILES_${PN} += "${libdir}/gbm/"
-- 
1.7.9.5


