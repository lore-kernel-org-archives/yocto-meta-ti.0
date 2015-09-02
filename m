Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20389E00A3C; Wed,  2 Sep 2015 06:47:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00ADBE00CB2
	for <meta-ti@yoctoproject.org>; Wed,  2 Sep 2015 06:46:53 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 93EDE52094; Wed,  2 Sep 2015 13:46:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150902134653.93EDE52094@arago-project.org>
Date: Wed,  2 Sep 2015 13:46:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : uio-module-drv: Update to new version 1.0.2.3
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
X-List-Received-Date: Wed, 02 Sep 2015 13:47:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 090b02a104924886afd0fa79be7b5d08eebf071f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=090b02a104924886afd0fa79be7b5d08eebf071f

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Sep  1 07:34:54 2015 +0000

uio-module-drv: Update to new version 1.0.2.3

- Also add test code recipe for uio-module-drv
- Common part of recipe moved to uio-module-drv.inc

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../uio-module-drv/uio-module-drv-test_git.bb      |   16 ++++++++++++++++
 recipes-bsp/uio-module-drv/uio-module-drv.inc      |   10 ++++++++++
 recipes-bsp/uio-module-drv/uio-module-drv_git.bb   |   13 ++-----------
 3 files changed, 28 insertions(+), 11 deletions(-)

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


