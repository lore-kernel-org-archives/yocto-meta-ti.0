Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42E2AE0095D; Tue, 19 May 2015 04:27:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D7D4E0095D
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 04:27:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4JBR9vT022305
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 06:27:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4JBR9g0023939
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 06:27:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 May 2015 06:27:08 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4JBR6LW028715;	Tue, 19 May 2015 06:27:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 May 2015 07:27:01 -0400
Message-ID: <1432034821-22913-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1432034821-22913-1-git-send-email-j-stiffler@ti.com>
References: <1432034821-22913-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] dsptop: Add version 1.2.0
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
X-List-Received-Date: Tue, 19 May 2015 11:27:12 -0000
Content-Type: text/plain

* dsptop is a utility that provides a top-like interface to observe
  DSP resource usage in real-time.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
* v2 changes:
  - Add support for k2hk-evm
  - Reorganize file based on oe-stylize.

 recipes-bsp/dsptop/dsptop_git.bb |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 recipes-bsp/dsptop/dsptop_git.bb

diff --git a/recipes-bsp/dsptop/dsptop_git.bb b/recipes-bsp/dsptop/dsptop_git.bb
new file mode 100644
index 0000000..3225838
--- /dev/null
+++ b/recipes-bsp/dsptop/dsptop_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "TI dsptop utility."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=309825aa8f5edfcf2c44912ac094b979"
+
+DEPENDS = "libulm ncurses"
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/git/dsptop"
+
+DEVICE = ""
+DEVICE_dra7xx = "DRA7xx"
+DEVICE_k2hk-evm = "C66AK2Hxx"
+
+EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+COMPATIBLE_MACHINE = "dra7xx|k2hk-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = "debugss-module-drv"
+
+include dsptop.inc
+
+PARALLEL_MAKE = ""
-- 
1.7.9.5


