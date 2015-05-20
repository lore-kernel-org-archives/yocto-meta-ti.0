Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56EFAE0095C; Wed, 20 May 2015 06:38:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E315E0027F
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 06:38:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4KDcRsD017466
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 08:38:27 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4KDcRV2002334
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 08:38:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 May 2015 08:38:27 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4KDcRP3031906;	Wed, 20 May 2015 08:38:27 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 May 2015 09:38:23 -0400
Message-ID: <1432129103-2489-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3 1/3] gdbserverproxy-module-drv: Add version 1.1.0
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
X-List-Received-Date: Wed, 20 May 2015 13:38:32 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
* v3 changes:
  - Use the more generic "keystone" soc family as opposed to the
    specific k2hk-evm machine.

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
index 0000000..aeedb6c
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
+PLATFORM_keystone = "KEYSTONE_PLATFORM"
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
+COMPATIBLE_MACHINE = "dra7xx|keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+include gdbc6x.inc
+
+module_autoload_gdbserverproxy = "gdbserverproxy"
-- 
1.7.9.5


