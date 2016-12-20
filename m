Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64402E00BC1; Tue, 20 Dec 2016 13:36:46 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19EAFE00A64
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 13:36:43 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 87DE052AF0; Tue, 20 Dec 2016 21:36:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161220213642.87DE052AF0@arago-project.org>
Date: Tue, 20 Dec 2016 21:36:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : pruss-lld: utilize oe_runmake
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
X-List-Received-Date: Tue, 20 Dec 2016 21:36:46 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1c0dc51920d5b5bb5a0f2496bc9a0b6679d89181
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1c0dc51920d5b5bb5a0f2496bc9a0b6679d89181

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Dec 21 02:39:14 2016 +0000

pruss-lld: utilize oe_runmake

* Use the oe_runmake wrapper to invoke make
* Supply common make arguments to EXTRA_OEMAKE such as which makefile
  to invoke.
* This resolves build issues when pruss-lld needs to be reconfigured
  as do_configure would make the clean target of the incorrect
  makefile.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pruss-lld/pruss-lld-test_git.bb |    8 +++++---
 recipes-bsp/pruss-lld/pruss-lld_git.bb      |   10 ++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
index d994ec8..7fdbfb6 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
@@ -4,16 +4,18 @@ DEPENDS="common-csl-ip pruss-lld osal"
 
 include pruss-lld.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
 
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PRUSS_SRC_DIR=${S}"
+
 do_compile () {
 #   Build the tests
-    make -f makefile_armv7 tests PDK_INSTALL_PATH=${STAGING_INCDIR} PRUSS_SRC_DIR=${S}
+    oe_runmake tests
 }
 
 do_install () {
 #   Install the binary
-    make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_BIN_BASE_DIR=${D}${bindir} PRUSS_SRC_DIR=${S}
+    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir}
 }
diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bb b/recipes-bsp/pruss-lld/pruss-lld_git.bb
index 72670f4..2eca4ff 100644
--- a/recipes-bsp/pruss-lld/pruss-lld_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld_git.bb
@@ -4,17 +4,19 @@ DEPENDS="common-csl-ip osal"
 
 include pruss-lld.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
 
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
 do_compile () {
 #   Build the lib
-    make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
-    make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+    oe_runmake clean
+    oe_runmake lib
 }
 
 do_install () {
 #   Install the lib
-    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+    oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
 }


