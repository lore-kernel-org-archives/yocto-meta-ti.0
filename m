Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 583BAE00B27; Fri, 23 Oct 2015 08:09:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E85E1E00AB5
	for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2015 08:08:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9NF8w1X016112
	for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2015 10:08:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9NF8wLk023291
	for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2015 10:08:58 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 23 Oct 2015 10:08:58 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9NF8wuu020574;	Fri, 23 Oct 2015 10:08:58 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 23 Oct 2015 11:08:56 -0400
Message-ID: <1445612936-18547-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] aif2-lld: Add low level driver package for keystone2 antenna interface
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
X-List-Received-Date: Fri, 23 Oct 2015 15:09:01 -0000
Content-Type: text/plain

- Provides low level driver and test binaries for keystone2 antenna
  interface peripheral

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/aif2-lld/aif2-lld-test_git.bb |   16 ++++++++++++++++
 recipes-bsp/aif2-lld/aif2-lld.inc         |   13 +++++++++++++
 recipes-bsp/aif2-lld/aif2-lld_git.bb      |   15 +++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100755 recipes-bsp/aif2-lld/aif2-lld-test_git.bb
 create mode 100755 recipes-bsp/aif2-lld/aif2-lld.inc
 create mode 100755 recipes-bsp/aif2-lld/aif2-lld_git.bb

diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
new file mode 100755
index 0000000..2a9de43
--- /dev/null
+++ b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "TI Antenna Interface peripheral module low level driver test binaries"
+
+DEPENDS = "common-csl-ip aif2-lld qmss-lld cppi-lld"
+
+include aif2-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} AIF2_SRC_DIR=${WORKDIR}/git"
+
+do_compile () {
+    oe_runmake clean DEVICE=k2hk
+    oe_runmake tests DEVICE=k2hk
+}
+
+do_install () {
+    oe_runmake installbin DEVICE=k2hk AIF2_SRC_DIR=${WORKDIR}/git INSTALL_BIN_BASE_DIR=${D}/${bindir}
+}
diff --git a/recipes-bsp/aif2-lld/aif2-lld.inc b/recipes-bsp/aif2-lld/aif2-lld.inc
new file mode 100755
index 0000000..212813c
--- /dev/null
+++ b/recipes-bsp/aif2-lld/aif2-lld.inc
@@ -0,0 +1,13 @@
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/aif2-lld.git;destsuffix=git/ti/drv/aif2;protocol=git;branch=${BRANCH}"
+# The following commit correspond to DEV.AIF2LLD.01.02.00.00A
+SRCREV = "7f394ec9975cd4cef982b11763c882c4c763ddce"
+
+PV = "1.2.0.0"
+
+COMPATIBLE_MACHINE = "k2hk-evm"
+
+S = "${WORKDIR}/git/ti/drv/aif2"
diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/aif2-lld_git.bb
new file mode 100755
index 0000000..f6e95c2
--- /dev/null
+++ b/recipes-bsp/aif2-lld/aif2-lld_git.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Antenna Interface low level driver"
+
+DEPENDS = "common-csl-ip qmss-lld cppi-lld"
+
+include aif2-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+    oe_runmake lib DEVICE=k2hk
+}
+
+do_install () {
+    oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
-- 
1.7.9.5


