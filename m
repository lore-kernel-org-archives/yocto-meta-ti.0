Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EEF35E00B2F; Wed,  4 Nov 2015 06:58:07 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6215BE00B44
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 06:58:01 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 6A1FD52ABF; Wed,  4 Nov 2015 14:58:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104145800.6A1FD52ABF@arago-project.org>
Date: Wed,  4 Nov 2015 14:58:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : hyplnk-lld: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 14:58:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 41ee00c8f168650068215b0ecfde2b59096258f7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=41ee00c8f168650068215b0ecfde2b59096258f7

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:15 2015 +0000

hyplnk-lld: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |    2 ++
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc         |   21 +++++++++++++--------
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |    2 ++
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
index c33e2df..31b69c2 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
@@ -1,5 +1,7 @@
 include hyplnk-lld.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS = "common-csl-ip hyplnk-lld"
 
 do_compile () {
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
index 70b5d80..09fec45 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
@@ -5,21 +5,26 @@ COMPATIBLE_MACHINE = "keystone"
 
 LLDNAME="hyplnk"
 
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=623325cc19e613a4e770fbb749922592"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/${HYPLNK_GIT_DESTSUFFIX}/COPYING.txt;md5=623325cc19e613a4e770fbb749922592"
+
+HYPLNK_GIT_URI = "git://git.ti.com/keystone-rtos/hyplnk-lld.git"
+HYPLNK_GIT_PROTOCOL = "git"
+HYPLNK_GIT_BRANCH = "master"
+HYPLNK_GIT_DESTSUFFIX = "git/ti/drv/${LLDNAME}"
 
-BRANCH="master"
-SRC_URI = "git://git.ti.com/keystone-rtos/hyplnk-lld.git;destsuffix=git/ti/drv/${LLDNAME};protocol=git;branch=${BRANCH}"
-FILESPATH_prepend := "${THISDIR}/files"
 # Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.05
-SRCREV = "ea2a634578626deaa69608a189d5d7e84e5b7127"
+HYPLNK_SRCREV = "ea2a634578626deaa69608a189d5d7e84e5b7127"
+
+BRANCH="${HYPLNK_GIT_BRANCH}"
+SRC_URI = "${HYPLNK_GIT_URI};destsuffix=${HYPLNK_GIT_DESTSUFFIX};protocol=${HYPLNK_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${HYPLNK_SRCREV}"
 
 PV = "2.1.0.5"
-PR = "r1"
+INC_PR = "r2"
 
 DEVICELIST = " k2h \
                k2k \
                k2e \
 "
 
-BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/drv/${LLDNAME}"
+S = "${WORKDIR}/${HYPLNK_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
index 8be072c..e20ad1f 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
@@ -1,5 +1,7 @@
 include hyplnk-lld.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS = "common-csl-ip"
 
 SRC_URI += "file://init_hyplnk.sh"


