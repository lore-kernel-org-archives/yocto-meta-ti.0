Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 955E8E009AD; Fri, 10 Apr 2015 15:09:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42FEFE009A6
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 15:09:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CD41152A83; Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150410220932.CD41152A83@arago-project.org>
Date: Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : uio-module-drv: Update to new version 1.0.2.1
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
X-List-Received-Date: Fri, 10 Apr 2015 22:09:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 58718b0bcead48d845dd29a6b5af588ba9318224
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=58718b0bcead48d845dd29a6b5af588ba9318224

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Apr 11 04:02:10 2015 +0000

uio-module-drv: Update to new version 1.0.2.1

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/uio-module-drv/uio-module-drv_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
index a363d5f..b7a26a1 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -4,14 +4,14 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
 
 BRANCH ?= "master"
-# This corresponds to version 01.00.01.00A
-SRCREV = "3bce5bfec7a7865e278410e3c4484f878b9038b6"
-PV = "1.0.1"
+# This corresponds to version 01.00.02.01
+SRCREV = "c1988446e3364af4df7cd877e6536f0c6647d7bb"
+PV = "1.0.2.1"
 
 SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 S = "${WORKDIR}/git"


