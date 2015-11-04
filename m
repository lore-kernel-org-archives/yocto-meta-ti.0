Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A08C6E00B19; Wed,  4 Nov 2015 07:00:21 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B4D5E00B2C
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:00:02 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D52AF52AB1; Wed,  4 Nov 2015 15:00:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150001.D52AF52AB1@arago-project.org>
Date: Wed,  4 Nov 2015 15:00:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : nwal-lld: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 15:00:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c4ef4c75a648e44fc0dc447117206a632fa6a7c4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c4ef4c75a648e44fc0dc447117206a632fa6a7c4

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:20 2015 +0000

nwal-lld: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/nwal-lld/nwal-lld-test_git.bb |    2 ++
 recipes-bsp/nwal-lld/nwal-lld.inc         |   13 ++++++++++---
 recipes-bsp/nwal-lld/nwal-lld_git.bb      |    2 ++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
index 3813df9..79528a0 100644
--- a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
+++ b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib nwal-lld"
 
 include nwal-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index 247bfc0..c4ccdbd 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -3,12 +3,19 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fb
 
 COMPATIBLE_MACHINE = "keystone"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git;protocol=git;branch=${BRANCH}"
+NWAL_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git"
+NWAL_LLD_GIT_PROTOCOL = "git"
+NWAL_LLD_GIT_BRANCH = "master"
 
 # Below commit ID corresponds to "DEV.NWAL.02.01.00.08"
-SRCREV = "e6df99e59a848c7afffe90fc9710b7dcb8067c31"
+NWAL_LLD_SRCREV = "e6df99e59a848c7afffe90fc9710b7dcb8067c31"
+
+BRANCH = "${NWAL_LLD_GIT_BRANCH}"
+SRC_URI = "${NWAL_LLD_GIT_URI};protocol=${NWAL_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${NWAL_LLD_SRCREV}"
+
 PV = "02.01.00.08"
+INC_PR = "r1"
 
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/nwal"
diff --git a/recipes-bsp/nwal-lld/nwal-lld_git.bb b/recipes-bsp/nwal-lld/nwal-lld_git.bb
index da09730..a9690ca 100644
--- a/recipes-bsp/nwal-lld/nwal-lld_git.bb
+++ b/recipes-bsp/nwal-lld/nwal-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib"
 
 include nwal-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {


