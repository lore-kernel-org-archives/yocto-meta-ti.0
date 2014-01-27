Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00A6DE006BE
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 11:43:38 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0200KIQS4N6QB0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 27 Jan 2014 13:43:36 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A20D3200AC; Mon,
	27 Jan 2014 14:43:35 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 27 Jan 2014 14:43:33 -0500
Message-id: <1390851813-27883-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1387410879-23769-1-git-send-email-sam.nelson@ti.com>
References: <1387410879-23769-1-git-send-email-sam.nelson@ti.com>
Subject: [PATCH] cmem: adding new recipe for cmem
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
X-List-Received-Date: Mon, 27 Jan 2014 19:43:41 -0000

From: Sam Nelson <sam.nelson@ti.com>

cmem module provides user space contiguous memory allocation

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cmem/cmem-mod_git.bb | 12 ++++++++++++
 recipes-bsp/cmem/cmem.inc        | 12 ++++++++++++
 recipes-bsp/cmem/cmem_git.bb     | 13 +++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 recipes-bsp/cmem/cmem-mod_git.bb
 create mode 100644 recipes-bsp/cmem/cmem.inc
 create mode 100644 recipes-bsp/cmem/cmem_git.bb

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
index 0000000..bab9238
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
-- 
1.8.3.2


