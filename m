Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B12BAE008CF; Tue, 10 Feb 2015 13:28:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BF5EE00717
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 13:28:19 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1ALSI8Q025761
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 15:28:18 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1ALSHSL032249
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 15:28:17 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 15:28:18 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1ALSCZi030822;	Tue, 10 Feb 2015 15:28:15 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Feb 2015 16:28:07 -0500
Message-ID: <1423603690-30013-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 1/4] dfe-lld: Add recipe for Digital Radio Front end low level driver
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
X-List-Received-Date: Tue, 10 Feb 2015 21:28:23 -0000
Content-Type: text/plain

- Provides low level driver for Digital Radio front end
- Supports device k2l

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
Changes from previous version of patch
- test recipe removed to be a separate patch
---
---
 recipes-bsp/dfe-lld/dfe-lld.inc    |   13 +++++++++++++
 recipes-bsp/dfe-lld/dfe-lld_git.bb |   15 +++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 recipes-bsp/dfe-lld/dfe-lld.inc
 create mode 100644 recipes-bsp/dfe-lld/dfe-lld_git.bb

diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
new file mode 100644
index 0000000..4979499
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
+COMPATIBLE_MACHINE = "k2l-evm"
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


