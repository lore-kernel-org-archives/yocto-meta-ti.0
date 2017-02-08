Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C936E0093F; Wed,  8 Feb 2017 13:28:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1E20E006C6
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2017 13:28:02 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v18LS1hY032031
	for <meta-ti@yoctoproject.org>; Wed, 8 Feb 2017 15:28:01 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v18LS1hf018668
	for <meta-ti@yoctoproject.org>; Wed, 8 Feb 2017 15:28:01 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 15:28:01 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v18LS0QF017292;	Wed, 8 Feb 2017 15:28:00 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 8 Feb 2017 16:27:59 -0500
Message-ID: <1486589279-48191-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] multiprocmgr-test: Add test c66x images, sources and scripts to package
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
X-List-Received-Date: Wed, 08 Feb 2017 21:28:06 -0000
Content-Type: text/plain

multiprocmgr-test installs source files, host binaries and associated
    scripts (ti/examples/mpm/test)
multiprocmgr-rtos-test installs the C66x test images in the same
directory structure.

Other updates include
- Use of oe_runmake instead of make
- Added runtime dependency of multiprocmgr-rtos-test & bash

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb | 24 +++++++++++++++++++-----
 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb | 21 ++++++++++++++++-----
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
index 061790b..c88f0d7 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
@@ -6,22 +6,36 @@ require recipes-ti/multiprocmgr/multiprocmgr.inc
 
 DEPENDS = "ti-cgt6x-native"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-export LOCAL_SYSROOT="${STAGING_DIR_TARGET}"
-export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+PACKAGES =+ "${PN}-test"
+FILES_${PN}-test = "${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/build/bin/*.out \
+                    ${datadir}/ti/examples/mpm/test/sync_test/c66x/bin/*.out"
+
+EXTRA_OEMAKE = "LOCAL_SYSROOT="${STAGING_DIR_TARGET}" \
+                C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+               "
 
 do_compile() {
-    make c66x
-    make test_c66x
+    oe_runmake c66x
+    oe_runmake test_c66x
 }
 
 do_install() {
     install -d ${D}${MPM_INSTALL_DIR_RECIPE}
     cp -pPrf ${S}/* ${D}${MPM_INSTALL_DIR_RECIPE}
+
+    # Copy C66x binaries
+    install -d ${D}${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/build/bin
+    cp ${S}/test/filetestdemo/c66x/demo_loopback/build/bin/*.out \
+        ${D}${datadir}/ti/examples/mpm/test/filetestdemo/c66x/demo_loopback/build/bin/
+    install -d ${D}${datadir}/ti/examples/mpm/test/sync_test/c66x/bin
+    cp ${S}/test/sync_test/c66x/bin/*.out \
+        ${D}${datadir}/ti/examples/mpm/test/sync_test/c66x/bin/
 }
 
 FILES_${PN}-dev += "${MPM_INSTALL_DIR_RECIPE}"
 INSANE_SKIP_${PN}-dev = "arch"
+INSANE_SKIP_${PN}-test = "arch"
 
 ALLOW_EMPTY_${PN} = "1"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
index 7ec8796..f01d651 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
@@ -2,22 +2,33 @@ DESCRIPTION = "TI Multiproc Manager test code"
 
 include multiprocmgr.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS = "multiprocmgr cmem"
 RDEPENDS_${PN} = "multiprocmgr mpm-transport cmem"
+RDEPENDS_${PN} += "multiprocmgr-rtos-test bash"
 
 CC += "-I${STAGING_KERNEL_DIR}/include"
 
 # Assuming the multiprocmgr kernel API is safe
 CC[vardepsexclude] = "STAGING_KERNEL_DIR"
 
+FILES_${PN} += "\
+    ${datadir}/ti/examples/mpm \
+"
+
+FILES_${PN}-dbg += "\
+    ${datadir}/ti/examples/mpm/*/.debug \
+"
+
 do_compile() {
-	make -C ${S} test
+	oe_runmake -C ${S} test
 }
 
 do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/test/filetestdemo/host/bin/demo_filetest ${D}${bindir}/mpm_demo_filetest
-	install -c -m 755 ${S}/test/sync_test/host/bin/sync_test ${D}${bindir}/mpm_sync_test
+	# Copy Sources and binary
+	install -d ${D}${datadir}/ti/examples/mpm/src
+	cp -r ${S}/src/mailbox ${D}${datadir}/ti/examples/mpm/src
+	cp -r ${S}/src/sync ${D}${datadir}/ti/examples/mpm/src
+	cp -r ${S}/test ${D}${datadir}/ti/examples/mpm
 }
-- 
1.9.1


