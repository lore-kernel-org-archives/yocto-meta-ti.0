Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7FF7E00DD0; Mon, 19 Dec 2016 15:16:09 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2A24E00A21
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:15:51 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C21DB52ADB; Mon, 19 Dec 2016 23:15:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231550.C21DB52ADB@arago-project.org>
Date: Mon, 19 Dec 2016 23:15:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : osal: Upstream version 1.0.0.5E
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
X-List-Received-Date: Mon, 19 Dec 2016 23:16:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 000df8b346c96c5b341ec467372f550740d88edb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=000df8b346c96c5b341ec467372f550740d88edb

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Dec 15 21:54:39 2016 +0000

osal: Upstream version 1.0.0.5E

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/osal/osal-test_git.bb |   20 ++++++++++++++++++++
 recipes-bsp/osal/osal.inc         |   20 ++++++++++++++++++++
 recipes-bsp/osal/osal_git.bb      |   20 ++++++++++++++++++++
 3 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/osal/osal-test_git.bb b/recipes-bsp/osal/osal-test_git.bb
new file mode 100644
index 0000000..9d4fa6d
--- /dev/null
+++ b/recipes-bsp/osal/osal-test_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI OSAL tests"
+
+DEPENDS="common-csl-ip osal"
+
+include osal.inc
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/${OSAL_GIT_DESTSUFFIX}"
+
+do_compile () {
+#   Build the tests
+    make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
+    make -f makefile_armv7 tests PDK_INSTALL_PATH=${STAGING_INCDIR} OSAL_SRC_DIR=${S}
+}
+
+do_install () {
+#   Install the binary
+    make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_BIN_BASE_DIR=${D}${bindir} OSAL_SRC_DIR=${S}
+}
diff --git a/recipes-bsp/osal/osal.inc b/recipes-bsp/osal/osal.inc
new file mode 100644
index 0000000..55a165e
--- /dev/null
+++ b/recipes-bsp/osal/osal.inc
@@ -0,0 +1,20 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://osal.h;beginline=1;endline=31;md5=8cbd8efb1460e4f16e6b00c8a7686be4"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+OSAL_GIT_URI = "git://git.ti.com/keystone-rtos/osal.git"
+OSAL_GIT_PROTOCOL = "git"
+OSAL_GIT_BRANCH = "master"
+OSAL_GIT_DESTSUFFIX = "git/ti/osal"
+
+# Below commit ID corresponds to "DEV.OSAL.01.00.00.05E"
+OSAL_SRCREV = "5125c71d756530513500b463d3301d03dee04497"
+
+BRANCH = "${OSAL_GIT_BRANCH}"
+SRC_URI = "${OSAL_GIT_URI};destsuffix=${OSAL_GIT_DESTSUFFIX};protocol=${OSAL_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${OSAL_SRCREV}"
+PV = "01.00.00.05E"
+INC_PR = "r0"
diff --git a/recipes-bsp/osal/osal_git.bb b/recipes-bsp/osal/osal_git.bb
new file mode 100644
index 0000000..ecb46b2
--- /dev/null
+++ b/recipes-bsp/osal/osal_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI OSAL library for Linux"
+
+DEPENDS="common-csl-ip"
+
+include osal.inc
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/${OSAL_GIT_DESTSUFFIX}"
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


