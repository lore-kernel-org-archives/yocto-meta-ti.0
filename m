Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BCF6E00840
	for <meta-ti@yoctoproject.org>; Tue, 14 Jan 2014 12:42:58 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 02A1552A55; Tue, 14 Jan 2014 20:42:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140114204258.02A1552A55@arago-project.org>
Date: Tue, 14 Jan 2014 20:42:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : vpe-vpdma: Package for VPE DMA FW and test app
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
X-List-Received-Date: Tue, 14 Jan 2014 20:42:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: c0de04584082d127643389bf529a60335c3bb52b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c0de04584082d127643389bf529a60335c3bb52b

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Jan 13 17:33:05 2014 -0600

vpe-vpdma: Package for VPE DMA FW and test app

* This recipe will create the firmware and test application
  packages.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/vpe-vpdma_git.bb |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

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


