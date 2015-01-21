Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5EB8DE0092D; Wed, 21 Jan 2015 12:38:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A510FE0084E
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 12:38:00 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0849D529A4; Wed, 21 Jan 2015 20:37:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150121203800.0849D529A4@arago-project.org>
Date: Wed, 21 Jan 2015 20:37:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : hplib: Add recipe for TI high performance library
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
X-List-Received-Date: Wed, 21 Jan 2015 20:38:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ca6a156ea89a1632cf3d97dafece66ea26784894
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ca6a156ea89a1632cf3d97dafece66ea26784894

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Jan 10 09:07:09 2015 +0000

hplib: Add recipe for TI high performance library

- Provides high performance library, kernel module, user space libraries
  and test binaries
- Supports devices k2h, k2k, k2l & k2e

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hplib/hplib-mod_git.bb  |   20 ++++++++++++++++++++
 recipes-bsp/hplib/hplib-test_git.bb |   30 ++++++++++++++++++++++++++++++
 recipes-bsp/hplib/hplib.inc         |   10 ++++++++++
 recipes-bsp/hplib/hplib_git.bb      |   30 ++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/hplib/hplib-mod_git.bb b/recipes-bsp/hplib/hplib-mod_git.bb
new file mode 100644
index 0000000..acef1ce
--- /dev/null
+++ b/recipes-bsp/hplib/hplib-mod_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI High Performance Library kernel module"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/runtime/hplib/module/COPYING.txt;md5=c1c4d3453cddc5b7f0ce84a277e66779"
+
+DEPENDS = "hplib"
+
+include hplib.inc
+
+# This package builds a kernel module, use kernel PR as base and append a local
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+S ="${WORKDIR}/git/ti/runtime/hplib/module"
+EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR} PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+inherit module
+
+do_install () {
+	oe_runmake install INSTALL_MOD_PATH="${D}"
+}
diff --git a/recipes-bsp/hplib/hplib-test_git.bb b/recipes-bsp/hplib/hplib-test_git.bb
new file mode 100644
index 0000000..574fa2a
--- /dev/null
+++ b/recipes-bsp/hplib/hplib-test_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "TI High performance library test binaries"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
+
+DEPENDS = "common-csl-ip qmss-lld sa-lld pktlib hplib"
+
+include hplib.inc
+
+CHOICELIST = "yes no"
+
+S = "${WORKDIR}/git/ti/runtime/hplib"
+
+EXTRA_OEMAKE += '-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}'
+
+do_compile () {
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake tests HPLIB_SRC_DIR=${S} USEDYNAMIC_LIB=$choice DEVICE="$device"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake installbin INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
+	done
+}
diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
new file mode 100644
index 0000000..99254d1
--- /dev/null
+++ b/recipes-bsp/hplib/hplib.inc
@@ -0,0 +1,10 @@
+COMPATIBLE_MACHINE = "keystone"
+
+DEVICELIST = "k2h k2k k2l k2e"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/hplib.git;protocol=git;branch=${BRANCH}"
+
+# Below Commit ID corresponds to "DEV.HPLIB.01.01.00.04"
+SRCREV = "89d847bb8155f5727867d82f96978f89ea0a7d13"
+PV = "01.01.00.04"
diff --git a/recipes-bsp/hplib/hplib_git.bb b/recipes-bsp/hplib/hplib_git.bb
new file mode 100644
index 0000000..fbb3004
--- /dev/null
+++ b/recipes-bsp/hplib/hplib_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "TI High performance libraries"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
+
+DEPENDS = "common-csl-ip rm-lld qmss-lld sa-lld pktlib"
+
+include hplib.inc
+
+CHOICELIST = "yes no"
+
+S = "${WORKDIR}/git/ti/runtime/hplib"
+
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake lib HPLIB_SRC_DIR=${S} USEDYNAMIC_LIB=$choice DEVICE="$device"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
+	done
+}


