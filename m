Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B7A9E00E00; Tue, 19 Apr 2016 15:06:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 072F9E00C87
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 15:05:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6083152007; Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160419220558.6083152007@arago-project.org>
Date: Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : traceframework: Clean up recipe
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
X-List-Received-Date: Tue, 19 Apr 2016 22:06:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4a4cfdb3b2ed20cc1bc99221f64e6f2c1398177f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4a4cfdb3b2ed20cc1bc99221f64e6f2c1398177f

Author: Justin Sobota <jsobota@ti.com>
Date:   Wed Apr 20 02:49:44 2016 +0000

traceframework: Clean up recipe

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/traceframework/traceframework.inc    |   28 +++++++++++++++++
 recipes-bsp/traceframework/traceframework_git.bb |   36 ++++-----------------
 2 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework.inc b/recipes-bsp/traceframework/traceframework.inc
new file mode 100644
index 0000000..a9a1a96
--- /dev/null
+++ b/recipes-bsp/traceframework/traceframework.inc
@@ -0,0 +1,28 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
+
+COMPATIBLE_MACHINE = "tci6614-evm|keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+TRACEFRAMEWORK_GIT_URI = "git://git.ti.com/keystone-rtos/traceframework.git"
+TRACEFRAMEWORK_GIT_PROTOCOL = "git"
+TRACEFRAMEWORK_GIT_BRANCH = "master"
+TRACEFRAMEWORK_GIT_DESTSUFFIX = "git/ti/instrumentation/traceframework"
+
+# Below commit ID corresponds to "DEV.TFWK-01.01.01.08B"
+TRACEFRAMEWORK_SRCREV = "e7a60a71a385337425547e3cac6716998c6a3528"
+
+BRANCH = "${TRACEFRAMEWORK_GIT_BRANCH}"
+SRC_URI = "${TRACEFRAMEWORK_GIT_URI};destsuffix=${TRACEFRAMEWORK_GIT_DESTSUFFIX};protocol=${TRACEFRAMEWORK_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${TRACEFRAMEWORK_SRCREV}"
+PV = "01.01.01.08"
+INC_PR = "r1"
+
+DEVICELIST = "k2k k2h k2e k2l"
+DEVICELIST_tci6614-evm = "c6614"
+DEVICELIST_k2hk-evm    = "k2k k2h"
+DEVICELIST_k2e-evm     = "k2e"
+DEVICELIST_k2l-evm     = "k2l"
+
+S = "${WORKDIR}/${TRACEFRAMEWORK_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index 49a7e95..a3b0d71 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -1,39 +1,12 @@
 DESCRIPTION = "TI Trace Framework library"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/instrumentation/traceframework/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
 
-TRACEFRAMEWORK_GIT_URI = "git://git.ti.com/keystone-rtos/traceframework.git"
-TRACEFRAMEWORK_GIT_PROTOCOL = "git"
-TRACEFRAMEWORK_GIT_BRANCH = "master"
-TRACEFRAMEWORK_GIT_DESTSUFFIX = "git/ti/instrumentation/traceframework"
-
-# Below commit ID corresponds to DEV.TFWK-01.01.01.08B
-TRACEFRAMEWORK_SRCREV = "e7a60a71a385337425547e3cac6716998c6a3528"
-
-BRANCH="${TRACEFRAMEWORK_GIT_BRANCH}"
-SRC_URI = "${TRACEFRAMEWORK_GIT_URI};destsuffix=${TRACEFRAMEWORK_GIT_DESTSUFFIX};protocol=${TRACEFRAMEWORK_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${TRACEFRAMEWORK_SRCREV}"
-
-PV = "01.01.01.08"
-PR = "r1"
-
-COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "cuia"
 
-DEVICELIST = "k2k k2h k2e k2l"
-DEVICELIST_tci6614-evm = "c6614"
-DEVICELIST_k2hk-evm    = "k2k k2h"
-DEVICELIST_k2e-evm     = "k2e"
-DEVICELIST_k2l-evm     = "k2l"
+include traceframework.inc
 
-PACKAGES =+ "${PN}-test"
-
-FILES_${PN}-test = "${bindir}/tfw*.out \
-                    ${bindir}/*.txt"
+PR = "${INC_PR}.0"
 
 BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/instrumentation/traceframework"
 
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} \
                  CUIA_INSTALL_DIR=${STAGING_INCDIR} CUIA_LIB_DIR=${STAGING_LIBDIR}"
@@ -57,3 +30,8 @@ do_install() {
 		oe_runmake install DEVICE="$device" TFW_SRC_DIR=${S} TARGET_ROOT_DIR=${D}
 	done
 }
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/tfw*.out \
+                    ${bindir}/*.txt"


