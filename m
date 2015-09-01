Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4391CE00CCB; Mon, 31 Aug 2015 18:35:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2358E00B44
	for <meta-ti@yoctoproject.org>; Mon, 31 Aug 2015 18:34:57 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t811Yv9W025727
	for <meta-ti@yoctoproject.org>; Mon, 31 Aug 2015 20:34:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t811YvrM027704
	for <meta-ti@yoctoproject.org>; Mon, 31 Aug 2015 20:34:57 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 31 Aug 2015 20:34:56 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t811YuZR017483;	Mon, 31 Aug 2015 20:34:56 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 31 Aug 2015 21:34:54 -0400
Message-ID: <1441071294-13492-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] uio-module-drv: Update to new version 1.0.2.3
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
X-List-Received-Date: Tue, 01 Sep 2015 01:35:01 -0000
Content-Type: text/plain

- Also add test code recipe for uio-module-drv
- Common part of recipe moved to uio-module-drv.inc

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../uio-module-drv/uio-module-drv-test_git.bb      |   16 ++++++++++++++++
 recipes-bsp/uio-module-drv/uio-module-drv.inc      |   10 ++++++++++
 recipes-bsp/uio-module-drv/uio-module-drv_git.bb   |   13 ++-----------
 3 files changed, 28 insertions(+), 11 deletions(-)
 create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
 create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv.inc

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
new file mode 100644
index 0000000..1080a91
--- /dev/null
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Test code for user space IO (UIO) driver"
+
+include uio-module-drv.inc
+PV = "1.0.2.3"
+
+COMPATIBLE_MACHINE = "keystone"
+RDEPENDS_${PN} = "uio-module-drv"
+
+do_compile() {
+	oe_runmake -C ${S} test
+}
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/test/uio_cic2_int_multithread_test ${D}${bindir}/.
+}
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
new file mode 100644
index 0000000..567f7f6
--- /dev/null
+++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -0,0 +1,10 @@
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
+
+BRANCH = "master"
+# This corresponds to version 01.00.02.03
+SRCREV = "634a0c64763c5cd7840e2d439d0ee900455584c8"
+
+SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
index b247527..d75fda2 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -1,21 +1,12 @@
 DESCRIPTION="User space IO (UIO) driver for on-chip modules"
 
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
-
-BRANCH ?= "master"
-# This corresponds to version 01.00.02.01
-SRCREV = "c1988446e3364af4df7cd877e6536f0c6647d7bb"
-PV = "1.0.2.1+git${SRCPV}"
-
-SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
+include uio-module-drv.inc
+PV = "1.0.2.3+git${SRCPV}"
 
 # This package builds a kernel module, use kernel PR as base and append a local
 MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
-S = "${WORKDIR}/git"
-
 module_auto_load_uio-module-drv = "uio-module-drv"
 
 inherit module
-- 
1.7.9.5


