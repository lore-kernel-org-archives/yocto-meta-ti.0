Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFE33E008E3; Thu, 26 Feb 2015 05:34:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3310DE00769
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 05:34:21 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QDYK9t012219
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:34:20 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QDYJB3029724
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:34:19 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Feb 2015 07:34:19 -0600
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1QDYDhI015862;	Thu, 26 Feb 2015 07:34:19 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Feb 2015 08:34:10 -0500
Message-ID: <1424957651-5207-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC PATCH 5/6] opencl: OpenCL library.
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
X-List-Received-Date: Thu, 26 Feb 2015 13:34:27 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ocl/opencl_git.bb |   50 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 recipes-ti/ocl/opencl_git.bb

diff --git a/recipes-ti/ocl/opencl_git.bb b/recipes-ti/ocl/opencl_git.bb
new file mode 100644
index 0000000..a07ae57
--- /dev/null
+++ b/recipes-ti/ocl/opencl_git.bb
@@ -0,0 +1,50 @@
+DESCRIPTION = "TI OpenCL"
+HOMEPAGE = "https://gitorious.design.ti.com/ocl"
+LICENSE = "BSD"
+
+include ocl.inc
+
+inherit cmake
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PACKAGES += " ${PN}-runtime"
+
+DEPENDS = "opencl-monitor cmake-native cmem ti-llvm3.3 ti-llvm3.3-native binutils sqlite3 libffi boost boost-native libloki pkgconfig-native virtual/kernel"
+
+RDEPENDS_${PN}-dev += " opencl-monitor"
+RDEPENDS_${PN}-runtime += " ${PN} opencl-monitor clocl ti-cgt6x"
+
+ALLOW_EMPTY_${PN}-runtime = "1"
+
+
+SRC_URI_append = " \
+    ${SRC_URI_OPENCL} \
+    ${SRC_URI_BUILTINS} \
+    ${OPENCL_PATCHES} \
+    ${OPENGL_HEADERS} \
+"
+
+S = "${WORKDIR}/git/opencl"
+
+export WANT_LLVM_RELEASE = "3.3-ti"
+
+EXTRA_OECMAKE += " -DBUILD_TARGET=ARM_AM57 -DBUILD_OUTPUT=lib"
+EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} LINUX_DEVKIT_ROOT=${STAGING_DIR_HOST}"
+export KERNEL_INSTALL_DIR = "${STAGING_KERNEL_DIR}"
+
+do_configure_prepend() {
+    mkdir -p ${S}/include/GL
+    cp -rv ${WORKDIR}/GL/* ${S}/include/GL
+}
+
+do_install_append() {
+    install -d ${D}${includedir}/GL
+    cp -rv ${S}/include/GL/* ${D}${includedir}/GL
+}
+
+FILES_${PN} += " \
+    ${datadir}/ti/opencl/* \
+"
+
-- 
1.7.9.5


