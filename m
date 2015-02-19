Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02EFAE008CE; Thu, 19 Feb 2015 13:46:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CC4EE0082D
	for <meta-ti@yoctoproject.org>; Thu, 19 Feb 2015 13:46:11 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4A0F85297F; Thu, 19 Feb 2015 21:46:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150219214610.4A0F85297F@arago-project.org>
Date: Thu, 19 Feb 2015 21:46:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : dfe-lld: Add recipe for Digital Radio Front end low level driver
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
X-List-Received-Date: Thu, 19 Feb 2015 21:46:18 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ea65cbe1c9d448777658a877b41a928b9369e56c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ea65cbe1c9d448777658a877b41a928b9369e56c

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Feb 11 03:28:07 2015 +0000

dfe-lld: Add recipe for Digital Radio Front end low level driver

- Provides low level driver for Digital Radio front end
- Supports device k2l

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dfe-lld/dfe-lld.inc    |   13 +++++++++++++
 recipes-bsp/dfe-lld/dfe-lld_git.bb |   15 +++++++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)

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


