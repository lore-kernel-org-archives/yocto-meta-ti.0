Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F88EE0095C; Wed, 20 May 2015 06:34:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8DB95E0027F
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 06:34:02 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4KDY1m7021155
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 08:34:01 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4KDY1JD031420
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 08:34:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 May 2015 08:34:00 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4KDY0Kg025394;	Wed, 20 May 2015 08:34:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 May 2015 09:33:59 -0400
Message-ID: <1432128839-1322-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3 1/3] debugss-module-drv: Add version 1.2.0
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
X-List-Received-Date: Wed, 20 May 2015 13:34:04 -0000
Content-Type: text/plain

* The debugss-module-drv is require for the dsptop utility.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
* v3 changes:
  - Use the more generic "keystone" soc family as opposed to the
    specific k2hk-evm machine.

* v2 changes:
  - Add support for k2hk-evm
  - Reorganize file based on oe-stylize.

 recipes-bsp/dsptop/debugss-module-drv_git.bb |   22 ++++++++++++++++++++++
 recipes-bsp/dsptop/dsptop.inc                |    8 ++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 recipes-bsp/dsptop/debugss-module-drv_git.bb
 create mode 100644 recipes-bsp/dsptop/dsptop.inc

diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/recipes-bsp/dsptop/debugss-module-drv_git.bb
new file mode 100644
index 0000000..66e0453
--- /dev/null
+++ b/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Debug Sub-System (DebugSS) driver for Keystone and DRA7xx devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
+
+# This package builds a kernel module, use kernel PR as base and append a local
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
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
index 0000000..4b9e3fa
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
-- 
1.7.9.5


