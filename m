Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E03E3E008EA; Thu, 26 Feb 2015 05:34:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09B1BE008E3
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 05:34:19 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QDYIwF018931
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:34:18 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QDYHpo029678
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:34:17 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Feb 2015 07:34:17 -0600
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1QDYDhG015862;	Thu, 26 Feb 2015 07:34:17 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Feb 2015 08:34:08 -0500
Message-ID: <1424957651-5207-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC PATCH 3/6] clocl: Add the opencl kernel compiler.
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
 recipes-ti/ocl/clocl_git.bb |   35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 recipes-ti/ocl/clocl_git.bb

diff --git a/recipes-ti/ocl/clocl_git.bb b/recipes-ti/ocl/clocl_git.bb
new file mode 100644
index 0000000..2dd28a1
--- /dev/null
+++ b/recipes-ti/ocl/clocl_git.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "TI OpenCL"
+HOMEPAGE = "https://gitorious.design.ti.com/ocl"
+LICENSE = "BSD"
+
+include ocl.inc
+
+DEPENDS = "ti-llvm3.3 ti-llvm3.3-native boost"
+
+
+SRC_URI_append = " \
+    ${SRC_URI_OPENCL} \
+    ${OPENCL_PATCHES} \
+"
+
+S = "${WORKDIR}/git/opencl"
+
+export WANT_LLVM_RELEASE = "3.3-ti"
+
+TARGET_class-target = "arm"
+TARGET_class-native = "x86"
+TARGET_class-nativesdk = "x86"
+
+EXTRA_OEMAKE = "-C ${S}/clocl _PRODUCT_VERSION=${PV} TARGET=${TARGET} LLVM_CONFIG_EXE=llvm-config"
+
+do_compile() {
+  oe_runmake
+}
+
+do_install() {
+  install -d ${D}${bindir}
+  install -m 755 ${S}/clocl/${TARGET}/clocl ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
1.7.9.5


