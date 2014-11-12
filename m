Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A95AE007C1; Wed, 12 Nov 2014 11:54:30 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16207E00769
	for <meta-ti@yoctoproject.org>; Wed, 12 Nov 2014 11:54:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id AC1BF52A57; Wed, 12 Nov 2014 19:54:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141112195418.AC1BF52A57@arago-project.org>
Date: Wed, 12 Nov 2014 19:54:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : hyplnk-lld: Add new recipe for Hyperlink lld
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
X-List-Received-Date: Wed, 12 Nov 2014 19:54:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: b8854f7969ef8d7ca1db52aaf693cee6d64bb645
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b8854f7969ef8d7ca1db52aaf693cee6d64bb645

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Nov  6 04:17:04 2014 +0000

hyplnk-lld: Add new recipe for Hyperlink lld

- Provides low level driver for Hyperlink module
- Test recipe is used to build tests and examples using
  the hyperlink library.
- Supports k2h, k2k & k2e

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |   32 +++++++++++++++++++++++++
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc         |   24 ++++++++++++++++++
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |   22 +++++++++++++++++
 3 files changed, 78 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
new file mode 100755
index 0000000..8212c97
--- /dev/null
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
@@ -0,0 +1,32 @@
+include hyplnk-lld.inc
+
+DEPENDS = "common-csl-ip hyplnk-lld"
+
+CHOICELIST = " yes \
+               no  \
+"
+
+do_compile () {
+	make -f makefile_armv7 clean PDK_INSTALL_PATH="${STAGING_INCDIR}" \
+		HYPLNK_SRC_DIR="${S}"
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			make -f makefile_armv7 tests examples \
+				PDK_INSTALL_PATH="${STAGING_INCDIR}" \
+				DEVICE="$device" HYPLNK_SRC_DIR="${S}" \
+				USEDYNAMIC_LIB="$choice"
+		done
+	done
+}
+
+do_install () {
+    for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 installbin \
+			PDK_INSTALL_PATH="${STAGING_INCDIR}" DEVICE="$device" \
+			HYPLNK_SRC_DIR="${S}" \
+			INSTALL_BIN_BASE_DIR="${D}/${bindir}"
+	done
+}
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
new file mode 100644
index 0000000..4c8bb32
--- /dev/null
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "TI Hyperlink Low Level Driver"
+LICENSE = "BSD-3-Clause"
+
+COMPATIBLE_MACHINE = "keystone"
+
+LLDNAME="hyplnk"
+
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=623325cc19e613a4e770fbb749922592"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/hyplnk-lld.git;destsuffix=git/ti/drv/${LLDNAME};protocol=git;branch=${BRANCH}"
+# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.01
+SRCREV = "6910da379501984ecf27f8d23ba6fc6310fe387e"
+
+PV = "2.1.0"
+PR = "r0"
+
+DEVICELIST = " k2h \
+               k2k \
+               k2e \
+"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/${LLDNAME}"
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
new file mode 100755
index 0000000..a582f98
--- /dev/null
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
@@ -0,0 +1,22 @@
+include hyplnk-lld.inc
+
+DEPENDS = "common-csl-ip"
+
+CHOICELIST = " yes \
+               no  \
+"
+do_compile () {
+	make -f makefile_armv7 clean PDK_INSTALL_PATH="${STAGING_INCDIR}" \
+		HYPLNK_SRC_DIR="${S}"
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 lib PDK_INSTALL_PATH="${STAGING_INCDIR}"\
+			DEVICE="$device" HYPLNK_SRC_DIR="${S}"
+	done
+}
+
+do_install () {
+	make -f makefile_armv7 install PDK_INSTALL_PATH="${STAGING_INCDIR}" \
+		INSTALL_INC_BASE_DIR="${D}/${includedir}" \
+		INSTALL_LIB_BASE_DIR="${D}${libdir}" HYPLNK_SRC_DIR="${S}"
+}


