Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7BD51E009BC; Thu,  9 Feb 2017 18:09:37 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF785E009BC
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2017 18:09:31 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1B854529D2; Fri, 10 Feb 2017 02:09:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170210020930.1B854529D2@arago-project.org>
Date: Fri, 10 Feb 2017 02:09:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : multiprocmgr-test: Add test c66x images, sources and scripts to package
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
X-List-Received-Date: Fri, 10 Feb 2017 02:09:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3ab96808170dbd3347e751808883ce6024562b2a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3ab96808170dbd3347e751808883ce6024562b2a

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Feb  9 03:27:59 2017 +0000

multiprocmgr-test: Add test c66x images, sources and scripts to package

multiprocmgr-test installs source files, host binaries and associated
    scripts (ti/examples/mpm/test)
multiprocmgr-rtos-test installs the C66x test images in the same
directory structure.

Other updates include
- Use of oe_runmake instead of make
- Added runtime dependency of multiprocmgr-rtos-test & bash

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb |   24 +++++++++++++++++----
 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb |   21 ++++++++++++++----
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


