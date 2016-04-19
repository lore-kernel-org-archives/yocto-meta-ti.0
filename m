Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10666E00D47; Tue, 19 Apr 2016 14:43:46 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7170E00C2E
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 14:43:42 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3JLhfIi026378
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 16:43:41 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3JLhfZB006137
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 16:43:41 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 Apr 2016 16:43:41 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3JLheFh017311;	Tue, 19 Apr 2016 16:43:40 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Apr 2016 17:43:38 -0400
Message-ID: <1461102219-11525-1-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/2] pktlib: Clean up recipe
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
X-List-Received-Date: Tue, 19 Apr 2016 21:43:46 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/pktlib/pktlib.inc    |   24 ++++++++++++++++++++++++
 recipes-bsp/pktlib/pktlib_git.bb |   18 ++----------------
 2 files changed, 26 insertions(+), 16 deletions(-)
 create mode 100644 recipes-bsp/pktlib/pktlib.inc

diff --git a/recipes-bsp/pktlib/pktlib.inc b/recipes-bsp/pktlib/pktlib.inc
new file mode 100644
index 0000000..701a83f
--- /dev/null
+++ b/recipes-bsp/pktlib/pktlib.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "Provides library for handling packet descriptors for keystone devices"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://docs/Doxyfile;md5=91d01dc3788e1f405f000b2089191a0a"
+
+COMPATIBLE_MACHINE = "keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PKTLIB_GIT_URI = "git://git.ti.com/keystone-rtos/pktlib.git"
+PKTLIB_GIT_PROTOCOL = "git"
+PKTLIB_GIT_BRANCH = "master"
+PKTLIB_GIT_DESTSUFFIX = "git/ti/runtime/pktlib"
+
+# Below commit ID corresponds to "DEV.PKTLIB.2.1.0.7"
+PKTLIB_SRCREV = "22f66931964c25f83d1971f7eb78902d10c17d8a"
+
+BRANCH = "${PKTLIB_GIT_BRANCH}"
+# Don't use DESTSUFFIX when cloning since repo contains ti/runtime/pktlib directory tree
+SRC_URI = "${PKTLIB_GIT_URI};protocol=${PKTLIB_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${PKTLIB_SRCREV}"
+PV = "2.1.0.7"
+INC_PR = "r2"
+
+S = "${WORKDIR}/${PKTLIB_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
index 341391e..dd66bd9 100644
--- a/recipes-bsp/pktlib/pktlib_git.bb
+++ b/recipes-bsp/pktlib/pktlib_git.bb
@@ -1,25 +1,11 @@
 DESCRIPTION = "Provides library for handling packet descriptors for keystone devices"
-LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
 
 DEPENDS = "common-csl-ip rm-lld qmss-lld cppi-lld"
-COMPATIBLE_MACHINE = "keystone"
 
-PKTLIB_GIT_URI = "git://git.ti.com/keystone-rtos/pktlib.git"
-PKTLIB_GIT_PROTOCOL = "git"
-PKTLIB_GIT_BRANCH = "master"
+include pktlib.inc
 
-# Corresponds to DEV.PKTLIB.2.1.0.7
-PKTLIB_SRCREV = "22f66931964c25f83d1971f7eb78902d10c17d8a"
-
-BRANCH = "${PKTLIB_GIT_BRANCH}"
-SRC_URI = "${PKTLIB_GIT_URI};protocol=${PKTLIB_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${PKTLIB_SRCREV}"
-
-PV = "2.1.0.7"
-PR = "r0"
-
-S = "${WORKDIR}/git/ti/runtime/pktlib"
+PR = "${INC_PR}.1"
 
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}"
 
-- 
1.7.10.4


