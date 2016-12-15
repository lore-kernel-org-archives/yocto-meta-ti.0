Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A762E00E27; Thu, 15 Dec 2016 08:06:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10101E00E22
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 08:06:17 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBFFvdJD017755
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 09:57:39 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBFFvdk9017365
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 09:57:39 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Dec 2016 09:57:38 -0600
Received: from a0866445-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uBFFvOK3018442;	Thu, 15 Dec 2016 09:57:38 -0600
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Dec 2016 10:54:40 -0500
Message-ID: <1481817282-7017-9-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481817282-7017-1-git-send-email-jsobota@ti.com>
References: <1481817282-7017-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 09/11] pruss-lld: Upstream version 1.0.0.5A
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
X-List-Received-Date: Thu, 15 Dec 2016 16:06:19 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/pruss-lld/pruss-lld-test_git.bb | 19 +++++++++++++++++++
 recipes-bsp/pruss-lld/pruss-lld.inc         | 20 ++++++++++++++++++++
 recipes-bsp/pruss-lld/pruss-lld_git.bb      | 20 ++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld-test_git.bb
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld.inc
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld_git.bb

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
-- 
2.7.4


