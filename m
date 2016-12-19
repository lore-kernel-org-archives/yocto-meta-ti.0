Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C488E00DF7; Mon, 19 Dec 2016 15:15:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D13DAE00D1F
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:15:48 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E78E652AC8; Mon, 19 Dec 2016 23:15:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231547.E78E652AC8@arago-project.org>
Date: Mon, 19 Dec 2016 23:15:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : pruss-lld: Upstream version 1.0.0.5A
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
X-List-Received-Date: Mon, 19 Dec 2016 23:15:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: 8d5dc516128f10d348e5d3e897ab3b3e0f233aa4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8d5dc516128f10d348e5d3e897ab3b3e0f233aa4

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Dec 15 21:54:40 2016 +0000

pruss-lld: Upstream version 1.0.0.5A

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pruss-lld/pruss-lld-test_git.bb |   19 +++++++++++++++++++
 recipes-bsp/pruss-lld/pruss-lld.inc         |   20 ++++++++++++++++++++
 recipes-bsp/pruss-lld/pruss-lld_git.bb      |   20 ++++++++++++++++++++
 3 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
new file mode 100644
index 0000000..d994ec8
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "TI PRUSS low level driver tests"
+
+DEPENDS="common-csl-ip pruss-lld osal"
+
+include pruss-lld.inc
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
+
+do_compile () {
+#   Build the tests
+    make -f makefile_armv7 tests PDK_INSTALL_PATH=${STAGING_INCDIR} PRUSS_SRC_DIR=${S}
+}
+
+do_install () {
+#   Install the binary
+    make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_BIN_BASE_DIR=${D}${bindir} PRUSS_SRC_DIR=${S}
+}
diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pruss-lld.inc
new file mode 100644
index 0000000..52a92bd
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld.inc
@@ -0,0 +1,20 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://pruicss.h;beginline=1;endline=31;md5=315177aa03d58bcd124a6e799e2bd458"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PRUSS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pruss-lld.git"
+PRUSS_LLD_GIT_PROTOCOL = "git"
+PRUSS_LLD_GIT_BRANCH = "master"
+PRUSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/pruss"
+
+# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.05A"
+PRUSS_LLD_SRCREV = "7421ea14f163fb3c95c3645fe0add1e05da9d748"
+
+BRANCH = "${PRUSS_LLD_GIT_BRANCH}"
+SRC_URI = "${PRUSS_LLD_GIT_URI};destsuffix=${PRUSS_LLD_GIT_DESTSUFFIX};protocol=${PRUSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${PRUSS_LLD_SRCREV}"
+PV = "01.00.00.05A"
+INC_PR = "r0"
diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bb b/recipes-bsp/pruss-lld/pruss-lld_git.bb
new file mode 100644
index 0000000..72670f4
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI PRUSS low level driver library"
+
+DEPENDS="common-csl-ip osal"
+
+include pruss-lld.inc
+
+PR = "${INC_PR}.1"
+
+S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
+
+do_compile () {
+#   Build the lib
+    make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
+    make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+}
+
+do_install () {
+#   Install the lib
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}


