Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8612AE0075B
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 14:12:49 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0DMCmoc025277
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 16:12:48 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0DMCmlQ015038
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 16:12:48 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 13 Jan 2014 16:12:47 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0DMCjkp032472;
	Mon, 13 Jan 2014 16:12:46 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 13 Jan 2014 17:33:05 -0600
Message-ID: <1389655987-31349-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/3] vpe-vpdma: Package for VPE DMA FW and test app
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
X-List-Received-Date: Mon, 13 Jan 2014 22:12:52 -0000
Content-Type: text/plain

* This recipe will create the firmware and test application
  packages.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-bsp/ti/vpe-vpdma_git.bb |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/ti/vpe-vpdma_git.bb

diff --git a/recipes-bsp/ti/vpe-vpdma_git.bb b/recipes-bsp/ti/vpe-vpdma_git.bb
new file mode 100644
index 0000000..d506791
--- /dev/null
+++ b/recipes-bsp/ti/vpe-vpdma_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "VPE VPDMA firmware and test program"
+
+DEPENDS += "virtual/kernel"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
+
+COMPATIBLE_MACHINE = "dra7xx-evm"
+
+PV = "1b8"
+PR = "r0"
+
+SRCREV = "24a5487ec13bf560f0e7fb24a9d4747f9f358be2"
+BRANCH ?= "master"
+
+SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+# The test application needs additional include headers from the kernel
+EXTRA_OEMAKE = 'KDIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include"'
+
+do_install() {
+    oe_runmake DESTDIR="${D}" install
+}
+
+# Separate the firmware into it's own package.
+PACKAGES =+ "${PN}-fw"
+FILES_${PN}-fw += "${base_libdir}/firmware"
-- 
1.7.0.4


