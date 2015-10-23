Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ECC1CE00B36; Fri, 23 Oct 2015 12:36:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7B29E00B23
	for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2015 12:36:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5C24F52A19; Fri, 23 Oct 2015 19:36:16 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151023193616.5C24F52A19@arago-project.org>
Date: Fri, 23 Oct 2015 19:36:16 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : aif2-lld: Add low level driver package for keystone2 antenna interface
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
X-List-Received-Date: Fri, 23 Oct 2015 19:36:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 44c64fca6ad1fb893c77720919ccce0a2a228409
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=44c64fca6ad1fb893c77720919ccce0a2a228409

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Oct 23 21:08:56 2015 +0000

aif2-lld: Add low level driver package for keystone2 antenna interface

- Provides low level driver and test binaries for keystone2 antenna
  interface peripheral

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/aif2-lld/aif2-lld-test_git.bb |   16 ++++++++++++++++
 recipes-bsp/aif2-lld/aif2-lld.inc         |   13 +++++++++++++
 recipes-bsp/aif2-lld/aif2-lld_git.bb      |   15 +++++++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
new file mode 100755
index 0000000..2a9de43
--- /dev/null
+++ b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "TI Antenna Interface peripheral module low level driver test binaries"
+
+DEPENDS = "common-csl-ip aif2-lld qmss-lld cppi-lld"
+
+include aif2-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} AIF2_SRC_DIR=${WORKDIR}/git"
+
+do_compile () {
+    oe_runmake clean DEVICE=k2hk
+    oe_runmake tests DEVICE=k2hk
+}
+
+do_install () {
+    oe_runmake installbin DEVICE=k2hk AIF2_SRC_DIR=${WORKDIR}/git INSTALL_BIN_BASE_DIR=${D}/${bindir}
+}
diff --git a/recipes-bsp/aif2-lld/aif2-lld.inc b/recipes-bsp/aif2-lld/aif2-lld.inc
new file mode 100755
index 0000000..212813c
--- /dev/null
+++ b/recipes-bsp/aif2-lld/aif2-lld.inc
@@ -0,0 +1,13 @@
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/aif2-lld.git;destsuffix=git/ti/drv/aif2;protocol=git;branch=${BRANCH}"
+# The following commit correspond to DEV.AIF2LLD.01.02.00.00A
+SRCREV = "7f394ec9975cd4cef982b11763c882c4c763ddce"
+
+PV = "1.2.0.0"
+
+COMPATIBLE_MACHINE = "k2hk-evm"
+
+S = "${WORKDIR}/git/ti/drv/aif2"
diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/aif2-lld_git.bb
new file mode 100755
index 0000000..f6e95c2
--- /dev/null
+++ b/recipes-bsp/aif2-lld/aif2-lld_git.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Antenna Interface low level driver"
+
+DEPENDS = "common-csl-ip qmss-lld cppi-lld"
+
+include aif2-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+    oe_runmake lib DEVICE=k2hk
+}
+
+do_install () {
+    oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}


