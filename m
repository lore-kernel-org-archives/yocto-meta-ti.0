Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7139CE009E5; Fri, 22 May 2015 09:33:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A75D3E008DC
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 09:33:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 55C3D52A7E; Fri, 22 May 2015 16:33:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150522163332.55C3D52A7E@arago-project.org>
Date: Fri, 22 May 2015 16:33:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : debugss-module-drv: Add version 1.2.0
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
Commit: 2e5b5d7127ffaa82fbd4ccfbc14342229bd27103
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2e5b5d7127ffaa82fbd4ccfbc14342229bd27103

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 20 19:33:59 2015 +0000

debugss-module-drv: Add version 1.2.0

* The debugss-module-drv is require for the dsptop utility.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dsptop/debugss-module-drv_git.bb |   23 +++++++++++++++++++++++
 recipes-bsp/dsptop/dsptop.inc                |    8 ++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/recipes-bsp/dsptop/debugss-module-drv_git.bb
new file mode 100644
index 0000000..052ae4b
--- /dev/null
+++ b/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Debug Sub-System (DebugSS) driver for Keystone and DRA7xx devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
+
+# This package builds a kernel module, use kernel PR as base and append a local
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+PV_append = "+git${SRCPV}"
+
+S = "${WORKDIR}/git/debugss_module/debugss-mod"
+
+inherit module
+
+PLATFORM = ""
+PLATFORM_dra7xx = "DRA7xx_PLATFORM"
+PLATFORM_keystone = "KEYSTONE_PLATFORM"
+
+EXTRA_OEMAKE = "'PLATFORM=${PLATFORM}'"
+
+COMPATIBLE_MACHINE = "dra7xx|keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+include dsptop.inc
diff --git a/recipes-bsp/dsptop/dsptop.inc b/recipes-bsp/dsptop/dsptop.inc
new file mode 100644
index 0000000..5897f25
--- /dev/null
+++ b/recipes-bsp/dsptop/dsptop.inc
@@ -0,0 +1,8 @@
+# This corresponds to version 1.2.0
+SRCREV = "9893486936626e2d3de721f429a67fcac8a68151"
+PV = "1.2.0"
+INC_PR = "r0"
+
+SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "master"


