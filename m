Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D3B8E008EA; Thu, 26 Feb 2015 05:34:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BB94E006E9
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 05:34:22 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QDYL86030807
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:34:21 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QDYKTh029737
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:34:20 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Feb 2015 07:34:20 -0600
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1QDYDhJ015862;	Thu, 26 Feb 2015 07:34:20 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Feb 2015 08:34:11 -0500
Message-ID: <1424957651-5207-7-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC PATCH 6/6] opencl-examples: OpenCL example applications.
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
X-List-Received-Date: Thu, 26 Feb 2015 13:34:25 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...-larger-sets-and-display-size-information.patch |   74 ++++++++++++++++++++
 recipes-ti/ocl/opencl-examples_git.bb              |   66 +++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 recipes-ti/ocl/ocl/0001-Add-larger-sets-and-display-size-information.patch
 create mode 100644 recipes-ti/ocl/opencl-examples_git.bb

diff --git a/recipes-ti/ocl/ocl/0001-Add-larger-sets-and-display-size-information.patch b/recipes-ti/ocl/ocl/0001-Add-larger-sets-and-display-size-information.patch
new file mode 100644
index 0000000..b9987ad
--- /dev/null
+++ b/recipes-ti/ocl/ocl/0001-Add-larger-sets-and-display-size-information.patch
@@ -0,0 +1,74 @@
+From c182467a5a2ed347d04b5586c96d4d3c33082805 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Thu, 4 Dec 2014 09:29:34 -0500
+Subject: [PATCH] Add larger sets and display size information.
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ dsplib_fft/fft_ocl.cpp |    5 ++++-
+ vecadd/main.cpp        |    5 ++++-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/dsplib_fft/fft_ocl.cpp b/dsplib_fft/fft_ocl.cpp
+index 5f30532..044584a 100644
+--- a/dsplib_fft/fft_ocl.cpp
++++ b/dsplib_fft/fft_ocl.cpp
+@@ -29,6 +29,7 @@
+ #include <cmath>
+ #include <cstring>
+ #include <iostream>
++#include <stdio.h>
+ #include "ocl_util.h"
+ 
+ #define __CL_ENABLE_EXCEPTIONS
+@@ -53,7 +54,7 @@ const char * kernelStr =
+ /* ======================================================================== */
+ /*  Initialized arrays with fixed test data.                                */
+ /* ======================================================================== */
+-#define  FFTSZ (64*1024)
++#define  FFTSZ (1*1024*1024)
+ #define  PAD   0
+ 
+ float x[2*FFTSZ];
+@@ -88,6 +89,8 @@ int main ()
+      int d = 0;
+      int bufsize = sizeof(float) * (2*FFTSZ + PAD + PAD);
+ 
++     printf("Offloading FFT (SP,Complex) of %dK elements...\n\n", (FFTSZ / 1024)); fflush(stdout);
++
+      Buffer bufX(context, CL_MEM_READ_ONLY,  bufsize);
+      Buffer bufY(context, CL_MEM_WRITE_ONLY, bufsize);
+      Buffer bufW(context, CL_MEM_READ_ONLY,  bufsize);
+diff --git a/vecadd/main.cpp b/vecadd/main.cpp
+index be1aced..e2dceda 100644
+--- a/vecadd/main.cpp
++++ b/vecadd/main.cpp
+@@ -29,6 +29,7 @@
+ #include <CL/cl.hpp>
+ #include <iostream>
+ #include <cstdlib>
++#include <stdio.h>
+ #include "ocl_util.h"
+ 
+ using namespace cl;
+@@ -43,7 +44,7 @@ const char * kernelStr =
+     "    c[id] = a[id] + b[id];\n"
+     "}\n";
+ 
+-const int NumElements     = 8*1024;
++const int NumElements     = 8*1024*1024;
+ const int NumWorkGroups   = 256;
+ const int VectorElements  = 4;
+ const int NumVecElements  = NumElements / VectorElements;
+@@ -76,6 +77,8 @@ int main(int argc, char *argv[])
+      devices[d].getInfo(CL_DEVICE_NAME, &str);
+      cout << "DEVICE: " << str << endl << endl;
+ 
++     printf("Offloading vector addition of %dK elements...\n\n", (NumElements / 1024)); fflush(stdout);
++
+      Buffer bufA   (context, CL_MEM_READ_ONLY,  bufsize);
+      Buffer bufB   (context, CL_MEM_READ_ONLY,  bufsize);
+      Buffer bufDst (context, CL_MEM_WRITE_ONLY, bufsize);
+-- 
+1.7.9.5
+
diff --git a/recipes-ti/ocl/opencl-examples_git.bb b/recipes-ti/ocl/opencl-examples_git.bb
new file mode 100644
index 0000000..32af835
--- /dev/null
+++ b/recipes-ti/ocl/opencl-examples_git.bb
@@ -0,0 +1,66 @@
+DESCRIPTION = "TI OpenCL Examples"
+HOMEPAGE = "https://gitorious.design.ti.com/ocl"
+LICENSE = "BSD"
+
+include ocl.inc
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS = "opencl ti-cgt6x-native clocl-native"
+
+RDEPENDS_${PN} += " opencl-runtime"
+
+SRC_URI_append = " \
+    ${SRC_URI_EXAMPLES} \
+    ${EXAMPLES_PATCHES} \
+"
+
+
+S = "${WORKDIR}/git/opencl_example_src"
+B = "${S}"
+
+OCL_EXAMPLE_LIST = "dsplib_fft null ooo ooo_map platforms simple vecadd ccode buffer offline offline_embed"
+
+python do_unpack_append() {
+    import shutil
+
+    git_dir = d.expand("${WORKDIR}/git/opencl_examples")
+    s = d.getVar("S", True)
+
+    os.makedirs(s)
+    shutil.copy(os.path.join(git_dir,"Makefile"),s)
+    shutil.copy(os.path.join(git_dir,"make.inc"),s)
+    for example in d.getVar("OCL_EXAMPLE_LIST").split():
+        shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
+}
+
+
+EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    install -d ${D}${datadir}/ti/examples/opencl
+
+    install ${B}/Makefile ${D}${datadir}/ti/examples/opencl
+    install ${B}/make.inc ${D}${datadir}/ti/examples/opencl
+
+    for ocl_example in ${OCL_EXAMPLE_LIST}; do
+        install -d ${D}${datadir}/ti/examples/opencl/${ocl_example}
+        cp -rv ${B}/${ocl_example}/* ${D}${datadir}/ti/examples/opencl/${ocl_example}
+    done
+}
+
+FILES_${PN} += "\
+    ${datadir}/ti/examples/opencl \
+"
+
+FILES_${PN}-dbg += "\
+    ${datadir}/ti/examples/opencl/*/.debug \
+"
+
+INSANE_SKIP_${PN} = "arch"
+
-- 
1.7.9.5


