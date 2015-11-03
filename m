Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28065E00B05; Tue,  3 Nov 2015 11:47:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03070E00B19
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:46 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3Jlkrd014595
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:46 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JlkKh001865
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:46 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:46 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla7M022118;	Tue, 3 Nov 2015 13:47:46 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:28 -0500
Message-ID: <1446580053-16935-23-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 22/27] sa-lld: Clean up recipes
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:48 -0000
Content-Type: text/plain

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/sa-lld/sa-lld-test_git.bb |  2 ++
 recipes-bsp/sa-lld/sa-lld.inc         | 18 +++++++++++++-----
 recipes-bsp/sa-lld/sa-lld_git.bb      |  2 ++
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
-- 
1.9.1


