Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3743BE00848; Tue,  7 Oct 2014 12:48:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63037E0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 12:48:15 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 74A1C529DD; Tue,  7 Oct 2014 19:48:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141007194815.74A1C529DD@arago-project.org>
Date: Tue,  7 Oct 2014 19:48:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : uio-module-drv: Add new recipe for user space io driver
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
X-List-Received-Date: Tue, 07 Oct 2014 19:48:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fe53dc3cbd322cf6db3edf2eeb2ba72263b0ea36
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fe53dc3cbd322cf6db3edf2eeb2ba72263b0ea36

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Oct  8 00:44:58 2014 +0000

uio-module-drv: Add new recipe for user space io driver

- Provides User space IO driver for on-chip modules

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/uio-module-drv/uio-module-drv_git.bb |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
new file mode 100644
index 0000000..a363d5f
--- /dev/null
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION="User space IO (UIO) driver for on-chip modules"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
+
+BRANCH ?= "master"
+# This corresponds to version 01.00.01.00A
+SRCREV = "3bce5bfec7a7865e278410e3c4484f878b9038b6"
+PV = "1.0.1"
+
+SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
+
+# This package builds a kernel module, use kernel PR as base and append a local
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+S = "${WORKDIR}/git"
+
+module_auto_load_uio-module-drv = "uio-module-drv"
+
+inherit module


