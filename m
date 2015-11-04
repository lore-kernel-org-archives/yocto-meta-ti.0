Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3437E00B54; Wed,  4 Nov 2015 06:58:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE46CE00B28
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 06:58:00 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5924D52AB2; Wed,  4 Nov 2015 14:57:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104145759.5924D52AB2@arago-project.org>
Date: Wed,  4 Nov 2015 14:57:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : edma3-lld: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 14:58:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 82e19a921ca4da9556ce5ce06ab903e9450bd388
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=82e19a921ca4da9556ce5ce06ab903e9450bd388

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:12 2015 +0000

edma3-lld: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb |    2 +-
 recipes-bsp/edma3-lld/edma3-lld.inc         |   13 ++++++++++---
 recipes-bsp/edma3-lld/edma3-lld_git.bb      |    2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index a4e0df6..4ebfd16 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -2,7 +2,7 @@ require edma3-lld.inc
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 DEPENDS = "ti-cgt6x-native ti-sysbios ti-xdctools"
 
diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index 28c49e3..8dc80f7 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -2,9 +2,16 @@ DESCRIPTION = "TI EDMA3 low level driver and test code"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git;protocol=git;branch=${BRANCH}"
+EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
+EDMA3_LLD_GIT_PROTOCOL = "git"
+EDMA3_LLD_GIT_BRANCH = "master"
+
 # The following commit corresponds to tag DEV_EDMA3_LLD_02_12_01_21_RC1
-SRCREV = "562cba36ccd53e89e6979e99a58374513b543f93"
+EDMA3_LLD_SRCREV = "562cba36ccd53e89e6979e99a58374513b543f93"
+
+BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
+SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${EDMA3_LLD_SRCREV}"
 
 PV = "2.12.01.21"
+INC_PR = "r2"
diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld/edma3-lld_git.bb
index 913dd3e..ec6ca47 100644
--- a/recipes-bsp/edma3-lld/edma3-lld_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bb
@@ -1,6 +1,6 @@
 require edma3-lld.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "keystone"
 


