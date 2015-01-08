Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DDAFE00944; Thu,  8 Jan 2015 09:23:01 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB69BE0090F
	for <meta-ti@yoctoproject.org>; Thu,  8 Jan 2015 09:22:49 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 6765E529EC; Thu,  8 Jan 2015 17:22:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150108172247.6765E529EC@arago-project.org>
Date: Thu,  8 Jan 2015 17:22:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : pktlib: Adds recipe for pklib component
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
X-List-Received-Date: Thu, 08 Jan 2015 17:23:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: aa9164062490956d66cb9b893c7f272b9b0f58a7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=aa9164062490956d66cb9b893c7f272b9b0f58a7

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Jan  8 09:01:02 2015 +0000

pktlib: Adds recipe for pklib component

- pktlib: provides library for handling packet descriptor for keystone devices

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pktlib/pktlib_git.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
new file mode 100644
index 0000000..df68f76
--- /dev/null
+++ b/recipes-bsp/pktlib/pktlib_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Provides library for handling packet descriptors for keystone devices"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
+
+DEPENDS = "common-csl-ip rm-lld qmss-lld cppi-lld"
+COMPATIBLE_MACHINE = "keystone"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/pktlib.git;protocol=git;branch=${BRANCH}"
+
+# Corresponds to DEV.PKTLIB.2.1.0.4
+SRCREV = "a9aa56afed54b0a04f36d2fdb248cad5dcac6ff6"
+PV = "2.1.0.4"
+
+S = "${WORKDIR}/git/ti/runtime/pktlib"
+
+EXTRA_OEMAKE += "-f make=file_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}"
+
+MAKE_TARGETS = "lib"


