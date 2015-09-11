Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0E1EE00D4A; Fri, 11 Sep 2015 12:53:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C01A9E00D17
	for <meta-ti@yoctoproject.org>; Fri, 11 Sep 2015 12:53:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 06892529F8; Fri, 11 Sep 2015 19:53:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150911195330.06892529F8@arago-project.org>
Date: Fri, 11 Sep 2015 19:53:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : debugss-module-drv: Fix build issue with fido
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
Branch: fido
Commit: 2559059544329f039bcef469f2b2a02863530715
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2559059544329f039bcef469f2b2a02863530715

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Sep 10 17:58:40 2015 +0000

debugss-module-drv: Fix build issue with fido

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dsptop/debugss-module-drv_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/recipes-bsp/dsptop/debugss-module-drv_git.bb
index 052ae4b..6856d60 100644
--- a/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 PV_append = "+git${SRCPV}"
 
@@ -15,7 +15,7 @@ PLATFORM = ""
 PLATFORM_dra7xx = "DRA7xx_PLATFORM"
 PLATFORM_keystone = "KEYSTONE_PLATFORM"
 
-EXTRA_OEMAKE = "'PLATFORM=${PLATFORM}'"
+EXTRA_OEMAKE = "'PLATFORM=${PLATFORM}' KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"


