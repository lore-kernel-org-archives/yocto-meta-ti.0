Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CFACE00BE1; Wed,  4 Nov 2015 07:00:37 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82BE5E00B2F
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:00:02 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2688852A94; Wed,  4 Nov 2015 15:00:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150002.2688852A94@arago-project.org>
Date: Wed,  4 Nov 2015 15:00:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : pa-lld: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 15:00:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 51c651cf8c7d8ec33ab6b50feee41680fbb87281
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=51c651cf8c7d8ec33ab6b50feee41680fbb87281

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:22 2015 +0000

pa-lld: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pa-lld/pa-lld-test_git.bb |    2 ++
 recipes-bsp/pa-lld/pa-lld.inc         |   18 ++++++++++++------
 recipes-bsp/pa-lld/pa-lld_git.bb      |    2 ++
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bb b/recipes-bsp/pa-lld/pa-lld-test_git.bb
index b70dadd..0fb6f07 100644
--- a/recipes-bsp/pa-lld/pa-lld-test_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip pa-lld cppi-lld qmss-lld sa-lld"
 
 include pa-lld.inc
 
+PR = "${INC_PR}.0"
+
 DEVICELIST = "k2h k2k k2l k2e"
 
 CHOICELIST = "yes no"
diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index b8ade64..58f0f42 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -3,13 +3,19 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=e8f6789acdcd
 
 COMPATIBLE_MACHINE = "keystone"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/pa-lld.git;destsuffix=git/ti/drv/pa;protocol=git;branch=${BRANCH}"
+PA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pa-lld.git"
+PA_LLD_GIT_PROTOCOL = "git"
+PA_LLD_GIT_BRANCH = "master"
+PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
 
 # Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.05A"
-SRCREV = "ae3aa3e80ecf64fe5a16515d134a6bc217220e2e"
+PA_LLD_SRCREV = "ae3aa3e80ecf64fe5a16515d134a6bc217220e2e"
+
+BRANCH = "${PA_LLD_GIT_BRANCH}"
+SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${PA_LLD_SRCREV}"
+
 PV = "03.00.01.05"
-PR = "r1"
+INC_PR = "r2"
 
-BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/drv/pa"
+S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
index 468113b..0cb3bc5 100644
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "common-csl-ip rm-lld"
 
 include pa-lld.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI += "file://init_pa.sh"
 
 inherit update-rc.d


