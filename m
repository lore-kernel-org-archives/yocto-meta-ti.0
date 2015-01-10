Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBE8BE0090F; Fri,  9 Jan 2015 19:07:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41FB0E0080C
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 19:07:13 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0A37CFt010436
	for <meta-ti@yoctoproject.org>; Fri, 9 Jan 2015 21:07:12 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0A37CbL014266
	for <meta-ti@yoctoproject.org>; Fri, 9 Jan 2015 21:07:12 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 9 Jan 2015 21:07:12 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0A37Cna010183;	Fri, 9 Jan 2015 21:07:12 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 9 Jan 2015 22:07:09 -0500
Message-ID: <1420859229-28228-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] hplib: Add recipe for TI high performance library
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
X-List-Received-Date: Sat, 10 Jan 2015 03:07:25 -0000
Content-Type: text/plain

- Provides high performance library, kernel module, user space libraries
  and test binaries
- Supports devices k2h, k2k, k2l & k2e

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/hplib/hplib-mod_git.bb  |   20 ++++++++++++++++++++
 recipes-bsp/hplib/hplib-test_git.bb |   30 ++++++++++++++++++++++++++++++
 recipes-bsp/hplib/hplib.inc         |   10 ++++++++++
 recipes-bsp/hplib/hplib_git.bb      |   30 ++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 recipes-bsp/hplib/hplib-mod_git.bb
 create mode 100644 recipes-bsp/hplib/hplib-test_git.bb
 create mode 100644 recipes-bsp/hplib/hplib.inc
 create mode 100644 recipes-bsp/hplib/hplib_git.bb

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
-- 
1.7.9.5


