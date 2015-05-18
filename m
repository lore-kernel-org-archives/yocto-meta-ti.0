Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99770E009FA; Mon, 18 May 2015 10:33:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6DB7E009E3
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 10:33:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4IHX036013251
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:33:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IHX0eU031075
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:33:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 12:33:00 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4IHWx5P023023;	Mon, 18 May 2015 12:33:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 May 2015 13:32:54 -0400
Message-ID: <1431970376-24163-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431970376-24163-1-git-send-email-j-stiffler@ti.com>
References: <1431970376-24163-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] gdbserverproxy-module-drv: Add version 1.1.0
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
X-List-Received-Date: Mon, 18 May 2015 17:33:08 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-devtools/gdbc6x/gdbc6x.inc                 |    9 ++++++
 .../gdbc6x/gdbserverproxy-module-drv_git.bb        |   31 ++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x.inc
 create mode 100644 recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb

diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-devtools/gdbc6x/gdbc6x.inc
new file mode 100644
index 0000000..ecdc11e
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x.inc
@@ -0,0 +1,9 @@
+BRANCH = "master"
+
+PV = "1.1.0"
+INC_PR = "r0"
+
+# This corresponds to version 1.1.0    
+SRCREV = "1ab06f8bcfe7540754558bac331a0312c4b59142"
+
+SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
diff --git a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
new file mode 100644
index 0000000..2b02236
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION="Interface for GDB to commincate witha TI C66X DSP"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=75859989545e37968a99b631ef42722e"
+
+include gdbc6x.inc
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
+EXTRA_OEMAKE = "PLATFORM=${PLATFORM}"
+
+S = "${WORKDIR}/git/kernel_module/gdbproxy-mod"
+
+module_autoload_gdbserverproxy = "gdbserverproxy"
+
+inherit module
+
+do_configure[noexec] = "1"
+do_qa_configure[noexec] = "1"
+
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "board-support/extra-drivers/${PN}-${PV}"
+SRCIPK_PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.9.5


