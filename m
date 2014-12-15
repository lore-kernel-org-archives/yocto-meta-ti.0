Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A79ADE009B2; Mon, 15 Dec 2014 12:22:47 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB2B1E00947
	for <meta-ti@yoctoproject.org>; Mon, 15 Dec 2014 12:22:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id EF95652A6C; Mon, 15 Dec 2014 20:22:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141215202229.EF95652A6C@arago-project.org>
Date: Mon, 15 Dec 2014 20:22:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mmap-lld; Add new recipe for mmap lld
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
X-List-Received-Date: Mon, 15 Dec 2014 20:22:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f81589410d96d123b6143d1bc8e33374775e7d7c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f81589410d96d123b6143d1bc8e33374775e7d7c

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Nov 19 17:47:01 2014 +0000

mmap-lld; Add new recipe for mmap lld

- Provides memory map driver using Keystone MPAX module
- Test recipe is used to build test binaries using the mmap lld library
- Supports k2h, k2k & k2e

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/mmap-lld/mmap-lld-test_git.bb |   40 +++++++++++++++++++++++++++++
 recipes-bsp/mmap-lld/mmap-lld.inc         |   16 +++++++++++
 recipes-bsp/mmap-lld/mmap-lld_git.bb      |   12 ++++++++
 3 files changed, 68 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
new file mode 100755
index 0000000..41e46f7
--- /dev/null
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "TI KEYSTONE MMAP driver test binaries "
+include mmap-lld.inc
+
+DEPENDS="common-csl-ip mmap-lld"
+RDEPENDS_${PN}="uio-module-drv"
+
+DEVICELIST = "k2h \
+              k2k \
+              k2e \
+"
+
+CHOICELIST = " yes \
+               no \
+"
+
+do_compile () {
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 clean \
+			PDK_INSTALL_PATH="${STAGING_INCDIR}" \
+			DEVICE="$device" MPAX_SRC_DIR="${S}"
+		for choice in ${CHOICELIST}
+		do
+			make -f makefile_armv7 tests examples \
+				PDK_INSTALL_PATH=${STAGING_INCDIR} \
+				DEVICE="$device" MPAX_SRC_DIR="${S}" \
+				USEDYNAMIC_LIB="$choice"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 installbin \
+		PDK_INSTALL_PATH=${STAGING_INCDIR} \
+		DEVICE="$device" MPAX_SRC_DIR="${S}" \
+		INSTALL_BIN_BASE_DIR="${D}/${bindir}"
+	done
+}
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
new file mode 100644
index 0000000..b8a5b32
--- /dev/null
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -0,0 +1,16 @@
+LICENSE = "BSD-3-Clause"
+
+COMPATIBLE_MACHINE = "keystone"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
+
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git;destsuffix=git/ti/runtime/mmap;protocol=git;branch=${BRANCH}"
+# Commit correspond to DEV.MMAP.02.00.00.03
+SRCREV = "601f9284c392f67bb7f69ed1a5df5231a43c3137"
+
+PV="2.0.0"
+PR = "r0"
+
+S = "${WORKDIR}/git/ti/runtime/mmap"
\ No newline at end of file
diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-lld/mmap-lld_git.bb
new file mode 100755
index 0000000..3a56a62
--- /dev/null
+++ b/recipes-bsp/mmap-lld/mmap-lld_git.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "TI KEYSTONE mmap driver using Keystone MPAX Programming"
+include mmap-lld.inc
+
+DEPENDS="common-csl-ip"
+
+do_compile () {
+	make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+}
+
+do_install () {
+	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}


