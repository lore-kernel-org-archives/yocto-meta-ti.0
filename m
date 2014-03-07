Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9D9DE009DA
	for <meta-ti@yoctoproject.org>; Thu,  6 Mar 2014 17:48:13 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s271mCxW016869
	for <meta-ti@yoctoproject.org>; Thu, 6 Mar 2014 19:48:12 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s271mCSd005039
	for <meta-ti@yoctoproject.org>; Thu, 6 Mar 2014 19:48:12 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 6 Mar 2014 19:48:12 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s271mCXP012899;	Thu, 6 Mar 2014 19:48:12 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Mar 2014 20:48:09 -0500
Message-ID: <1394156889-17171-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] uio-module-drv:User space IO driver for on chip modules
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
X-List-Received-Date: Fri, 07 Mar 2014 01:48:15 -0000
Content-Type: text/plain

- Provides user space access for peripheral module on chip

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/uio-module-drv/uio-module-drv_git.bb |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv_git.bb

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
new file mode 100644
index 0000000..2b02a8f
--- /dev/null
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION="User space IO (UIO) driver for on-chip modules"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
+
+BRANCH ?= "master"
+# This corresponds to version 0.0.0.0
+SRCREV = "489c4b9b6693314f841e83c24306b2327df6a77c"
+
+SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
+
+# This package builds a kernel module, use kernel PR as base and append a local
+PR = "${MACHINE_KERNEL_PR}"
+PR_append = "a"
+
+S = "${WORKDIR}/git"
+
+module_auto_load_uio-module-drv = "uio-module-drv"
+
+inherit module
+
-- 
1.7.9.5


