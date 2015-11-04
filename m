Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9970E00B60; Wed,  4 Nov 2015 07:04:16 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E933E00A73
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:03:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BA33C52AA7; Wed,  4 Nov 2015 15:03:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150353.BA33C52AA7@arago-project.org>
Date: Wed,  4 Nov 2015 15:03:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : sa-lld: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 15:04:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1e37806e858cf6b43216a9b53a1a906612b73188
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1e37806e858cf6b43216a9b53a1a906612b73188

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:28 2015 +0000

sa-lld: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/sa-lld/sa-lld-test_git.bb |    2 ++
 recipes-bsp/sa-lld/sa-lld.inc         |   18 +++++++++++++-----
 recipes-bsp/sa-lld/sa-lld_git.bb      |    2 ++
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
index 7cb0ac7..4f74ab6 100644
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip cppi-lld qmss-lld pa-lld sa-lld"
 
 include sa-lld.inc
 
+PR = "${INC_PR}.0"
+
 DEVICELIST = "k2h k2k k2l k2e"
 
 CHOICELIST = "no yes"
diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index 8066279..47584b6 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -3,11 +3,19 @@ COMPATIBLE_MACHINE = "keystone"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=4709d353574a9569e129ebdf20e732dd"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/sa-lld.git;destsuffix=git/ti/drv/sa;protocol=git;branch=${BRANCH}"
+SA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/sa-lld.git"
+SA_LLD_GIT_PROTOCOL = "git"
+SA_LLD_GIT_BRANCH = "master"
+SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
+
 # Following commit DEV.SA_LLD.03.00.00.11A
-SRCREV = "bf5b097e868b20d23d386abc34a1902903d7d9ea"
+SA_LLD_SRCREV = "bf5b097e868b20d23d386abc34a1902903d7d9ea"
+
+BRANCH = "${SA_LLD_GIT_BRANCH}"
+SRC_URI = "${SA_LLD_GIT_URI};destsuffix=${SA_LLD_GIT_DESTSUFFIX};protocol=${SA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${SA_LLD_SRCREV}"
+
 PV = "03.00.00.11"
+INC_PR = "r1"
 
-BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/drv/sa"
+S = "${WORKDIR}/${SA_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/sa-lld/sa-lld_git.bb b/recipes-bsp/sa-lld/sa-lld_git.bb
index 3df2c6c..1cab6db 100644
--- a/recipes-bsp/sa-lld/sa-lld_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip"
 
 include sa-lld.inc
 
+PR = "${INC_PR}.0"
+
 do_compile () {
 #   Now build the lld in the updated directory
 	make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}


