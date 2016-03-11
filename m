Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F77FE00BEF; Fri, 11 Mar 2016 11:08:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED15BE00B9C
	for <meta-ti@yoctoproject.org>; Fri, 11 Mar 2016 11:08:10 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 15C7352AC1; Fri, 11 Mar 2016 19:08:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160311190809.15C7352AC1@arago-project.org>
Date: Fri, 11 Mar 2016 19:08:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : debugss-module-drv: Add support for k2e-evm
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
X-List-Received-Date: Fri, 11 Mar 2016 19:08:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 75e1fa3df24dc4d96c9554e789a64826d7721226
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=75e1fa3df24dc4d96c9554e789a64826d7721226

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri Mar 11 21:34:42 2016 +0000

debugss-module-drv: Add support for k2e-evm

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dsptop/debugss-module-drv_git.bb |    3 ++-
 recipes-bsp/dsptop/dsptop.inc                |    4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/recipes-bsp/dsptop/debugss-module-drv_git.bb
index bf7da44..60d72d4 100644
--- a/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
 PV_append = "+git${SRCPV}"
 
@@ -14,6 +14,7 @@ inherit module
 PLATFORM = ""
 PLATFORM_dra7xx = "DRA7xx_PLATFORM"
 PLATFORM_keystone = "KEYSTONE_PLATFORM"
+PLATFORM_k2e-evm = "K2E_PLATFORM"
 
 EXTRA_OEMAKE = "'PLATFORM=${PLATFORM}' KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
diff --git a/recipes-bsp/dsptop/dsptop.inc b/recipes-bsp/dsptop/dsptop.inc
index 8d23ad0..04bf060 100644
--- a/recipes-bsp/dsptop/dsptop.inc
+++ b/recipes-bsp/dsptop/dsptop.inc
@@ -1,7 +1,7 @@
 # This corresponds to version 1.2.0
-SRCREV = "edf5670075cf6cf42f46654d284f9f78c1c123a1"
+SRCREV = "7dca008bec245e4292897e2eea7b2edb0c51cd2b"
 PV = "1.2.0"
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
 


