Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D21B7E00B56; Wed,  4 Nov 2015 06:58:04 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 896A5E00AD8
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 06:57:59 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E1A6052A8B; Wed,  4 Nov 2015 14:57:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104145758.E1A6052A8B@arago-project.org>
Date: Wed,  4 Nov 2015 14:57:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : aif2-lld: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 14:58:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: c41839b3aa3bd39eb48288b81427a0fa5d1699e7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c41839b3aa3bd39eb48288b81427a0fa5d1699e7

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:07 2015 +0000

aif2-lld: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/aif2-lld/aif2-lld-test_git.bb |    2 ++
 recipes-bsp/aif2-lld/aif2-lld.inc         |   17 +++++++++++++----
 recipes-bsp/aif2-lld/aif2-lld_git.bb      |    2 ++
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
index 2a9de43..9180b95 100755
--- a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
+++ b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip aif2-lld qmss-lld cppi-lld"
 
 include aif2-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} AIF2_SRC_DIR=${WORKDIR}/git"
 
 do_compile () {
diff --git a/recipes-bsp/aif2-lld/aif2-lld.inc b/recipes-bsp/aif2-lld/aif2-lld.inc
index 212813c..cd1e169 100755
--- a/recipes-bsp/aif2-lld/aif2-lld.inc
+++ b/recipes-bsp/aif2-lld/aif2-lld.inc
@@ -1,13 +1,22 @@
 LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/aif2-lld.git;destsuffix=git/ti/drv/aif2;protocol=git;branch=${BRANCH}"
+
+AIF2_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/aif2-lld.git"
+AIF2_LLD_GIT_PROTOCOL = "git"
+AIF2_LLD_GIT_BRANCH = "master"
+AIF2_LLD_GIT_DESTSUFFIX = "git/ti/drv/aif2"
+
 # The following commit correspond to DEV.AIF2LLD.01.02.00.00A
-SRCREV = "7f394ec9975cd4cef982b11763c882c4c763ddce"
+AIF2_LLD_SRCREV = "7f394ec9975cd4cef982b11763c882c4c763ddce"
+
+BRANCH = "${AIF2_LLD_GIT_BRANCH}"
+SRC_URI = "${AIF2_LLD_GIT_URI};destsuffix=${AIF2_LLD_GIT_DESTSUFFIX};protocol=${AIF2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${AIF2_LLD_SRCREV}"
 
 PV = "1.2.0.0"
+INC_PR = "r1"
 
 COMPATIBLE_MACHINE = "k2hk-evm"
 
-S = "${WORKDIR}/git/ti/drv/aif2"
+S = "${WORKDIR}/${AIF2_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/aif2-lld_git.bb
index f6e95c2..f310b17 100755
--- a/recipes-bsp/aif2-lld/aif2-lld_git.bb
+++ b/recipes-bsp/aif2-lld/aif2-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip qmss-lld cppi-lld"
 
 include aif2-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {


