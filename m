Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E94E8E006E3
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 13:37:05 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9221752A63; Mon, 27 Jan 2014 21:37:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140127213702.9221752A63@arago-project.org>
Date: Mon, 27 Jan 2014 21:37:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : cmem: adding new recipe for cmem
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
X-List-Received-Date: Mon, 27 Jan 2014 21:37:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b17cf2d6f1d9107eff707b1f88a8f7bc1a5d2aab
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b17cf2d6f1d9107eff707b1f88a8f7bc1a5d2aab

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Dec 18 18:54:39 2013 -0500

cmem: adding new recipe for cmem

cmem module provides user space contiguous memory allocation

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cmem/cmem-mod_git.bb |   12 ++++++++++++
 recipes-bsp/cmem/cmem.inc        |   12 ++++++++++++
 recipes-bsp/cmem/cmem_git.bb     |   13 +++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
new file mode 100644
index 0000000..2bdf9c0
--- /dev/null
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
+
+include cmem.inc
+
+# This package builds a kernel module, use kernel PR as base and append a local
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+inherit module
+
+EXTRA_OEMAKE += '-f lu.mak KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" TOOLCHAIN_PREFIX="${TOOLCHAIN_PREFIX}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra"'
+MAKE_TARGETS = "module"
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
new file mode 100644
index 0000000..7927839
--- /dev/null
+++ b/recipes-bsp/cmem/cmem.inc
@@ -0,0 +1,12 @@
+HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb8310b3b983024edc620"
+
+BRANCH ?= "master"
+# This corresponds to version 4.00.01.08
+SRCREV = "0b68dfe9f155a1978cdb2178e052dc0d6f1e705b"
+
+SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
new file mode 100644
index 0000000..b633d74
--- /dev/null
+++ b/recipes-bsp/cmem/cmem_git.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "The cmem component supports contiguous memory allocation from userspace"
+
+include cmem.inc
+
+RDEPENDS_${PN} = "cmem-mod"
+
+PR = "r0+gitr${SRCPV}"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/*"
+
+inherit autotools


