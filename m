Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E2DFE0094C; Mon, 18 May 2015 10:24:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DF58E0094C
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 10:24:49 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4IHOmpf015008
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:24:48 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IHOm1s024053
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:24:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 12:24:48 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4IHOj1D026575;	Mon, 18 May 2015 12:24:47 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 May 2015 13:24:40 -0400
Message-ID: <1431969882-24031-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431969882-24031-1-git-send-email-j-stiffler@ti.com>
References: <1431969882-24031-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] debugss-module-drv: Add version 1.2.0
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
X-List-Received-Date: Mon, 18 May 2015 17:24:53 -0000
Content-Type: text/plain

* The debugss-module-drv is require for the dsptop utility.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/dsptop/debugss-module-drv_git.bb |   22 ++++++++++++++++++++++
 recipes-bsp/dsptop/dsptop.inc                |    9 +++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-bsp/dsptop/debugss-module-drv_git.bb
 create mode 100644 recipes-bsp/dsptop/dsptop.inc

diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/recipes-bsp/dsptop/debugss-module-drv_git.bb
new file mode 100644
index 0000000..561bb91
--- /dev/null
+++ b/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION="Debug Sub-System (DebugSS) driver for Keystone and DRA7xx devices"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
+
+include dsptop.inc
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# This package builds a kernel module, use kernel PR as base and append a local
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+PLATFORM = ""
+PLATFORM_dra7xx = "DRA7xx_PLATFORM"
+
+EXTRA_OEMAKE = "'PLATFORM=${PLATFORM}'"
+
+S = "${WORKDIR}/git/debugss_module/debugss-mod"
+
+inherit module
diff --git a/recipes-bsp/dsptop/dsptop.inc b/recipes-bsp/dsptop/dsptop.inc
new file mode 100644
index 0000000..cd403a1
--- /dev/null
+++ b/recipes-bsp/dsptop/dsptop.inc
@@ -0,0 +1,9 @@
+BRANCH = "master"
+
+PV = "1.2.0"
+INC_PR = "r0"
+
+# This corresponds to version 1.2.0    
+SRCREV = "9893486936626e2d3de721f429a67fcac8a68151"
+
+SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
-- 
1.7.9.5


