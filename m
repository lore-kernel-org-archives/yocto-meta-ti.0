Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8E3CE00757; Thu, 26 Feb 2015 05:34:22 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E1F8E00757
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 05:34:20 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QDYJhG012213
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:34:19 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QDYISx017256
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:34:18 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Feb 2015 07:34:18 -0600
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1QDYDhH015862;	Thu, 26 Feb 2015 07:34:18 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Feb 2015 08:34:09 -0500
Message-ID: <1424957651-5207-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC PATCH 4/6] opencl-monitor: OpenCL firmware which runs on the accelerators.
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
X-List-Received-Date: Thu, 26 Feb 2015 13:34:22 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ocl/opencl-monitor_git.bb |   41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 recipes-ti/ocl/opencl-monitor_git.bb

diff --git a/recipes-ti/ocl/opencl-monitor_git.bb b/recipes-ti/ocl/opencl-monitor_git.bb
new file mode 100644
index 0000000..54b3f45
--- /dev/null
+++ b/recipes-ti/ocl/opencl-monitor_git.bb
@@ -0,0 +1,41 @@
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
+SRC_URI_append = " \
+    ${SRC_URI_OPENCL} \
+    ${SRC_URI_MONITOR} \
+    ${SRC_URI_BUILTINS} \
+    ${SRC_URI_LIBM} \
+    ${SRC_URI_MONITOR_IMAGE} \
+    ${MONITOR_PATCHES} \
+    ${OPENCL_PATCHES} \
+    ${OPENGL_HEADERS} \
+"
+
+S = "${WORKDIR}/git/opencl_monitor"
+
+
+do_compile_append() {
+    cp -rv ${WORKDIR}/opencl_monitor-vayu-0.12.0/* ${S}/
+}
+
+do_install_append() {
+    cp -v ${D}${datadir}/ti/opencl/dsp0.out ${D}${datadir}/ti/opencl/dsp.out
+    cp -v ${D}${datadir}/ti/opencl/dsp0.syms ${D}${datadir}/ti/opencl/dsp.syms
+}
+
+FILES_${PN} += " \
+    ${datadir}/ti/opencl/* \
+    ${base_libdir}/firmware/* \
+"
+
+INSANE_SKIP_${PN} = "arch"
+
-- 
1.7.9.5


