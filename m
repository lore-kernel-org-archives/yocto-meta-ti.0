Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD79EE00E79; Tue, 19 Apr 2016 15:06:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 098F8E00D47
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 15:05:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 81133529EC; Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160419220558.81133529EC@arago-project.org>
Date: Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : pktlib: Clean up recipe
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
X-List-Received-Date: Tue, 19 Apr 2016 22:06:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d0cc24a3de72c37dfd22bee810f784cd90e2426a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d0cc24a3de72c37dfd22bee810f784cd90e2426a

Author: Justin Sobota <jsobota@ti.com>
Date:   Wed Apr 20 03:43:38 2016 +0000

pktlib: Clean up recipe

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pktlib/pktlib.inc    |   24 ++++++++++++++++++++++++
 recipes-bsp/pktlib/pktlib_git.bb |   18 ++----------------
 2 files changed, 26 insertions(+), 16 deletions(-)

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
 


