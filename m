Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06848E0079A; Mon,  1 Feb 2016 13:16:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54A62E0073D
	for <meta-ti@yoctoproject.org>; Mon,  1 Feb 2016 13:16:54 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u11LGrLl014094
	for <meta-ti@yoctoproject.org>; Mon, 1 Feb 2016 15:16:53 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11LGrlR017316
	for <meta-ti@yoctoproject.org>; Mon, 1 Feb 2016 15:16:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Feb 2016 15:16:53 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u11LGp84030246;	Mon, 1 Feb 2016 15:16:53 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 1 Feb 2016 16:16:46 -0500
Message-ID: <1454361406-1690-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454361406-1690-1-git-send-email-j-stiffler@ti.com>
References: <1454361406-1690-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] temperature-module-drv: Smart Reflex Sub-System (SRSS) module driver
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
X-List-Received-Date: Mon, 01 Feb 2016 21:16:57 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/dsptop/dsptop_git.bb                 |  3 ++-
 recipes-bsp/dsptop/temperature-module-drv_git.bb | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/dsptop/temperature-module-drv_git.bb

diff --git a/recipes-bsp/dsptop/dsptop_git.bb b/recipes-bsp/dsptop/dsptop_git.bb
index 4b6c729..121dc9b 100644
--- a/recipes-bsp/dsptop/dsptop_git.bb
+++ b/recipes-bsp/dsptop/dsptop_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=309825aa8f5edfcf2c44912ac094b979
 
 DEPENDS = "libulm ncurses"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 S = "${WORKDIR}/git/dsptop"
 
@@ -22,6 +22,7 @@ COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 RDEPENDS_${PN} = "debugss-module-drv"
+RDEPENDS_${PN}_append_keystone = " temperature-module-drv"
 
 include dsptop.inc
 
diff --git a/recipes-bsp/dsptop/temperature-module-drv_git.bb b/recipes-bsp/dsptop/temperature-module-drv_git.bb
new file mode 100644
index 0000000..0bd54c5
--- /dev/null
+++ b/recipes-bsp/dsptop/temperature-module-drv_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Smart Reflex Sub-System (SRSS) module driver for Keystone devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
+
+# This package builds a kernel module, use kernel PR as base and append a local
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+PV_append = "+git${SRCPV}"
+
+S = "${WORKDIR}/git/temperature_module/temperature-mod"
+
+inherit module
+
+EXTRA_OEMAKE = "KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
+
+COMPATIBLE_MACHINE = "keystone"
+
+include dsptop.inc
-- 
1.9.1


