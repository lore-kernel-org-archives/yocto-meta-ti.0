Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2AFAFE00E27; Thu, 15 Dec 2016 08:06:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B87B0E00DF7
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 08:06:16 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBFFvcTU017752
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 09:57:38 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBFFvcLx017360
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 09:57:38 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Dec 2016 09:57:38 -0600
Received: from a0866445-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uBFFvOK2018442;	Thu, 15 Dec 2016 09:57:38 -0600
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Dec 2016 10:54:39 -0500
Message-ID: <1481817282-7017-8-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481817282-7017-1-git-send-email-jsobota@ti.com>
References: <1481817282-7017-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 08/11] osal: Upstream version 1.0.0.5E
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
X-List-Received-Date: Thu, 15 Dec 2016 16:06:18 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/osal/osal-test_git.bb | 20 ++++++++++++++++++++
 recipes-bsp/osal/osal.inc         | 20 ++++++++++++++++++++
 recipes-bsp/osal/osal_git.bb      | 20 ++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 recipes-bsp/osal/osal-test_git.bb
 create mode 100644 recipes-bsp/osal/osal.inc
 create mode 100644 recipes-bsp/osal/osal_git.bb

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
-- 
2.7.4


