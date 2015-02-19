Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01035E008D4; Thu, 19 Feb 2015 13:46:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B643E00827
	for <meta-ti@yoctoproject.org>; Thu, 19 Feb 2015 13:46:11 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 6426452A4F; Thu, 19 Feb 2015 21:46:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150219214610.6426452A4F@arago-project.org>
Date: Thu, 19 Feb 2015 21:46:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : iqn2-lld: Add recipes for TI iqn2 peripheral module low level driver
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
Commit: bfc42e6786167d6948bbceee7b82345738a960db
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bfc42e6786167d6948bbceee7b82345738a960db

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Feb 11 03:28:08 2015 +0000

iqn2-lld: Add recipes for TI iqn2 peripheral module low level driver

- Provides low level driver for TI iqn2 peripheral module
- Supports k2l device

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/iqn2-lld/iqn2-lld.inc    |   13 +++++++++++++
 recipes-bsp/iqn2-lld/iqn2-lld_git.bb |   16 ++++++++++++++++
 2 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
new file mode 100644
index 0000000..c5b1511
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
+COMPATIBLE_MACHINE = "k2l-evm"
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


