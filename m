Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 260B5E00B28; Wed,  4 Nov 2015 06:58:07 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23CAAE00B31
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 06:58:01 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 201E152ABB; Wed,  4 Nov 2015 14:58:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104145800.201E152ABB@arago-project.org>
Date: Wed,  4 Nov 2015 14:58:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : dfe-lld: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 14:58:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 30bc6a176aadedd48ce66e8bf37c838418dd81dc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=30bc6a176aadedd48ce66e8bf37c838418dd81dc

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:11 2015 +0000

dfe-lld: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dfe-lld/dfe-lld-test_git.bb |    2 ++
 recipes-bsp/dfe-lld/dfe-lld.inc         |   17 +++++++++++++----
 recipes-bsp/dfe-lld/dfe-lld_git.bb      |    2 ++
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
index acaaf63..34b90c7 100644
--- a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
+++ b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip dfe-lld iqn2-lld"
 
 include dfe-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} DFE_SRC_DIR=${S}"
 
 do_compile () {
diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
index f5778d9..f2e4213 100644
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ b/recipes-bsp/dfe-lld/dfe-lld.inc
@@ -1,13 +1,22 @@
 LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1f4217b705bf98762a302fd720649dcc"
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/dfe-lld.git;destsuffix=git/ti/drv/dfe;protocol=git;branch=${BRANCH}"
+
+DFE_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/dfe-lld.git"
+DFE_LLD_GIT_PROTOCOL = "git"
+DFE_LLD_GIT_BRANCH = "master"
+DFE_LLD_GIT_DESTSUFFIX = "git/ti/drv/dfe"
+
 # The following commit correspond to DEV.DFE_LLD.01.00.00.05E
-SRCREV = "42e9df0108d208c92b9d2fee7e8b1b1ab62f4b69"
+DFE_LLD_SRCREV = "42e9df0108d208c92b9d2fee7e8b1b1ab62f4b69"
+
+BRANCH = "${DFE_LLD_GIT_BRANCH}"
+SRC_URI = "${DFE_LLD_GIT_URI};destsuffix=${DFE_LLD_GIT_DESTSUFFIX};protocol=${DFE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${DFE_LLD_SRCREV}"
 
 PV = "1.0.0.5"
+INC_PR = "r1"
 
 COMPATIBLE_MACHINE = "k2l-evm"
 
-S = "${WORKDIR}/git/ti/drv/dfe"
+S = "${WORKDIR}/${DFE_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/dfe-lld/dfe-lld_git.bb b/recipes-bsp/dfe-lld/dfe-lld_git.bb
index a2477ca..3d33584 100644
--- a/recipes-bsp/dfe-lld/dfe-lld_git.bb
+++ b/recipes-bsp/dfe-lld/dfe-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip"
 
 include dfe-lld.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {


