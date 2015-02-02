Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CE38E0086F; Mon,  2 Feb 2015 07:55:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DD35E00824
	for <meta-ti@yoctoproject.org>; Mon,  2 Feb 2015 07:55:29 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t12FtSQ5016686
	for <meta-ti@yoctoproject.org>; Mon, 2 Feb 2015 09:55:28 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t12FtRc3005257
	for <meta-ti@yoctoproject.org>; Mon, 2 Feb 2015 09:55:27 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 Feb 2015 09:55:27 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t12FtQWA001057;	Mon, 2 Feb 2015 09:55:27 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 2 Feb 2015 10:55:24 -0500
Message-ID: <1422892524-4436-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422892524-4436-1-git-send-email-sam.nelson@ti.com>
References: <1422892524-4436-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] iqn2-lld: Add recipes for TI iqn2 peripheral module low level driver
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

-Provides low level driver and test code for TI iqn2 peripheral module
- Supports k2l device

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb |   16 ++++++++++++++++
 recipes-bsp/iqn2-lld/iqn2-lld.inc         |   13 +++++++++++++
 recipes-bsp/iqn2-lld/iqn2-lld_git.bb      |   16 ++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
 create mode 100644 recipes-bsp/iqn2-lld/iqn2-lld.inc
 create mode 100644 recipes-bsp/iqn2-lld/iqn2-lld_git.bb

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
new file mode 100644
index 0000000..f1aa9e4
--- /dev/null
+++ b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "TI IQN2 peripheral module low level driver test binaries"
+
+DEPENDS = "common-csl-ip iqn2-lld dfe-lld"
+
+include iqn2-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} IQN2_SRC_DIR=${WORKDIR}/git"
+
+do_compile () {
+	oe_runmake clean DEVICE=k2l
+	oe_runmake tests DEVICE=k2l
+}
+
+do_install () {
+	oe_runmake installbin DEVICE=k2l IQN2_SRC_DIR=${WORKDIR}/git INSTALL_BIN_BASE_DIR=${D}/${bindir}
+}
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
new file mode 100644
index 0000000..a871c5c
--- /dev/null
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -0,0 +1,13 @@
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
+LICENSE = "BSD-3-Clause"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/iqn2-lld.git;destsuffix=git/ti/drv/iqn2;protocol=git;branch=${BRANCH}"
+# Following commit corresponds to DEV.IQN_LLD.01.00.00.05B
+SRCREV = "ca35079f41d06259be39f992f55a9f815d305ef5"
+
+PV = "1.0.0.5"
+
+COMPATIBLE_MACHINE = "keystone"
+
+S = "${WORKDIR}/git/ti/drv/iqn2"
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
new file mode 100644
index 0000000..19ffc05
--- /dev/null
+++ b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "TI IQN2 peripheral module low level driver"
+
+DEPENDS = "common-csl-ip"
+
+include iqn2-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+	oe_runmake clean
+	oe_runmake lib
+}
+
+do_install () {
+	oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
-- 
1.7.9.5


