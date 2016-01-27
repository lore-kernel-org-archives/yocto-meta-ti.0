Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 41827E009C3; Wed, 27 Jan 2016 12:54:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC909E00B3A
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:52 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0555852A68; Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205449.0555852A68@arago-project.org>
Date: Wed, 27 Jan 2016 20:54:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : qmss-lld: Upgrade to version 2.1.0.12
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
X-List-Received-Date: Wed, 27 Jan 2016 20:54:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 9cfc0e73fba042a36b1a32a4467fc854d9e3f4b2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9cfc0e73fba042a36b1a32a4467fc854d9e3f4b2

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jan 27 03:16:46 2016 +0000

qmss-lld: Upgrade to version 2.1.0.12

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/qmss-lld/qmss-lld-test_git.bb          |    4 ++--
 recipes-bsp/qmss-lld/qmss-lld.inc                  |   14 ++++++++++----
 .../qmss-ld-fix-firmware-installation.patch        |   13 +++++++++++++
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
index 60a35b1..5b9ad4e 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "TI QMSS low level driver unit test and example binaries"
 
-DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld"
+DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld cmem"
 
 include qmss-lld.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 CHOICELIST = "yes no"
 
diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index 9520cea..fae58e1 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -9,15 +9,15 @@ QMSS_LLD_GIT_PROTOCOL = "git"
 QMSS_LLD_GIT_BRANCH = "master"
 QMSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/qmss"
 
-# commit ID corresponding to DEV.QMSS_LLD.02.01.00.11
-QMSS_LLD_SRCREV = "2024ab2d411c1a6dd3f5e768a3cb30c2a685f1e4"
+# commit ID corresponding to DEV.QMSS_LLD.02.01.00.12
+QMSS_LLD_SRCREV = "6b093515f38c6e4d3a8014903a563a9b89fd7c98"
 
 BRANCH ="${QMSS_LLD_GIT_BRANCH}"
 SRC_URI = "${QMSS_LLD_GIT_URI};destsuffix=${QMSS_LLD_GIT_DESTSUFFIX};protocol=${QMSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${QMSS_LLD_SRCREV}"
 
-PV = "02.01.00.11"
-INC_PR = "r2"
+PV = "02.01.00.12"
+INC_PR = "r0"
 
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"
@@ -25,3 +25,9 @@ DEVICELIST_k2l-evm = "k2l"
 DEVICELIST_k2e-evm = "k2e"
 
 S = "${WORKDIR}/${QMSS_LLD_GIT_DESTSUFFIX}"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/qmss-lld:"
+
+SRC_URI_append = " \
+    file://qmss-ld-fix-firmware-installation.patch \
+"
diff --git a/recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch b/recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch
new file mode 100644
index 0000000..a48aae1
--- /dev/null
+++ b/recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch
@@ -0,0 +1,13 @@
+diff --git a/makefile_armv7 b/makefile_armv7
+index a1fd5c0..d050ace 100644
+--- a/makefile_armv7
++++ b/makefile_armv7
+@@ -117,7 +117,7 @@ install:
+ 	install -d $(INSTALL_LIB_BASE_DIR)
+ 	$(CP) ./*.h                $(INSTALL_INC_BASE_DIR)/ti/drv/qmss
+ 	$(CP) ./include/*.h        $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/include
+-	$(CP) ./firmware/*.h       $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/firmware
++	$(CP) -r ./firmware/*      $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/firmware
+ 	$(CP) -r ./device $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/
+ 	@$(CP) -r $(ARMV7LIBDIR)/*.a         $(INSTALL_LIB_BASE_DIR)
+ 	@$(CP) -r $(ARMV7LIBDIR)/*.so        $(INSTALL_LIB_BASE_DIR)


