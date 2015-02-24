Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70FBFE00828; Tue, 24 Feb 2015 13:10:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C184E00477
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 13:10:20 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5954152A43; Tue, 24 Feb 2015 21:10:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150224211020.5954152A43@arago-project.org>
Date: Tue, 24 Feb 2015 21:10:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : srio-lld: Add recipe for srio peripheral low level driver
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
X-List-Received-Date: Tue, 24 Feb 2015 21:10:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 22b8d340af9493c2ab2eece65919dace2e2010aa
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=22b8d340af9493c2ab2eece65919dace2e2010aa

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Feb 11 04:56:52 2015 +0000

srio-lld: Add recipe for srio peripheral low level driver

- Provides user space low level driver for srio peripheral
- Devices supported k2h & k2k

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/srio-lld/srio-lld-test_git.bb |   27 +++++++++++++++++++++++++++
 recipes-bsp/srio-lld/srio-lld.inc         |   16 ++++++++++++++++
 recipes-bsp/srio-lld/srio-lld_git.bb      |   19 +++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/srio-lld/srio-lld-test_git.bb b/recipes-bsp/srio-lld/srio-lld-test_git.bb
new file mode 100644
index 0000000..7cf254e
--- /dev/null
+++ b/recipes-bsp/srio-lld/srio-lld-test_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "TI SRIO peripheral low level driver unit test and example binaries"
+COMPATIBLE_MACHINE = "keystone"
+DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld srio-lld cmem"
+
+include srio-lld.inc
+
+CHOICELIST = "yes no"
+
+do_compile () {
+#   Now build the lld in the updated directory
+	for device in ${DEVICELIST}
+	do
+		oe_runmake clean DEVICE="$device" SRIO_SRC_DIR=${S}
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake tests DEVICE="$device" SRIO_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+			oe_runmake examples DEVICE="$device" SRIO_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake installbin DEVICE="$device" SRIO_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
+	done
+}
diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
new file mode 100644
index 0000000..1ae2128
--- /dev/null
+++ b/recipes-bsp/srio-lld/srio-lld.inc
@@ -0,0 +1,16 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/srio/srio_drv.h;beginline=1;endline=41;md5=469096088e072d883ff7eef301b34093"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/srio-lld.git;destsuffix=git/ti/drv/srio;protocol=git;branch=${BRANCH}"
+
+# commit ID corresponding to DEV.SRIO_LLD.02.00.00.11
+SRCREV = "2d0efea281222055b3b828c79e57102edaae9db7"
+PV = "02.00.00.11"
+
+DEVICELIST = "k2h k2k"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/srio"
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
diff --git a/recipes-bsp/srio-lld/srio-lld_git.bb b/recipes-bsp/srio-lld/srio-lld_git.bb
new file mode 100644
index 0000000..9ff845b
--- /dev/null
+++ b/recipes-bsp/srio-lld/srio-lld_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "TI SRIO peripheral low level driver"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS="common-csl-ip rm-lld cppi-lld"
+
+include srio-lld.inc
+
+do_compile () {
+#   Now build the lld
+	oe_runmake clean
+	for device in ${DEVICELIST}
+	do
+		oe_runmake lib DEVICE="${device}"
+	done
+}
+
+do_install () {
+	oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}


