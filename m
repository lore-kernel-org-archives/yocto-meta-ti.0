Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 083FCE00805
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 15:54:40 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBINsd6x004686
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 17:54:39 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBINsd3f019177
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 17:54:39 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 18 Dec 2013 17:54:39 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rBINsdqG023556;	Wed, 18 Dec 2013 17:54:39 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 18 Dec 2013 18:54:39 -0500
Message-ID: <1387410879-23769-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v4] cmem: Adding new recipe for cmem
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
X-List-Received-Date: Wed, 18 Dec 2013 23:54:41 -0000
Content-Type: text/plain

cmem module provides user space contiguous memory allocation

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Fixed compared to previous version
- Updated recipe to use commit id
- Updated make targets module_clean-->modules_clean,
  module_install --> modules_install
---
---
 recipes-bsp/cmem/cmem-mod_git.bb |   24 ++++++++++++++++++++++++
 recipes-bsp/cmem/cmem.inc        |   10 ++++++++++
 recipes-bsp/cmem/cmem_git.bb     |   15 +++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 recipes-bsp/cmem/cmem-mod_git.bb
 create mode 100644 recipes-bsp/cmem/cmem.inc
 create mode 100644 recipes-bsp/cmem/cmem_git.bb

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
new file mode 100644
index 0000000..5809d08
--- /dev/null
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -0,0 +1,24 @@
+DESCRIPTION="Contiguous memory allocation kernel module for contiguous memory allocation from userspace "
+
+include cmem.inc
+
+# This package builds a kernel module, use kernel PR as base and append a local
+PR = "${MACHINE_KERNEL_PR}"
+PR_append = "a"
+
+S = "${WORKDIR}/git"
+
+inherit module
+
+do_compile () {
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+    cd ${S}
+    make -f lu.mak modules_clean
+    make -f lu.mak module KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PREFIX=${CROSS_COMPILE}
+}
+
+do_install () {
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+    cd ${S}
+    make -f lu.mak modules_install KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra" INSTALL_MOD_PATH="${D}"
+}
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
new file mode 100644
index 0000000..b1f441a
--- /dev/null
+++ b/recipes-bsp/cmem/cmem.inc
@@ -0,0 +1,10 @@
+HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb8310b3b983024edc620"
+
+BRANCH ?= "master"
+# This corresponds to version 4.00.01.08
+SRCREV = "0b68dfe9f155a1978cdb2178e052dc0d6f1e705b"
+
+SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
new file mode 100644
index 0000000..ca3ed89
--- /dev/null
+++ b/recipes-bsp/cmem/cmem_git.bb
@@ -0,0 +1,15 @@
+DESCRIPTION="The cmem component supports contiguous memory allocation from userspace "
+
+include cmem.inc
+
+RDEPENDS_${PN} = "cmem-mod"
+
+S = "${WORKDIR}/git"
+
+PR = "r0"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/*"
+
+inherit autotools
-- 
1.7.9.5


