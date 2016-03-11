Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61983E00AD7; Fri, 11 Mar 2016 07:34:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05CE4E00A7D
	for <meta-ti@yoctoproject.org>; Fri, 11 Mar 2016 07:34:45 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2BFYip7004728
	for <meta-ti@yoctoproject.org>; Fri, 11 Mar 2016 09:34:44 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2BFYij3000567
	for <meta-ti@yoctoproject.org>; Fri, 11 Mar 2016 09:34:44 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 11 Mar 2016 09:34:44 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2BFYiMx023496;	Fri, 11 Mar 2016 09:34:44 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 11 Mar 2016 10:34:42 -0500
Message-ID: <1457710482-9498-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] debugss-module-drv: Add support for k2e-evm
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
X-List-Received-Date: Fri, 11 Mar 2016 15:34:47 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/dsptop/debugss-module-drv_git.bb | 3 ++-
 recipes-bsp/dsptop/dsptop.inc                | 4 ++--
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
 
-- 
1.9.1


