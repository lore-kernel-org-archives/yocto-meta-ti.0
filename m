Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8AE93E00718; Thu, 26 Feb 2015 05:34:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36254E00546
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 05:34:16 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QDYGgB000672
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:34:16 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QDYFla017221
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:34:15 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Feb 2015 07:34:14 -0600
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1QDYDhE015862;	Thu, 26 Feb 2015 07:34:14 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Feb 2015 08:34:06 -0500
Message-ID: <1424957651-5207-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC PATCH 1/6] opencl: Add common file specifying opencl sources and version.
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
X-List-Received-Date: Thu, 26 Feb 2015 13:34:18 -0000
Content-Type: text/plain

* opencl consists of multiple packages, so use this file for
  shared information.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ocl/ocl.inc |   64 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 recipes-ti/ocl/ocl.inc

diff --git a/recipes-ti/ocl/ocl.inc b/recipes-ti/ocl/ocl.inc
new file mode 100644
index 0000000..71965e2
--- /dev/null
+++ b/recipes-ti/ocl/ocl.inc
@@ -0,0 +1,64 @@
+PV = "1.1.0"
+
+LIC_FILES_CHKSUM = "file://../debian/copyright;md5=d3795e71443db61e7c9677a97fa3aac4"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/ocl:"
+
+BRANCH_OCL = "master"
+BRANCH_OPENCL = "master"
+BRANCH_BUILTINS = "master"
+BRANCH_MONITOR = "master"
+BRANCH_LIBM = "master"
+BRANCH_EXAMPLES = "master"
+
+DESTSUFFIX_OCL = "git"
+DESTSUFFIX_OPENCL = "git/opencl"
+DESTSUFFIX_BUILTINS = "git/opencl_builtins"
+DESTSUFFIX_MONITOR = "git/opencl_monitor"
+DESTSUFFIX_LIBM = "git/open_libm"
+DESTSUFFIX_EXAMPLES = "git/opencl_examples"
+
+SRC_URI_BASE = "git://gitorious.design.ti.com/ocl"
+
+SRC_URI_OCL = "${SRC_URI_BASE}/ocl.git;protocol=git;branch=${BRANCH_OCL};name=ocl;destsuffix=${DESTSUFFIX_OCL}"
+SRC_URI_OPENCL = "${SRC_URI_BASE}/opencl.git;protocol=git;branch=${BRANCH_OPENCL};name=opencl;destsuffix=${DESTSUFFIX_OPENCL}"
+SRC_URI_BUILTINS = "${SRC_URI_BASE}/opencl_builtins.git;protocol=git;branch=${BRANCH_BUILTINS};name=opencl_builtins;destsuffix=${DESTSUFFIX_BUILTINS}"
+SRC_URI_MONITOR = "${SRC_URI_BASE}/opencl_monitor_vayu.git;protocol=git;branch=${BRANCH_MONITOR};name=opencl_monitor;destsuffix=${DESTSUFFIX_MONITOR}"
+SRC_URI_MONITOR_IMAGE = "http://udb0866934.am.dhcp.ti.com/mcsdk-8.x/yocto-tmp/opencl_monitor-vayu-0.12.0-1.tar.gz;name=ocl_monitor_image"
+SRC_URI_LIBM = "${SRC_URI_BASE}/open_libm.git;protocol=git;branch=${BRANCH_LIBM};name=open_libm;destsuffix=${DESTSUFFIX_LIBM}"
+SRC_URI_EXAMPLES = "${SRC_URI_BASE}/opencl_examples.git;protocol=git;branch=${BRANCH_EXAMPLES};name=opencl_examples;destsuffix=${DESTSUFFIX_EXAMPLES}"
+
+SRCREV_ocl = "730e6c85e55770969489e4079f7b9a7071e6c8cf"
+SRCREV_opencl = "d00eb494d52fbe07f419bff8f21ab28c05c494b6"
+SRCREV_opencl_builtins = "c410a457c55973f8a5e572978c0581c42608c96c"
+SRCREV_opencl_monitor = "a1fbe457f3fcfc9b087c91cfe9036cf700f1b187"
+SRCREV_open_libm = "4f391bd2ff68a78eae3a91ba606bb86c616d3d55"
+SRCREV_opencl_examples = "cba1bc746597a38827cab7d7e9fd9864229e298e"
+SRC_URI[ocl_monitor_image.md5sum] = "b013b26d1809fb43893d3fbb286b0cba"
+SRC_URI[ocl_monitor_image.sha256sum] = "5084679ab4eefa851c8bbfe95168fd82e2ff3aaea3a1cc800da04dfac1603367"
+
+OPENGL_HEADERS = " \
+    file://GL/gl.h \
+    file://GL/gl_mangle.h \
+    file://GL/glext.h \
+    file://GL/glx.h \
+    file://GL/glx_mangle.h \
+    file://GL/glxext.h \
+    file://GL/osmesa.h \
+    file://GL/wglext.h \
+    file://GL/wmesa.h \
+    file://GL/internal/dri_interface.h \
+"
+
+OPENCL_PATCHES = " \
+"
+
+MONITOR_PATCHES = " \
+"
+
+EXAMPLES_PATCHES = " \
+    file://0001-Add-larger-sets-and-display-size-information.patch \
+"
+
+SRC_URI = "${SRC_URI_OCL}"
+
-- 
1.7.9.5


