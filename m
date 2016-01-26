Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49ED8E00C06; Tue, 26 Jan 2016 13:17:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EFECE00C09
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 13:17:00 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0QLH0k4005560
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:17:00 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0QLH0Nu001419
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:17:00 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 Jan 2016 15:17:00 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0QLGvUS012813;	Tue, 26 Jan 2016 15:16:59 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 26 Jan 2016 16:16:46 -0500
Message-ID: <1453843011-28530-9-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
References: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 08/13] qmss-lld: Upgrade to version 2.1.0.12
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
X-List-Received-Date: Tue, 26 Jan 2016 21:17:05 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb                  |  4 ++--
 recipes-bsp/qmss-lld/qmss-lld.inc                          | 14 ++++++++++----
 .../qmss-lld/qmss-ld-fix-firmware-installation.patch       | 13 +++++++++++++
 3 files changed, 25 insertions(+), 6 deletions(-)
 create mode 100644 recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch

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
-- 
1.9.1


