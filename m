Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8BB1AE00BEB; Mon,  1 Feb 2016 14:09:15 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6383E00929
	for <meta-ti@yoctoproject.org>; Mon,  1 Feb 2016 14:09:04 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id F1FB752ABD; Mon,  1 Feb 2016 22:09:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160201220903.F1FB752ABD@arago-project.org>
Date: Mon,  1 Feb 2016 22:09:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : temperature-module-drv: Smart Reflex Sub-System (SRSS) module driver
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
X-List-Received-Date: Mon, 01 Feb 2016 22:09:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: db523c31f6ee3679706988687c2d17093bda87a1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=db523c31f6ee3679706988687c2d17093bda87a1

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Feb  2 03:16:46 2016 +0000

temperature-module-drv: Smart Reflex Sub-System (SRSS) module driver

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dsptop/dsptop_git.bb                 |    3 ++-
 recipes-bsp/dsptop/temperature-module-drv_git.bb |   18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/dsptop/dsptop_git.bb b/recipes-bsp/dsptop/dsptop_git.bb
index 4b6c729..121dc9b 100644
--- a/recipes-bsp/dsptop/dsptop_git.bb
+++ b/recipes-bsp/dsptop/dsptop_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=309825aa8f5edfcf2c44912ac094b979
 
 DEPENDS = "libulm ncurses"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 S = "${WORKDIR}/git/dsptop"
 
@@ -22,6 +22,7 @@ COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 RDEPENDS_${PN} = "debugss-module-drv"
+RDEPENDS_${PN}_append_keystone = " temperature-module-drv"
 
 include dsptop.inc
 
diff --git a/recipes-bsp/dsptop/temperature-module-drv_git.bb b/recipes-bsp/dsptop/temperature-module-drv_git.bb
new file mode 100644
index 0000000..0bd54c5
--- /dev/null
+++ b/recipes-bsp/dsptop/temperature-module-drv_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Smart Reflex Sub-System (SRSS) module driver for Keystone devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
+
+# This package builds a kernel module, use kernel PR as base and append a local
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+PV_append = "+git${SRCPV}"
+
+S = "${WORKDIR}/git/temperature_module/temperature-mod"
+
+inherit module
+
+EXTRA_OEMAKE = "KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
+
+COMPATIBLE_MACHINE = "keystone"
+
+include dsptop.inc


