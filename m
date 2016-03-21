Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A95DE00C8D; Mon, 21 Mar 2016 08:44:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0DECE00C8D
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 08:44:36 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6F01552ADF; Mon, 21 Mar 2016 15:44:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160321154434.6F01552ADF@arago-project.org>
Date: Mon, 21 Mar 2016 15:44:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : qmss-lld: Upgrade to version 2.1.0.14
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
X-List-Received-Date: Mon, 21 Mar 2016 15:44:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e97ff395b57c70f759a2ea580c17fed2158c4b8f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e97ff395b57c70f759a2ea580c17fed2158c4b8f

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Mon Mar 21 21:26:59 2016 +0000

qmss-lld: Upgrade to version 2.1.0.14

* Update license with TI-TFL license

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/qmss-lld/qmss-lld.inc                  |   16 +++++-----------
 .../qmss-ld-fix-firmware-installation.patch        |   13 -------------
 2 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index fae58e1..2395a4d 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -1,5 +1,5 @@
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
+LICENSE = "BSD-3-Clause & TI-TFL"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
 
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -9,14 +9,14 @@ QMSS_LLD_GIT_PROTOCOL = "git"
 QMSS_LLD_GIT_BRANCH = "master"
 QMSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/qmss"
 
-# commit ID corresponding to DEV.QMSS_LLD.02.01.00.12
-QMSS_LLD_SRCREV = "6b093515f38c6e4d3a8014903a563a9b89fd7c98"
+# commit ID corresponding to DEV.QMSS_LLD.02.01.00.14
+QMSS_LLD_SRCREV = "4cc3a3f1bcddfc19e2e7d8dd4208ca215e7ecbae"
 
 BRANCH ="${QMSS_LLD_GIT_BRANCH}"
 SRC_URI = "${QMSS_LLD_GIT_URI};destsuffix=${QMSS_LLD_GIT_DESTSUFFIX};protocol=${QMSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${QMSS_LLD_SRCREV}"
 
-PV = "02.01.00.12"
+PV = "02.01.00.14"
 INC_PR = "r0"
 
 DEVICELIST = "k2h k2k k2l k2e"
@@ -25,9 +25,3 @@ DEVICELIST_k2l-evm = "k2l"
 DEVICELIST_k2e-evm = "k2e"
 
 S = "${WORKDIR}/${QMSS_LLD_GIT_DESTSUFFIX}"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/qmss-lld:"
-
-SRC_URI_append = " \
-    file://qmss-ld-fix-firmware-installation.patch \
-"
diff --git a/recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch b/recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch
deleted file mode 100644
index a48aae1..0000000
--- a/recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/makefile_armv7 b/makefile_armv7
-index a1fd5c0..d050ace 100644
---- a/makefile_armv7
-+++ b/makefile_armv7
-@@ -117,7 +117,7 @@ install:
- 	install -d $(INSTALL_LIB_BASE_DIR)
- 	$(CP) ./*.h                $(INSTALL_INC_BASE_DIR)/ti/drv/qmss
- 	$(CP) ./include/*.h        $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/include
--	$(CP) ./firmware/*.h       $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/firmware
-+	$(CP) -r ./firmware/*      $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/firmware
- 	$(CP) -r ./device $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/
- 	@$(CP) -r $(ARMV7LIBDIR)/*.a         $(INSTALL_LIB_BASE_DIR)
- 	@$(CP) -r $(ARMV7LIBDIR)/*.so        $(INSTALL_LIB_BASE_DIR)


