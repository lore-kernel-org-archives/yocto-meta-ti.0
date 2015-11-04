Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47851E00B52; Wed,  4 Nov 2015 07:04:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA3B3E00B63
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:03:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7DA1352AB1; Wed,  4 Nov 2015 15:03:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150357.7DA1352AB1@arago-project.org>
Date: Wed,  4 Nov 2015 15:03:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : srio-lld: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 15:04:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: e761b86556428a987cf8881817e7d9e4bb07f937
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e761b86556428a987cf8881817e7d9e4bb07f937

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:30 2015 +0000

srio-lld: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/srio-lld/srio-lld-test_git.bb |    2 ++
 recipes-bsp/srio-lld/srio-lld.inc         |   14 +++++++++++---
 recipes-bsp/srio-lld/srio-lld_git.bb      |    2 ++
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/srio-lld/srio-lld-test_git.bb b/recipes-bsp/srio-lld/srio-lld-test_git.bb
index 7cf254e..da3e357 100644
--- a/recipes-bsp/srio-lld/srio-lld-test_git.bb
+++ b/recipes-bsp/srio-lld/srio-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld srio-lld cmem"
 
 include srio-lld.inc
 
+PR = "${INC_PR}.0"
+
 CHOICELIST = "yes no"
 
 do_compile () {
diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
index 0f1ee2d..6e51f79 100644
--- a/recipes-bsp/srio-lld/srio-lld.inc
+++ b/recipes-bsp/srio-lld/srio-lld.inc
@@ -1,12 +1,20 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/srio/srio_drv.h;beginline=1;endline=41;md5=469096088e072d883ff7eef301b34093"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/srio-lld.git;destsuffix=git/ti/drv/srio;protocol=git;branch=${BRANCH}"
+SRIO_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/srio-lld.git"
+SRIO_LLD_GIT_PROTOCOL = "git"
+SRIO_LLD_GIT_BRANCH = "master"
+SRIO_LLD_GIT_DESTSUFFIX = "git/ti/drv/srio"
 
 # commit ID corresponding to DEV.SRIO_LLD.02.00.00.13
-SRCREV = "dc49972265afd3ffd3b29ca235b8ca6daf790bd1"
+SRIO_LLD_SRCREV = "dc49972265afd3ffd3b29ca235b8ca6daf790bd1"
+
+BRANCH = "${SRIO_LLD_GIT_BRANCH}"
+SRC_URI = "${SRIO_LLD_GIT_URI};destsuffix=${SRIO_LLD_GIT_DESTSUFFIX};protocol=${SRIO_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${SRIO_LLD_SRCREV}"
+
 PV = "02.00.00.13"
+INC_PR = "r1"
 
 DEVICELIST = "k2h k2k"
 
diff --git a/recipes-bsp/srio-lld/srio-lld_git.bb b/recipes-bsp/srio-lld/srio-lld_git.bb
index 9ff845b..ba3cc24 100644
--- a/recipes-bsp/srio-lld/srio-lld_git.bb
+++ b/recipes-bsp/srio-lld/srio-lld_git.bb
@@ -5,6 +5,8 @@ DEPENDS="common-csl-ip rm-lld cppi-lld"
 
 include srio-lld.inc
 
+PR = "${INC_PR}.0"
+
 do_compile () {
 #   Now build the lld
 	oe_runmake clean


