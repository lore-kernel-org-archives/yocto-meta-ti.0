Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F4C3E009E6; Fri, 22 May 2015 09:33:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8A72E00945
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 09:33:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 88DF452AA0; Fri, 22 May 2015 16:33:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150522163332.88DF452AA0@arago-project.org>
Date: Fri, 22 May 2015 16:33:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : dsptop: Add version 1.2.0
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
X-List-Received-Date: Fri, 22 May 2015 16:33:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5f79e6fcaff436ef484ceb22571d84088b35478f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5f79e6fcaff436ef484ceb22571d84088b35478f

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 20 19:32:16 2015 +0000

dsptop: Add version 1.2.0

* dsptop is a utility that provides a top-like interface to observe
  DSP resource usage in real-time.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dsptop/dsptop_git.bb |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/dsptop/dsptop_git.bb b/recipes-bsp/dsptop/dsptop_git.bb
new file mode 100644
index 0000000..4b6c729
--- /dev/null
+++ b/recipes-bsp/dsptop/dsptop_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "TI dsptop utility."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=309825aa8f5edfcf2c44912ac094b979"
+
+DEPENDS = "libulm ncurses"
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/git/dsptop"
+
+DEVICE = ""
+DEVICE_dra7xx = "DRA7xx"
+DEVICE_keystone = "C66AK2Hxx"
+
+EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+COMPATIBLE_MACHINE = "dra7xx|keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = "debugss-module-drv"
+
+include dsptop.inc
+
+PARALLEL_MAKE = ""


