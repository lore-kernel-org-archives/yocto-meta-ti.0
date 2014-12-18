Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 004CEE00B68; Thu, 18 Dec 2014 10:04:50 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0F0DE00B49
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 10:04:47 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7A262529A4; Thu, 18 Dec 2014 18:04:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141218180446.7A262529A4@arago-project.org>
Date: Thu, 18 Dec 2014 18:04:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : qmss-lld: Add new recipe for QMSS Module low level driver
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
X-List-Received-Date: Thu, 18 Dec 2014 18:04:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d0a7ce516faddbff49f6e7065d7c6ea6c0165c3f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d0a7ce516faddbff49f6e7065d7c6ea6c0165c3f

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Dec 17 00:12:11 2014 +0000

qmss-lld: Add new recipe for QMSS Module low level driver

- Provides low level driver and test code for Queue managment subsystem module
- Supports k2h, k2k, k2l k2e devices

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/qmss-lld/qmss-lld-test_git.bb |   27 +++++++++++++++++++++++++++
 recipes-bsp/qmss-lld/qmss-lld.inc         |   15 +++++++++++++++
 recipes-bsp/qmss-lld/qmss-lld_git.bb      |   20 ++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
new file mode 100755
index 0000000..438d840
--- /dev/null
+++ b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "TI QMSS low level driver unit test and example binaries"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld"
+
+include qmss-lld.inc
+
+CHOICELIST = "yes no"
+
+do_compile () {
+#   Now build the lld in the updated directory
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S}
+		for choice in ${CHOICELIST}
+		do
+			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
+	done
+}
diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
new file mode 100644
index 0000000..87499cc
--- /dev/null
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -0,0 +1,15 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
+
+BRANCH ="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/qmss-lld.git;destsuffix=git/ti/drv/qmss;protocol=git;branch=${BRANCH}"
+
+# commit ID corresponding to DEV.QMSS_LLD.02.01.00.06
+SRCREV = "661fff76530fd56cf7550f76c7b7a541ea18fda8"
+PV = "02.01.00.06"
+PR = "r0"
+
+DEVICELIST = "k2h k2k k2l k2e"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/qmss"
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qmss-lld_git.bb
new file mode 100755
index 0000000..9d2f547
--- /dev/null
+++ b/recipes-bsp/qmss-lld/qmss-lld_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI QMSS low level driver library"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS="common-csl-ip rm-lld"
+
+include qmss-lld.inc
+
+do_compile () {
+#   Now build the lld
+    make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}"
+	done
+
+}
+
+do_install () {
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}


