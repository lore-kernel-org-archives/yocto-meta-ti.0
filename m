Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74F5EE00AB7; Thu, 28 Jan 2016 10:43:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0365E00B8C
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:43:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id AC91352AB4; Thu, 28 Jan 2016 18:43:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128184350.AC91352AB4@arago-project.org>
Date: Thu, 28 Jan 2016 18:43:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : uio-module-drv: Add to KERNEL_MODULE_AUTOLOAD
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
X-List-Received-Date: Thu, 28 Jan 2016 18:43:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0fbe32c1ebd09cb02adcede25b754c669311a9ff
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0fbe32c1ebd09cb02adcede25b754c669311a9ff

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 20:47:10 2016 +0000

uio-module-drv: Add to KERNEL_MODULE_AUTOLOAD

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/uio-module-drv/uio-module-drv_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
index 445dc1c..401fdbe 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -4,7 +4,7 @@ include uio-module-drv.inc
 PV = "2.0.0.0+git${SRCPV}"
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 module_auto_load_uio-module-drv = "uio-module-drv"
@@ -15,3 +15,5 @@ do_install_append () {
     install -d ${D}${includedir}
     cp *.h ${D}${includedir}
 }
+
+KERNEL_MODULE_AUTOLOAD += "uio_module_drv"


