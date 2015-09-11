Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B30CCE00D0D; Fri, 11 Sep 2015 12:53:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BECFFE00D0D
	for <meta-ti@yoctoproject.org>; Fri, 11 Sep 2015 12:53:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 36684529C7; Fri, 11 Sep 2015 19:53:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150911195330.36684529C7@arago-project.org>
Date: Fri, 11 Sep 2015 19:53:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : gdbserverproxy-module-drv: Fix build issue with fido
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
X-List-Received-Date: Fri, 11 Sep 2015 19:53:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d5697a352909a0146fe2a3931d6ed9ce44f95d95
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d5697a352909a0146fe2a3931d6ed9ce44f95d95

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Sep 10 17:58:41 2015 +0000

gdbserverproxy-module-drv: Fix build issue with fido

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../gdbc6x/gdbserverproxy-module-drv_git.bb        |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
index 4dedb83..77a29ec 100644
--- a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
+++ b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=75859989545e37968a99b631ef42722e"
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 PV_append = "+git${SRCPV}"
 
@@ -15,7 +15,7 @@ PLATFORM = ""
 PLATFORM_dra7xx = "DRA7xx_PLATFORM"
 PLATFORM_keystone = "KEYSTONE_PLATFORM"
 
-EXTRA_OEMAKE = "PLATFORM=${PLATFORM}"
+EXTRA_OEMAKE = "PLATFORM=${PLATFORM} KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 # The following is to prevent an unused configure.ac from erroneously
 # triggering the QA check for gettext.
@@ -29,4 +29,4 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 include gdbc6x.inc
 
-module_autoload_gdbserverproxy = "gdbserverproxy"
+KERNEL_MODULE_AUTOLOAD += "gdbserverproxy"


