Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78753E00349; Thu, 17 Dec 2015 17:07:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C237CE00C02
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 17:07:23 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4112852A1C; Fri, 18 Dec 2015 01:07:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151218010723.4112852A1C@arago-project.org>
Date: Fri, 18 Dec 2015 01:07:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : uio-module-drv: Update dependency on kernel modules
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
X-List-Received-Date: Fri, 18 Dec 2015 01:07:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: fc246f3f8f7f7318a374cfa159e569639de888dc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fc246f3f8f7f7318a374cfa159e569639de888dc

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Dec 17 00:41:03 2015 +0000

uio-module-drv: Update dependency on kernel modules

- This is to make this module depend on compilation of kernelmodules.
This will make sure uio.ko is built in the kernel before compilation of
this module.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/uio-module-drv/uio-module-drv_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
index 445dc1c..e10fdeb 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -4,9 +4,11 @@ include uio-module-drv.inc
 PV = "2.0.0.0+git${SRCPV}"
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
+do_configure[depends] += "virtual/kernel:do_compile_kernelmodules"
+
 module_auto_load_uio-module-drv = "uio-module-drv"
 
 inherit module


