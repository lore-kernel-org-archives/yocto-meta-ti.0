Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9FD0BE00C08; Wed,  4 Nov 2015 07:00:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5B93E00B4F
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:00:02 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7483252AB1; Wed,  4 Nov 2015 15:00:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150002.7483252AB1@arago-project.org>
Date: Wed,  4 Nov 2015 15:00:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : qmss-lld: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 15:00:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c252c773147b650727819a3a6e60be0111ad6e0f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c252c773147b650727819a3a6e60be0111ad6e0f

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:25 2015 +0000

qmss-lld: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/qmss-lld/qmss-lld-test_git.bb |    2 ++
 recipes-bsp/qmss-lld/qmss-lld.inc         |   17 ++++++++++++-----
 recipes-bsp/qmss-lld/qmss-lld_git.bb      |    1 +
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
index 438d840..7c19364 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
@@ -5,6 +5,8 @@ DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld"
 
 include qmss-lld.inc
 
+PR = "${INC_PR}.0"
+
 CHOICELIST = "yes no"
 
 do_compile () {
diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index 29ef0ce..efd681e 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -1,14 +1,21 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
 
-BRANCH ="master"
-SRC_URI = "git://git.ti.com/keystone-rtos/qmss-lld.git;destsuffix=git/ti/drv/qmss;protocol=git;branch=${BRANCH}"
+QMSS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/qmss-lld.git"
+QMSS_LLD_GIT_PROTOCOL = "git"
+QMSS_LLD_GIT_BRANCH = "master"
+QMSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/qmss"
 
 # commit ID corresponding to DEV.QMSS_LLD.02.01.00.11
-SRCREV = "2024ab2d411c1a6dd3f5e768a3cb30c2a685f1e4"
+QMSS_LLD_SRCREV = "2024ab2d411c1a6dd3f5e768a3cb30c2a685f1e4"
+
+BRANCH ="${QMSS_LLD_GIT_BRANCH}"
+SRC_URI = "${QMSS_LLD_GIT_URI};destsuffix=${QMSS_LLD_GIT_DESTSUFFIX};protocol=${QMSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${QMSS_LLD_SRCREV}"
+
 PV = "02.01.00.11"
+INC_PR = "r1"
 
 DEVICELIST = "k2h k2k k2l k2e"
 
-BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/drv/qmss"
+S = "${WORKDIR}/${QMSS_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qmss-lld_git.bb
index 38b0762..83c9a7e 100644
--- a/recipes-bsp/qmss-lld/qmss-lld_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld_git.bb
@@ -5,6 +5,7 @@ DEPENDS="common-csl-ip rm-lld"
 
 include qmss-lld.inc
 
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://init_qmss.sh"
 


