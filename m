Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2508E00B63; Wed,  4 Nov 2015 07:00:39 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9256E00AD8
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:00:04 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 68CAC52A94; Wed,  4 Nov 2015 15:00:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150004.68CAC52A94@arago-project.org>
Date: Wed,  4 Nov 2015 15:00:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : iqn2-lld: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 15:00:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: a892deb197318003ce325a34bc9e9729cf88f36f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a892deb197318003ce325a34bc9e9729cf88f36f

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:17 2015 +0000

iqn2-lld: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb |    2 ++
 recipes-bsp/iqn2-lld/iqn2-lld.inc         |   16 ++++++++++++----
 recipes-bsp/iqn2-lld/iqn2-lld_git.bb      |    2 ++
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
index f1aa9e4..f276c4b 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
+++ b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip iqn2-lld dfe-lld"
 
 include iqn2-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} IQN2_SRC_DIR=${WORKDIR}/git"
 
 do_compile () {
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
index 812d3f6..4a43a26 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -1,13 +1,21 @@
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
 LICENSE = "BSD-3-Clause"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/iqn2-lld.git;destsuffix=git/ti/drv/iqn2;protocol=git;branch=${BRANCH}"
+IQN2_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/iqn2-lld.git"
+IQN2_LLD_GIT_PROTOCOL = "git"
+IQN2_LLD_GIT_BRANCH = "master"
+IQN2_LLD_GIT_DESTSUFFIX = "git/ti/drv/iqn2"
+
 # Following commit corresponds to DEV.IQN_LLD.01.00.00.08F
-SRCREV = "29d5358b944f1447c024263f86e8c71784440b99"
+IQN2_LLD_SRCREV = "29d5358b944f1447c024263f86e8c71784440b99"
+
+BRANCH = "${IQN2_LLD_GIT_BRANCH}"
+SRC_URI = "${IQN2_LLD_GIT_URI};destsuffix=${IQN2_LLD_GIT_DESTSUFFIX};protocol=${IQN2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${IQN2_LLD_SRCREV}"
 
 PV = "1.0.0.8"
+INC_PR = "r1"
 
 COMPATIBLE_MACHINE = "k2l-evm"
 
-S = "${WORKDIR}/git/ti/drv/iqn2"
+S = "${WORKDIR}/${IQN2_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
index 19ffc05..4e68116 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
+++ b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip"
 
 include iqn2-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {


