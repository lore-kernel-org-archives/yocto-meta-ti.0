Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E1CAE00974; Fri, 22 May 2015 09:40:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E0EBE008DC
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 09:40:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 67A7D52987; Fri, 22 May 2015 16:40:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150522164030.67A7D52987@arago-project.org>
Date: Fri, 22 May 2015 16:40:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : gdbserverproxy-module-drv: Add version 1.1.0
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
X-List-Received-Date: Fri, 22 May 2015 16:40:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 63f1954c616ea32a0fbc6f5408ad3dd330a6c324
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=63f1954c616ea32a0fbc6f5408ad3dd330a6c324

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 20 19:38:23 2015 +0000

gdbserverproxy-module-drv: Add version 1.1.0

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-devtools/gdbc6x/gdbc6x.inc                 |    8 +++++
 .../gdbc6x/gdbserverproxy-module-drv_git.bb        |   32 ++++++++++++++++++++
 2 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-devtools/gdbc6x/gdbc6x.inc
new file mode 100644
index 0000000..8256127
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
index 0000000..4dedb83
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Interface for GDB to commincate witha TI C66X DSP"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=75859989545e37968a99b631ef42722e"
+
+# This package builds a kernel module, use kernel PR as base and append a local
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+PV_append = "+git${SRCPV}"
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


