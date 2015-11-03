Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2F75E00B9A; Tue,  3 Nov 2015 11:47:47 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F7DBE00AB9
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:46 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JljW4014590
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:45 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jljam001802
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:45 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:46 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla7J022118;	Tue, 3 Nov 2015 13:47:45 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:25 -0500
Message-ID: <1446580053-16935-20-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 19/27] qmss-lld: Clean up recipes
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:47 -0000
Content-Type: text/plain

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb |  2 ++
 recipes-bsp/qmss-lld/qmss-lld.inc         | 17 ++++++++++++-----
 recipes-bsp/qmss-lld/qmss-lld_git.bb      |  1 +
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
 
-- 
1.9.1


