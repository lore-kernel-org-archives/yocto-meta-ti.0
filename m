Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92A2CE009EB; Tue, 19 May 2015 05:51:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C527E009B8
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 05:51:31 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4JCpUNM018287
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 07:51:30 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4JCpT27028258
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 07:51:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 May 2015 07:51:29 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4JCpTrJ014421;	Tue, 19 May 2015 07:51:29 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 May 2015 08:51:20 -0400
Message-ID: <1432039882-22705-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 1/3] gdbserverproxy-module-drv: Add version 1.1.0
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
X-List-Received-Date: Tue, 19 May 2015 12:51:37 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
* v2 changes:
  - Add support for k2hk-evm
  - Reorganize file based on oe-stylize.
  - Removed sourceipk configuration.
  - Fix do_qa_configure check.

 recipes-devtools/gdbc6x/gdbc6x.inc                 |    8 +++++
 .../gdbc6x/gdbserverproxy-module-drv_git.bb        |   31 ++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x.inc
 create mode 100644 recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb

diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-devtools/gdbc6x/gdbc6x.inc
new file mode 100644
index 0000000..811df30
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x.inc
@@ -0,0 +1,8 @@
+# This corresponds to version 1.1.0    
+SRCREV = "1ab06f8bcfe7540754558bac331a0312c4b59142"
+PV = "1.1.0"
+INC_PR = "r0"
+
+SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "master"
diff --git a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
new file mode 100644
index 0000000..a517909
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Interface for GDB to commincate witha TI C66X DSP"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=75859989545e37968a99b631ef42722e"
+
+# This package builds a kernel module, use kernel PR as base and append a local
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+S = "${WORKDIR}/git/kernel_module/gdbproxy-mod"
+
+inherit module
+
+PLATFORM = ""
+PLATFORM_dra7xx = "DRA7xx_PLATFORM"
+PLATFORM_k2hk-evm = "KEYSTONE_PLATFORM"
+
+EXTRA_OEMAKE = "PLATFORM=${PLATFORM}"
+
+# The following is to prevent an unused configure.ac from erroneously
+# triggering the QA check for gettext.
+EXTRA_OECONF = "--disable-nls"
+do_configure() {
+    :
+}
+
+COMPATIBLE_MACHINE = "dra7xx|k2hk-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+include gdbc6x.inc
+
+module_autoload_gdbserverproxy = "gdbserverproxy"
-- 
1.7.9.5


