Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9FCFFE00DC7; Tue, 27 Jan 2015 17:02:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 734BAE01A01
	for <meta-ti@yoctoproject.org>; Tue, 27 Jan 2015 17:02:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9757C52AF8; Wed, 28 Jan 2015 01:02:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150128010236.9757C52AF8@arago-project.org>
Date: Wed, 28 Jan 2015 01:02:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : nwal-lld: Add recipes for Network abstraction layer low level driver and test code
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
X-List-Received-Date: Wed, 28 Jan 2015 01:02:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 82da11cf23abe9a1eac62a706549a9f0bd70dcf4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=82da11cf23abe9a1eac62a706549a9f0bd70dcf4

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Jan 22 11:25:16 2015 +0000

nwal-lld: Add recipes for Network abstraction layer low level driver and test code

- Provide Network abstraction layer for keystone devices.
- Supports k2h, k2k, k2l & k2e devices.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/nwal-lld/nwal-lld-test_git.bb |   25 +++++++++++++++++++++++++
 recipes-bsp/nwal-lld/nwal-lld.inc         |   18 ++++++++++++++++++
 recipes-bsp/nwal-lld/nwal-lld_git.bb      |   25 +++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
new file mode 100644
index 0000000..3813df9
--- /dev/null
+++ b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "TI Network Abstraction Layer unit test binaries"
+
+DEPENDS = "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib nwal-lld"
+
+include nwal-lld.inc
+
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake clean NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
+			oe_runmake tests NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
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
diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
new file mode 100644
index 0000000..1e77140
--- /dev/null
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -0,0 +1,18 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
+
+COMPATIBLE_MACHINE = "keystone"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git;protocol=git;branch=${BRANCH}"
+
+# Below commit ID corresponds to "DEV.NWAL.02.01.00.04A"
+SRCREV = "099a9191e642c7732760078bf5af1e3c6ca0197b"
+PV = "02.01.00.04"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/nwal"
+
+DEVICELIST = "k2h k2k k2l k2e"
+
+CHOICELIST = "yes no"
diff --git a/recipes-bsp/nwal-lld/nwal-lld_git.bb b/recipes-bsp/nwal-lld/nwal-lld_git.bb
new file mode 100644
index 0000000..da09730
--- /dev/null
+++ b/recipes-bsp/nwal-lld/nwal-lld_git.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "TI Network abstraction layer LLD library "
+
+DEPENDS = "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib"
+
+include nwal-lld.inc
+
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake clean NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
+			oe_runmake lib NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
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


