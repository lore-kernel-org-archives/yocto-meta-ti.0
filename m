Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C036AE008F5; Wed, 19 Nov 2014 03:47:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A972E008D9
	for <meta-ti@yoctoproject.org>; Wed, 19 Nov 2014 03:47:05 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAJBl4ig020137
	for <meta-ti@yoctoproject.org>; Wed, 19 Nov 2014 05:47:04 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAJBl4oj027986
	for <meta-ti@yoctoproject.org>; Wed, 19 Nov 2014 05:47:04 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 19 Nov 2014 05:47:03 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sAJBl3CG015984;	Wed, 19 Nov 2014 05:47:03 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 19 Nov 2014 06:47:01 -0500
Message-ID: <1416397621-20552-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] mmap-lld; Add new recipe for mmap lld
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
X-List-Received-Date: Wed, 19 Nov 2014 11:47:12 -0000
Content-Type: text/plain

- Provides memory map driver using Keystone MPAX module
- Test recipe is used to build test binaries using the mmap lld library
- Supports k2h, k2k & k2e

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb |   40 +++++++++++++++++++++++++++++
 recipes-bsp/mmap-lld/mmap-lld.inc         |   16 ++++++++++++
 recipes-bsp/mmap-lld/mmap-lld_git.bb      |   12 +++++++++
 3 files changed, 68 insertions(+)
 create mode 100755 recipes-bsp/mmap-lld/mmap-lld-test_git.bb
 create mode 100644 recipes-bsp/mmap-lld/mmap-lld.inc
 create mode 100755 recipes-bsp/mmap-lld/mmap-lld_git.bb

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
-- 
1.7.9.5


