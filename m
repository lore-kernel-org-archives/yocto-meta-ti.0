Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60226E008A6; Mon,  2 Feb 2015 07:55:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1278AE00809
	for <meta-ti@yoctoproject.org>; Mon,  2 Feb 2015 07:55:28 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t12FtR3l010167
	for <meta-ti@yoctoproject.org>; Mon, 2 Feb 2015 09:55:27 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t12FtQB5005245
	for <meta-ti@yoctoproject.org>; Mon, 2 Feb 2015 09:55:26 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 Feb 2015 09:55:26 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t12FtQW9001057;	Mon, 2 Feb 2015 09:55:26 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 2 Feb 2015 10:55:23 -0500
Message-ID: <1422892524-4436-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] dfe-lld: Add recipe for Digital Radio Front end low level driver & test code
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
X-List-Received-Date: Mon, 02 Feb 2015 15:55:47 -0000
Content-Type: text/plain

- Provides low level driver for Digital Radio front end
- Supports device k2l

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/dfe-lld/dfe-lld-test_git.bb |   18 ++++++++++++++++++
 recipes-bsp/dfe-lld/dfe-lld.inc         |   13 +++++++++++++
 recipes-bsp/dfe-lld/dfe-lld_git.bb      |   15 +++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 recipes-bsp/dfe-lld/dfe-lld-test_git.bb
 create mode 100644 recipes-bsp/dfe-lld/dfe-lld.inc
 create mode 100644 recipes-bsp/dfe-lld/dfe-lld_git.bb

diff --git a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
new file mode 100644
index 0000000..acaaf63
--- /dev/null
+++ b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "TI Digital Radio Front End lld test application"
+
+DEPENDS = "common-csl-ip dfe-lld iqn2-lld"
+
+include dfe-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} DFE_SRC_DIR=${S}"
+
+do_compile () {
+#   Now build the lld in the updated directory
+	oe_runmake clean DEVICE=k2l
+	oe_runmake tests DEVICE=k2l
+	oe_runmake tests DEVICE=k2l USEDYNAMIC_LIB=yes
+}
+
+do_install () {
+	oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}/${bindir}
+}
diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
new file mode 100644
index 0000000..b1e42e7
--- /dev/null
+++ b/recipes-bsp/dfe-lld/dfe-lld.inc
@@ -0,0 +1,13 @@
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1f4217b705bf98762a302fd720649dcc"
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/dfe-lld.git;destsuffix=git/ti/drv/dfe;protocol=git;branch=${BRANCH}"
+# The following commit correspond to DEV.DFE_LLD.01.00.00.03C
+SRCREV = "ed20e87d3676e3e05ce2b78179b504a05083ad15"
+
+PV = "1.0.0.3"
+
+COMPATIBLE_MACHINE = "keystone"
+
+S = "${WORKDIR}/git/ti/drv/dfe"
diff --git a/recipes-bsp/dfe-lld/dfe-lld_git.bb b/recipes-bsp/dfe-lld/dfe-lld_git.bb
new file mode 100644
index 0000000..a2477ca
--- /dev/null
+++ b/recipes-bsp/dfe-lld/dfe-lld_git.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Digital Radio Front End low level driver"
+
+DEPENDS = "common-csl-ip"
+
+include dfe-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+	oe_runmake lib DEVICE=k2l
+}
+
+do_install () {
+	oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
-- 
1.7.9.5


