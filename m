Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7FCFAE0077F; Wed,  8 Oct 2014 09:24:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32D53E006DB
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 09:23:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s98GNq6g028460
	for <meta-ti@yoctoproject.org>; Wed, 8 Oct 2014 11:23:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s98GNqER009415
	for <meta-ti@yoctoproject.org>; Wed, 8 Oct 2014 11:23:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 11:23:52 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s98GNpu7025971;	Wed, 8 Oct 2014 11:23:52 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 8 Oct 2014 12:23:49 -0400
Message-ID: <1412785429-18554-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] hyplnk-lld: Add new recipe for Hyperlink lld
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
X-List-Received-Date: Wed, 08 Oct 2014 16:24:00 -0000
Content-Type: text/plain

- Provides low level driver for Hyperlink module
- Test recipe is used to build tests and examples using
  the hyperlink library.
- Supports k2h, k2k & k2e

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |   25 +++++++++++++++++++++++++
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc         |   24 ++++++++++++++++++++++++
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |   18 ++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100755 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
 create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld.inc
 create mode 100755 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
new file mode 100755
index 0000000..49d11f0
--- /dev/null
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
@@ -0,0 +1,25 @@
+include hyplnk-lld.inc
+
+DEPENDS="common-csl-ip hyplnk-lld"
+
+CHOICELIST = " yes \
+               no  \
+"
+
+do_compile () {
+	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} HYPLNK_SRC_DIR=${PWD}
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="${device}" HYPLNK_SRC_DIR=${S} USEDYNAMIC_LIB="${choice}"
+		done
+	done
+}
+
+do_install () {
+    for device in ${DEVICELIST}
+	do
+	    make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="${device}" HYPLNK_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
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
index 0000000..3b9bc8a
--- /dev/null
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
@@ -0,0 +1,18 @@
+include hyplnk-lld.inc
+
+DEPENDS="common-csl-ip"
+
+CHOICELIST = " yes \
+               no  \
+"
+do_compile () {
+	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} HYPLNK_SRC_DIR=${PWD}
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}"
+	done
+}
+
+do_install () {
+	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
-- 
1.7.9.5


